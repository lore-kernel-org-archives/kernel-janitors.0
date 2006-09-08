From: James Nelson <james4765@gmail.com>
Date: Fri, 08 Sep 2006 02:02:21 +0000
Subject: [KJ] [PATCH 53/72] arm: add KERN_ constants to
Message-Id: <20060908020221.10114.80622.sendpatchset@david.homenet>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Signed-off-by: James Nelson <james4765@gmail.com>
---
diff --git a/arch/arm/mach-sa1100/h3600.c b/arch/arm/mach-sa1100/h3600.c
index 7364478..7066ada 100644
--- a/arch/arm/mach-sa1100/h3600.c
+++ b/arch/arm/mach-sa1100/h3600.c
@@ -53,6 +53,10 @@ #endif
 
 #include "generic.h"
 
+#define PFX "h3xxx: "
+#undef DEBUG
+#define DPRINTK(fmt, args...) pr_debug(PFX "%s: ", __FUNCTION__, ## args)
+
 struct ipaq_model_ops ipaq_model_ops;
 EXPORT_SYMBOL(ipaq_model_ops);
 
@@ -596,7 +600,7 @@ static void h3800_control_egpio(enum ipa
 	case IPAQ_EGPIO_CODEC_NRESET:
 	case IPAQ_EGPIO_AUDIO_ON:
 	case IPAQ_EGPIO_QMUTE:
-		printk("%s: error - should not be called\n", __FUNCTION__);
+		printk(PFX "%s: error - should not be called\n", __FUNCTION__);
 		break;
 	case IPAQ_EGPIO_OPT_NVRAM_ON:
 		SET_ASIC2(GPIO2_OPT_ON_NVRAM);
@@ -638,7 +642,7 @@ static int h3800_pm_callback(int req)
 	static u16 asic2_data;
 	int result = 0;
 
-	printk("%s %d\n", __FUNCTION__, req);
+	printk(PFX "%s %d\n", __FUNCTION__, req);
 
 	switch (req) {
 	case PM_RESUME:
@@ -666,7 +670,7 @@ static int h3800_pm_callback(int req)
 		asic2_data = H3800_ASIC2_GPIOPIOD;
 		break;
 	default:
-		printk("%s: unrecognized PM callback\n", __FUNCTION__);
+		printk(KERN_ERR PFX "%s: unrecognized PM callback\n", __FUNCTION__);
 		break;
 	}
 	return result;
@@ -706,7 +710,7 @@ static void h3800_IRQ_demux(unsigned int
 {
 	int i;
 
-	if (0) printk("%s: interrupt received\n", __FUNCTION__);
+	DPRINTK("interrupt received\n");
 
 	desc->chip->ack(irq);
 
@@ -716,21 +720,21 @@ static void h3800_IRQ_demux(unsigned int
 
 		/* KPIO */
 		irq = H3800_ASIC2_KPIINTFLAG;
-		if (0) printk("%s KPIO 0x%08X\n", __FUNCTION__, irq);
+		DPRINTK("KPIO 0x%08X\n", irq);
 		for (j = 0; j < H3800_KPIO_IRQ_COUNT; j++)
 			if (irq & kpio_irq_mask[j])
 				do_edge_IRQ(H3800_KPIO_IRQ_COUNT + j, irq_desc + H3800_KPIO_IRQ_COUNT + j, regs);
 
 		/* GPIO2 */
 		irq = H3800_ASIC2_GPIINTFLAG;
-		if (0) printk("%s GPIO 0x%08X\n", __FUNCTION__, irq);
+		DPRINTK("GPIO 0x%08X\n", irq);
 		for (j = 0; j < H3800_GPIO_IRQ_COUNT; j++)
 			if (irq & gpio_irq_mask[j])
 				do_edge_IRQ(H3800_GPIO_IRQ_COUNT + j, irq_desc + H3800_GPIO_IRQ_COUNT + j , regs);
 	}
 
 	if (i >= MAX_ASIC_ISR_LOOPS)
-		printk("%s: interrupt processing overrun\n", __FUNCTION__);
+		pr_info("%s: interrupt processing overrun\n", __FUNCTION__);
 
 	/* For level-based interrupts */
 	desc->chip->unmask(irq);
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
