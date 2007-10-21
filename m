From: Roel Kluin <12o3l@tiscali.nl>
Date: Sun, 21 Oct 2007 21:12:17 +0000
Subject: Re: [PATCH] VSC_GSC_HSC bus debugging
Message-Id: <471BC0B1.7060309@tiscali.nl>
List-Id: <kernel-janitors.vger.kernel.org>
References: <471B926D.10009@tiscali.nl>
In-Reply-To: <471B926D.10009@tiscali.nl>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Matthew Wilcox wrote:
> On Sun, Oct 21, 2007 at 07:54:53PM +0200, Roel Kluin wrote:
>> +config GSC_DEBUG
>> +	bool "VSC_GSC_HSC bus debugging"
> 
> What an ugly prompt string ...

I wrote a script to make these changes, but apparently it's still not perfect
I should have checked it more. I will make changes and resend previously sent
patches. Below is the patch previously called [PATCH] VSC_GSC_HSC bus debugging,
with corrections.

I used "VSC/GSC/HSC bus support" from "config GSC" in the Kconfig. the slashes
were translated to underscores because they previously gave a bug. it's fixed now,
but I think the name "VSC/GSC/HSC bus debugging" is more appropriate here.
 
>> +	depends on GSC
>> +	default n
> 
> default is 'n', by default.  No need to specify it.

ok fixed that

>> +#ifdef GSC_DEBUG
>> +	#define DEBUG 1
>> +#endif
> 
> Why the indent?

I thought it was more clear. But have that changed now as well.

>> -	DEBPRINTK("%s intr, mask=0x%x\n", gsc_asic->name, irr);
>> +	printk("%s intr, mask=0x%x\n", gsc_asic->name, irr);
> 
> Presumably you meant pr_debug?

yes.

Thanks for your comments. How is the one below instead? It is a replacement for
[PATCH] VSC_GSC_HSC bus debugging.

Now there's also a change in some printk's and the GSC_DEBUG option has a place
lower in the Kconfig file. I also added a Kconfig help description.

---
    Kconfig GSC bus debugging and more elaborate printks
    
    Signed-off-by: Roel Kluin <12o3l@tiscali.nl>

diff --git a/drivers/parisc/Kconfig b/drivers/parisc/Kconfig
index 1d3b84b..8959141 100644
--- a/drivers/parisc/Kconfig
+++ b/drivers/parisc/Kconfig
@@ -54,6 +54,12 @@ config EISA
 	  supports both the Mongoose & Wax EISA adapters.  It is sadly
 	  incomplete and lacks support for card-to-host DMA.
 
+config GSC_DEBUG
+	bool "VSC/GSC/HSC bus debugging"
+	depends on GSC
+	help
+	  Say Y here to enable debugging for VSC, GSC and HSC busses.
+
 source "drivers/eisa/Kconfig"
 
 config ISA
diff --git a/drivers/parisc/gsc.c b/drivers/parisc/gsc.c
index 1b3e3fd..8805abb 100644
--- a/drivers/parisc/gsc.c
+++ b/drivers/parisc/gsc.c
@@ -27,19 +27,17 @@
 
 #include "gsc.h"
 
-#undef DEBUG
-
-#ifdef DEBUG
-#define DEBPRINTK printk
-#else
-#define DEBPRINTK(x,...)
+#ifdef GSC_DEBUG
+#define DEBUG 1
 #endif
+#include <linux/kernel.h>
+
 
 int gsc_alloc_irq(struct gsc_irq *i)
 {
 	int irq = txn_alloc_irq(GSC_EIM_WIDTH);
 	if (irq < 0) {
-		printk("cannot get irq\n");
+		printk("GSC: cannot get irq\n");
 		return irq;
 	}
 
@@ -58,7 +56,7 @@ int gsc_claim_irq(struct gsc_irq *i, int irq)
 
 	irq = txn_claim_irq(irq);
 	if (irq < 0) {
-		printk("cannot claim irq %d\n", c);
+		printk("GSC: cannot claim irq %d\n", c);
 		return irq;
 	}
 
@@ -82,7 +80,7 @@ irqreturn_t gsc_asic_intr(int gsc_asic_irq, void *dev)
 	if (irr = 0)
 		return IRQ_NONE;
 
-	DEBPRINTK("%s intr, mask=0x%x\n", gsc_asic->name, irr);
+	pr_debug("%s intr, mask=0x%x\n", gsc_asic->name, irr);
 
 	do {
 		int local_irq = __ffs(irr);
@@ -112,7 +110,7 @@ static void gsc_asic_disable_irq(unsigned int irq)
 	int local_irq = gsc_find_local_irq(irq, irq_dev->global_irq, 32);
 	u32 imr;
 
-	DEBPRINTK(KERN_DEBUG "%s(%d) %s: IMR 0x%x\n", __FUNCTION__, irq,
+	pr_debug("%s(%d) %s: IMR 0x%x\n", __FUNCTION__, irq,
 			irq_dev->name, imr);
 
 	/* Disable the IRQ line by clearing the bit in the IMR */
@@ -127,7 +125,7 @@ static void gsc_asic_enable_irq(unsigned int irq)
 	int local_irq = gsc_find_local_irq(irq, irq_dev->global_irq, 32);
 	u32 imr;
 
-	DEBPRINTK(KERN_DEBUG "%s(%d) %s: IMR 0x%x\n", __FUNCTION__, irq,
+	pr_debug("%s(%d) %s: IMR 0x%x\n", __FUNCTION__, irq,
 			irq_dev->name, imr);
 
 	/* Enable the IRQ line by setting the bit in the IMR */
