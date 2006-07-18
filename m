From: Henne <henne@nachtwindheim.de>
Date: Tue, 18 Jul 2006 11:59:54 +0000
Subject: [KJ] [PATCH] kernel-doc in kernel/irq/handle.c
Message-Id: <44BCCD3A.20109@nachtwindheim.de>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: tglx@linutronix.de
Cc: linux-kernel@vger.kernel.org, kernel-janitors@lists.osdl.org

From: Henrik Kretzschmar <henne@nachtwindheim.de>

Adds the description of the parameters from handle_bad_irq().
Signed-off-by: Henrik Kretzschmar <henne@nachtwindheim.de>
---

diff -ruN linux-2.6.18-rc2/kernel/irq/handle.c linux/kernel/irq/handle.c
--- linux-2.6.18-rc2/kernel/irq/handle.c        2006-07-18 13:37:39.000000000 +0200
+++ linux/kernel/irq/handle.c   2006-07-18 13:51:15.000000000 +0200
@@ -20,6 +20,11 @@

 /**
  * handle_bad_irq - handle spurious and unhandled irqs
+ * @irq:       the interrupt number
+ * @desc:      description of the interrupt
+ * @regs:      pointer to a register structure
+ *
+ * Handles spurious and unhandled IRQ's. It also prints a debugmessage.
  */
 void fastcall
 handle_bad_irq(unsigned int irq, struct irq_desc *desc, struct pt_regs *regs)
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
