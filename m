From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 02 May 2017 09:25:27 +0000
Subject: [PATCH] Btrfs: remove an unused variable
Message-Id: <20170502092527.rpb42y7ngvh5tkei@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Chris Mason <clm@fb.com>
Cc: Josef Bacik <jbacik@fb.com>, David Sterba <dsterba@suse.com>, linux-btrfs@vger.kernel.org, kernel-janitors@vger.kernel.org

"item" is never used.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/fs/btrfs/inode.c b/fs/btrfs/inode.c
index 1e4e4532f381..337aef86dae5 100644
--- a/fs/btrfs/inode.c
+++ b/fs/btrfs/inode.c
@@ -5881,7 +5881,6 @@ static int btrfs_real_readdir(struct file *file, struct dir_context *ctx)
 	struct inode *inode = file_inode(file);
 	struct btrfs_fs_info *fs_info = btrfs_sb(inode->i_sb);
 	struct btrfs_root *root = BTRFS_I(inode)->root;
-	struct btrfs_item *item;
 	struct btrfs_dir_item *di;
 	struct btrfs_key key;
 	struct btrfs_key found_key;
@@ -5932,7 +5931,6 @@ static int btrfs_real_readdir(struct file *file, struct dir_context *ctx)
 			continue;
 		}
 
-		item = btrfs_item_nr(slot);
 		btrfs_item_key_to_cpu(leaf, &found_key, slot);
 
 		if (found_key.objectid != key.objectid)
