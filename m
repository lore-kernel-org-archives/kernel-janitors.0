From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 03 May 2019 13:09:13 +0000
Subject: [PATCH] mt76: mt7615: Use after free in mt7615_mcu_set_bcn()
Message-Id: <20190503130909.GI29695@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Felix Fietkau <nbd-Vt+b4OUoWG0@public.gmane.org>, Ryder Lee <ryder.lee-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Cc: Lorenzo Bianconi <lorenzo.bianconi83-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Roy Luo <royluo-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, Kalle Valo <kvalo-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-wireless-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, kernel-janitors-u79uwXL29TY76Z2rM5mHXA@public.gmane.org

We dereference "skb" when we assign:

	req.pkt_len = cpu_to_le16(MT_TXD_SIZE + skb->len);
                                                ^^^^^^^^
So this patch just moves the dev_kfree_skb() down a bit to avoid the
use after free.

Fixes: 04b8e65922f6 ("mt76: add mac80211 driver for MT7615 PCIe-based chipsets")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 drivers/net/wireless/mediatek/mt76/mt7615/mcu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7615/mcu.c b/drivers/net/wireless/mediatek/mt76/mt7615/mcu.c
index ea67c6022fe6..dc1301effa24 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7615/mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7615/mcu.c
@@ -1270,7 +1270,6 @@ int mt7615_mcu_set_bcn(struct mt7615_dev *dev, struct ieee80211_vif *vif,
 	mt7615_mac_write_txwi(dev, (__le32 *)(req.pkt), skb, wcid, NULL,
 			      0, NULL);
 	memcpy(req.pkt + MT_TXD_SIZE, skb->data, skb->len);
-	dev_kfree_skb(skb);
 
 	req.omac_idx = mvif->omac_idx;
 	req.enable = en;
@@ -1281,6 +1280,7 @@ int mt7615_mcu_set_bcn(struct mt7615_dev *dev, struct ieee80211_vif *vif,
 	req.pkt_len = cpu_to_le16(MT_TXD_SIZE + skb->len);
 	req.tim_ie_pos = cpu_to_le16(MT_TXD_SIZE + tim_off);
 
+	dev_kfree_skb(skb);
 	skb = mt7615_mcu_msg_alloc(&req, sizeof(req));
 
 	return mt7615_mcu_msg_send(dev, skb, MCU_EXT_CMD_BCN_OFFLOAD,
-- 
2.18.0
