From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Mon, 05 Mar 2012 18:10:07 +0000
Subject: [patch] airo: fix test for FLAG_RADIO_DOWN
Message-Id: <20120305181007.GC26880@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "John W. Linville" <linville@tuxdriver.com>
Cc: linux-wireless@vger.kernel.org, kernel-janitors@vger.kernel.org

We should be doing a shift (1 << FLAG_RADIO_DOWN) here before testing
the flag.  As luck would have it, this test works almost correctly.
The current code tests for FLAG_RADIO_OFF instead of FLAG_RADIO_DOWN.

#define FLAG_RADIO_OFF  0       /* User disabling of MAC */
#define FLAG_RADIO_DOWN 1       /* ifup/ifdown disabling of MAC */

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
I don't have this hardware.  Please review carefully.

diff --git a/drivers/net/wireless/airo.c b/drivers/net/wireless/airo.c
index 1c008c6..ddc061d 100644
--- a/drivers/net/wireless/airo.c
+++ b/drivers/net/wireless/airo.c
@@ -1869,7 +1869,7 @@ static int readStatsRid(struct airo_info*ai, StatsRid *sr, int rid, int lock)
 
 static void try_auto_wep(struct airo_info *ai)
 {
-	if (auto_wep && !(ai->flags & FLAG_RADIO_DOWN)) {
+	if (auto_wep && !test_bit(FLAG_RADIO_DOWN, &ai->flags)) {
 		ai->expires = RUN_AT(3*HZ);
 		wake_up_interruptible(&ai->thr_wait);
 	}
