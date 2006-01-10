From: Christophe Lucas <clucas@rotomalug.org>
Date: Tue, 10 Jan 2006 11:42:13 +0000
Subject: [KJ] [PATCH] printk : arch/arm/kernel/irq.c
Message-Id: <20060110114213.GD8401@rotomalug.org>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============68388175076511537=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============68388175076511537==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Description:
printk should include appropriate KERN_* constant (of course
only at beginning of lines).

Signed-off-by: Christophe Lucas <clucas@rotomalug.org>

Index: linux-2.6.15/arch/arm/kernel/irq.c
===================================================================
--- linux-2.6.15.orig/arch/arm/kernel/irq.c	2006-01-03 04:21:10.000000000 +0100
+++ linux-2.6.15/arch/arm/kernel/irq.c	2006-01-07 11:27:02.000000000 +0100
@@ -175,8 +175,8 @@
 
 	spin_lock_irqsave(&irq_controller_lock, flags);
 	if (unlikely(!desc->disable_depth)) {
-		printk("enable_irq(%u) unbalanced from %p\n", irq,
-			__builtin_return_address(0));
+		printk(KERN_INFO "enable_irq(%u) unbalanced from %p\n",
+			irq, __builtin_return_address(0));
 	} else if (!--desc->disable_depth) {
 		desc->probing = 0;
 		desc->chip->unmask(irq);
@@ -311,9 +311,9 @@
 	count--;
 
 	if (ret != IRQ_HANDLED && ret != IRQ_NONE) {
-		printk("irq%u: bogus retval mask %x\n", irq, ret);
+		printk(KERN_WARNING "irq%u: bogus retval mask %x\n", irq, ret);
 	} else {
-		printk("irq%u: nobody cared\n", irq);
+		printk(KERN_WARNING "irq%u: nobody cared\n", irq);
 	}
 	show_regs(regs);
 	dump_stack();

--===============68388175076511537==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============68388175076511537==--
