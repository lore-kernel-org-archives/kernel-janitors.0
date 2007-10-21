From: Roel Kluin <12o3l@tiscali.nl>
Date: Sun, 21 Oct 2007 17:54:53 +0000
Subject: [PATCH] VSC_GSC_HSC bus debugging
Message-Id: <471B926D.10009@tiscali.nl>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

    VSC_GSC_HSC bus debugging
    
    Signed-off-by: Roel Kluin <12o3l@tiscali.nl>

diff --git a/drivers/parisc/Kconfig b/drivers/parisc/Kconfig
index 1d3b84b..6121170 100644
--- a/drivers/parisc/Kconfig
+++ b/drivers/parisc/Kconfig
@@ -10,6 +10,11 @@ config GSC
 	  are not found in B1000, C3000, J5000, A500, L1000, N4000 and upwards.
 	  If in doubt, say "Y".
 
+config GSC_DEBUG
+	bool "VSC_GSC_HSC bus debugging"
+	depends on GSC
+	default n
+
 config HPPB
 	bool "HP-PB bus support"
 	depends on GSC
diff --git a/drivers/parisc/gsc.c b/drivers/parisc/gsc.c
index 1b3e3fd..0e6a614 100644
--- a/drivers/parisc/gsc.c
+++ b/drivers/parisc/gsc.c
@@ -26,14 +26,13 @@
 #include <asm/io.h>
 
 #include "gsc.h"
+#ifdef GSC_DEBUG
+	#define DEBUG 1
+#endif
+#include <linux/kernel.h>
 
 #undef DEBUG
 
-#ifdef DEBUG
-#define DEBPRINTK printk
-#else
-#define DEBPRINTK(x,...)
-#endif
 
 int gsc_alloc_irq(struct gsc_irq *i)
 {
@@ -82,7 +81,7 @@ irqreturn_t gsc_asic_intr(int gsc_asic_irq, void *dev)
 	if (irr = 0)
 		return IRQ_NONE;
 
-	DEBPRINTK("%s intr, mask=0x%x\n", gsc_asic->name, irr);
+	printk("%s intr, mask=0x%x\n", gsc_asic->name, irr);
 
 	do {
 		int local_irq = __ffs(irr);
@@ -112,7 +111,7 @@ static void gsc_asic_disable_irq(unsigned int irq)
 	int local_irq = gsc_find_local_irq(irq, irq_dev->global_irq, 32);
 	u32 imr;
 
-	DEBPRINTK(KERN_DEBUG "%s(%d) %s: IMR 0x%x\n", __FUNCTION__, irq,
+	printk(KERN_DEBUG "%s(%d) %s: IMR 0x%x\n", __FUNCTION__, irq,
 			irq_dev->name, imr);
 
 	/* Disable the IRQ line by clearing the bit in the IMR */
@@ -127,7 +126,7 @@ static void gsc_asic_enable_irq(unsigned int irq)
 	int local_irq = gsc_find_local_irq(irq, irq_dev->global_irq, 32);
 	u32 imr;
 
-	DEBPRINTK(KERN_DEBUG "%s(%d) %s: IMR 0x%x\n", __FUNCTION__, irq,
+	printk(KERN_DEBUG "%s(%d) %s: IMR 0x%x\n", __FUNCTION__, irq,
 			irq_dev->name, imr);
 
 	/* Enable the IRQ line by setting the bit in the IMR */
