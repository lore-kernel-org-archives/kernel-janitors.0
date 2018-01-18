From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Thu, 18 Jan 2018 21:15:40 +0000
Subject: [PATCH 2/3] irq-imx-gpcv2: Improve a size determination in imx_gpcv2_irqchip_init()
Message-Id: <56c51505-0ac3-7c59-6ba3-768dd3a675da@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <e9033837-9e04-be5b-2875-aa746840d5a7@users.sourceforge.net>
In-Reply-To: <e9033837-9e04-be5b-2875-aa746840d5a7@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org, Jason Cooper <jason@lakedaemon.net>, Marc Zyngier <marc.zyngier@arm.com>, Shenwei Wang <shenwei.wang@freescale.com>, Thomas Gleixner <tglx@linutronix.de>
Cc: LKML <linux-kernel@vger.kernel.org>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Thu, 18 Jan 2018 21:25:13 +0100

Replace the specification of a data structure by a pointer dereference
as the parameter for the operator "sizeof" to make the corresponding size
determination a bit safer according to the Linux coding style convention.

This issue was detected by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/irqchip/irq-imx-gpcv2.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/irqchip/irq-imx-gpcv2.c b/drivers/irqchip/irq-imx-gpcv2.c
index f08fcbb46b1b..e62f22c84112 100644
--- a/drivers/irqchip/irq-imx-gpcv2.c
+++ b/drivers/irqchip/irq-imx-gpcv2.c
@@ -224,7 +224,7 @@ static int __init imx_gpcv2_irqchip_init(struct device_node *node,
 		return -ENXIO;
 	}
 
-	cd = kzalloc(sizeof(struct gpcv2_irqchip_data), GFP_KERNEL);
+	cd = kzalloc(sizeof(*cd), GFP_KERNEL);
 	if (!cd)
 		return -ENOMEM;
 
-- 
2.15.1

