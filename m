From: YueHaibing <yuehaibing@huawei.com>
Date: Mon, 22 Oct 2018 07:51:15 +0000
Subject: [PATCH] rtlwifi: btcoex: remove set but not used variable 'ppsc'
Message-Id: <1540194675-65562-1-git-send-email-yuehaibing@huawei.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Ping-Ke Shih <pkshih@realtek.com>, Kalle Valo <kvalo@codeaurora.org>, Larry Finger <Larry.Finger@lwfinger.net>, Colin Ian King <colin.king@canonical.com>, Nathan Chancellor <natechancellor@gmail.com>
Cc: YueHaibing <yuehaibing@huawei.com>, linux-wireless@vger.kernel.org, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

Fixes gcc '-Wunused-but-set-variable' warning:

drivers/net/wireless/realtek/rtlwifi/btcoexist/halbtcoutsrc.c: In function 'halbtc_leave_lps':
drivers/net/wireless/realtek/rtlwifi/btcoexist/halbtcoutsrc.c:295:21: warning:
 variable 'ppsc' set but not used [-Wunused-but-set-variable]

drivers/net/wireless/realtek/rtlwifi/btcoexist/halbtcoutsrc.c: In function 'halbtc_enter_lps':
drivers/net/wireless/realtek/rtlwifi/btcoexist/halbtcoutsrc.c:318:21: warning:
 variable 'ppsc' set but not used [-Wunused-but-set-variable]

It never used since introduction in
commit aa45a673b291 ("rtlwifi: btcoexist: Add new mini driver")

Signed-off-by: YueHaibing <yuehaibing@huawei.com>
---
 drivers/net/wireless/realtek/rtlwifi/btcoexist/halbtcoutsrc.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/drivers/net/wireless/realtek/rtlwifi/btcoexist/halbtcoutsrc.c b/drivers/net/wireless/realtek/rtlwifi/btcoexist/halbtcoutsrc.c
index 6fbf884..d748aab 100644
--- a/drivers/net/wireless/realtek/rtlwifi/btcoexist/halbtcoutsrc.c
+++ b/drivers/net/wireless/realtek/rtlwifi/btcoexist/halbtcoutsrc.c
@@ -292,11 +292,9 @@ bool halbtc_send_bt_mp_operation(struct btc_coexist *btcoexist, u8 op_code,
 static void halbtc_leave_lps(struct btc_coexist *btcoexist)
 {
 	struct rtl_priv *rtlpriv;
-	struct rtl_ps_ctl *ppsc;
 	bool ap_enable = false;
 
 	rtlpriv = btcoexist->adapter;
-	ppsc = rtl_psc(rtlpriv);
 
 	btcoexist->btc_get(btcoexist, BTC_GET_BL_WIFI_AP_MODE_ENABLE,
 			   &ap_enable);
@@ -315,11 +313,9 @@ static void halbtc_leave_lps(struct btc_coexist *btcoexist)
 static void halbtc_enter_lps(struct btc_coexist *btcoexist)
 {
 	struct rtl_priv *rtlpriv;
-	struct rtl_ps_ctl *ppsc;
 	bool ap_enable = false;
 
 	rtlpriv = btcoexist->adapter;
-	ppsc = rtl_psc(rtlpriv);
 
 	btcoexist->btc_get(btcoexist, BTC_GET_BL_WIFI_AP_MODE_ENABLE,
 			   &ap_enable);
