From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Sat, 05 Sep 2020 12:47:58 +0000
Subject: [PATCH] rtlwifi: rtl8723ae: Delete a stray tab
Message-Id: <20200905124758.GB183976@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Ping-Ke Shih <pkshih@realtek.com>
Cc: Kalle Valo <kvalo@codeaurora.org>, Jakub Kicinski <kuba@kernel.org>, Qiujun Huang <hqjagain@gmail.com>, Larry Finger <Larry.Finger@lwfinger.net>, linux-wireless@vger.kernel.org, kernel-janitors@vger.kernel.org

This line is indented too far.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 drivers/net/wireless/realtek/rtlwifi/rtl8723ae/hal_btc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/wireless/realtek/rtlwifi/rtl8723ae/hal_btc.c b/drivers/net/wireless/realtek/rtlwifi/rtl8723ae/hal_btc.c
index 16c6007861ff..53af0d209b11 100644
--- a/drivers/net/wireless/realtek/rtlwifi/rtl8723ae/hal_btc.c
+++ b/drivers/net/wireless/realtek/rtlwifi/rtl8723ae/hal_btc.c
@@ -435,7 +435,7 @@ static void rtl8723e_dm_bt_set_fw_tdma_ctrl(struct ieee80211_hw *hw,
 		if (TDMA_1ANT = ant_num) {
 			rtl_dbg(rtlpriv, COMP_BT_COEXIST, DBG_TRACE,
 				"[BTCoex], TDMA_1ANT\n");
-				h2c_parameter[0] |= BIT(1);
+			h2c_parameter[0] |= BIT(1);
 		} else if (TDMA_2ANT = ant_num) {
 			rtl_dbg(rtlpriv, COMP_BT_COEXIST, DBG_TRACE,
 				"[BTCoex], TDMA_2ANT\n");
-- 
2.28.0
