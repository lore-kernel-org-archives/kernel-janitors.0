From: Firo Yang <firogm@gmail.com>
Date: Thu, 11 Jun 2015 01:41:10 +0000
Subject: [PATCH v2] md: fix a build warning
Message-Id: <1433986870-7014-1-git-send-email-firogm@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: neilb@suse.de
Cc: linux-raid@vger.kernel.org, kernel-janitors@vger.kernel.org, Firo Yang <firogm@gmail.com>

Warning like this:

drivers/md/md.c: In function ‘update_array_info’:
drivers/md/md.c:6394:26: warning: logical not is only applied
to the left hand side of comparison [-Wlogical-not-parentheses]
      !mddev->persistent  != info->not_persistent||

Fix it as Neil Brown said:
mddev->persistent != !info->not_persistent ||

Signed-off-by: Firo Yang <firogm@gmail.com>
---
 drivers/md/md.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/md/md.c b/drivers/md/md.c
index dd85be9..a3528b9 100644
--- a/drivers/md/md.c
+++ b/drivers/md/md.c
@@ -6391,7 +6391,7 @@ static int update_array_info(struct mddev *mddev, mdu_array_info_t *info)
 	    mddev->ctime         != info->ctime         ||
 	    mddev->level         != info->level         ||
 /*	    mddev->layout        != info->layout        || */
-	    !mddev->persistent	 != info->not_persistent||
+	    mddev->persistent	 != !info->not_persistent ||
 	    mddev->chunk_sectors != info->chunk_size >> 9 ||
 	    /* ignore bottom 8 bits of state, and allow SB_BITMAP_PRESENT to change */
 	    ((state^info->state) & 0xfffffe00)
-- 
2.4.2

