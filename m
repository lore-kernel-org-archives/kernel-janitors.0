From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Mon, 25 Jun 2012 11:15:23 +0000
Subject: [patch v2] Btrfs: fix error handling in __add_reloc_root()
Message-Id: <20120625111048.GA10393@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
In-Reply-To: <4FE473F6.5000109@fusionio.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Chris Mason <chris.mason@fusionio.com>
Cc: linux-btrfs@vger.kernel.org, Josef Bacik <jbacik@fusionio.com>, kernel-janitors@vger.kernel.org

We dereferenced "node" in the error message after freeing it.  Also
btrfs_panic() can return so we should return an error code instead of
continuing.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
v2: in the first version I just deleted the kfree().

diff --git a/fs/btrfs/relocation.c b/fs/btrfs/relocation.c
index 790f492..4da0865 100644
--- a/fs/btrfs/relocation.c
+++ b/fs/btrfs/relocation.c
@@ -1239,10 +1239,11 @@ static int __must_check __add_reloc_root(struct btrfs_root *root)
 			      node->bytenr, &node->rb_node);
 	spin_unlock(&rc->reloc_root_tree.lock);
 	if (rb_node) {
-		kfree(node);
 		btrfs_panic(root->fs_info, -EEXIST, "Duplicate root found "
 			    "for start=%llu while inserting into relocation "
 			    "tree\n", node->bytenr);
+		kfree(node);
+		return -EEXIST;
 	}
 
 	list_add_tail(&root->root_list, &rc->reloc_roots);
