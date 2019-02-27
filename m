From: YueHaibing <yuehaibing@huawei.com>
Date: Wed, 27 Feb 2019 02:23:34 +0000
Subject: [PATCH] rtlwifi: rtl8723ae: Remove set but not used variable 'bt_retry_cnt'
Message-Id: <20190227022334.7750-1-yuehaibing@huawei.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Ping-Ke Shih <pkshih@realtek.com>, Kalle Valo <kvalo@codeaurora.org>, Larry Finger <Larry.Finger@lwfinger.net>
Cc: YueHaibing <yuehaibing@huawei.com>, linux-wireless@vger.kernel.org, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

Fixes gcc '-Wunused-but-set-variable' warning:

drivers/net/wireless/realtek/rtlwifi/rtl8723ae/hal_btc.c: In function '_rtl8723e_dm_bt_coexist_2_ant':
drivers/net/wireless/realtek/rtlwifi/rtl8723ae/hal_btc.c:1408:5: warning:
 variable 'bt_retry_cnt' set but not used [-Wunused-but-set-variable]

It's never used and can be removed.

Signed-off-by: YueHaibing <yuehaibing@huawei.com>
---
 drivers/net/wireless/realtek/rtlwifi/rtl8723ae/hal_btc.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/net/wireless/realtek/rtlwifi/rtl8723ae/hal_btc.c b/drivers/net/wireless/realtek/rtlwifi/rtl8723ae/hal_btc.c
index a6b31dae5691..680198280f8f 100644
--- a/drivers/net/wireless/realtek/rtlwifi/rtl8723ae/hal_btc.c
+++ b/drivers/net/wireless/realtek/rtlwifi/rtl8723ae/hal_btc.c
@@ -1405,7 +1405,6 @@ static void rtl8723e_dm_bt_reset_action_profile_state(struct ieee80211_hw *hw)
 static void _rtl8723e_dm_bt_coexist_2_ant(struct ieee80211_hw *hw)
 {
 	struct rtl_priv *rtlpriv = rtl_priv(hw);
-	u8 bt_retry_cnt;
 	u8 bt_info_original;
 	RT_TRACE(rtlpriv, COMP_BT_COEXIST, DBG_DMESG,
 		"[BTCoex] Get bt info by fw!!\n");
@@ -1417,7 +1416,6 @@ static void _rtl8723e_dm_bt_coexist_2_ant(struct ieee80211_hw *hw)
 				"[BTCoex] c2h for bt_info not rcvd yet!!\n");
 	}
 
-	bt_retry_cnt = hal_coex_8723.bt_retry_cnt;
 	bt_info_original = hal_coex_8723.c2h_bt_info_original;
 
 	/* when bt inquiry or page scan, we have to set h2c 0x25 */
