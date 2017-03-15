From: "Andrew F. Davis" <afd@ti.com>
Date: Wed, 15 Mar 2017 16:23:22 +0000
Subject: [PATCH 14/14] ath5k: Remove unneeded conversions to bool
Message-Id: <20170315162322.12096-14-afd@ti.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Found with scripts/coccinelle/misc/boolconv.cocci.

Signed-off-by: Andrew F. Davis <afd@ti.com>
---
 drivers/net/wireless/ath/ath5k/ani.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath5k/ani.c b/drivers/net/wireless/ath/ath5k/ani.c
index 0624333f5430..850c608b43a3 100644
--- a/drivers/net/wireless/ath/ath5k/ani.c
+++ b/drivers/net/wireless/ath/ath5k/ani.c
@@ -501,7 +501,7 @@ ath5k_ani_calibration(struct ath5k_hw *ah)
 
 	if (as->ofdm_errors > ofdm_high || as->cck_errors > cck_high) {
 		/* too many PHY errors - we have to raise immunity */
-		bool ofdm_flag = as->ofdm_errors > ofdm_high ? true : false;
+		bool ofdm_flag = as->ofdm_errors > ofdm_high;
 		ath5k_ani_raise_immunity(ah, as, ofdm_flag);
 		ath5k_ani_period_restart(as);
 
-- 
2.11.0

