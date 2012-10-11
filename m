From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 11 Oct 2012 07:03:29 +0000
Subject: [patch] irq: potential integer wrapping __setup_irq()
Message-Id: <20121011070329.GH31607@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Thomas Gleixner <tglx@linutronix.de>
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

"thread_mask" is an unsigned long.  It's better to use 1UL here so we
can take advantage of the high bits as well.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/kernel/irq/manage.c b/kernel/irq/manage.c
index 4c69326..cfe1283 100644
--- a/kernel/irq/manage.c
+++ b/kernel/irq/manage.c
@@ -1027,7 +1027,7 @@ __setup_irq(unsigned int irq, struct irq_desc *desc, struct irqaction *new)
 		 * thread_mask assigned. See the loop above which or's
 		 * all existing action->thread_mask bits.
 		 */
-		new->thread_mask = 1 << ffz(thread_mask);
+		new->thread_mask = 1UL << ffz(thread_mask);
 
 	} else if (new->handler = irq_default_primary_handler &&
 		   !(desc->irq_data.chip->flags & IRQCHIP_ONESHOT_SAFE)) {
