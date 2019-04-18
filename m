From: YueHaibing <yuehaibing@huawei.com>
Date: Thu, 18 Apr 2019 06:43:56 +0000
Subject: [PATCH -next] btrfs: Remove set but not used variable 'fs_info'
Message-Id: <20190418064356.10418-1-yuehaibing@huawei.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1541643283-109411-1-git-send-email-yuehaibing@huawei.com>
In-Reply-To: <1541643283-109411-1-git-send-email-yuehaibing@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Chris Mason <clm@fb.com>, Josef Bacik <josef@toxicpanda.com>, David Sterba <dsterba@suse.com>
Cc: YueHaibing <yuehaibing@huawei.com>, linux-btrfs@vger.kernel.org, kernel-janitors@vger.kernel.org

Fixes gcc '-Wunused-but-set-variable' warning:

fs/btrfs/free-space-tree.c: In function 'load_free_space_tree':
fs/btrfs/free-space-tree.c:1535:24: warning:
 variable 'fs_info' set but not used [-Wunused-but-set-variable]

It's not used since commit 05e9d3137d47 ("btrfs: get fs_info from block group
in search_free_space_info"),  so can be removed.

Signed-off-by: YueHaibing <yuehaibing@huawei.com>
---
 fs/btrfs/free-space-tree.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/fs/btrfs/free-space-tree.c b/fs/btrfs/free-space-tree.c
index cfe9dfb0ff05..f5dc115ebba0 100644
--- a/fs/btrfs/free-space-tree.c
+++ b/fs/btrfs/free-space-tree.c
@@ -1532,14 +1532,12 @@ static int load_free_space_extents(struct btrfs_caching_control *caching_ctl,
 int load_free_space_tree(struct btrfs_caching_control *caching_ctl)
 {
 	struct btrfs_block_group_cache *block_group;
-	struct btrfs_fs_info *fs_info;
 	struct btrfs_free_space_info *info;
 	struct btrfs_path *path;
 	u32 extent_count, flags;
 	int ret;
 
 	block_group = caching_ctl->block_group;
-	fs_info = block_group->fs_info;
 
 	path = btrfs_alloc_path();
 	if (!path)
