From: Eric Sesterhenn <snakebyte@gmx.de>
Date: Thu, 23 Feb 2006 00:05:10 +0000
Subject: [KJ] [Patch] kzalloc conversion in fs/hfs
Message-Id: <1140653110.5833.9.camel@alice>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============41663129611824345=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============41663129611824345==
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

hi,

this converts fs/hfs to kzalloc() usage.
compile tested with make allyesconfig

Signed-off-by: Eric Sesterhenn <snakebyte@gmx.de>

--- linux-2.6.16-rc4/fs/hfs/bnode.c.orig	2006-02-22 11:05:14.000000000 +0100
+++ linux-2.6.16-rc4/fs/hfs/bnode.c	2006-02-22 11:05:29.000000000 +0100
@@ -249,10 +249,9 @@ static struct hfs_bnode *__hfs_bnode_cre
 	sb = tree->inode->i_sb;
 	size = sizeof(struct hfs_bnode) + tree->pages_per_bnode *
 		sizeof(struct page *);
-	node = kmalloc(size, GFP_KERNEL);
+	node = kzalloc(size, GFP_KERNEL);
 	if (!node)
 		return NULL;
-	memset(node, 0, size);
 	node->tree = tree;
 	node->this = cnid;
 	set_bit(HFS_BNODE_NEW, &node->flags);
--- linux-2.6.16-rc4/fs/hfs/btree.c.orig	2006-02-22 11:05:38.000000000 +0100
+++ linux-2.6.16-rc4/fs/hfs/btree.c	2006-02-22 11:05:46.000000000 +0100
@@ -21,10 +21,9 @@ struct hfs_btree *hfs_btree_open(struct 
 	struct page *page;
 	unsigned int size;
 
-	tree = kmalloc(sizeof(*tree), GFP_KERNEL);
+	tree = kzalloc(sizeof(*tree), GFP_KERNEL);
 	if (!tree)
 		return NULL;
-	memset(tree, 0, sizeof(*tree));
 
 	init_MUTEX(&tree->tree_lock);
 	spin_lock_init(&tree->hash_lock);
--- linux-2.6.16-rc4/fs/hfs/super.c.orig	2006-02-22 11:05:55.000000000 +0100
+++ linux-2.6.16-rc4/fs/hfs/super.c	2006-02-22 11:06:08.000000000 +0100
@@ -355,11 +355,10 @@ static int hfs_fill_super(struct super_b
 	struct inode *root_inode;
 	int res;
 
-	sbi = kmalloc(sizeof(struct hfs_sb_info), GFP_KERNEL);
+	sbi = kzalloc(sizeof(struct hfs_sb_info), GFP_KERNEL);
 	if (!sbi)
 		return -ENOMEM;
 	sb->s_fs_info = sbi;
-	memset(sbi, 0, sizeof(struct hfs_sb_info));
 	INIT_HLIST_HEAD(&sbi->rsrc_inodes);
 
 	res = -EINVAL;



--===============41663129611824345==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============41663129611824345==--
