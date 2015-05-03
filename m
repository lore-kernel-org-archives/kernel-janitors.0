From: green@linuxhacker.ru
Date: Sun, 03 May 2015 03:10:08 +0000
Subject: [PATCH 3/3] staging/lustre/llite: move some procfs files to sysfs
Message-Id: <1430622608-30402-4-git-send-email-green@linuxhacker.ru>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

From: Oleg Drokin <green@linuxhacker.ru>

Move just first few files from /proc/fs/lustre/llite/*/
to /sys/fs/lustre/llite/*/:
blocksize    filesfree   fstype       kbytesfree   max_read_ahead_mb
client_type  filestotal  kbytesavail  kbytestotal  uuid

More to follow.

Signed-off-by: Oleg Drokin <green@linuxhacker.ru>
---
 .../staging/lustre/lustre/llite/llite_internal.h   |   4 +
 drivers/staging/lustre/lustre/llite/llite_lib.c    |   7 +-
 drivers/staging/lustre/lustre/llite/lproc_llite.c  | 190 ++++++++++++---------
 drivers/staging/lustre/lustre/llite/super25.c      |  11 +-
 4 files changed, 124 insertions(+), 88 deletions(-)

diff --git a/drivers/staging/lustre/lustre/llite/llite_internal.h b/drivers/staging/lustre/lustre/llite/llite_internal.h
index 1253b3c..5df2754 100644
--- a/drivers/staging/lustre/lustre/llite/llite_internal.h
+++ b/drivers/staging/lustre/lustre/llite/llite_internal.h
@@ -524,6 +524,9 @@ struct ll_sb_info {
 	struct rmtacl_ctl_table   ll_rct;
 	struct eacl_table	 ll_et;
 	__kernel_fsid_t		  ll_fsid;
+	struct kobject		 ll_kobj; /* sysfs object */
+	struct super_block	*ll_sb; /* struct super_block (for sysfs code)*/
+	struct completion	 ll_kobj_unregister;
 };
 
 #define LL_DEFAULT_MAX_RW_CHUNK      (32 * 1024 * 1024)
@@ -645,6 +648,7 @@ struct lov_stripe_md;
 extern spinlock_t inode_lock;
 
 extern struct proc_dir_entry *proc_lustre_fs_root;
