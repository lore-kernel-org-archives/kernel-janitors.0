From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 11 Mar 2020 13:52:27 +0000
Subject: [PATCH] mt76: mt7615: remove a stray if statement
Message-Id: <20200311135227.GA16505@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Felix Fietkau <nbd@nbd.name>, Ryder Lee <ryder.lee@mediatek.com>
Cc: kernel-janitors@vger.kernel.org, linux-wireless@vger.kernel.org, Matthias Brugger <matthias.bgg@gmail.com>, linux-mediatek@lists.infradead.org, Roy Luo <royluo@google.com>, Lorenzo Bianconi <lorenzo.bianconi83@gmail.com>, Kalle Valo <kvalo@codeaurora.org>

This if statement was supposed to be deleted, but it wasn't.  It means
that we sometimes don't set the sensitivity correctly.

Fixes: 2cad515ece8a ("mt76: mt7615: add missing settings for simultaneous dual-band support")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 drivers/net/wireless/mediatek/mt76/mt7615/mac.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7615/mac.c b/drivers/net/wireless/mediatek/mt76/mt7615/mac.c
index 145366dbc39b..64b6bc3c1e02 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7615/mac.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7615/mac.c
@@ -1630,7 +1630,6 @@ mt7615_mac_adjust_sensitivity(struct mt7615_phy *phy,
 				 MT_WF_PHY_PD_OFDM(ext_phy, val));
 		} else {
 			val = *sensitivity + 256;
-			if (!ext_phy)
 			mt76_rmw(dev, MT_WF_PHY_RXTD_CCK_PD(ext_phy),
 				 MT_WF_PHY_PD_CCK_MASK(ext_phy),
 				 MT_WF_PHY_PD_CCK(ext_phy, val));
-- 
2.20.1
