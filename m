From: Colin King <colin.king@canonical.com>
Date: Tue, 14 Nov 2017 17:01:45 +0000
Subject: [PATCH] rtlwifi: rtl818x: remove redundant check for cck_power > 15
Message-Id: <20171114170145.3987-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Hin-Tak Leung <htl10@users.sourceforge.net>, Larry Finger <Larry.Finger@lwfinger.net>, Kalle Valo <kvalo@codeaurora.org>, linux-wireless@vger.kernel.org, netdev@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

cck_poweri cannot be greated than 15 as is derived from the bottom 4 bits
from riv->channels[channel - 1].hw_value & 0xf.  Hence the check for it
being greater than 15 is redundant and can be removed.

Detected by CoverityScan, CID#744303 ("Logically dead code")

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/net/wireless/realtek/rtl818x/rtl8187/rtl8225.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/net/wireless/realtek/rtl818x/rtl8187/rtl8225.c b/drivers/net/wireless/realtek/rtl818x/rtl8187/rtl8225.c
index e6668ffb77e6..ff0971f1e2c8 100644
--- a/drivers/net/wireless/realtek/rtl818x/rtl8187/rtl8225.c
+++ b/drivers/net/wireless/realtek/rtl818x/rtl8187/rtl8225.c
@@ -688,10 +688,7 @@ static void rtl8225z2_b_rf_set_tx_power(struct ieee80211_hw *dev, int channel)
 	cck_power = priv->channels[channel - 1].hw_value & 0xF;
 	ofdm_power = priv->channels[channel - 1].hw_value >> 4;
 
-	if (cck_power > 15)
-		cck_power = (priv->hw_rev = RTL8187BvB) ? 15 : 22;
-	else
-		cck_power += (priv->hw_rev = RTL8187BvB) ? 0 : 7;
+	cck_power += (priv->hw_rev = RTL8187BvB) ? 0 : 7;
 	cck_power += priv->txpwr_base & 0xF;
 	cck_power = min(cck_power, (u8)35);
 
-- 
2.14.1

