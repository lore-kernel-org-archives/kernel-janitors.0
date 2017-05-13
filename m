From: Colin King <colin.king@canonical.com>
Date: Sat, 13 May 2017 22:37:02 +0000
Subject: [PATCH] rtlwifi: rtl8723ae:fix spelling mistake: "Coexistance" -> "Coexistence"
Message-Id: <20170513223702.19748-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Larry Finger <Larry.Finger@lwfinger.net>, Chaoming Li <chaoming_li@realsil.com.cn>, Kalle Valo <kvalo@codeaurora.org>, Joe Perches <joe@perches.com>, Christian Engelmayer <cengelma@gmx.at>, Arnd Bergmann <arnd@arndb.de>, linux-wireless@vger.kernel.org, netdev@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Trivial fix to spelling mistake in RT_TRACE text

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/net/wireless/realtek/rtlwifi/rtl8723ae/hw.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/wireless/realtek/rtlwifi/rtl8723ae/hw.c b/drivers/net/wireless/realtek/rtlwifi/rtl8723ae/hw.c
index 859c045bd37c..47e5f9003bb0 100644
--- a/drivers/net/wireless/realtek/rtlwifi/rtl8723ae/hw.c
+++ b/drivers/net/wireless/realtek/rtlwifi/rtl8723ae/hw.c
@@ -2313,7 +2313,7 @@ static void rtl8723e_bt_var_init(struct ieee80211_hw *hw)
 		rtlpriv->btcoexist.eeprom_bt_radio_shared;
 
 	RT_TRACE(rtlpriv, COMP_BT_COEXIST, DBG_TRACE,
-		 "BT Coexistance = 0x%x\n",
+		 "BT Coexistence = 0x%x\n",
 		 rtlpriv->btcoexist.bt_coexistence);
 
 	if (rtlpriv->btcoexist.bt_coexistence) {
-- 
2.11.0

