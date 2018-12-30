From: Colin King <colin.king@canonical.com>
Date: Sun, 30 Dec 2018 13:26:40 +0000
Subject: [PATCH] mt76: make const array 'data' static, shrinks object size
Message-Id: <20181230132640.6916-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Felix Fietkau <nbd@nbd.name>, Lorenzo Bianconi <lorenzo.bianconi83@gmail.com>, Kalle Valo <kvalo@codeaurora.org>, "David S . Miller" <davem@davemloft.net>, Matthias Brugger <matthias.bgg@gmail.com>, linux-wireless@vger.kernel.org, netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Don't populate the const array 'data' on the stack but instead
make it static. Makes the object code smaller by 78 bytes:

Before:
   text    data     bss     dec     hex filename
   5438    1080       0    6518    1976 mediatek/mt76/mt76x2/usb_mcu.o

After:
   text    data     bss     dec     hex filename
   5296    1144       0    6440    1928 mediatek/mt76/mt76x2/usb_mcu.o

(gcc version 8.2.0 x86_64)

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/net/wireless/mediatek/mt76/mt76x2/usb_mcu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt76x2/usb_mcu.c b/drivers/net/wireless/mediatek/mt76/mt76x2/usb_mcu.c
index 45a95ee3a415..152d41fe9ff5 100644
--- a/drivers/net/wireless/mediatek/mt76/mt76x2/usb_mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt76x2/usb_mcu.c
@@ -39,7 +39,7 @@ static void mt76x2u_mcu_load_ivb(struct mt76x02_dev *dev)
 static void mt76x2u_mcu_enable_patch(struct mt76x02_dev *dev)
 {
 	struct mt76_usb *usb = &dev->mt76.usb;
-	const u8 data[] = {
+	static const u8 data[] = {
 		0x6f, 0xfc, 0x08, 0x01,
 		0x20, 0x04, 0x00, 0x00,
 		0x00, 0x09, 0x00,
-- 
2.19.1
