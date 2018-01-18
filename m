From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Thu, 18 Jan 2018 17:13:48 +0000
Subject: [PATCH] irq-imgpdc: Delete two error messages for a failed memory allocation in pdc_intc_probe()
Message-Id: <09ce518e-44f9-2274-57a6-286bb75d5a5d@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org, Jason Cooper <jason@lakedaemon.net>, James Hogan <james.hogan@imgtec.com>, Marc Zyngier <marc.zyngier@arm.com>, Thomas Gleixner <tglx@linutronix.de>
Cc: LKML <linux-kernel@vger.kernel.org>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Thu, 18 Jan 2018 18:05:46 +0100

Omit extra messages for a memory allocation failure in this function.

This issue was detected by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/irqchip/irq-imgpdc.c | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/drivers/irqchip/irq-imgpdc.c b/drivers/irqchip/irq-imgpdc.c
index e80263e16c4c..d4a2e9081fd2 100644
--- a/drivers/irqchip/irq-imgpdc.c
+++ b/drivers/irqchip/irq-imgpdc.c
@@ -316,10 +316,9 @@ static int pdc_intc_probe(struct platform_device *pdev)
 
 	/* Allocate driver data */
 	priv = devm_kzalloc(&pdev->dev, sizeof(*priv), GFP_KERNEL);
-	if (!priv) {
-		dev_err(&pdev->dev, "cannot allocate device data\n");
+	if (!priv)
 		return -ENOMEM;
-	}
+
 	raw_spin_lock_init(&priv->lock);
 	platform_set_drvdata(pdev, priv);
 
@@ -356,10 +355,9 @@ static int pdc_intc_probe(struct platform_device *pdev)
 	/* Get peripheral IRQ numbers */
 	priv->perip_irqs = devm_kzalloc(&pdev->dev, 4 * priv->nr_perips,
 					GFP_KERNEL);
-	if (!priv->perip_irqs) {
-		dev_err(&pdev->dev, "cannot allocate perip IRQ list\n");
+	if (!priv->perip_irqs)
 		return -ENOMEM;
-	}
+
 	for (i = 0; i < priv->nr_perips; ++i) {
 		irq = platform_get_irq(pdev, 1 + i);
 		if (irq < 0) {
-- 
2.15.1

