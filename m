From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Sat, 20 May 2017 05:33:43 +0000
Subject: [PATCH] rtlwifi: btcoex: 23b 1ant: fix halbtc8723b1ant_action_wifi_only()
Message-Id: <20170520053343.gwdinyn447bwpia2@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Larry Finger <Larry.Finger@lwfinger.net>
Cc: Chaoming Li <chaoming_li@realsil.com.cn>, Kalle Valo <kvalo@codeaurora.org>, Ping-Ke Shih <pkshih@realtek.com>, Yan-Hsuan Chuang <yhchuang@realtek.com>, linux-wireless@vger.kernel.org, kernel-janitors@vger.kernel.org

The parameters are in the wrong order when we call
halbtc8723b1ant_set_ant_path() so it's equivalent of calling:

	halbtc8723b1ant_set_ant_path(btcoexist, BTC_ANT_PATH_WIFI, false, true);

Fixes: f66509e3d7c2 ("rtlwifi: btcoex: Remove 23b 1ant configuration parameter")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/net/wireless/realtek/rtlwifi/btcoexist/halbtc8723b1ant.c b/drivers/net/wireless/realtek/rtlwifi/btcoexist/halbtc8723b1ant.c
index f3704d7db4d5..2a7a6ec525a2 100644
--- a/drivers/net/wireless/realtek/rtlwifi/btcoexist/halbtc8723b1ant.c
+++ b/drivers/net/wireless/realtek/rtlwifi/btcoexist/halbtc8723b1ant.c
@@ -1429,7 +1429,7 @@ static void halbtc8723b1ant_action_wifi_only(struct btc_coexist *btcoexist)
 {
 	halbtc8723b1ant_coex_table_with_type(btcoexist, FORCE_EXEC, 0);
 	halbtc8723b1ant_ps_tdma(btcoexist, FORCE_EXEC, false, 8);
-	halbtc8723b1ant_set_ant_path(btcoexist, false, false, BTC_ANT_PATH_PTA);
+	halbtc8723b1ant_set_ant_path(btcoexist, BTC_ANT_PATH_PTA, false, false);
 }
 
 /* check if BT is disabled */
