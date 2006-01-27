From: Eric Sesterhenn / snakebyte <snakebyte@gmx.de>
Date: Fri, 27 Jan 2006 09:32:30 +0000
Subject: [KJ] [Patch 4/12] BUG_ON() Conversion in fs/hfs/
Message-Id: <1138354351.7391.48.camel@alice>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============86883623825802081=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============86883623825802081==
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

hi,

this changes if() BUG(); constructs to BUG_ON() which is
cleaner, contains unlikely() and can better optimized away.

Signed-off-by: Eric Sesterhenn <snakebyte@gmx.de>

--- linux-2.6.16-rc1-git4/fs/hfs/bnode.c.orig	2006-01-27 01:32:08.000000000 +0100
+++ linux-2.6.16-rc1-git4/fs/hfs/bnode.c	2006-01-27 01:32:33.000000000 +0100
@@ -306,8 +306,7 @@ void hfs_bnode_unhash(struct hfs_bnode *
 	for (p = &node->tree->node_hash[hfs_bnode_hash(node->this)];
 	     *p && *p != node; p = &(*p)->next_hash)
 		;
-	if (!*p)
-		BUG();
+	BUG_ON(!*p);
 	*p = node->next_hash;
 	node->tree->node_hash_cnt--;
 }
@@ -415,8 +414,7 @@ struct hfs_bnode *hfs_bnode_create(struc
 	spin_lock(&tree->hash_lock);
 	node = hfs_bnode_findhash(tree, num);
 	spin_unlock(&tree->hash_lock);
-	if (node)
-		BUG();
+	BUG_ON(node);
 	node = __hfs_bnode_create(tree, num);
 	if (!node)
 		return ERR_PTR(-ENOMEM);
@@ -459,8 +457,7 @@ void hfs_bnode_put(struct hfs_bnode *nod
 
 		dprint(DBG_BNODE_REFS, "put_node(%d:%d): %d\n",
 		       node->tree->cnid, node->this, atomic_read(&node->refcnt));
-		if (!atomic_read(&node->refcnt))
-			BUG();
+		BUG_ON(!atomic_read(&node->refcnt));
 		if (!atomic_dec_and_lock(&node->refcnt, &tree->hash_lock))
 			return;
 		for (i = 0; i < tree->pages_per_bnode; i++) {
--- linux-2.6.16-rc1-git4/fs/hfs/btree.c.orig	2006-01-27 01:31:02.000000000 +0100
+++ linux-2.6.16-rc1-git4/fs/hfs/btree.c	2006-01-27 01:31:37.000000000 +0100
@@ -36,8 +36,7 @@ struct hfs_btree *hfs_btree_open(struct 
 	tree->inode = iget_locked(sb, id);
 	if (!tree->inode)
 		goto free_tree;
-	if (!(tree->inode->i_state & I_NEW))
-		BUG();
+	BUG_ON(!(tree->inode->i_state & I_NEW));
 	{
 	struct hfs_mdb *mdb = HFS_SB(sb)->mdb;
 	HFS_I(tree->inode)->flags = 0;



--===============86883623825802081==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============86883623825802081==--