+extern struct kset *llite_kset;
 
 static inline struct inode *ll_info2i(struct ll_inode_info *lli)
 {
diff --git a/drivers/staging/lustre/lustre/llite/llite_lib.c b/drivers/staging/lustre/lustre/llite/llite_lib.c
index e5bac94..e2b3510 100644
--- a/drivers/staging/lustre/lustre/llite/llite_lib.c
+++ b/drivers/staging/lustre/lustre/llite/llite_lib.c
@@ -58,6 +58,7 @@
 
 struct kmem_cache *ll_file_data_slab;
 struct proc_dir_entry *proc_lustre_fs_root;
+struct kset *llite_kset;
 
 static LIST_HEAD(ll_super_blocks);
 static DEFINE_SPINLOCK(ll_sb_lock);
@@ -66,7 +67,7 @@ static DEFINE_SPINLOCK(ll_sb_lock);
 #define log2(n) ffz(~(n))
 #endif
 
-static struct ll_sb_info *ll_init_sbi(void)
+static struct ll_sb_info *ll_init_sbi(struct super_block *sb)
 {
 	struct ll_sb_info *sbi = NULL;
 	unsigned long pages;
@@ -134,6 +135,8 @@ static struct ll_sb_info *ll_init_sbi(void)
 	atomic_set(&sbi->ll_agl_total, 0);
 	sbi->ll_flags |= LL_SBI_AGL_ENABLED;
 
+	sbi->ll_sb = sb;
+
 	return sbi;
 }
 
@@ -921,7 +924,7 @@ int ll_fill_super(struct super_block *sb, struct vfsmount *mnt)
 	try_module_get(THIS_MODULE);
 
 	/* client additional sb info */
-	lsi->lsi_llsbi = sbi = ll_init_sbi();
+	lsi->lsi_llsbi = sbi = ll_init_sbi(sb);
 	if (!sbi) {
 		module_put(THIS_MODULE);
 		kfree(cfg);
diff --git a/drivers/staging/lustre/lustre/llite/lproc_llite.c b/drivers/staging/lustre/lustre/llite/lproc_llite.c
index 83a9b85..8ddaeb1 100644
--- a/drivers/staging/lustre/lustre/llite/lproc_llite.c
+++ b/drivers/staging/lustre/lustre/llite/lproc_llite.c
@@ -48,31 +48,31 @@ static struct file_operations ll_rw_extents_stats_fops;
 static struct file_operations ll_rw_extents_stats_pp_fops;
 static struct file_operations ll_rw_offset_stats_fops;
 
-static int ll_blksize_seq_show(struct seq_file *m, void *v)
+static ssize_t blocksize_show(struct kobject *kobj, char *buf)
 {
-	struct super_block *sb = (struct super_block *)m->private;
+	struct ll_sb_info *sbi = container_of(kobj, struct ll_sb_info,
+					      ll_kobj);
 	struct obd_statfs osfs;
 	int rc;
 
-	LASSERT(sb != NULL);
-	rc = ll_statfs_internal(sb, &osfs,
+	rc = ll_statfs_internal(sbi->ll_sb, &osfs,
 				cfs_time_shift_64(-OBD_STATFS_CACHE_SECONDS),
 				OBD_STATFS_NODELAY);
 	if (!rc)
-		seq_printf(m, "%u\n", osfs.os_bsize);
+		return snprintf(buf, PAGE_SIZE, "%u\n", osfs.os_bsize);
 
 	return rc;
 }
-LPROC_SEQ_FOPS_RO(ll_blksize);
+LUSTRE_RO_ATTR(blocksize);
 
-static int ll_kbytestotal_seq_show(struct seq_file *m, void *v)
+static ssize_t kbytestotal_show(struct kobject *kobj, char *buf)
 {
-	struct super_block *sb = (struct super_block *)m->private;
+	struct ll_sb_info *sbi = container_of(kobj, struct ll_sb_info,
+					      ll_kobj);
 	struct obd_statfs osfs;
 	int rc;
 
-	LASSERT(sb != NULL);
-	rc = ll_statfs_internal(sb, &osfs,
+	rc = ll_statfs_internal(sbi->ll_sb, &osfs,
 				cfs_time_shift_64(-OBD_STATFS_CACHE_SECONDS),
 				OBD_STATFS_NODELAY);
 	if (!rc) {
@@ -82,21 +82,21 @@ static int ll_kbytestotal_seq_show(struct seq_file *m, void *v)
 		while (blk_size >>= 1)
 			result <<= 1;
 
-		seq_printf(m, "%llu\n", result);
+		rc = snprintf(buf, PAGE_SIZE, "%llu\n", result);
 	}
 
 	return rc;
 }
-LPROC_SEQ_FOPS_RO(ll_kbytestotal);
+LUSTRE_RO_ATTR(kbytestotal);
 
-static int ll_kbytesfree_seq_show(struct seq_file *m, void *v)
+static ssize_t kbytesfree_show(struct kobject *kobj, char *buf)
 {
-	struct super_block *sb = (struct super_block *)m->private;
+	struct ll_sb_info *sbi = container_of(kobj, struct ll_sb_info,
+					      ll_kobj);
 	struct obd_statfs osfs;
 	int rc;
 
-	LASSERT(sb != NULL);
-	rc = ll_statfs_internal(sb, &osfs,
+	rc = ll_statfs_internal(sbi->ll_sb, &osfs,
 				cfs_time_shift_64(-OBD_STATFS_CACHE_SECONDS),
 				OBD_STATFS_NODELAY);
 	if (!rc) {
@@ -106,21 +106,21 @@ static int ll_kbytesfree_seq_show(struct seq_file *m, void *v)
 		while (blk_size >>= 1)
 			result <<= 1;
 
-		seq_printf(m, "%llu\n", result);
+		rc = snprintf(buf, PAGE_SIZE, "%llu\n", result);
 	}
 
 	return rc;
 }
-LPROC_SEQ_FOPS_RO(ll_kbytesfree);
+LUSTRE_RO_ATTR(kbytesfree);
 
-static int ll_kbytesavail_seq_show(struct seq_file *m, void *v)
+static ssize_t kbytesavail_show(struct kobject *kobj, char *buf)
 {
-	struct super_block *sb = (struct super_block *)m->private;
+	struct ll_sb_info *sbi = container_of(kobj, struct ll_sb_info,
+					      ll_kobj);
 	struct obd_statfs osfs;
 	int rc;
 
-	LASSERT(sb != NULL);
-	rc = ll_statfs_internal(sb, &osfs,
+	rc = ll_statfs_internal(sbi->ll_sb, &osfs,
 				cfs_time_shift_64(-OBD_STATFS_CACHE_SECONDS),
 				OBD_STATFS_NODELAY);
 	if (!rc) {
@@ -130,81 +130,74 @@ static int ll_kbytesavail_seq_show(struct seq_file *m, void *v)
 		while (blk_size >>= 1)
 			result <<= 1;
 
-		seq_printf(m, "%llu\n", result);
+		rc = snprintf(buf, PAGE_SIZE, "%llu\n", result);
 	}
 
 	return rc;
 }
-LPROC_SEQ_FOPS_RO(ll_kbytesavail);
+LUSTRE_RO_ATTR(kbytesavail);
 
-static int ll_filestotal_seq_show(struct seq_file *m, void *v)
+static ssize_t filestotal_show(struct kobject *kobj, char *buf)
 {
-	struct super_block *sb = (struct super_block *)m->private;
+	struct ll_sb_info *sbi = container_of(kobj, struct ll_sb_info,
+					      ll_kobj);
 	struct obd_statfs osfs;
 	int rc;
 
-	LASSERT(sb != NULL);
-	rc = ll_statfs_internal(sb, &osfs,
+	rc = ll_statfs_internal(sbi->ll_sb, &osfs,
 				cfs_time_shift_64(-OBD_STATFS_CACHE_SECONDS),
 				OBD_STATFS_NODELAY);
 	if (!rc)
-		seq_printf(m, "%llu\n", osfs.os_files);
+		return snprintf(buf, PAGE_SIZE, "%llu\n", osfs.os_files);
 
 	return rc;
 }
-LPROC_SEQ_FOPS_RO(ll_filestotal);
+LUSTRE_RO_ATTR(filestotal);
 
-static int ll_filesfree_seq_show(struct seq_file *m, void *v)
+static ssize_t filesfree_show(struct kobject *kobj, char *buf)
 {
-	struct super_block *sb = (struct super_block *)m->private;
+	struct ll_sb_info *sbi = container_of(kobj, struct ll_sb_info,
+					      ll_kobj);
 	struct obd_statfs osfs;
 	int rc;
 
-	LASSERT(sb != NULL);
-	rc = ll_statfs_internal(sb, &osfs,
+	rc = ll_statfs_internal(sbi->ll_sb, &osfs,
 				cfs_time_shift_64(-OBD_STATFS_CACHE_SECONDS),
 				OBD_STATFS_NODELAY);
 	if (!rc)
-		seq_printf(m, "%llu\n", osfs.os_ffree);
+		return snprintf(buf, PAGE_SIZE, "%llu\n", osfs.os_ffree);
 
 	return rc;
 }
-LPROC_SEQ_FOPS_RO(ll_filesfree);
+LUSTRE_RO_ATTR(filesfree);
 
-static int ll_client_type_seq_show(struct seq_file *m, void *v)
+static ssize_t client_type_show(struct kobject *kobj, char *buf)
 {
-	struct ll_sb_info *sbi = ll_s2sbi((struct super_block *)m->private);
+	struct ll_sb_info *sbi = container_of(kobj, struct ll_sb_info,
+					      ll_kobj);
 
-	LASSERT(sbi != NULL);
-
-	if (sbi->ll_flags & LL_SBI_RMT_CLIENT)
-		seq_puts(m, "remote client\n");
-	else
-		seq_puts(m, "local client\n");
-
-	return 0;
+	return snprintf(buf, PAGE_SIZE, "%s client\n",
+			sbi->ll_flags & LL_SBI_RMT_CLIENT ? "remote" : "local");
 }
-LPROC_SEQ_FOPS_RO(ll_client_type);
+LUSTRE_RO_ATTR(client_type);
 
-static int ll_fstype_seq_show(struct seq_file *m, void *v)
+static ssize_t fstype_show(struct kobject *kobj, char *buf)
 {
-	struct super_block *sb = (struct super_block *)m->private;
+	struct ll_sb_info *sbi = container_of(kobj, struct ll_sb_info,
+					      ll_kobj);
 
-	LASSERT(sb != NULL);
-	seq_printf(m, "%s\n", sb->s_type->name);
-	return 0;
+	return snprintf(buf, PAGE_SIZE, "%s\n", sbi->ll_sb->s_type->name);
 }
-LPROC_SEQ_FOPS_RO(ll_fstype);
+LUSTRE_RO_ATTR(fstype);
 
-static int ll_sb_uuid_seq_show(struct seq_file *m, void *v)
+static ssize_t uuid_show(struct kobject *kobj, char *buf)
 {
-	struct super_block *sb = (struct super_block *)m->private;
+	struct ll_sb_info *sbi = container_of(kobj, struct ll_sb_info,
+					      ll_kobj);
 
-	LASSERT(sb != NULL);
-	seq_printf(m, "%s\n", ll_s2sbi(sb)->ll_sb_uuid.uuid);
-	return 0;
+	return snprintf(buf, PAGE_SIZE, "%s\n", sbi->ll_sb_uuid.uuid);
 }
-LPROC_SEQ_FOPS_RO(ll_sb_uuid);
+LUSTRE_RO_ATTR(uuid);
 
 static int ll_site_stats_seq_show(struct seq_file *m, void *v)
 {
@@ -218,10 +211,10 @@ static int ll_site_stats_seq_show(struct seq_file *m, void *v)
 }
 LPROC_SEQ_FOPS_RO(ll_site_stats);
 
-static int ll_max_readahead_mb_seq_show(struct seq_file *m, void *v)
+static ssize_t max_read_ahead_mb_show(struct kobject *kobj, char *buf)
 {
-	struct super_block *sb = m->private;
-	struct ll_sb_info *sbi = ll_s2sbi(sb);
+	struct ll_sb_info *sbi = container_of(kobj, struct ll_sb_info,
+					      ll_kobj);
 	long pages_number;
 	int mult;
 
@@ -230,23 +223,26 @@ static int ll_max_readahead_mb_seq_show(struct seq_file *m, void *v)
 	spin_unlock(&sbi->ll_lock);
 
 	mult = 1 << (20 - PAGE_CACHE_SHIFT);
-	return lprocfs_seq_read_frac_helper(m, pages_number, mult);
+	return lprocfs_read_frac_helper(buf, PAGE_SIZE, pages_number, mult);
 }
 
-static ssize_t ll_max_readahead_mb_seq_write(struct file *file,
-					     const char __user *buffer,
-					     size_t count, loff_t *off)
+static ssize_t max_read_ahead_mb_store(struct kobject *kobj,
+				       const char *buffer,
+				       size_t count)
 {
-	struct super_block *sb = ((struct seq_file *)file->private_data)->private;
-	struct ll_sb_info *sbi = ll_s2sbi(sb);
-	int mult, rc, pages_number;
+	struct ll_sb_info *sbi = container_of(kobj, struct ll_sb_info,
+					      ll_kobj);
+	int rc;
+	unsigned long pages_number;
 
-	mult = 1 << (20 - PAGE_CACHE_SHIFT);
-	rc = lprocfs_write_frac_helper(buffer, count, &pages_number, mult);
+	rc = kstrtoul(buffer, 10, &pages_number);
 	if (rc)
 		return rc;
 
-	if (pages_number < 0 || pages_number > totalram_pages / 2) {
+	pages_number *= 1 << (20 - PAGE_CACHE_SHIFT); /* MB -> pages */
+
+	if (pages_number > totalram_pages / 2) {
+
 		CERROR("can't set file readahead more than %lu MB\n",
 		       totalram_pages >> (20 - PAGE_CACHE_SHIFT + 1)); /*1/2 of RAM*/
 		return -ERANGE;
@@ -258,7 +254,7 @@ static ssize_t ll_max_readahead_mb_seq_write(struct file *file,
 
 	return count;
 }
-LPROC_SEQ_FOPS(ll_max_readahead_mb);
+LUSTRE_RW_ATTR(max_read_ahead_mb);
 
 static int ll_max_readahead_per_file_mb_seq_show(struct seq_file *m, void *v)
 {
@@ -835,19 +831,7 @@ static ssize_t ll_xattr_cache_seq_write(struct file *file,
 LPROC_SEQ_FOPS(ll_xattr_cache);
 
 static struct lprocfs_vars lprocfs_llite_obd_vars[] = {
-	{ "uuid",	  &ll_sb_uuid_fops,	  NULL, 0 },
-	/* { "mntpt_path",   ll_rd_path,	     0, 0 }, */
-	{ "fstype",       &ll_fstype_fops,	  NULL, 0 },
 	{ "site",	  &ll_site_stats_fops,    NULL, 0 },
-	{ "blocksize",    &ll_blksize_fops,	  NULL, 0 },
-	{ "kbytestotal",  &ll_kbytestotal_fops,   NULL, 0 },
-	{ "kbytesfree",   &ll_kbytesfree_fops,    NULL, 0 },
-	{ "kbytesavail",  &ll_kbytesavail_fops,   NULL, 0 },
-	{ "filestotal",   &ll_filestotal_fops,    NULL, 0 },
-	{ "filesfree",    &ll_filesfree_fops,	  NULL, 0 },
-	{ "client_type",  &ll_client_type_fops,   NULL, 0 },
-	/* { "filegroups",   lprocfs_rd_filegroups,  0, 0 }, */
-	{ "max_read_ahead_mb", &ll_max_readahead_mb_fops, NULL },
 	{ "max_read_ahead_per_file_mb", &ll_max_readahead_per_file_mb_fops,
 		NULL },
 	{ "max_read_ahead_whole_mb", &ll_max_read_ahead_whole_mb_fops, NULL },
@@ -872,6 +856,33 @@ static struct lprocfs_vars lprocfs_llite_obd_vars[] = {
 
 #define MAX_STRING_SIZE 128
 
+static struct attribute *llite_attrs[] = {
+	LUSTRE_ATTR_LIST(blocksize),
+	LUSTRE_ATTR_LIST(kbytestotal),
+	LUSTRE_ATTR_LIST(kbytesfree),
+	LUSTRE_ATTR_LIST(kbytesavail),
+	LUSTRE_ATTR_LIST(uuid),
+	LUSTRE_ATTR_LIST(fstype),
+	LUSTRE_ATTR_LIST(filestotal),
+	LUSTRE_ATTR_LIST(filesfree),
+	LUSTRE_ATTR_LIST(client_type),
+	LUSTRE_ATTR_LIST(max_read_ahead_mb),
+	NULL,
+};
+
+static void llite_sb_release(struct kobject *kobj)
+{
+	struct ll_sb_info *sbi = container_of(kobj, struct ll_sb_info,
+					      ll_kobj);
+	complete(&sbi->ll_kobj_unregister);
+}
+
+static struct kobj_type llite_ktype = {
+	.default_attrs	= llite_attrs,
+	.sysfs_ops	= &lustre_sysfs_ops,
+	.release	= llite_sb_release,
+};
+
 static const struct llite_file_opcode {
 	__u32       opcode;
 	__u32       type;
@@ -1064,6 +1075,13 @@ int lprocfs_register_mountpoint(struct proc_dir_entry *parent,
 	if (err)
 		goto out;
 
+	sbi->ll_kobj.kset = llite_kset;
+	init_completion(&sbi->ll_kobj_unregister);
+	err = kobject_init_and_add(&sbi->ll_kobj, &llite_ktype, NULL,
+				   "%s", name);
+	if (err)
+		goto out;
+
 	/* MDC info */
 	obd = class_name2obd(mdc);
 
@@ -1124,6 +1142,8 @@ void lprocfs_unregister_mountpoint(struct ll_sb_info *sbi)
 {
 	if (sbi->ll_proc_root) {
 		lprocfs_remove(&sbi->ll_proc_root);
+		kobject_put(&sbi->ll_kobj);
+		wait_for_completion(&sbi->ll_kobj_unregister);
 		lprocfs_free_stats(&sbi->ll_ra_stats);
 		lprocfs_free_stats(&sbi->ll_stats);
 	}
diff --git a/drivers/staging/lustre/lustre/llite/super25.c b/drivers/staging/lustre/lustre/llite/super25.c
index a494f62..7ad00b3 100644
--- a/drivers/staging/lustre/lustre/llite/super25.c
+++ b/drivers/staging/lustre/lustre/llite/super25.c
@@ -138,6 +138,12 @@ static int __init init_lustre_lite(void)
 
 	proc_lustre_fs_root = entry;
 
+	llite_kset = kset_create_and_add("llite", NULL, &lustre_kobj);
+	if (!llite_kset) {
+		rc = -ENOMEM;
+		goto out_proc;
+	}
+
 	cfs_get_random_bytes(seed, sizeof(seed));
 
 	/* Nodes with small feet have little entropy. The NID for this
@@ -155,7 +161,7 @@ static int __init init_lustre_lite(void)
 	setup_timer(&ll_capa_timer, ll_capa_timer_callback, 0);
 	rc = ll_capa_thread_start();
 	if (rc != 0)
-		goto out_proc;
+		goto out_sysfs;
 
 	rc = vvp_global_init();
 	if (rc != 0)
@@ -176,6 +182,8 @@ out_vvp:
 out_capa:
 	del_timer(&ll_capa_timer);
 	ll_capa_thread_stop();
+out_sysfs:
+	kset_unregister(llite_kset);
 out_proc:
 	lprocfs_remove(&proc_lustre_fs_root);
 out_cache:
@@ -201,6 +209,7 @@ static void __exit exit_lustre_lite(void)
 	lustre_register_client_process_config(NULL);
 
 	lprocfs_remove(&proc_lustre_fs_root);
+	kset_unregister(llite_kset);
 
 	ll_xattr_fini();
 	vvp_global_fini();
-- 
2.1.0

