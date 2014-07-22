From: Artemiy Volkov <artemiyv@acm.org>
Date: Tue, 22 Jul 2014 17:58:37 +0000
Subject: [PATCH 5/5] ext2: xip.c: Merge string literals on adjacent lines
Message-Id: <1406051917-3823-6-git-send-email-artemiyv@acm.org>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

This patch joins lines and merges quoted strings in xip.c, for use of grep-ability.

Signed-off-by: Artemiy Volkov <artemiyv@acm.org>
---
 fs/ext2/xip.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/fs/ext2/xip.c b/fs/ext2/xip.c
index e98171a..6c1cbb4 100644
--- a/fs/ext2/xip.c
+++ b/fs/ext2/xip.c
@@ -69,8 +69,7 @@ void ext2_xip_verify_sb(struct super_block *sb)
 	    !sb->s_bdev->bd_disk->fops->direct_access) {
 		sbi->s_mount_opt &= (~EXT2_MOUNT_XIP);
 		ext2_msg(sb, KERN_WARNING,
-			     "warning: ignoring xip option - "
-			     "not supported by bdev");
+			     "warning: ignoring xip option - not supported by bdev");
 	}
 }
 
-- 
1.9.1

