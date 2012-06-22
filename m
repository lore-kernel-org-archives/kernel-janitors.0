From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 22 Jun 2012 07:14:33 +0000
Subject: [patch] Btrfs: dereferencing free'd memory in panic message
Message-Id: <20120622071433.GA27618@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Chris Mason <chris.mason@fusionio.com>
Cc: linux-btrfs@vger.kernel.org, kernel-janitors@vger.kernel.org

We free "node" and then dereference it in the panic message on the next
line.  I considered moving the kfree() after the panic given that panic
can return under certain configurations, but in the end I decided it
doesn't matter if we leak a bit after a panic.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/fs/btrfs/relocation.c b/fs/btrfs/relocation.c
index 790f492..c50d80a 100644
--- a/fs/btrfs/relocation.c
+++ b/fs/btrfs/relocation.c
@@ -1239,7 +1239,6 @@ static int __must_check __add_reloc_root(struct btrfs_root *root)
 			      node->bytenr, &node->rb_node);
 	spin_unlock(&rc->reloc_root_tree.lock);
 	if (rb_node) {
-		kfree(node);
 		btrfs_panic(root->fs_info, -EEXIST, "Duplicate root found "
 			    "for start=%llu while inserting into relocation "
 			    "tree\n", node->bytenr);
