From: Eric Sesterhenn / snakebyte <snakebyte@gmx.de>
Date: Fri, 27 Jan 2006 09:32:40 +0000
Subject: [KJ] [Patch 5/12] BUG_ON() Conversion in fs/hfsplus/
Message-Id: <1138354360.7391.52.camel@alice>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============68684442317314764=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============68684442317314764==
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

hi,

this changes if() BUG(); constructs to BUG_ON() which is
cleaner, contains unlikely() and can better optimized away.

Signed-off-by: Eric Sesterhenn <snakebyte@gmx.de>

--- linux-2.6.16-rc1-git4/fs/hfsplus/bnode.c.orig	2006-01-27 01:33:05.000000000 +0100
+++ linux-2.6.16-rc1-git4/fs/hfsplus/bnode.c	2006-01-27 01:33:24.000000000 +0100
@@ -466,8 +466,7 @@ void hfs_bnode_unhash(struct hfs_bnode *
 	for (p = &node->tree->node_hash[hfs_bnode_hash(node->this)];
 	     *p && *p != node; p = &(*p)->next_hash)
 		;
-	if (!*p)
-		BUG();
+	BUG_ON(!*p);
 	*p = node->next_hash;
 	node->tree->node_hash_cnt--;
 }
@@ -621,8 +620,7 @@ void hfs_bnode_put(struct hfs_bnode *nod
 
 		dprint(DBG_BNODE_REFS, "put_node(%d:%d): %d\n",
 		       node->tree->cnid, node->this, atomic_read(&node->refcnt));
-		if (!atomic_read(&node->refcnt))
-			BUG();
+		BUG_ON(!atomic_read(&node->refcnt));
 		if (!atomic_dec_and_lock(&node->refcnt, &tree->hash_lock))
 			return;
 		for (i = 0; i < tree->pages_per_bnode; i++) {
--- linux-2.6.16-rc1-git4/fs/hfsplus/btree.c.orig	2006-01-27 01:32:43.000000000 +0100
+++ linux-2.6.16-rc1-git4/fs/hfsplus/btree.c	2006-01-27 01:32:54.000000000 +0100
@@ -268,8 +268,7 @@ void hfs_bmap_free(struct hfs_bnode *nod
 	u8 *data, byte, m;
 
 	dprint(DBG_BNODE_MOD, "btree_free_node: %u\n", node->this);
-	if (!node->this)
-		BUG();
+	BUG_ON(!node->this);
 	tree = node->tree;
 	nidx = node->this;
 	node = hfs_bnode_find(tree, 0);



--===============68684442317314764==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============68684442317314764==--
