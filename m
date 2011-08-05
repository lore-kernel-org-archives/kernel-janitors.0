From: Dan Carpenter <error27@gmail.com>
Date: Fri, 05 Aug 2011 14:19:00 +0000
Subject: [patch] btrfs: memory leak in btrfs_add_inode_defrag()
Message-Id: <20110805141900.GL7659@shale.localdomain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Chris Mason <chris.mason@oracle.com>
Cc: "open list:BTRFS FILE SYSTEM" <linux-btrfs@vger.kernel.org>, kernel-janitors@vger.kernel.org

We don't use the defrag struct on this path.

Signed-off-by: Dan Carpenter <error27@gmail.com>

diff --git a/fs/btrfs/file.c b/fs/btrfs/file.c
index 658d669..1102059 100644
--- a/fs/btrfs/file.c
+++ b/fs/btrfs/file.c
@@ -150,6 +150,8 @@ int btrfs_add_inode_defrag(struct btrfs_trans_handle *trans,
 	spin_lock(&root->fs_info->defrag_inodes_lock);
 	if (!BTRFS_I(inode)->in_defrag)
 		__btrfs_add_inode_defrag(inode, defrag);
+	else
+		kfree(defrag);
 	spin_unlock(&root->fs_info->defrag_inodes_lock);
 	return 0;
 }
