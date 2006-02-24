From: Eric Sesterhenn <snakebyte@gmx.de>
Date: Fri, 24 Feb 2006 20:50:12 +0000
Subject: Re: [KJ] [Patch] fs/ kzalloc conversions
Message-Id: <1140814212.24243.4.camel@alice>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============29069211499657999=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <1140772454.22453.1.camel@alice>
	<20060224111755.GA7801@mipter.zuzino.mipt.ru>
	<20060224152628.GO28587@parisc-linux.org>
In-Reply-To: <20060224152628.GO28587@parisc-linux.org>
To: Matthew Wilcox <matthew@wil.cx>
Cc: linux-fsdevel@vger.kernel.org, kernel-janitors@lists.osdl.org

--===============29069211499657999==
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Fri, 2006-02-24 at 08:26 -0700, Matthew Wilcox wrote:
> [this mail serves two purposes.  One is to educate about the limits of
> what a compiler can do, and the other is to alert to a memory-corruption
> bug in AIO.  If you're only interested in the latter, please skip to
> the bottom.]

thanks, good to know that there is an overflow hiding.
Here is an updated patch, compile tested with allyesconfig.

Signed-off-by: Eric Sesterhenn <snakebyte@gmx.de>

--- linux-2.6.16-rc4/fs/adfs/super.c.orig	2006-02-21 22:34:10.000000000 +0100
+++ linux-2.6.16-rc4/fs/adfs/super.c	2006-02-21 22:34:20.000000000 +0100
@@ -338,11 +338,10 @@ static int adfs_fill_super(struct super_
 
 	sb->s_flags |= MS_NODIRATIME;
 
-	asb = kmalloc(sizeof(*asb), GFP_KERNEL);
+	asb = kzalloc(sizeof(*asb), GFP_KERNEL);
 	if (!asb)
 		return -ENOMEM;
 	sb->s_fs_info = asb;
-	memset(asb, 0, sizeof(*asb));
 
 	/* set default options */
 	asb->s_uid = 0;
--- linux-2.6.16-rc4/fs/aio.c.orig	2006-02-21 22:34:34.000000000 +0100
+++ linux-2.6.16-rc4/fs/aio.c	2006-02-21 22:35:56.000000000 +0100
@@ -122,10 +122,9 @@ static int aio_setup_ring(struct kioctx 
 	info->nr = 0;
 	info->ring_pages = info->internal_pages;
 	if (nr_pages > AIO_RING_PAGES) {
-		info->ring_pages = kmalloc(sizeof(struct page *) * nr_pages, GFP_KERNEL);
+		info->ring_pages = kcalloc(nr_pages, sizeof(struct page *), GFP_KERNEL);
 		if (!info->ring_pages)
 			return -ENOMEM;
-		memset(info->ring_pages, 0, sizeof(struct page *) * nr_pages);
 	}
 
 	info->mmap_size = nr_pages * PAGE_SIZE;
--- linux-2.6.16-rc4/fs/autofs4/inode.c.orig	2006-02-23 01:12:29.000000000 +0100
+++ linux-2.6.16-rc4/fs/autofs4/inode.c	2006-02-23 01:13:00.000000000 +0100
@@ -253,13 +253,11 @@ int autofs4_fill_super(struct super_bloc
 	struct autofs_info *ino;
 	int minproto, maxproto;
 
-	sbi = (struct autofs_sb_info *) kmalloc(sizeof(*sbi), GFP_KERNEL);
+	sbi = (struct autofs_sb_info *) kzalloc(sizeof(*sbi), GFP_KERNEL);
 	if ( !sbi )
 		goto fail_unlock;
 	DPRINTK("starting up, sbi = %p",sbi);
 
-	memset(sbi, 0, sizeof(*sbi));
-
 	s->s_fs_info = sbi;
 	sbi->magic = AUTOFS_SBI_MAGIC;
 	sbi->root = NULL;
--- linux-2.6.16-rc4/fs/autofs/inode.c.orig	2006-02-21 22:40:48.000000000 +0100
+++ linux-2.6.16-rc4/fs/autofs/inode.c	2006-02-21 22:48:51.000000000 +0100
@@ -128,10 +128,9 @@ int autofs_fill_super(struct super_block
 	struct autofs_sb_info *sbi;
 	int minproto, maxproto;
 
-	sbi = kmalloc(sizeof(*sbi), GFP_KERNEL);
+	sbi = kzalloc(sizeof(*sbi), GFP_KERNEL);
 	if ( !sbi )
 		goto fail_unlock;
-	memset(sbi, 0, sizeof(*sbi));
 	DPRINTK(("autofs: starting up, sbi = %p\n",sbi));
 
 	s->s_fs_info = sbi;
--- linux-2.6.16-rc4/fs/bfs/inode.c.orig	2006-02-23 01:19:56.000000000 +0100
+++ linux-2.6.16-rc4/fs/bfs/inode.c	2006-02-23 01:20:14.000000000 +0100
@@ -309,11 +309,10 @@ static int bfs_fill_super(struct super_b
 	unsigned i, imap_len;
 	struct bfs_sb_info * info;
 
-	info = kmalloc(sizeof(*info), GFP_KERNEL);
+	info = kzalloc(sizeof(*info), GFP_KERNEL);
 	if (!info)
 		return -ENOMEM;
 	s->s_fs_info = info;
-	memset(info, 0, sizeof(*info));
 
 	sb_set_blocksize(s, BFS_BSIZE);
 
@@ -336,10 +335,9 @@ static int bfs_fill_super(struct super_b
 			+ BFS_ROOT_INO - 1;
 
 	imap_len = info->si_lasti/8 + 1;
-	info->si_imap = kmalloc(imap_len, GFP_KERNEL);
+	info->si_imap = kzalloc(imap_len, GFP_KERNEL);
 	if (!info->si_imap)
 		goto out;
-	memset(info->si_imap, 0, imap_len);
 	for (i=0; i<BFS_ROOT_INO; i++) 
 		set_bit(i, info->si_imap);
 
--- linux-2.6.16-rc4/fs/binfmt_elf_fdpic.c.orig	2006-02-23 00:43:34.000000000 +0100
+++ linux-2.6.16-rc4/fs/binfmt_elf_fdpic.c	2006-02-23 00:43:56.000000000 +0100
@@ -678,12 +678,11 @@ static int elf_fdpic_map_file(struct elf
 		return -ELIBBAD;
 
 	size = sizeof(*loadmap) + nloads * sizeof(*seg);
-	loadmap = kmalloc(size, GFP_KERNEL);
+	loadmap = kzalloc(size, GFP_KERNEL);
 	if (!loadmap)
 		return -ENOMEM;
 
 	params->loadmap = loadmap;
-	memset(loadmap, 0, size);
 
 	loadmap->version = ELF32_FDPIC_LOADMAP_VERSION;
 	loadmap->nsegs = nloads;
--- linux-2.6.16-rc4/fs/binfmt_elf.c.orig	2006-02-22 02:03:38.000000000 +0100
+++ linux-2.6.16-rc4/fs/binfmt_elf.c	2006-02-22 02:04:03.000000000 +0100
@@ -1460,12 +1460,11 @@ static int elf_core_dump(long signr, str
 		read_lock(&tasklist_lock);
 		do_each_thread(g,p)
 			if (current->mm == p->mm && current != p) {
-				tmp = kmalloc(sizeof(*tmp), GFP_ATOMIC);
+				tmp = kzalloc(sizeof(*tmp), GFP_ATOMIC);
 				if (!tmp) {
 					read_unlock(&tasklist_lock);
 					goto cleanup;
 				}
-				memset(tmp, 0, sizeof(*tmp));
 				INIT_LIST_HEAD(&tmp->list);
 				tmp->thread = p;
 				list_add(&tmp->list, &thread_list);
--- linux-2.6.16-rc4/fs/bio.c.orig	2006-02-22 16:23:46.000000000 +0100
+++ linux-2.6.16-rc4/fs/bio.c	2006-02-22 16:24:25.000000000 +0100
@@ -635,12 +635,10 @@ static struct bio *__bio_map_user_iov(re
 		return ERR_PTR(-ENOMEM);
 
 	ret = -ENOMEM;
-	pages = kmalloc(nr_pages * sizeof(struct page *), GFP_KERNEL);
+	pages = kzalloc(nr_pages * sizeof(struct page *), GFP_KERNEL);
 	if (!pages)
 		goto out;
 
-	memset(pages, 0, nr_pages * sizeof(struct page *));
-
 	for (i = 0; i < iov_count; i++) {
 		unsigned long uaddr = (unsigned long)iov[i].iov_base;
 		unsigned long len = iov[i].iov_len;
@@ -1182,12 +1180,11 @@ void bioset_free(struct bio_set *bs)
 
 struct bio_set *bioset_create(int bio_pool_size, int bvec_pool_size, int scale)
 {
-	struct bio_set *bs = kmalloc(sizeof(*bs), GFP_KERNEL);
+	struct bio_set *bs = kzalloc(sizeof(*bs), GFP_KERNEL);
 
 	if (!bs)
 		return NULL;
 
-	memset(bs, 0, sizeof(*bs));
 	bs->bio_pool = mempool_create(bio_pool_size, mempool_alloc_slab,
 			mempool_free_slab, bio_slab);
 
--- linux-2.6.16-rc4/fs/char_dev.c.orig	2006-02-23 01:09:51.000000000 +0100
+++ linux-2.6.16-rc4/fs/char_dev.c	2006-02-23 01:10:19.000000000 +0100
@@ -145,12 +145,10 @@ __register_chrdev_region(unsigned int ma
 	int ret = 0;
 	int i;
 
-	cd = kmalloc(sizeof(struct char_device_struct), GFP_KERNEL);
+	cd = kzalloc(sizeof(struct char_device_struct), GFP_KERNEL);
 	if (cd == NULL)
 		return ERR_PTR(-ENOMEM);
 
-	memset(cd, 0, sizeof(struct char_device_struct));
-
 	down(&chrdevs_lock);
 
 	/* temporary */
@@ -465,9 +463,8 @@ static struct kobj_type ktype_cdev_dynam
 
 struct cdev *cdev_alloc(void)
 {
-	struct cdev *p = kmalloc(sizeof(struct cdev), GFP_KERNEL);
+	struct cdev *p = kzalloc(sizeof(struct cdev), GFP_KERNEL);
 	if (p) {
-		memset(p, 0, sizeof(struct cdev));
 		p->kobj.ktype = &ktype_cdev_dynamic;
 		INIT_LIST_HEAD(&p->list);
 		kobject_init(&p->kobj);
--- linux-2.6.16-rc4/fs/compat.c.orig	2006-02-23 01:13:40.000000000 +0100
+++ linux-2.6.16-rc4/fs/compat.c	2006-02-23 01:14:00.000000000 +0100
@@ -1474,10 +1474,9 @@ int compat_do_execve(char * filename,
 	int i;
 
 	retval = -ENOMEM;
-	bprm = kmalloc(sizeof(*bprm), GFP_KERNEL);
+	bprm = kzalloc(sizeof(*bprm), GFP_KERNEL);
 	if (!bprm)
 		goto out_ret;
-	memset(bprm, 0, sizeof(*bprm));
 
 	file = open_exec(filename);
 	retval = PTR_ERR(file);
--- linux-2.6.16-rc4/fs/reiserfs/file.c.orig	2006-02-21 22:39:09.000000000 +0100
+++ linux-2.6.16-rc4/fs/reiserfs/file.c	2006-02-21 22:39:45.000000000 +0100
@@ -318,12 +318,11 @@ static int reiserfs_allocate_blocks_for_
 			/* area filled with zeroes, to supply as list of zero blocknumbers
 			   We allocate it outside of loop just in case loop would spin for
 			   several iterations. */
-			char *zeros = kmalloc(to_paste * UNFM_P_SIZE, GFP_ATOMIC);	// We cannot insert more than MAX_ITEM_LEN bytes anyway.
+			char *zeros = kcalloc(to_paste, UNFM_P_SIZE, GFP_ATOMIC);	// We cannot insert more than MAX_ITEM_LEN bytes anyway.
 			if (!zeros) {
 				res = -ENOMEM;
 				goto error_exit_free_blocks;
 			}
-			memset(zeros, 0, to_paste * UNFM_P_SIZE);
 			do {
 				to_paste =
 				    min_t(__u64, hole_size,
--- linux-2.6.16-rc4/fs/cramfs/inode.c.orig	2006-02-22 11:00:20.000000000 +0100
+++ linux-2.6.16-rc4/fs/cramfs/inode.c	2006-02-22 11:00:45.000000000 +0100
@@ -245,11 +245,10 @@ static int cramfs_fill_super(struct supe
 
 	sb->s_flags |= MS_RDONLY;
 
-	sbi = kmalloc(sizeof(struct cramfs_sb_info), GFP_KERNEL);
+	sbi = kzalloc(sizeof(struct cramfs_sb_info), GFP_KERNEL);
 	if (!sbi)
 		return -ENOMEM;
 	sb->s_fs_info = sbi;
-	memset(sbi, 0, sizeof(struct cramfs_sb_info));
 
 	/* Invalidate the read buffers on mount: think disk change.. */
 	down(&read_mutex);
--- linux-2.6.16-rc4/fs/devfs/base.c.orig	2006-02-22 11:01:00.000000000 +0100
+++ linux-2.6.16-rc4/fs/devfs/base.c	2006-02-22 11:01:21.000000000 +0100
@@ -970,9 +970,8 @@ static struct devfs_entry *_devfs_alloc_
 
 	if (name && (namelen < 1))
 		namelen = strlen(name);
-	if ((new = kmalloc(sizeof *new + namelen, GFP_KERNEL)) == NULL)
+	if ((new = kzalloc(sizeof *new + namelen, GFP_KERNEL)) == NULL)
 		return NULL;
-	memset(new, 0, sizeof *new + namelen);	/*  Will set '\0' on name  */
 	new->mode = mode;
 	if (S_ISDIR(mode))
 		rwlock_init(&new->u.dir.lock);
--- linux-2.6.16-rc4/fs/efs/super.c.orig	2006-02-22 10:55:19.000000000 +0100
+++ linux-2.6.16-rc4/fs/efs/super.c	2006-02-22 10:55:44.000000000 +0100
@@ -248,11 +248,10 @@ static int efs_fill_super(struct super_b
 	struct buffer_head *bh;
 	struct inode *root;
 
- 	sb = kmalloc(sizeof(struct efs_sb_info), GFP_KERNEL);
+ 	sb = kzalloc(sizeof(struct efs_sb_info), GFP_KERNEL);
 	if (!sb)
 		return -ENOMEM;
 	s->s_fs_info = sb;
-	memset(sb, 0, sizeof(struct efs_sb_info));
  
 	s->s_magic		= EFS_SUPER_MAGIC;
 	if (!sb_set_blocksize(s, EFS_BLOCKSIZE)) {
--- linux-2.6.16-rc4/fs/exec.c.orig	2006-02-23 01:14:09.000000000 +0100
+++ linux-2.6.16-rc4/fs/exec.c	2006-02-23 01:14:29.000000000 +0100
@@ -1137,10 +1137,9 @@ int do_execve(char * filename,
 	int i;
 
 	retval = -ENOMEM;
-	bprm = kmalloc(sizeof(*bprm), GFP_KERNEL);
+	bprm = kzalloc(sizeof(*bprm), GFP_KERNEL);
 	if (!bprm)
 		goto out_ret;
-	memset(bprm, 0, sizeof(*bprm));
 
 	file = open_exec(filename);
 	retval = PTR_ERR(file);
--- linux-2.6.16-rc4/fs/fat/inode.c.orig	2006-02-23 01:17:26.000000000 +0100
+++ linux-2.6.16-rc4/fs/fat/inode.c	2006-02-23 01:17:35.000000000 +0100
@@ -1167,11 +1167,10 @@ int fat_fill_super(struct super_block *s
 	long error;
 	char buf[50];
 
-	sbi = kmalloc(sizeof(struct msdos_sb_info), GFP_KERNEL);
+	sbi = kzalloc(sizeof(struct msdos_sb_info), GFP_KERNEL);
 	if (!sbi)
 		return -ENOMEM;
 	sb->s_fs_info = sbi;
-	memset(sbi, 0, sizeof(struct msdos_sb_info));
 
 	sb->s_flags |= MS_NODIRATIME;
 	sb->s_magic = MSDOS_SUPER_MAGIC;
--- linux-2.6.16-rc4/fs/file.c.orig	2006-02-21 22:49:05.000000000 +0100
+++ linux-2.6.16-rc4/fs/file.c	2006-02-21 22:49:39.000000000 +0100
@@ -237,10 +237,9 @@ static struct fdtable *alloc_fdtable(int
   	fd_set *new_openset = NULL, *new_execset = NULL;
 	struct file **new_fds;
 
-	fdt = kmalloc(sizeof(*fdt), GFP_KERNEL);
+	fdt = kzalloc(sizeof(*fdt), GFP_KERNEL);
 	if (!fdt)
   		goto out;
-	memset(fdt, 0, sizeof(*fdt));
 
 	nfds = __FD_SETSIZE;
   	/* Expand to the max in easy steps */
--- linux-2.6.16-rc4/fs/hpfs/super.c.orig	2006-02-23 01:13:15.000000000 +0100
+++ linux-2.6.16-rc4/fs/hpfs/super.c	2006-02-23 01:13:26.000000000 +0100
@@ -459,11 +459,10 @@ static int hpfs_fill_super(struct super_
 
 	int o;
 
-	sbi = kmalloc(sizeof(*sbi), GFP_KERNEL);
+	sbi = kzalloc(sizeof(*sbi), GFP_KERNEL);
 	if (!sbi)
 		return -ENOMEM;
 	s->s_fs_info = sbi;
-	memset(sbi, 0, sizeof(*sbi));
 
 	sbi->sb_bmp_dir = NULL;
 	sbi->sb_cp_table = NULL;
--- linux-2.6.16-rc4/fs/isofs/inode.c.orig	2006-02-22 16:23:12.000000000 +0100
+++ linux-2.6.16-rc4/fs/isofs/inode.c	2006-02-22 16:23:28.000000000 +0100
@@ -557,11 +557,10 @@ static int isofs_fill_super(struct super
 	struct iso9660_options		opt;
 	struct isofs_sb_info	      * sbi;
 
-	sbi = kmalloc(sizeof(*sbi), GFP_KERNEL);
+	sbi = kzalloc(sizeof(*sbi), GFP_KERNEL);
 	if (!sbi)
 		return -ENOMEM;
 	s->s_fs_info = sbi;
-	memset(sbi, 0, sizeof(*sbi));
 
 	if (!parse_options((char *)data, &opt))
 		goto out_freesbi;
--- linux-2.6.16-rc4/fs/minix/inode.c.orig	2006-02-22 11:06:35.000000000 +0100
+++ linux-2.6.16-rc4/fs/minix/inode.c	2006-02-22 11:06:58.000000000 +0100
@@ -144,11 +144,10 @@ static int minix_fill_super(struct super
 	struct inode *root_inode;
 	struct minix_sb_info *sbi;
 
-	sbi = kmalloc(sizeof(struct minix_sb_info), GFP_KERNEL);
+	sbi = kzalloc(sizeof(struct minix_sb_info), GFP_KERNEL);
 	if (!sbi)
 		return -ENOMEM;
 	s->s_fs_info = sbi;
-	memset(sbi, 0, sizeof(struct minix_sb_info));
 
 	/* N.B. These should be compile-time tests.
 	   Unfortunately that is impossible. */
@@ -204,10 +203,9 @@ static int minix_fill_super(struct super
 	 * Allocate the buffer map to keep the superblock small.
 	 */
 	i = (sbi->s_imap_blocks + sbi->s_zmap_blocks) * sizeof(bh);
-	map = kmalloc(i, GFP_KERNEL);
+	map = kzalloc(i, GFP_KERNEL);
 	if (!map)
 		goto out_no_map;
-	memset(map, 0, i);
 	sbi->s_imap = &map[0];
 	sbi->s_zmap = &map[sbi->s_imap_blocks];
 
--- linux-2.6.16-rc4/fs/ncpfs/inode.c.orig	2006-02-23 00:41:22.000000000 +0100
+++ linux-2.6.16-rc4/fs/ncpfs/inode.c	2006-02-23 00:41:44.000000000 +0100
@@ -411,11 +411,10 @@ static int ncp_fill_super(struct super_b
 #endif
 	struct ncp_entry_info finfo;
 
-	server = kmalloc(sizeof(struct ncp_server), GFP_KERNEL);
+	server = kzalloc(sizeof(struct ncp_server), GFP_KERNEL);
 	if (!server)
 		return -ENOMEM;
 	sb->s_fs_info = server;
-	memset(server, 0, sizeof(struct ncp_server));
 
 	error = -EFAULT;
 	if (raw_data == NULL)
--- linux-2.6.16-rc4/fs/pipe.c.orig	2006-02-21 22:33:42.000000000 +0100
+++ linux-2.6.16-rc4/fs/pipe.c	2006-02-21 22:33:55.000000000 +0100
@@ -662,10 +662,9 @@ struct inode* pipe_new(struct inode* ino
 {
 	struct pipe_inode_info *info;
 
-	info = kmalloc(sizeof(struct pipe_inode_info), GFP_KERNEL);
+	info = kzalloc(sizeof(struct pipe_inode_info), GFP_KERNEL);
 	if (!info)
 		goto fail_page;
-	memset(info, 0, sizeof(*info));
 	inode->i_pipe = info;
 
 	init_waitqueue_head(PIPE_WAIT(*inode));
--- linux-2.6.16-rc4/fs/qnx4/inode.c.orig	2006-02-23 01:17:44.000000000 +0100
+++ linux-2.6.16-rc4/fs/qnx4/inode.c	2006-02-23 01:18:05.000000000 +0100
@@ -357,11 +357,10 @@ static int qnx4_fill_super(struct super_
 	const char *errmsg;
 	struct qnx4_sb_info *qs;
 
-	qs = kmalloc(sizeof(struct qnx4_sb_info), GFP_KERNEL);
+	qs = kzalloc(sizeof(struct qnx4_sb_info), GFP_KERNEL);
 	if (!qs)
 		return -ENOMEM;
 	s->s_fs_info = qs;
-	memset(qs, 0, sizeof(struct qnx4_sb_info));
 
 	sb_set_blocksize(s, QNX4_BLOCK_SIZE);
 
--- linux-2.6.16-rc4/fs/super.c.orig	2006-02-23 00:41:55.000000000 +0100
+++ linux-2.6.16-rc4/fs/super.c	2006-02-23 00:42:34.000000000 +0100
@@ -55,11 +55,10 @@ DEFINE_SPINLOCK(sb_lock);
  */
 static struct super_block *alloc_super(void)
 {
-	struct super_block *s = kmalloc(sizeof(struct super_block),  GFP_USER);
+	struct super_block *s = kzalloc(sizeof(struct super_block),  GFP_USER);
 	static struct super_operations default_op;
 
 	if (s) {
-		memset(s, 0, sizeof(struct super_block));
 		if (security_sb_alloc(s)) {
 			kfree(s);
 			s = NULL;
--- linux-2.6.16-rc4/fs/sysv/super.c.orig	2006-02-23 01:09:11.000000000 +0100
+++ linux-2.6.16-rc4/fs/sysv/super.c	2006-02-23 01:09:34.000000000 +0100
@@ -369,10 +369,9 @@ static int sysv_fill_super(struct super_
 	if (64 != sizeof (struct sysv_inode))
 		panic("sysv fs: bad inode size");
 
-	sbi = kmalloc(sizeof(struct sysv_sb_info), GFP_KERNEL);
+	sbi = kzalloc(sizeof(struct sysv_sb_info), GFP_KERNEL);
 	if (!sbi)
 		return -ENOMEM;
-	memset(sbi, 0, sizeof(struct sysv_sb_info));
 
 	sbi->s_sb = sb;
 	sbi->s_block_base = 0;
@@ -453,10 +452,9 @@ static int v7_fill_super(struct super_bl
 	if (64 != sizeof (struct sysv_inode))
 		panic("sysv fs: bad i-node size");
 
-	sbi = kmalloc(sizeof(struct sysv_sb_info), GFP_KERNEL);
+	sbi = kzalloc(sizeof(struct sysv_sb_info), GFP_KERNEL);
 	if (!sbi)
 		return -ENOMEM;
-	memset(sbi, 0, sizeof(struct sysv_sb_info));
 
 	sbi->s_sb = sb;
 	sbi->s_block_base = 0;
--- linux-2.6.16-rc4/fs/ufs/super.c.orig	2006-02-23 00:42:44.000000000 +0100
+++ linux-2.6.16-rc4/fs/ufs/super.c	2006-02-23 00:43:04.000000000 +0100
@@ -546,11 +546,10 @@ static int ufs_fill_super(struct super_b
 	
 	UFSD(("ENTER\n"))
 		
-	sbi = kmalloc(sizeof(struct ufs_sb_info), GFP_KERNEL);
+	sbi = kzalloc(sizeof(struct ufs_sb_info), GFP_KERNEL);
 	if (!sbi)
 		goto failed_nomem;
 	sb->s_fs_info = sbi;
-	memset(sbi, 0, sizeof(struct ufs_sb_info));
 
 	UFSD(("flag %u\n", (int)(sb->s_flags & MS_RDONLY)))
 	



--===============29069211499657999==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============29069211499657999==--
