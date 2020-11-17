From: Colin King <colin.king@canonical.com>
Date: Tue, 17 Nov 2020 13:07:04 +0000
Subject: [PATCH][next] btrfs: fix spelling mistake "inititialize" -> "initialize"
Message-Id: <20201117130704.420088-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Chris Mason <clm@fb.com>, Josef Bacik <josef@toxicpanda.com>, David Sterba <dsterba@suse.com>, linux-btrfs@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

There is a spelling mistake in a btrfs_err error message. Fix it.

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 fs/btrfs/disk-io.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/btrfs/disk-io.c b/fs/btrfs/disk-io.c
index 4402dcb00cb5..70633fafff54 100644
--- a/fs/btrfs/disk-io.c
+++ b/fs/btrfs/disk-io.c
@@ -3310,7 +3310,7 @@ int __cold open_ctree(struct super_block *sb, struct btrfs_fs_devices *fs_device
 
 	ret = btrfs_check_zoned_mode(fs_info);
 	if (ret) {
-		btrfs_err(fs_info, "failed to inititialize zoned mode: %d",
+		btrfs_err(fs_info, "failed to initialize zoned mode: %d",
 			  ret);
 		goto fail_block_groups;
 	}
-- 
2.28.0
