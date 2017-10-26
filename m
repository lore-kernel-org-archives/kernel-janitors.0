From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Thu, 26 Oct 2017 20:14:19 +0000
Subject: [PATCH] irqchip: mmp: Use common error handling code in mmp2_mux_of_init()
Message-Id: <690b6f85-80a7-4add-2106-a3df2c614cd5@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org, Daniel Drake <dsd@laptop.org>, Haojian Zhuang <haojian.zhuang@gmail.com>, Jason Cooper <jason@lakedaemon.net>, Marc Zyngier <marc.zyngier@arm.com>, Thomas Gleixner <tglx@linutronix.de>
Cc: LKML <linux-kernel@vger.kernel.org>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Thu, 26 Oct 2017 22:05:26 +0200

Add a jump target so that a bit of exception handling can be better reused
at the end of this function.

This issue was detected by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/irqchip/irq-mmp.c | 18 ++++++++++--------
 1 file changed, 10 insertions(+), 8 deletions(-)

diff --git a/drivers/irqchip/irq-mmp.c b/drivers/irqchip/irq-mmp.c
index 25f32e1d7764..4a3dd020777f 100644
--- a/drivers/irqchip/irq-mmp.c
+++ b/drivers/irqchip/irq-mmp.c
@@ -438,16 +438,14 @@ static int __init mmp2_mux_of_init(struct device_node *node,
 		return -EINVAL;
 	}
 	ret = of_address_to_resource(node, 0, &res);
-	if (ret < 0) {
-		pr_err("Not found reg property\n");
-		return -EINVAL;
-	}
+	if (ret < 0)
+		goto report_failure;
+
 	icu_data[i].reg_status = mmp_icu_base + res.start;
 	ret = of_address_to_resource(node, 1, &res);
-	if (ret < 0) {
-		pr_err("Not found reg property\n");
-		return -EINVAL;
-	}
+	if (ret < 0)
+		goto report_failure;
+
 	icu_data[i].reg_mask = mmp_icu_base + res.start;
 	icu_data[i].cascade_irq = irq_of_parse_and_map(node, 0);
 	if (!icu_data[i].cascade_irq)
@@ -483,6 +481,10 @@ static int __init mmp2_mux_of_init(struct device_node *node,
 	}
 	irq_domain_remove(icu_data[i].domain);
 	return -EINVAL;
+
+report_failure:
+	pr_err("Not found reg property\n");
+	return -EINVAL;
 }
 IRQCHIP_DECLARE(mmp2_mux_intc, "mrvl,mmp2-mux-intc", mmp2_mux_of_init);
 #endif
-- 
2.14.3

