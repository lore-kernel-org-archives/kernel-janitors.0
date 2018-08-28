From: Colin King <colin.king@canonical.com>
Date: Tue, 28 Aug 2018 10:45:21 +0000
Subject: [PATCH] btrfs: remove unused pointer inode
Message-Id: <20180828104521.5167-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Chris Mason <clm@fb.com>, Josef Bacik <jbacik@fb.com>, David Sterba <dsterba@suse.com>, linux-btrfs@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Pointer inode is being assigned but is never used hence it is
redundant and can be removed.

Cleans up clang warning:
variable ‘inode’ set but not used [-Wunused-but-set-variable]

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 fs/btrfs/inode.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/fs/btrfs/inode.c b/fs/btrfs/inode.c
index c32ca4ca3540..b6921ed5c07b 100644
--- a/fs/btrfs/inode.c
+++ b/fs/btrfs/inode.c
@@ -2750,12 +2750,9 @@ static void relink_file_extents(struct new_sa_defrag_extent *new)
 	struct btrfs_path *path;
 	struct sa_defrag_extent_backref *backref;
 	struct sa_defrag_extent_backref *prev = NULL;
-	struct inode *inode;
 	struct rb_node *node;
 	int ret;
 
-	inode = new->inode;
-
 	path = btrfs_alloc_path();
 	if (!path)
 		return;
-- 
2.17.1
