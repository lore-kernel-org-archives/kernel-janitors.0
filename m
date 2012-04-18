From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 18 Apr 2012 06:59:03 +0000
Subject: [patch 1/2] Btrfs: double unlock bug in error handling
Message-Id: <20120418065903.GE12831@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Chris Mason <chris.mason@oracle.com>, Jeff Mahoney <jeffm@suse.com>
Cc: linux-btrfs@vger.kernel.org, kernel-janitors@vger.kernel.org

The caller expects this function to return with the lock held and
releases it immediately on error.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/fs/btrfs/extent-tree.c b/fs/btrfs/extent-tree.c
index 2b35f8d..a0bb9dc 100644
--- a/fs/btrfs/extent-tree.c
+++ b/fs/btrfs/extent-tree.c
@@ -2301,6 +2301,7 @@ static noinline int run_clustered_refs(struct btrfs_trans_handle *trans,
 
 				if (ret) {
 					printk(KERN_DEBUG "btrfs: run_delayed_extent_op returned %d\n", ret);
+					spin_lock(&delayed_refs->lock);
 					return ret;
 				}
 
@@ -2331,6 +2332,7 @@ static noinline int run_clustered_refs(struct btrfs_trans_handle *trans,
 
 		if (ret) {
 			printk(KERN_DEBUG "btrfs: run_one_delayed_ref returned %d\n", ret);
+			spin_lock(&delayed_refs->lock);
 			return ret;
 		}
 
