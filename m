From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Fri, 19 Jan 2018 19:40:24 +0000
Subject: [PATCH] IRQ-Renesas: Delete an error message for a failed memory allocation in two functions
Message-Id: <9e149a56-299f-b6e1-26f2-c6b4c4717b28@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org, Jason Cooper <jason@lakedaemon.net>, Marc Zyngier <marc.zyngier@arm.com>, Thomas Gleixner <tglx@linutronix.de>
Cc: LKML <linux-kernel@vger.kernel.org>, Magnus Damm <damm@opensource.se>, Simon Horman <horms+renesas@verge.net.au>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Fri, 19 Jan 2018 20:32:04 +0100

Omit an extra message for a memory allocation failure in these functions.

This issue was detected by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/irqchip/irq-renesas-intc-irqpin.c | 4 +---
 drivers/irqchip/irq-renesas-irqc.c        | 1 -
 2 files changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/irqchip/irq-renesas-intc-irqpin.c b/drivers/irqchip/irq-renesas-intc-irqpin.c
index cee59fe1321c..2a7f311b19e4 100644
--- a/drivers/irqchip/irq-renesas-intc-irqpin.c
+++ b/drivers/irqchip/irq-renesas-intc-irqpin.c
@@ -410,10 +410,8 @@ static int intc_irqpin_probe(struct platform_device *pdev)
 	int k;
 
 	p = devm_kzalloc(dev, sizeof(*p), GFP_KERNEL);
-	if (!p) {
-		dev_err(dev, "failed to allocate driver data\n");
+	if (!p)
 		return -ENOMEM;
-	}
 
 	/* deal with driver instance configuration */
 	of_property_read_u32(dev->of_node, "sense-bitfield-width",
diff --git a/drivers/irqchip/irq-renesas-irqc.c b/drivers/irqchip/irq-renesas-irqc.c
index 52304b139aa4..8c2c5d92f688 100644
--- a/drivers/irqchip/irq-renesas-irqc.c
+++ b/drivers/irqchip/irq-renesas-irqc.c
@@ -151,7 +151,6 @@ static int irqc_probe(struct platform_device *pdev)
 
 	p = kzalloc(sizeof(*p), GFP_KERNEL);
 	if (!p) {
-		dev_err(&pdev->dev, "failed to allocate driver data\n");
 		ret = -ENOMEM;
 		goto err0;
 	}
-- 
2.15.1

