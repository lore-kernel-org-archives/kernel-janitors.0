From: James Nelson <james4765@gmail.com>
Date: Fri, 08 Sep 2006 01:56:44 +0000
Subject: [KJ] [PATCH 03/72] arm: add KERN_ constants to
Message-Id: <20060908015644.10114.79482.sendpatchset@david.homenet>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Signed-off-by: James Nelson <james4765@gmail.com>
---
diff --git a/arch/arm/mach-h720x/common.c b/arch/arm/mach-h720x/common.c
index c096b45..2b74d79 100644
--- a/arch/arm/mach-h720x/common.c
+++ b/arch/arm/mach-h720x/common.c
@@ -31,11 +31,8 @@ #include <asm/arch/irqs.h>
 
 #include <asm/mach/dma.h>
 
-#if 0
-#define IRQDBG(args...) printk(args)
-#else
-#define IRQDBG(args...) do {} while(0)
-#endif
+#undef DEBUG
+#define IRQDBG(fmt, args...) pr_debug("%s: " fmt, __FUNCTION__, ## args)
 
 void __init arch_dma_init(dma_t *dma)
 {
@@ -103,7 +100,7 @@ static void
 h720x_gpio_handler(unsigned int mask, unsigned int irq,
                  struct irqdesc *desc, struct pt_regs *regs)
 {
-	IRQDBG("%s irq: %d\n",__FUNCTION__,irq);
+	IRQDBG("irq: %d\n",irq);
 	desc = irq_desc + irq;
 	while (mask) {
 		if (mask & 1) {
@@ -124,7 +121,7 @@ h720x_gpioa_demux_handler(unsigned int i
 
 	mask = CPU_REG(GPIO_A_VIRT,GPIO_STAT);
 	irq = IRQ_CHAINED_GPIOA(0);
-	IRQDBG("%s mask: 0x%08x irq: %d\n",__FUNCTION__,mask,irq);
+	IRQDBG("mask: 0x%08x irq: %d\n",mask,irq);
 	h720x_gpio_handler(mask, irq, desc, regs);
 }
 
@@ -135,7 +132,7 @@ h720x_gpiob_demux_handler(unsigned int i
 	unsigned int mask, irq;
 	mask = CPU_REG(GPIO_B_VIRT,GPIO_STAT);
 	irq = IRQ_CHAINED_GPIOB(0);
-	IRQDBG("%s mask: 0x%08x irq: %d\n",__FUNCTION__,mask,irq);
+	IRQDBG("mask: 0x%08x irq: %d\n",mask,irq);
 	h720x_gpio_handler(mask, irq, desc, regs);
 }
 
@@ -147,7 +144,7 @@ h720x_gpioc_demux_handler(unsigned int i
 
 	mask = CPU_REG(GPIO_C_VIRT,GPIO_STAT);
 	irq = IRQ_CHAINED_GPIOC(0);
-	IRQDBG("%s mask: 0x%08x irq: %d\n",__FUNCTION__,mask,irq);
+	IRQDBG("mask: 0x%08x irq: %d\n",mask,irq);
 	h720x_gpio_handler(mask, irq, desc, regs);
 }
 
@@ -159,7 +156,7 @@ h720x_gpiod_demux_handler(unsigned int i
 
 	mask = CPU_REG(GPIO_D_VIRT,GPIO_STAT);
 	irq = IRQ_CHAINED_GPIOD(0);
-	IRQDBG("%s mask: 0x%08x irq: %d\n",__FUNCTION__,mask,irq);
+	IRQDBG("mask: 0x%08x irq: %d\n",mask,irq);
 	h720x_gpio_handler(mask, irq, desc, regs);
 }
 
@@ -172,7 +169,7 @@ h720x_gpioe_demux_handler(unsigned int i
 
 	mask = CPU_REG(GPIO_E_VIRT,GPIO_STAT);
 	irq = IRQ_CHAINED_GPIOE(0);
-	IRQDBG("%s mask: 0x%08x irq: %d\n",__FUNCTION__,mask,irq);
+	IRQDBG("mask: 0x%08x irq: %d\n",mask,irq);
 	h720x_gpio_handler(mask, irq, desc, regs);
 }
 #endif
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
