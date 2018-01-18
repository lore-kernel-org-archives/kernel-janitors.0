From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Thu, 18 Jan 2018 21:17:19 +0000
Subject: [PATCH 3/3] irq-imx-gpcv2: Use common error handling code in imx_gpcv2_irqchip_init()
Message-Id: <f97b7f91-11f7-224e-a953-f6ff1982becd@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <e9033837-9e04-be5b-2875-aa746840d5a7@users.sourceforge.net>
In-Reply-To: <e9033837-9e04-be5b-2875-aa746840d5a7@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org, Jason Cooper <jason@lakedaemon.net>, Marc Zyngier <marc.zyngier@arm.com>, Shenwei Wang <shenwei.wang@freescale.com>, Thomas Gleixner <tglx@linutronix.de>
Cc: LKML <linux-kernel@vger.kernel.org>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Thu, 18 Jan 2018 22:00:05 +0100

Add a jump target so that a bit of exception handling can be better reused
at the end of this function.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/irqchip/irq-imx-gpcv2.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/drivers/irqchip/irq-imx-gpcv2.c b/drivers/irqchip/irq-imx-gpcv2.c
index e62f22c84112..2dc348581877 100644
--- a/drivers/irqchip/irq-imx-gpcv2.c
+++ b/drivers/irqchip/irq-imx-gpcv2.c
@@ -233,16 +233,14 @@ static int __init imx_gpcv2_irqchip_init(struct device_node *node,
 	cd->gpc_base = of_iomap(node, 0);
 	if (!cd->gpc_base) {
 		pr_err("fsl-gpcv2: unable to map gpc registers\n");
-		kfree(cd);
-		return -ENOMEM;
+		goto free_data;
 	}
 
 	domain = irq_domain_add_hierarchy(parent_domain, 0, GPC_MAX_IRQS,
 				node, &gpcv2_irqchip_data_domain_ops, cd);
 	if (!domain) {
 		iounmap(cd->gpc_base);
-		kfree(cd);
-		return -ENOMEM;
+		goto free_data;
 	}
 	irq_set_default_host(domain);
 
@@ -272,6 +270,10 @@ static int __init imx_gpcv2_irqchip_init(struct device_node *node,
 	 */
 	of_node_clear_flag(node, OF_POPULATED);
 	return 0;
+
+free_data:
+	kfree(cd);
+	return -ENOMEM;
 }
 
 IRQCHIP_DECLARE(imx_gpcv2, "fsl,imx7d-gpc", imx_gpcv2_irqchip_init);
-- 
2.15.1

