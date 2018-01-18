From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Thu, 18 Jan 2018 16:25:41 +0000
Subject: [PATCH 3/5] irqchip/irq-gic-v2m: Mark a of_device_id variable as "const"
Message-Id: <fb56a882-cd8e-a3c2-9874-3eb39aca4ded@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <cd9daaf3-677e-9845-0d36-b6826b3457b5@users.sourceforge.net>
In-Reply-To: <cd9daaf3-677e-9845-0d36-b6826b3457b5@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org, Jason Cooper <jason@lakedaemon.net>, Marc Zyngier <marc.zyngier@arm.com>, Thomas Gleixner <tglx@linutronix.de>
Cc: LKML <linux-kernel@vger.kernel.org>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Thu, 18 Jan 2018 16:33:43 +0100

The script "checkpatch.pl" pointed information out like the following.

WARNING: struct of_device_id should normally be const

Thus fix the affected source code place.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/irqchip/irq-gic-v2m.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/irqchip/irq-gic-v2m.c b/drivers/irqchip/irq-gic-v2m.c
index 930261710ba2..7482c2b86bb8 100644
--- a/drivers/irqchip/irq-gic-v2m.c
+++ b/drivers/irqchip/irq-gic-v2m.c
@@ -380,7 +380,7 @@ static int __init gicv2m_init_one(struct fwnode_handle *fwnode,
 	return ret;
 }
 
-static struct of_device_id gicv2m_device_id[] = {
+static const struct of_device_id gicv2m_device_id[] = {
 	{	.compatible	= "arm,gic-v2m-frame",	},
 	{},
 };
-- 
2.15.1

