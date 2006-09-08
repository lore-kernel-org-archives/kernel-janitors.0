From: James Nelson <james4765@gmail.com>
Date: Fri, 08 Sep 2006 02:03:44 +0000
Subject: [KJ] [PATCH 65/72] arm: add KERN_ constants to
Message-Id: <20060908020344.10114.74462.sendpatchset@david.homenet>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Signed-off-by: James Nelson <james4765@gmail.com>
---
diff --git a/arch/arm/plat-omap/dma.c b/arch/arm/plat-omap/dma.c
index 9eddc95..3699253 100644
@@ -33,14 +33,6 @@ #include <asm/io.h>
 
 #include <asm/arch/tc.h>
 
-#define DEBUG_PRINTS
-#undef DEBUG_PRINTS
-#ifdef DEBUG_PRINTS
-#define debug_printk(x) printk x
-#else
-#define	debug_printk(x)
-#endif
-
 #define OMAP_DMA_ACTIVE		0x01
 #define OMAP_DMA_CCR_EN		(1 << 7)
 #define OMAP2_DMA_CSR_CLEAR_MASK	0xffe
@@ -554,7 +546,7 @@ void omap_free_dma(int lch)
 
 	spin_lock_irqsave(&dma_chan_lock, flags);
 	if (dma_chan[lch].dev_id = -1) {
-		printk("omap_dma: trying to free nonallocated DMA channel %d\n",
+		pr_info("omap_dma: trying to free nonallocated DMA channel %d\n",
 		       lch);
 		spin_unlock_irqrestore(&dma_chan_lock, flags);
 		return;
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
