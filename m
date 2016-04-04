From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Mon, 04 Apr 2016 11:17:36 +0000
Subject: [patch] irqchip/mbigen: checking for IS_ERR() instead of NULL
Message-Id: <20160404111736.GB26910@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Thomas Gleixner <tglx@linutronix.de>, MaJun <majun258@huawei.com>
Cc: Jason Cooper <jason@lakedaemon.net>, Marc Zyngier <marc.zyngier@arm.com>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

of_platform_device_create() returns NULL on error, it never returns
error pointers.

Fixes: ed2a1002d25c ('irqchip/mbigen: Handle multiple device nodes in a mbigen module')
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/irqchip/irq-mbigen.c b/drivers/irqchip/irq-mbigen.c
index d67baa2..03b79b0 100644
--- a/drivers/irqchip/irq-mbigen.c
+++ b/drivers/irqchip/irq-mbigen.c
@@ -263,8 +263,8 @@ static int mbigen_device_probe(struct platform_device *pdev)
 
 		parent = platform_bus_type.dev_root;
 		child = of_platform_device_create(np, NULL, parent);
-		if (IS_ERR(child))
-			return PTR_ERR(child);
+		if (!child)
+			return -ENOMEM;
 
 		if (of_property_read_u32(child->dev.of_node, "num-pins",
 					 &num_pins) < 0) {
