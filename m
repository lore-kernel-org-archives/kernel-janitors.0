From: Colin King <colin.king@canonical.com>
Date: Thu, 14 May 2020 18:13:29 +0000
Subject: [PATCH][next] rtw88: 8723d: fix incorrect setting of ldo_pwr
Message-Id: <20200514181329.16292-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Yan-Hsuan Chuang <yhchuang@realtek.com>, Kalle Valo <kvalo@codeaurora.org>, "David S . Miller" <davem@davemloft.net>, Ping-Ke Shih <pkshih@realtek.com>, linux-wireless@vger.kernel.org, netdev@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Currently ldo_pwr has the LDO25 voltage bits set to zero and then
it is overwritten with the new voltage setting. The assignment
looks incorrect, it should be bit-wise or'ing in the new voltage
setting rather than a direct assignment.

Addresses-Coverity: ("Unused value")
Fixes: 1afb5eb7a00d ("rtw88: 8723d: Add cfg_ldo25 to control LDO25")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/net/wireless/realtek/rtw88/rtw8723d.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/wireless/realtek/rtw88/rtw8723d.c b/drivers/net/wireless/realtek/rtw88/rtw8723d.c
index b517af417e0e..2c6e417c5bca 100644
--- a/drivers/net/wireless/realtek/rtw88/rtw8723d.c
+++ b/drivers/net/wireless/realtek/rtw88/rtw8723d.c
@@ -561,7 +561,7 @@ static void rtw8723d_cfg_ldo25(struct rtw_dev *rtwdev, bool enable)
 	ldo_pwr = rtw_read8(rtwdev, REG_LDO_EFUSE_CTRL + 3);
 	if (enable) {
 		ldo_pwr &= ~BIT_MASK_LDO25_VOLTAGE;
-		ldo_pwr = (BIT_LDO25_VOLTAGE_V25 << 4) | BIT_LDO25_EN;
+		ldo_pwr |= (BIT_LDO25_VOLTAGE_V25 << 4) | BIT_LDO25_EN;
 	} else {
 		ldo_pwr &= ~BIT_LDO25_EN;
 	}
-- 
2.25.1
