From: Eric Sesterhenn <snakebyte@gmx.de>
Date: Thu, 23 Feb 2006 00:05:12 +0000
Subject: [KJ] [Patch] kzalloc conversion in fs/hfsplus
Message-Id: <1140653112.5833.10.camel@alice>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============34250691837139469=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <1140653110.5833.9.camel@alice>
In-Reply-To: <1140653110.5833.9.camel@alice>
To: kernel-janitors@vger.kernel.org

--===============34250691837139469==
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

hi,

this converts fs/hfsplus to kzalloc() usage.
compile tested with make allyesconfig

Signed-off-by: Eric Sesterhenn <snakebyte@gmx.de>

--- linux-2.6.16-rc4/fs/hfsplus/bnode.c.orig	2006-02-22 16:24:48.000000000 +0100
+++ linux-2.6.16-rc4/fs/hfsplus/bnode.c	2006-02-22 16:25:09.000000000 +0100
@@ -409,10 +409,9 @@ static struct hfs_bnode *__hfs_bnode_cre
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
--- linux-2.6.16-rc4/fs/hfsplus/btree.c.orig	2006-02-22 16:25:18.000000000 +0100
+++ linux-2.6.16-rc4/fs/hfsplus/btree.c	2006-02-22 16:25:31.000000000 +0100
@@ -24,10 +24,9 @@ struct hfs_btree *hfs_btree_open(struct 
 	struct page *page;
 	unsigned int size;
 
-	tree = kmalloc(sizeof(*tree), GFP_KERNEL);
+	tree = kzalloc(sizeof(*tree), GFP_KERNEL);
 	if (!tree)
 		return NULL;
-	memset(tree, 0, sizeof(*tree));
 
 	init_MUTEX(&tree->tree_lock);
 	spin_lock_init(&tree->hash_lock);



--===============34250691837139469==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============34250691837139469==--
