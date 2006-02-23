From: Eric Sesterhenn <snakebyte@gmx.de>
Date: Thu, 23 Feb 2006 00:05:06 +0000
Subject: [KJ] [Patch] kzalloc conversion in fs/jfs
Message-Id: <1140653107.5833.8.camel@alice>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============041915503486678496=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <1140562365.26697.0.camel@alice>
In-Reply-To: <1140562365.26697.0.camel@alice>
To: kernel-janitors@vger.kernel.org

--===============041915503486678496==
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

hi,

this converts fs/jfs to kzalloc() usage.
compile tested with make allyesconfig

Signed-off-by: Eric Sesterhenn <snakebyte@gmx.de>

--- linux-2.6.16-rc4/fs/jfs/jfs_metapage.c.orig	2006-02-23 00:44:21.000000000 +0100
+++ linux-2.6.16-rc4/fs/jfs/jfs_metapage.c	2006-02-23 00:44:34.000000000 +0100
@@ -104,10 +104,9 @@ static inline int insert_metapage(struct
 	if (PagePrivate(page))
 		a = mp_anchor(page);
 	else {
-		a = kmalloc(sizeof(struct meta_anchor), GFP_NOFS);
+		a = kzalloc(sizeof(struct meta_anchor), GFP_NOFS);
 		if (!a)
 			return -ENOMEM;
-		memset(a, 0, sizeof(struct meta_anchor));
 		set_page_private(page, (unsigned long)a);
 		SetPagePrivate(page);
 		kmap(page);
--- linux-2.6.16-rc4/fs/jfs/super.c.orig	2006-02-23 00:44:42.000000000 +0100
+++ linux-2.6.16-rc4/fs/jfs/super.c	2006-02-23 00:45:45.000000000 +0100
@@ -396,10 +396,9 @@ static int jfs_fill_super(struct super_b
 	if (!new_valid_dev(sb->s_bdev->bd_dev))
 		return -EOVERFLOW;
 
-	sbi = kmalloc(sizeof (struct jfs_sb_info), GFP_KERNEL);
+	sbi = kzalloc(sizeof (struct jfs_sb_info), GFP_KERNEL);
 	if (!sbi)
 		return -ENOSPC;
-	memset(sbi, 0, sizeof (struct jfs_sb_info));
 	sb->s_fs_info = sbi;
 	sbi->sb = sb;
 
--- linux-2.6.16-rc4/fs/jfs/jfs_logmgr.c.orig	2006-02-23 00:45:58.000000000 +0100
+++ linux-2.6.16-rc4/fs/jfs/jfs_logmgr.c	2006-02-23 00:46:59.000000000 +0100
@@ -1105,11 +1105,10 @@ int lmLogOpen(struct super_block *sb)
 		}
 	}
 
-	if (!(log = kmalloc(sizeof(struct jfs_log), GFP_KERNEL))) {
+	if (!(log = kzalloc(sizeof(struct jfs_log), GFP_KERNEL))) {
 		up(&jfs_log_sem);
 		return -ENOMEM;
 	}
-	memset(log, 0, sizeof(struct jfs_log));
 	INIT_LIST_HEAD(&log->sb_list);
 	init_waitqueue_head(&log->syncwait);
 
@@ -1181,9 +1180,8 @@ static int open_inline_log(struct super_
 	struct jfs_log *log;
 	int rc;
 
-	if (!(log = kmalloc(sizeof(struct jfs_log), GFP_KERNEL)))
+	if (!(log = kzalloc(sizeof(struct jfs_log), GFP_KERNEL)))
 		return -ENOMEM;
-	memset(log, 0, sizeof(struct jfs_log));
 	INIT_LIST_HEAD(&log->sb_list);
 	init_waitqueue_head(&log->syncwait);
 
@@ -1216,12 +1214,11 @@ static int open_dummy_log(struct super_b
 
 	down(&jfs_log_sem);
 	if (!dummy_log) {
-		dummy_log = kmalloc(sizeof(struct jfs_log), GFP_KERNEL);
+		dummy_log = kzalloc(sizeof(struct jfs_log), GFP_KERNEL);
 		if (!dummy_log) {
 			up(&jfs_log_sem);
 			return -ENOMEM;
 		}
-		memset(dummy_log, 0, sizeof(struct jfs_log));
 		INIT_LIST_HEAD(&dummy_log->sb_list);
 		init_waitqueue_head(&dummy_log->syncwait);
 		dummy_log->no_integrity = 1;



--===============041915503486678496==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============041915503486678496==--
