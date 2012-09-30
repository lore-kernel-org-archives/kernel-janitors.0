From: Peter Senna Tschudin <peter.senna@gmail.com>
Date: Sun, 30 Sep 2012 19:21:10 +0000
Subject: [PATCH] ath/ath9k/ar9003_eeprom.c: Remove unnecessary semicolon
Message-Id: <1349032870-4780-1-git-send-email-peter.senna@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mcgrof@qca.qualcomm.com
Cc: jouni@qca.qualcomm.com, vthiagar@qca.qualcomm.com, senthilb@qca.qualcomm.com, linville@tuxdriver.com, linux-wireless@vger.kernel.org, ath9k-devel@lists.ath9k.org, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org, Peter Senna Tschudin <peter.senna@gmail.com>

The semantic match that finds this problem is as follows:
(http://coccinelle.lip6.fr/)

// <smpl>
@r1@
position p;
@@
if (...);@p

@script:python@
p0 << r1.p;
@@
// Emacs org-mode output
cocci.print_main("", p0)
cocci.print_secs("", p0)
// </smpl>

Signed-off-by: Peter Senna Tschudin <peter.senna@gmail.com>
---
 drivers/net/wireless/ath/ath9k/ar9003_eeprom.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath9k/ar9003_eeprom.c b/drivers/net/wireless/ath/ath9k/ar9003_eeprom.c
index 5bbe505..189aeb2 100644
--- a/drivers/net/wireless/ath/ath9k/ar9003_eeprom.c
+++ b/drivers/net/wireless/ath/ath9k/ar9003_eeprom.c
@@ -2989,7 +2989,7 @@ static u32 ath9k_hw_ar9300_get_eeprom(struct ath_hw *ah,
 	case EEP_PAPRD:
 		if (AR_SREV_9462(ah))
 			return false;
-		if (!ah->config.enable_paprd);
+		if (!ah->config.enable_paprd)
 			return false;
 		return !!(pBase->featureEnable & BIT(5));
 	case EEP_CHAIN_MASK_REDUCE:
-- 
1.7.11.4

