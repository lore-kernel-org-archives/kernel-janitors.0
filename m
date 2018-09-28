From: YueHaibing <yuehaibing@huawei.com>
Date: Fri, 28 Sep 2018 02:21:53 +0000
Subject: [PATCH -next] staging: rtlwifi: Remove set but not used variable 'ppsc'
Message-Id: <1538101313-161546-1-git-send-email-yuehaibing@huawei.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Nathan Chancellor <natechancellor@gmail.com>, Shreeya Patel <shreeya.patel23498@gmail.com>
Cc: YueHaibing <yuehaibing@huawei.com>, devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

Fixes gcc '-Wunused-but-set-variable' warning:

drivers/staging/rtlwifi/btcoexist/halbtcoutsrc.c: In function 'halbtc_leave_lps':
drivers/staging/rtlwifi/btcoexist/halbtcoutsrc.c:284:21: warning:
 variable 'ppsc' set but not used [-Wunused-but-set-variable]

drivers/staging/rtlwifi/btcoexist/halbtcoutsrc.c: In function 'halbtc_enter_lps':
drivers/staging/rtlwifi/btcoexist/halbtcoutsrc.c:307:21: warning:
 variable 'ppsc' set but not used [-Wunused-but-set-variable]

Signed-off-by: YueHaibing <yuehaibing@huawei.com>
---
 drivers/staging/rtlwifi/btcoexist/halbtcoutsrc.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/drivers/staging/rtlwifi/btcoexist/halbtcoutsrc.c b/drivers/staging/rtlwifi/btcoexist/halbtcoutsrc.c
index 85a7490..24e19ff 100644
--- a/drivers/staging/rtlwifi/btcoexist/halbtcoutsrc.c
+++ b/drivers/staging/rtlwifi/btcoexist/halbtcoutsrc.c
@@ -281,11 +281,9 @@ bool halbtc_send_bt_mp_operation(struct btc_coexist *btcoexist, u8 op_code,
 static void halbtc_leave_lps(struct btc_coexist *btcoexist)
 {
 	struct rtl_priv *rtlpriv;
-	struct rtl_ps_ctl *ppsc;
 	bool ap_enable = false;
 
 	rtlpriv = btcoexist->adapter;
-	ppsc = rtl_psc(rtlpriv);
 
 	btcoexist->btc_get(btcoexist, BTC_GET_BL_WIFI_AP_MODE_ENABLE,
 			   &ap_enable);
@@ -304,11 +302,9 @@ static void halbtc_leave_lps(struct btc_coexist *btcoexist)
 static void halbtc_enter_lps(struct btc_coexist *btcoexist)
 {
 	struct rtl_priv *rtlpriv;
-	struct rtl_ps_ctl *ppsc;
 	bool ap_enable = false;
 
 	rtlpriv = btcoexist->adapter;
-	ppsc = rtl_psc(rtlpriv);
 
 	btcoexist->btc_get(btcoexist, BTC_GET_BL_WIFI_AP_MODE_ENABLE,
 			   &ap_enable);
