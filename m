From: Markus Elfring <Markus.Elfring@web.de>
Date: Wed, 18 Sep 2019 11:26:43 +0000
Subject: [PATCH] memory/fsl-corenet-cf: Use devm_platform_ioremap_resource() in ccf_probe()
Message-Id: <d4e42383-a462-f5d8-4277-c20775c7352c@web.de>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org, Allison Randal <allison@lohutok.net>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Scott Wood <scottwood@freescale.com>, Thomas Gleixner <tglx@linutronix.de>
Cc: LKML <linux-kernel@vger.kernel.org>, Bartosz Golaszewski <bgolaszewski@baylibre.com>, Himanshu Jha <himanshujha199640@gmail.com>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Wed, 18 Sep 2019 13:14:46 +0200

Simplify this function implementation by using a known wrapper function.

This issue was detected by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/memory/fsl-corenet-cf.c | 9 +--------
 1 file changed, 1 insertion(+), 8 deletions(-)

diff --git a/drivers/memory/fsl-corenet-cf.c b/drivers/memory/fsl-corenet-cf.c
index 0b0ed72016da..f2fdc3c82ff7 100644
--- a/drivers/memory/fsl-corenet-cf.c
+++ b/drivers/memory/fsl-corenet-cf.c
@@ -172,7 +172,6 @@ static irqreturn_t ccf_irq(int irq, void *dev_id)
 static int ccf_probe(struct platform_device *pdev)
 {
 	struct ccf_private *ccf;
-	struct resource *r;
 	const struct of_device_id *match;
 	u32 errinten;
 	int ret, irq;
@@ -185,13 +184,7 @@ static int ccf_probe(struct platform_device *pdev)
 	if (!ccf)
 		return -ENOMEM;

-	r = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	if (!r) {
-		dev_err(&pdev->dev, "%s: no mem resource\n", __func__);
-		return -ENXIO;
-	}
-
-	ccf->regs = devm_ioremap_resource(&pdev->dev, r);
+	ccf->regs = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(ccf->regs)) {
 		dev_err(&pdev->dev, "%s: can't map mem resource\n", __func__);
 		return PTR_ERR(ccf->regs);
--
2.23.0
