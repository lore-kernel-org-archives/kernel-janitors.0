From: Colin King <colin.king@canonical.com>
Date: Thu, 17 Jan 2019 15:28:59 +0000
Subject: [PATCH] rtlwifi: rtl818x: fix indentation issue
Message-Id: <20190117152859.6873-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Kalle Valo <kvalo@codeaurora.org>, "David S . Miller" <davem@davemloft.net>, linux-wireless@vger.kernel.org, netdev@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

There is a statement that is indented too deeply. Fix this.

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/net/wireless/realtek/rtl818x/rtl8180/dev.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/wireless/realtek/rtl818x/rtl8180/dev.c b/drivers/net/wireless/realtek/rtl818x/rtl8180/dev.c
index 225c1c8851cc..e2b1bfbcfbd4 100644
--- a/drivers/net/wireless/realtek/rtl818x/rtl8180/dev.c
+++ b/drivers/net/wireless/realtek/rtl818x/rtl8180/dev.c
@@ -803,7 +803,7 @@ static void rtl8180_config_cardbus(struct ieee80211_hw *dev)
 		rtl818x_iowrite16(priv, FEMR_SE, 0xffff);
 	} else {
 		reg16 = rtl818x_ioread16(priv, &priv->map->FEMR);
-			reg16 |= (1 << 15) | (1 << 14) | (1 << 4);
+		reg16 |= (1 << 15) | (1 << 14) | (1 << 4);
 		rtl818x_iowrite16(priv, &priv->map->FEMR, reg16);
 	}
 
-- 
2.19.1
