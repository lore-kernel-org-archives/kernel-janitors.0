From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Thu, 18 Jan 2018 16:24:30 +0000
Subject: [PATCH 2/5] irqchip/irq-gic-v2m: Improve a size determination in gicv2m_init_one()
Message-Id: <10ededda-66a9-001c-4ad6-db5baa80b679@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <cd9daaf3-677e-9845-0d36-b6826b3457b5@users.sourceforge.net>
In-Reply-To: <cd9daaf3-677e-9845-0d36-b6826b3457b5@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org, Jason Cooper <jason@lakedaemon.net>, Marc Zyngier <marc.zyngier@arm.com>, Thomas Gleixner <tglx@linutronix.de>
Cc: LKML <linux-kernel@vger.kernel.org>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Thu, 18 Jan 2018 16:07:41 +0100

Replace the specification of a data structure by a pointer dereference
as the parameter for the operator "sizeof" to make the corresponding size
determination a bit safer according to the Linux coding style convention.

This issue was detected by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/irqchip/irq-gic-v2m.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/irqchip/irq-gic-v2m.c b/drivers/irqchip/irq-gic-v2m.c
index b795fefafb12..930261710ba2 100644
--- a/drivers/irqchip/irq-gic-v2m.c
+++ b/drivers/irqchip/irq-gic-v2m.c
@@ -306,9 +306,8 @@ static int __init gicv2m_init_one(struct fwnode_handle *fwnode,
 				  struct resource *res)
 {
 	int ret;
-	struct v2m_data *v2m;
+	struct v2m_data *v2m = kzalloc(sizeof(*v2m), GFP_KERNEL);
 
-	v2m = kzalloc(sizeof(struct v2m_data), GFP_KERNEL);
 	if (!v2m)
 		return -ENOMEM;
 
-- 
2.15.1

