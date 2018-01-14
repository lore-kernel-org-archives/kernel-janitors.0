From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Sun, 14 Jan 2018 21:30:04 +0000
Subject: [PATCH] mfd/jz4740-adc: Delete an error message for a failed memory allocation in jz4740_adc_probe()
Message-Id: <448b31bd-4466-b373-988f-f6452e32f390@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org, Lee Jones <lee.jones@linaro.org>
Cc: LKML <linux-kernel@vger.kernel.org>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Sun, 14 Jan 2018 22:26:21 +0100

Omit an extra message for a memory allocation failure in this function.

This issue was detected by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/mfd/jz4740-adc.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/mfd/jz4740-adc.c b/drivers/mfd/jz4740-adc.c
index 798e44306382..f4cd14294b61 100644
--- a/drivers/mfd/jz4740-adc.c
+++ b/drivers/mfd/jz4740-adc.c
@@ -212,10 +212,8 @@ static int jz4740_adc_probe(struct platform_device *pdev)
 	int irq_base;
 
 	adc = devm_kzalloc(&pdev->dev, sizeof(*adc), GFP_KERNEL);
-	if (!adc) {
-		dev_err(&pdev->dev, "Failed to allocate driver structure\n");
+	if (!adc)
 		return -ENOMEM;
-	}
 
 	adc->irq = platform_get_irq(pdev, 0);
 	if (adc->irq < 0) {
-- 
2.15.1

