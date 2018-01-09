From: Colin King <colin.king@canonical.com>
Date: Tue, 09 Jan 2018 16:43:29 +0000
Subject: [PATCH][next] rtlwifi: btcoexist: remove redundant variable fw_ps_state
Message-Id: <20180109164329.15919-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Ping-Ke Shih <pkshih@realtek.com>, Kalle Valo <kvalo@codeaurora.org>, Larry Finger <Larry.Finger@lwfinger.net>, Yan-Hsuan Chuang <yhchuang@realtek.com>, linux-wireless@vger.kernel.org, netdev@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Variable fw_ps_state is assigned a value but it is never read, hence
it is redundant and can be removed.

Cleans up clang warning:
drivers/net/wireless/realtek/rtlwifi/btcoexist/halbtcoutsrc.c:736:2:
warning: Value stored to 'fw_ps_state' is never read

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/net/wireless/realtek/rtlwifi/btcoexist/halbtcoutsrc.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/net/wireless/realtek/rtlwifi/btcoexist/halbtcoutsrc.c b/drivers/net/wireless/realtek/rtlwifi/btcoexist/halbtcoutsrc.c
index 5f3eda31187a..873bf9303d5d 100644
--- a/drivers/net/wireless/realtek/rtlwifi/btcoexist/halbtcoutsrc.c
+++ b/drivers/net/wireless/realtek/rtlwifi/btcoexist/halbtcoutsrc.c
@@ -677,7 +677,7 @@ static void halbtc_display_wifi_status(struct btc_coexist *btcoexist,
 	u32 wifi_link_status = 0x0;
 	bool bt_hs_on = false, under_ips = false, under_lps = false;
 	bool low_power = false, dc_mode = false;
-	u8 wifi_chnl = 0, wifi_hs_chnl = 0, fw_ps_state;
+	u8 wifi_chnl = 0, wifi_hs_chnl = 0;
 	u8 ap_num = 0;
 
 	wifi_link_status = halbtc_get_wifi_link_status(btcoexist);
@@ -733,7 +733,6 @@ static void halbtc_display_wifi_status(struct btc_coexist *btcoexist,
 	dc_mode = true;	/*TODO*/
 	under_ips = rtlpriv->psc.inactive_pwrstate = ERFOFF ? 1 : 0;
 	under_lps = rtlpriv->psc.dot11_psmode = EACTIVE ? 0 : 1;
-	fw_ps_state = 0;
 	low_power = 0; /*TODO*/
 	seq_printf(m, "\n %-35s = %s%s%s%s",
 		   "Power Status",
-- 
2.15.1

