From: YueHaibing <yuehaibing@huawei.com>
Date: Wed, 27 Feb 2019 02:23:21 +0000
Subject: [PATCH] rtlwifi: rtl8723be: Remove set but not used variable 'b_last_is_cur_rdlstate'
Message-Id: <20190227022321.7623-1-yuehaibing@huawei.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Ping-Ke Shih <pkshih@realtek.com>, Kalle Valo <kvalo@codeaurora.org>, Larry Finger <Larry.Finger@lwfinger.net>
Cc: YueHaibing <yuehaibing@huawei.com>, linux-wireless@vger.kernel.org, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

Fixes gcc '-Wunused-but-set-variable' warning:

drivers/net/wireless/realtek/rtlwifi/rtl8723be/dm.c: In function 'rtl8723be_dm_check_edca_turbo':
drivers/net/wireless/realtek/rtlwifi/rtl8723be/dm.c:998:7: warning:
 variable 'b_last_is_cur_rdlstate' set but not used [-Wunused-but-set-variable]

It's never used and can be removed.

Signed-off-by: YueHaibing <yuehaibing@huawei.com>
---
 drivers/net/wireless/realtek/rtlwifi/rtl8723be/dm.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/net/wireless/realtek/rtlwifi/rtl8723be/dm.c b/drivers/net/wireless/realtek/rtlwifi/rtl8723be/dm.c
index ef355aa88117..b13fd3c0c832 100644
--- a/drivers/net/wireless/realtek/rtlwifi/rtl8723be/dm.c
+++ b/drivers/net/wireless/realtek/rtlwifi/rtl8723be/dm.c
@@ -995,12 +995,9 @@ static void rtl8723be_dm_check_edca_turbo(struct ieee80211_hw *hw)
 	u32 edca_be = 0x5ea42b;
 	u32 iot_peer = 0;
 	bool b_is_cur_rdlstate;
-	bool b_last_is_cur_rdlstate = false;
 	bool b_bias_on_rx = false;
 	bool b_edca_turbo_on = false;
 
-	b_last_is_cur_rdlstate = rtlpriv->dm.is_cur_rdlstate;
-
 	cur_txok_cnt = rtlpriv->stats.txbytesunicast - last_txok_cnt;
 	cur_rxok_cnt = rtlpriv->stats.rxbytesunicast - last_rxok_cnt;
