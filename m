From: James Nelson <james4765@gmail.com>
Date: Fri, 08 Sep 2006 02:04:04 +0000
Subject: [KJ] [PATCH 68/72] arm: add KERN_ constants to
Message-Id: <20060908020404.10114.72825.sendpatchset@david.homenet>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Signed-off-by: James Nelson <james4765@gmail.com>
---
diff --git a/arch/arm/plat-omap/mcbsp.c b/arch/arm/plat-omap/mcbsp.c
index 196aac3..1825a83 100644
--- a/arch/arm/plat-omap/mcbsp.c
+++ b/arch/arm/plat-omap/mcbsp.c
@@ -32,9 +32,9 @@ #include <asm/arch/dsp_common.h>
 #include <asm/arch/mcbsp.h>
 
 #ifdef CONFIG_MCBSP_DEBUG
-#define DBG(x...)	printk(x)
+#define DBG(fmt, args...)	printk(KERN_DEBUG "%s: " fmt, __FUNCTION__, ## args)
 #else
-#define DBG(x...)			do { } while (0)
+#define DBG(fmt, args...)
 #endif
 
 struct omap_mcbsp {
@@ -562,7 +562,7 @@ int omap_mcbsp_spi_master_xmit_word_poll
 			udelay(10);
 			OMAP_MCBSP_WRITE(io_base, SPCR2, spcr2 | XRST);
 			udelay(10);
-			printk("McBSP transmitter not ready\n");
+			pr_info("McBSP transmitter not ready\n");
 			return -EAGAIN;
 		}
 	}
@@ -582,7 +582,7 @@ int omap_mcbsp_spi_master_xmit_word_poll
 			udelay(10);
 			OMAP_MCBSP_WRITE(io_base, SPCR1, spcr1 | RRST);
 			udelay(10);
-			printk("McBSP receiver not ready\n");
+			pr_info("McBSP receiver not ready\n");
 			return -EAGAIN;
 		}
 	}
@@ -615,7 +615,7 @@ int omap_mcbsp_spi_master_recv_word_poll
 			udelay(10);
 			OMAP_MCBSP_WRITE(io_base, SPCR2, spcr2 | XRST);
 			udelay(10);
-			printk("McBSP transmitter not ready\n");
+			pr_info("McBSP transmitter not ready\n");
 			return -EAGAIN;
 		}
 	}
@@ -635,7 +635,7 @@ int omap_mcbsp_spi_master_recv_word_poll
 			udelay(10);
 			OMAP_MCBSP_WRITE(io_base, SPCR1, spcr1 | RRST);
 			udelay(10);
-			printk("McBSP receiver not ready\n");
+			pr_info("McBSP receiver not ready\n");
 			return -EAGAIN;
 		}
 	}
@@ -671,7 +671,7 @@ int omap_mcbsp_xmit_buffer(unsigned int 
 	if (omap_request_dma(mcbsp[id].dma_tx_sync, "McBSP TX", omap_mcbsp_tx_dma_callback,
 			     &mcbsp[id],
 			     &dma_tx_ch)) {
-		printk("OMAP-McBSP: Unable to request DMA channel for McBSP%d TX. Trying IRQ based TX\n", id+1);
+		pr_info("OMAP-McBSP: Unable to request DMA channel for McBSP%d TX. Trying IRQ based TX\n", id+1);
 		return -EAGAIN;
 	}
 	mcbsp[id].dma_tx_lch = dma_tx_ch;
@@ -724,7 +724,7 @@ int omap_mcbsp_recv_buffer(unsigned int 
 	if (omap_request_dma(mcbsp[id].dma_rx_sync, "McBSP RX", omap_mcbsp_rx_dma_callback,
 			     &mcbsp[id],
 			     &dma_rx_ch)) {
-		printk("Unable to request DMA channel for McBSP%d RX. Trying IRQ based RX\n", id+1);
+		pr_info("Unable to request DMA channel for McBSP%d RX. Trying IRQ based RX\n", id+1);
 		return -EAGAIN;
 	}
 	mcbsp[id].dma_rx_lch = dma_rx_ch;
@@ -920,7 +920,7 @@ static int __init omap_mcbsp_init(void)
 	int mcbsp_count = 0, i;
 	static const struct omap_mcbsp_info *mcbsp_info;
 
-	printk("Initializing OMAP McBSP system\n");
+	pr_info("Initializing OMAP McBSP system\n");
 
 #ifdef CONFIG_ARCH_OMAP1
 	mcbsp_dsp_ck = clk_get(0, "dsp_ck");
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
