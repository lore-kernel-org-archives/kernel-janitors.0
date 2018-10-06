From: Colin King <colin.king@canonical.com>
Date: Sat, 06 Oct 2018 18:42:46 +0000
Subject: [PATCH] rtlwifi: rtl8821ae: add in a missing break in switch statement
Message-Id: <20181006184246.29985-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Ping-Ke Shih <pkshih@realtek.com>, Kalle Valo <kvalo@codeaurora.org>, "David S . Miller" <davem@davemloft.net>, Larry Finger <Larry.Finger@lwfinger.net>, Tsang-Shian Lin <thlin@realtek.com>, linux-wireless@vger.kernel.org, netdev@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

The switch case RATR_INX_WIRELESS_MC has a missing break, this seems
to be unintentional as the setting of variable ret gets overwritten
when the case falls through to the following RATR_INX_WIRELESS_AC_5N
case.  Fix this by adding in the missing break.

Detected by CoverityScan, CID#1167237 ("Missing break in switch")

Fixes: 3c05bedb5fef ("Staging: rtl8812ae: Add Realtek 8821 PCI WIFI driver")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/net/wireless/realtek/rtlwifi/rtl8821ae/hw.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/net/wireless/realtek/rtlwifi/rtl8821ae/hw.c b/drivers/net/wireless/realtek/rtlwifi/rtl8821ae/hw.c
index 317c1b3101da..8af49c1c99db 100644
--- a/drivers/net/wireless/realtek/rtlwifi/rtl8821ae/hw.c
+++ b/drivers/net/wireless/realtek/rtlwifi/rtl8821ae/hw.c
@@ -3448,6 +3448,7 @@ static u8 _rtl8821ae_mrate_idx_to_arfr_id(
 			ret = 6;
 		else
 			ret = 7;
+		break;
 	case RATR_INX_WIRELESS_AC_5N:
 		if (rtlphy->rf_type = RF_1T1R)
 			ret = 10;
-- 
2.17.1
