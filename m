From: Markus Elfring <Markus.Elfring@web.de>
Date: Fri, 05 Jul 2019 18:30:08 +0000
Subject: [PATCH] mfd: asic3: One function call less in asic3_irq_probe()
Message-Id: <e57f9ad8-24b2-5c1e-2a48-6b49e15e597c@web.de>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org, Lee Jones <lee.jones@linaro.org>
Cc: LKML <linux-kernel@vger.kernel.org>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Fri, 5 Jul 2019 20:22:26 +0200

Avoid an extra function call by using a ternary operator instead of
a conditional statement.

This issue was detected by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/mfd/asic3.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/drivers/mfd/asic3.c b/drivers/mfd/asic3.c
index 83b18c998d6f..50f5368fb170 100644
--- a/drivers/mfd/asic3.c
+++ b/drivers/mfd/asic3.c
@@ -401,11 +401,10 @@ static int __init asic3_irq_probe(struct platform_device *pdev)
 	irq_base = asic->irq_base;

 	for (irq = irq_base; irq < irq_base + ASIC3_NR_IRQS; irq++) {
-		if (irq < asic->irq_base + ASIC3_NUM_GPIOS)
-			irq_set_chip(irq, &asic3_gpio_irq_chip);
-		else
-			irq_set_chip(irq, &asic3_irq_chip);
-
+		irq_set_chip(irq,
+			     (irq < asic->irq_base + ASIC3_NUM_GPIOS)
+			     ? &asic3_gpio_irq_chip
+			     : &asic3_irq_chip);
 		irq_set_chip_data(irq, asic);
 		irq_set_handler(irq, handle_level_irq);
 		irq_clear_status_flags(irq, IRQ_NOREQUEST | IRQ_NOPROBE);
--
2.22.0
