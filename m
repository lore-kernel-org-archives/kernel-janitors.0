From: Colin King <colin.king@canonical.com>
Date: Fri, 06 Sep 2019 12:19:26 +0000
Subject: [PATCH] mt76: mt76x0e: make array mt76x0_chan_map static const, makes object smaller
Message-Id: <20190906121926.24080-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Felix Fietkau <nbd@nbd.name>, Lorenzo Bianconi <lorenzo.bianconi83@gmail.com>, Ryder Lee <ryder.lee@mediatek.com>, Roy Luo <royluo@google.com>, Kalle Valo <kvalo@codeaurora.org>, "David S . Miller" <davem@davemloft.net>, Matthias Brugger <matthias.bgg@gmail.com>, linux-wireless@vger.kernel.org, netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Don't populate the array mt76x0_chan_map on the stack but instead make it
static const. Makes the object code smaller by 80 bytes.

Before:
   text	   data	    bss	    dec	    hex	filename
   7685	   1192	      0	   8877	   22ad	mediatek/mt76/mt76x0/eeprom.o

After:
   text	   data	    bss	    dec	    hex	filename
   7541	   1256	      0	   8797	   225d	mediatek/mt76/mt76x0/eeprom.o

(gcc version 9.2.1, amd64)

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/net/wireless/mediatek/mt76/mt76x0/eeprom.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt76x0/eeprom.c b/drivers/net/wireless/mediatek/mt76/mt76x0/eeprom.c
index 9d4426f6905f..96368fac4228 100644
--- a/drivers/net/wireless/mediatek/mt76/mt76x0/eeprom.c
+++ b/drivers/net/wireless/mediatek/mt76/mt76x0/eeprom.c
@@ -212,7 +212,7 @@ void mt76x0_get_tx_power_per_rate(struct mt76x02_dev *dev,
 void mt76x0_get_power_info(struct mt76x02_dev *dev,
 			   struct ieee80211_channel *chan, s8 *tp)
 {
-	struct mt76x0_chan_map {
+	static const struct mt76x0_chan_map {
 		u8 chan;
 		u8 offset;
 	} chan_map[] = {
-- 
2.20.1
