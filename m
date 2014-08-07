From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 07 Aug 2014 15:28:21 +0000
Subject: [patch] irqchip/irq-crossbar: off by one bugs in init
Message-Id: <20140807152821.GB10299@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Thomas Gleixner <tglx@linutronix.de>, Sricharan R <r.sricharan@ti.com>
Cc: Jason Cooper <jason@lakedaemon.net>, Grant Likely <grant.likely@linaro.org>, Rob Herring <robh+dt@kernel.org>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

My static checker complains that the ">" should be ">=" or else we go
beyoned the end of the cb->irq_map[] array on the next line.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/irqchip/irq-crossbar.c b/drivers/irqchip/irq-crossbar.c
index 85c2985..bbbaf5d 100644
--- a/drivers/irqchip/irq-crossbar.c
+++ b/drivers/irqchip/irq-crossbar.c
@@ -220,7 +220,7 @@ static int __init crossbar_of_init(struct device_node *node)
 			of_property_read_u32_index(node,
 						   "ti,irqs-reserved",
 						   i, &entry);
-			if (entry > max) {
+			if (entry >= max) {
 				pr_err("Invalid reserved entry\n");
 				ret = -EINVAL;
 				goto err_irq_map;
@@ -238,7 +238,7 @@ static int __init crossbar_of_init(struct device_node *node)
 			of_property_read_u32_index(node,
 						   "ti,irqs-skip",
 						   i, &entry);
-			if (entry > max) {
+			if (entry >= max) {
 				pr_err("Invalid skip entry\n");
 				ret = -EINVAL;
 				goto err_irq_map;
