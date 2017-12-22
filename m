From: Colin King <colin.king@canonical.com>
Date: Fri, 22 Dec 2017 00:55:08 +0000
Subject: [PATCH] btrfs: qgroup: remove unused label 'retry'
Message-Id: <20171222005508.11975-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Chris Mason <clm@fb.com>, Josef Bacik <jbacik@fb.com>, David Sterba <dsterba@suse.com>, linux-btrfs@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Label 'retry' is not used, remove it. Cleans up a clang build
warning:

warning: label ‘retry’ defined but not used [-Wunused-label]

Fixes: b283738ab0ad ("Revert "btrfs: qgroups: Retry after commit on getting EDQUOT"")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 fs/btrfs/qgroup.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/fs/btrfs/qgroup.c b/fs/btrfs/qgroup.c
index de3b96f1005b..2b89848e767d 100644
--- a/fs/btrfs/qgroup.c
+++ b/fs/btrfs/qgroup.c
@@ -2429,7 +2429,6 @@ static int qgroup_reserve(struct btrfs_root *root, u64 num_bytes, bool enforce,
 	    capable(CAP_SYS_RESOURCE))
 		enforce = false;
 
-retry:
 	spin_lock(&fs_info->qgroup_lock);
 	quota_root = fs_info->quota_root;
 	if (!quota_root)
-- 
2.14.1

