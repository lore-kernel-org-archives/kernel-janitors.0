From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 19 Jun 2012 10:30:11 +0000
Subject: [patch] Btrfs: small naming cleanup in join_transaction()
Message-Id: <20120619103011.GA7596@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Chris Mason <chris.mason@fusionio.com>
Cc: linux-btrfs@vger.kernel.org, Josef Bacik <josef@redhat.com>, kernel-janitors@vger.kernel.org

"root->fs_info" and "fs_info" are the same, but "fs_info" is prefered
because it is shorter and that's what is used in the rest of the
function.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
Also, Smatch doesn't understand that they are the same so it complains
about the locking.

diff --git a/fs/btrfs/transaction.c b/fs/btrfs/transaction.c
index b72b068..e5f1b15 100644
--- a/fs/btrfs/transaction.c
+++ b/fs/btrfs/transaction.c
@@ -100,8 +100,8 @@ loop:
 		kmem_cache_free(btrfs_transaction_cachep, cur_trans);
 		cur_trans = fs_info->running_transaction;
 		goto loop;
-	} else if (root->fs_info->fs_state & BTRFS_SUPER_FLAG_ERROR) {
-		spin_unlock(&root->fs_info->trans_lock);
+	} else if (fs_info->fs_state & BTRFS_SUPER_FLAG_ERROR) {
+		spin_unlock(&fs_info->trans_lock);
 		kmem_cache_free(btrfs_transaction_cachep, cur_trans);
 		return -EROFS;
 	}
