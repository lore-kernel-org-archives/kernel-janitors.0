From: James Nelson <james4765@gmail.com>
Date: Tue, 12 Sep 2006 03:21:24 +0000
Subject: [KJ] [PATCH 6/7][RESEND] arm: add KERN_* constants to printk()'s in
Message-Id: <20060912032124.5999.15721.sendpatchset@david.homenet>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Diffstat:

 dma.c     |   10 +---------
 dmtimer.c |    2 +-
 gpio.c    |    6 +++---
 mcbsp.c   |   18 +++++++++---------
 mux.c     |   10 +++++-----
 ocpi.c    |    2 +-
 pm.c      |    6 +++---
 usb.c     |    4 ++--
 8 files changed, 25 insertions(+), 33 deletions(-)

Signed-off-by: James Nelson <james4765@gmail.com>

---
diff --git a/arch/arm/plat-omap/dma.c b/arch/arm/plat-omap/dma.c
index 9eddc95..eb80611 100644
--- a/arch/arm/plat-omap/dma.c
+++ b/arch/arm/plat-omap/dma.c
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
diff --git a/arch/arm/plat-omap/dmtimer.c b/arch/arm/plat-omap/dmtimer.c
index 5052443..e55f66b 100644
--- a/arch/arm/plat-omap/dmtimer.c
+++ b/arch/arm/plat-omap/dmtimer.c
@@ -206,7 +206,7 @@ struct omap_dm_timer *omap_dm_timer_requ
 	spin_lock_irqsave(&dm_timer_lock, flags);
 	if (id <= 0 || id > dm_timer_count || dm_timers[id-1].reserved) {
 		spin_unlock_irqrestore(&dm_timer_lock, flags);
-		printk("BUG: warning at %s:%d/%s(): unable to get timer %d\n",
+		printk(KERN_ERR "BUG: warning at %s:%d/%s(): unable to get timer %d\n",
 		       __FILE__, __LINE__, __FUNCTION__, id);
 		dump_stack();
 		return NULL;
diff --git a/arch/arm/plat-omap/gpio.c b/arch/arm/plat-omap/gpio.c
index cd7f973..8cb546e 100644
--- a/arch/arm/plat-omap/gpio.c
+++ b/arch/arm/plat-omap/gpio.c
@@ -974,19 +974,19 @@ static int __init _omap_gpio_init(void)
 	if (cpu_is_omap15xx()) {
 		gpio_ick = clk_get(NULL, "arm_gpio_ck");
 		if (IS_ERR(gpio_ick))
-			printk("Could not get arm_gpio_ck\n");
+			pr_info("Could not get arm_gpio_ck\n");
 		else
 			clk_enable(gpio_ick);
 	}
 	if (cpu_is_omap24xx()) {
 		gpio_ick = clk_get(NULL, "gpios_ick");
 		if (IS_ERR(gpio_ick))
-			printk("Could not get gpios_ick\n");
+			pr_info("Could not get gpios_ick\n");
 		else
 			clk_enable(gpio_ick);
 		gpio_fck = clk_get(NULL, "gpios_fck");
 		if (IS_ERR(gpio_ick))
-			printk("Could not get gpios_fck\n");
+			pr_info("Could not get gpios_fck\n");
 		else
 			clk_enable(gpio_fck);
 	}
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
diff --git a/arch/arm/plat-omap/mux.c b/arch/arm/plat-omap/mux.c
index 042105a..a1b8144 100644
--- a/arch/arm/plat-omap/mux.c
+++ b/arch/arm/plat-omap/mux.c
@@ -84,7 +84,7 @@ int __init_or_module omap_cfg_reg(const 
 		if(cfg->pu_pd_val)
 			reg |= OMAP24XX_PULL_UP;
 #ifdef CONFIG_OMAP_MUX_DEBUG
-		printk("Muxing %s (0x%08x): 0x%02x -> 0x%02x\n",
+		pr_info("Muxing %s (0x%08x): 0x%02x -> 0x%02x\n",
 		       cfg->name, OMAP24XX_L4_BASE + cfg->mux_reg,
 		       omap_readb(OMAP24XX_L4_BASE + cfg->mux_reg), reg);
 #endif
@@ -168,20 +168,20 @@ #endif
 
 #ifdef CONFIG_OMAP_MUX_DEBUG
 	if (cfg->debug || warn) {
-		printk("MUX: Setting register %s\n", cfg->name);
-		printk("      %s (0x%08x) = 0x%08x -> 0x%08x\n",
+		pr_info("MUX: Setting register %s\n", cfg->name);
+		pr_info("      %s (0x%08x) = 0x%08x -> 0x%08x\n",
 		       cfg->mux_reg_name, cfg->mux_reg, reg_orig, reg);
 
 		if (!cpu_is_omap1510()) {
 			if (cfg->pu_pd_reg && cfg->pull_val) {
-				printk("      %s (0x%08x) = 0x%08x -> 0x%08x\n",
+				pr_info("      %s (0x%08x) = 0x%08x -> 0x%08x\n",
 				       cfg->pu_pd_name, cfg->pu_pd_reg,
 				       pu_pd_orig, pu_pd);
 			}
 		}
 
 		if (cfg->pull_reg)
-			printk("      %s (0x%08x) = 0x%08x -> 0x%08x\n",
+			pr_info("      %s (0x%08x) = 0x%08x -> 0x%08x\n",
 			       cfg->pull_name, cfg->pull_reg, pull_orig, pull);
 	}
 #endif
diff --git a/arch/arm/plat-omap/ocpi.c b/arch/arm/plat-omap/ocpi.c
index b5d3070..3968b5b 100644
--- a/arch/arm/plat-omap/ocpi.c
+++ b/arch/arm/plat-omap/ocpi.c
@@ -86,7 +86,7 @@ static int __init omap_ocpi_init(void)
 
 	clk_enable(ocpi_ck);
 	ocpi_enable();
-	printk("OMAP OCPI interconnect driver loaded\n");
+	pr_info("OMAP OCPI interconnect driver loaded\n");
 
 	return 0;
 }
diff --git a/arch/arm/plat-omap/pm.c b/arch/arm/plat-omap/pm.c
index 04b4102..7a72d51 100644
--- a/arch/arm/plat-omap/pm.c
+++ b/arch/arm/plat-omap/pm.c
@@ -167,7 +167,7 @@ void omap_pm_suspend(void)
 {
 	unsigned long arg0 = 0, arg1 = 0;
 
-	printk("PM: OMAP%x is trying to enter deep sleep...\n", system_rev);
+	pr_info("PM: OMAP%x is trying to enter deep sleep...\n", system_rev);
 
 	omap_serial_wake_trigger(1);
 
@@ -340,7 +340,7 @@ void omap_pm_suspend(void)
 
 	omap_serial_wake_trigger(0);
 
-	printk("PM: OMAP%x is re-starting from deep sleep...\n", system_rev);
+	pr_info("PM: OMAP%x is re-starting from deep sleep...\n", system_rev);
 
 	if (machine_is_omap_osk()) {
 		/* Let LED1 (D9) blink again */
@@ -595,7 +595,7 @@ static struct pm_ops omap_pm_ops ={
 
 static int __init omap_pm_init(void)
 {
-	printk("Power Management for TI OMAP.\n");
+	pr_info("Power Management for TI OMAP\n");
 	/*
 	 * We copy the assembler sleep/wakeup routines to SRAM.
 	 * These routines need to be in SRAM as that's the only
diff --git a/arch/arm/plat-omap/usb.c b/arch/arm/plat-omap/usb.c
index 9b81532..87cf76c 100644
--- a/arch/arm/plat-omap/usb.c
+++ b/arch/arm/plat-omap/usb.c
@@ -430,7 +430,7 @@ #endif
 	pr_debug("OTG_SYSCON_2_REG = %08x\n", syscon);
 	OTG_SYSCON_2_REG = syscon;
 
-	printk("USB: hmc %d", config->hmc_mode);
+	pr_info("USB: hmc %d", config->hmc_mode);
 	if (alt_pingroup)
 		printk(", usb2 alt %d wires", config->pins[2]);
 	else if (config->pins[0])
@@ -520,7 +520,7 @@ static void __init omap_1510_usb_init(st
 	val |= (config->hmc_mode << 1);
 	omap_writel(val, MOD_CONF_CTRL_0);
 
-	printk("USB: hmc %d", config->hmc_mode);
+	pr_info("USB: hmc %d", config->hmc_mode);
 	if (config->pins[0])
 		printk(", usb0 %d wires%s", config->pins[0],
 			is_usb0_device(config) ? " (dev)" : "");
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
