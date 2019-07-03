From: Markus Elfring <Markus.Elfring@web.de>
Date: Wed, 03 Jul 2019 15:09:54 +0000
Subject: [PATCH 2/3] NFS: Replace 16 seq_printf() calls by seq_puts()
Message-Id: <ae578dc9-9b5d-45e0-d616-546eb24ee084@web.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <cb79bcb1-0fd6-1b7f-c131-5883f09ad105@web.de>
In-Reply-To: <cb79bcb1-0fd6-1b7f-c131-5883f09ad105@web.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: linux-nfs@vger.kernel.org, Anna Schumaker <anna.schumaker@netapp.com>, Trond Myklebust <trond.myklebust@hammerspace.com>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Wed, 3 Jul 2019 15:50:37 +0200

Some strings should be put into a sequence.
Thus use the corresponding function “seq_puts”.

This issue was detected by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 fs/nfs/super.c | 32 ++++++++++++++++----------------
 1 file changed, 16 insertions(+), 16 deletions(-)

diff --git a/fs/nfs/super.c b/fs/nfs/super.c
index 0c229e877ba6..84dcde7f560b 100644
--- a/fs/nfs/super.c
+++ b/fs/nfs/super.c
@@ -582,7 +582,7 @@ static void nfs_show_mountd_options(struct seq_file *m, struct nfs_server *nfss,
 	}
 	default:
 		if (showdefaults)
-			seq_printf(m, ",mountaddr=unspecified");
+			seq_puts(m, ",mountaddr=unspecified");
 	}

 	if (nfss->mountd_version || showdefaults)
@@ -690,29 +690,29 @@ static void nfs_show_mount_options(struct seq_file *m, struct nfs_server *nfss,
 		nfs_show_nfsv4_options(m, nfss, showdefaults);

 	if (nfss->options & NFS_OPTION_FSCACHE)
-		seq_printf(m, ",fsc");
+		seq_puts(m, ",fsc");

 	if (nfss->options & NFS_OPTION_MIGRATION)
-		seq_printf(m, ",migration");
+		seq_puts(m, ",migration");

 	if (nfss->flags & NFS_MOUNT_LOOKUP_CACHE_NONEG) {
 		if (nfss->flags & NFS_MOUNT_LOOKUP_CACHE_NONE)
-			seq_printf(m, ",lookupcache=none");
+			seq_puts(m, ",lookupcache=none");
 		else
-			seq_printf(m, ",lookupcache=pos");
+			seq_puts(m, ",lookupcache=pos");
 	}

 	local_flock = nfss->flags & NFS_MOUNT_LOCAL_FLOCK;
 	local_fcntl = nfss->flags & NFS_MOUNT_LOCAL_FCNTL;

 	if (!local_flock && !local_fcntl)
-		seq_printf(m, ",local_lock=none");
+		seq_puts(m, ",local_lock=none");
 	else if (local_flock && local_fcntl)
-		seq_printf(m, ",local_lock=all");
+		seq_puts(m, ",local_lock=all");
 	else if (local_flock)
-		seq_printf(m, ",local_lock=flock");
+		seq_puts(m, ",local_lock=flock");
 	else
-		seq_printf(m, ",local_lock=posix");
+		seq_puts(m, ",local_lock=posix");
 }

 /*
@@ -739,7 +739,7 @@ EXPORT_SYMBOL_GPL(nfs_show_options);
 static void show_sessions(struct seq_file *m, struct nfs_server *server)
 {
 	if (nfs4_has_session(server->nfs_client))
-		seq_printf(m, ",sessions");
+		seq_puts(m, ",sessions");
 }
 #else
 static void show_sessions(struct seq_file *m, struct nfs_server *server) {}
@@ -816,7 +816,7 @@ int nfs_show_stats(struct seq_file *m, struct dentry *root)
 	/*
 	 * Display all mount option settings
 	 */
-	seq_printf(m, "\n\topts:\t");
+	seq_puts(m, "\n\topts:\t");
 	seq_puts(m, sb_rdonly(root->d_sb) ? "ro" : "rw");
 	seq_puts(m, root->d_sb->s_flags & SB_SYNCHRONOUS ? ",sync" : "");
 	seq_puts(m, root->d_sb->s_flags & SB_NOATIME ? ",noatime" : "");
@@ -827,7 +827,7 @@ int nfs_show_stats(struct seq_file *m, struct dentry *root)

 	show_implementation_id(m, nfss);

-	seq_printf(m, "\n\tcaps:\t");
+	seq_puts(m, "\n\tcaps:\t");
 	seq_printf(m, "caps=0x%x", nfss->caps);
 	seq_printf(m, ",wtmult=%u", nfss->wtmult);
 	seq_printf(m, ",dtsize=%u", nfss->dtsize);
@@ -836,7 +836,7 @@ int nfs_show_stats(struct seq_file *m, struct dentry *root)

 #if IS_ENABLED(CONFIG_NFS_V4)
 	if (nfss->nfs_client->rpc_ops->version == 4) {
-		seq_printf(m, "\n\tnfsv4:\t");
+		seq_puts(m, "\n\tnfsv4:\t");
 		seq_printf(m, "bm0=0x%x", nfss->attr_bitmask[0]);
 		seq_printf(m, ",bm1=0x%x", nfss->attr_bitmask[1]);
 		seq_printf(m, ",bm2=0x%x", nfss->attr_bitmask[2]);
@@ -874,15 +874,15 @@ int nfs_show_stats(struct seq_file *m, struct dentry *root)
 		preempt_enable();
 	}

-	seq_printf(m, "\n\tevents:\t");
+	seq_puts(m, "\n\tevents:\t");
 	for (i = 0; i < __NFSIOS_COUNTSMAX; i++)
 		seq_printf(m, "%lu ", totals.events[i]);
-	seq_printf(m, "\n\tbytes:\t");
+	seq_puts(m, "\n\tbytes:\t");
 	for (i = 0; i < __NFSIOS_BYTESMAX; i++)
 		seq_printf(m, "%Lu ", totals.bytes[i]);
 #ifdef CONFIG_NFS_FSCACHE
 	if (nfss->options & NFS_OPTION_FSCACHE) {
-		seq_printf(m, "\n\tfsc:\t");
+		seq_puts(m, "\n\tfsc:\t");
 		for (i = 0; i < __NFSIOS_FSCACHEMAX; i++)
 			seq_printf(m, "%Lu ", totals.fscache[i]);
 	}
--
2.22.0
