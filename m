From: Markus Elfring <Markus.Elfring@web.de>
Date: Sun, 05 Apr 2020 14:52:49 +0000
Subject: [PATCH] mt7615: Delete an error message in mt7622_wmac_probe()
Message-Id: <0b236ef3-45cb-b6bf-a3ca-fbe4fa4185da@web.de>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: linux-wireless@vger.kernel.org, netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, "David S. Miller" <davem@davemloft.net>, Felix Fietkau <nbd@nbd.name>, Kalle Valo <kvalo@codeaurora.org>, Lorenzo Bianconi <lorenzo.bianconi83@gmail.com>, Matthias Brugger <matthias.bgg@gmail.com>, Roy Luo <royluo@google.com>, Ryder Lee <ryder.lee@mediatek.com>, Sean Wang <sean.wang@mediatek.com>
Cc: kernel-janitors@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Tang Bin <tangbin@cmss.chinamobile.com>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Sun, 5 Apr 2020 16:45:48 +0200

The function “platform_get_irq” can log an error already.
Thus omit a redundant message for the exception handling in the
calling function.

This issue was detected by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/net/wireless/mediatek/mt76/mt7615/soc.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7615/soc.c b/drivers/net/wireless/mediatek/mt76/mt7615/soc.c
index 43aa49706c66..9aa5183c7a56 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7615/soc.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7615/soc.c
@@ -36,10 +36,8 @@ static int mt7622_wmac_probe(struct platform_device *pdev)
 	int irq;

 	irq = platform_get_irq(pdev, 0);
-	if (irq < 0) {
-		dev_err(&pdev->dev, "Failed to get device IRQ\n");
+	if (irq < 0)
 		return irq;
-	}

 	mem_base = devm_ioremap_resource(&pdev->dev, res);
 	if (IS_ERR(mem_base)) {
--
2.26.0
