From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Mon, 30 Jul 2012 08:15:15 +0000
Subject: [patch] Btrfs: unlock on error in btrfs_delalloc_reserve_metadata()
Message-Id: <20120730081515.GB15702@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Chris Mason <chris.mason@fusionio.com>
Cc: linux-btrfs@vger.kernel.org, kernel-janitors@vger.kernel.org

We should release this mutex before returning the error code.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
Applies to linux-next.

diff --git a/fs/btrfs/extent-tree.c b/fs/btrfs/extent-tree.c
index 4e1b153..45c69c4 100644
--- a/fs/btrfs/extent-tree.c
+++ b/fs/btrfs/extent-tree.c
@@ -4571,8 +4571,10 @@ int btrfs_delalloc_reserve_metadata(struct inode *inode, u64 num_bytes)
 	if (root->fs_info->quota_enabled) {
 		ret = btrfs_qgroup_reserve(root, num_bytes +
 					   nr_extents * root->leafsize);
-		if (ret)
+		if (ret) {
+			mutex_unlock(&BTRFS_I(inode)->delalloc_mutex);
 			return ret;
+		}
 	}
 
 	ret = reserve_metadata_bytes(root, block_rsv, to_reserve, flush);
