From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 19 May 2017 21:25:39 +0000
Subject: [PATCH] rtlwifi: btcoex: 23b 1ant: initialize bt_disabled to false
Message-Id: <20170519212539.cihnvwl7irchxoaj@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Larry Finger <Larry.Finger@lwfinger.net>
Cc: Chaoming Li <chaoming_li@realsil.com.cn>, Kalle Valo <kvalo@codeaurora.org>, Ping-Ke Shih <pkshih@realtek.com>, Yan-Hsuan Chuang <yhchuang@realtek.com>, linux-wireless@vger.kernel.org, kernel-janitors@vger.kernel.org

We only want to disable this if bt_disable_cnt is >= 2.

Fixes: f66509e3d7c2 ("rtlwifi: btcoex: Remove 23b 1ant configuration parameter")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
Btw, that patch also introduced Sparse warning but I don't know how to
address it.

drivers/net/wireless/realtek/rtlwifi/btcoexist/halbtc8723b1ant.c:1432:63: warning: odd constant _Bool cast (2 becomes 1)

diff --git a/drivers/net/wireless/realtek/rtlwifi/btcoexist/halbtc8723b1ant.c b/drivers/net/wireless/realtek/rtlwifi/btcoexist/halbtc8723b1ant.c
index f3704d7db4d5..d563a76f0262 100644
--- a/drivers/net/wireless/realtek/rtlwifi/btcoexist/halbtc8723b1ant.c
+++ b/drivers/net/wireless/realtek/rtlwifi/btcoexist/halbtc8723b1ant.c
@@ -1438,7 +1438,7 @@ static void halbtc8723b1ant_monitor_bt_enable_disable(struct btc_coexist
 {
 	struct rtl_priv *rtlpriv = btcoexist->adapter;
 	static u32 bt_disable_cnt;
-	bool bt_active = true, bt_disabled;
+	bool bt_active = true, bt_disabled = false;
 
 	if (coex_sta->high_priority_tx = 0 &&
 	    coex_sta->high_priority_rx = 0 && coex_sta->low_priority_tx = 0 &&
