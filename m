From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Thu, 18 Jan 2018 16:22:57 +0000
Subject: [PATCH 1/5] irqchip/irq-gic-v2m: Delete an error message for a failed memory allocation in gicv2m_in
Message-Id: <d93bb46d-41c5-22a8-4bbe-171c39fb532e@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <cd9daaf3-677e-9845-0d36-b6826b3457b5@users.sourceforge.net>
In-Reply-To: <cd9daaf3-677e-9845-0d36-b6826b3457b5@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org, Jason Cooper <jason@lakedaemon.net>, Marc Zyngier <marc.zyngier@arm.com>, Thomas Gleixner <tglx@linutronix.de>
Cc: LKML <linux-kernel@vger.kernel.org>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Thu, 18 Jan 2018 15:44:01 +0100

Omit an extra message for a memory allocation failure in this function.

This issue was detected by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/irqchip/irq-gic-v2m.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/irqchip/irq-gic-v2m.c b/drivers/irqchip/irq-gic-v2m.c
index 993a8426a453..b795fefafb12 100644
--- a/drivers/irqchip/irq-gic-v2m.c
+++ b/drivers/irqchip/irq-gic-v2m.c
@@ -309,10 +309,8 @@ static int __init gicv2m_init_one(struct fwnode_handle *fwnode,
 	struct v2m_data *v2m;
 
 	v2m = kzalloc(sizeof(struct v2m_data), GFP_KERNEL);
-	if (!v2m) {
-		pr_err("Failed to allocate struct v2m_data.\n");
+	if (!v2m)
 		return -ENOMEM;
-	}
 
 	INIT_LIST_HEAD(&v2m->entry);
 	v2m->fwnode = fwnode;
-- 
2.15.1

