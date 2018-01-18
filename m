From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Thu, 18 Jan 2018 21:14:31 +0000
Subject: [PATCH 1/3] irq-imx-gpcv2: Delete an error message for a failed memory allocation in imx_gpcv2_irqch
Message-Id: <280740be-7287-0b07-1f44-964ac5a5fc54@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <e9033837-9e04-be5b-2875-aa746840d5a7@users.sourceforge.net>
In-Reply-To: <e9033837-9e04-be5b-2875-aa746840d5a7@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org, Jason Cooper <jason@lakedaemon.net>, Marc Zyngier <marc.zyngier@arm.com>, Shenwei Wang <shenwei.wang@freescale.com>, Thomas Gleixner <tglx@linutronix.de>
Cc: LKML <linux-kernel@vger.kernel.org>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Thu, 18 Jan 2018 21:23:06 +0100

Omit an extra message for a memory allocation failure in this function.

This issue was detected by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/irqchip/irq-imx-gpcv2.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/irqchip/irq-imx-gpcv2.c b/drivers/irqchip/irq-imx-gpcv2.c
index 675eda5ff2b8..f08fcbb46b1b 100644
--- a/drivers/irqchip/irq-imx-gpcv2.c
+++ b/drivers/irqchip/irq-imx-gpcv2.c
@@ -225,10 +225,8 @@ static int __init imx_gpcv2_irqchip_init(struct device_node *node,
 	}
 
 	cd = kzalloc(sizeof(struct gpcv2_irqchip_data), GFP_KERNEL);
-	if (!cd) {
-		pr_err("kzalloc failed!\n");
+	if (!cd)
 		return -ENOMEM;
-	}
 
 	raw_spin_lock_init(&cd->rlock);
 
-- 
2.15.1

