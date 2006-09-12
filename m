From: James Nelson <james4765@gmail.com>
Date: Tue, 12 Sep 2006 03:21:39 +0000
Subject: [KJ] [PATCH 7/7][RESEND] arm: add KERN_* constants to printk()'s in
Message-Id: <20060912032139.5999.65826.sendpatchset@david.homenet>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Diffstat:

 mach-at91rm9200/clock.c     |    2 +-
 mach-at91rm9200/pm.c        |    2 +-
 mach-footbridge/cats-pci.c  |    2 +-
 mach-h720x/common.c         |   19 ++++++++-----------
 mach-integrator/clock.c     |    2 +-
 mach-iop3xx/iop321-pci.c    |    6 +-----
 mach-iop3xx/iop331-pci.c    |    8 ++------
 mach-ixp23xx/pci.c          |    6 +-----
 mach-lh7a40x/clcd.c         |    8 ++++----
 mach-lh7a40x/ssp-cpld.c     |   19 +++++++------------
 mach-netx/generic.c         |    6 +-----
 mach-omap1/board-nokia770.c |    2 +-
 mach-omap1/id.c             |   22 ++++++++++------------
 mach-omap1/irq.c            |    2 +-
 mach-omap1/pm.c             |    6 +++---
 mach-omap1/serial.c         |    6 +++---
 mach-omap2/pm.c             |    6 +++---
 mach-omap2/serial.c         |   12 ++++++------
 mach-pnx4008/gpio.c         |    2 +-
 mach-pxa/idp.c              |    2 +-
 mach-realview/clock.c       |    2 +-
 mach-realview/hotplug.c     |    4 +---
 mach-realview/localtimer.c  |    2 +-
 mach-rpc/dma.c              |    2 +-
 mach-sa1100/assabet.c       |    4 ++--
 mach-sa1100/collie_pm.c     |   14 +++++++-------
 mach-sa1100/cpu-sa1110.c    |    2 +-
 mach-sa1100/h3600.c         |   18 +++++++++++-------
 mach-shark/irq.c            |    2 +-
 mach-versatile/clock.c      |    2 +-
 mach-versatile/pci.c        |   14 +++++++-------
 31 files changed, 91 insertions(+), 115 deletions(-)

Signed-off-by: James Nelson <james4765@gmail.com>

---
diff --git a/arch/arm/mach-at91rm9200/clock.c b/arch/arm/mach-at91rm9200/clock.c
index edc2cc8..20ccef4 100644
--- a/arch/arm/mach-at91rm9200/clock.c
+++ b/arch/arm/mach-at91rm9200/clock.c
@@ -717,7 +717,7 @@ int __init at91_clock_init(unsigned long
 	/* MCK and CPU clock are "always on" */
 	clk_enable(&mck);
 
-	printk("Clocks: CPU %u MHz, master %u MHz, main %u.%03u MHz\n",
+	pr_info("Clocks: CPU %u MHz, master %u MHz, main %u.%03u MHz\n",
 		freq / 1000000, (unsigned) mck.rate_hz / 1000000,
 		(unsigned) main_clock / 1000000,
 		((unsigned) main_clock % 1000000) / 1000);
diff --git a/arch/arm/mach-at91rm9200/pm.c b/arch/arm/mach-at91rm9200/pm.c
index 47e5480..c92d9ea 100644
--- a/arch/arm/mach-at91rm9200/pm.c
+++ b/arch/arm/mach-at91rm9200/pm.c
@@ -205,7 +205,7 @@ static struct pm_ops at91_pm_ops ={
 
 static int __init at91_pm_init(void)
 {
-	printk("AT91: Power Management\n");
+	pr_info("AT91: Power Management\n");
 
 #ifdef CONFIG_AT91_PM_SLOW_CLOCK
 	/* REVISIT allocations of SRAM should be dynamically managed.
diff --git a/arch/arm/mach-footbridge/cats-pci.c b/arch/arm/mach-footbridge/cats-pci.c
index 4f984fd..8e16b58 100644
--- a/arch/arm/mach-footbridge/cats-pci.c
+++ b/arch/arm/mach-footbridge/cats-pci.c
@@ -25,7 +25,7 @@ static int __init cats_map_irq(struct pc
 		return irqmap_cats[dev->irq - 1];
 
 	if (dev->irq != 0)
-		printk("PCI: device %02x:%02x has unknown irq line %x\n",
+		printk(KERN_ERR "PCI: device %02x:%02x has unknown irq line %x\n",
 		       dev->bus->number, dev->devfn, dev->irq);
 
 	return -1;
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
diff --git a/arch/arm/mach-integrator/clock.c b/arch/arm/mach-integrator/clock.c
index 95a1e26..5c42be8 100644
--- a/arch/arm/mach-integrator/clock.c
+++ b/arch/arm/mach-integrator/clock.c
@@ -83,7 +83,7 @@ int clk_set_rate(struct clk *clk, unsign
 		vco = icst525_khz_to_vco(clk->params, rate / 1000);
 		clk->rate = icst525_khz(clk->params, vco) * 1000;
 
-		printk("Clock %s: setting VCO reg params: S=%d R=%d V=%d\n",
+		pr_info("Clock %s: setting VCO reg params: S=%d R=%d V=%d\n",
 			clk->name, vco.s, vco.r, vco.v);
 
 		clk->setvco(clk, vco);
diff --git a/arch/arm/mach-iop3xx/iop321-pci.c b/arch/arm/mach-iop3xx/iop321-pci.c
index 8ba6a0e..0a70f4d 100644
--- a/arch/arm/mach-iop3xx/iop321-pci.c
+++ b/arch/arm/mach-iop3xx/iop321-pci.c
@@ -28,11 +28,7 @@ #include <asm/arch/iop321.h>
 
 // #define DEBUG
 
-#ifdef DEBUG
-#define  DBG(x...) printk(x)
-#else
-#define  DBG(x...) do { } while (0)
-#endif
+#define  DBG(x...) pr_debug(x)
 
 /*
  * This routine builds either a type0 or type1 configuration command.  If the
diff --git a/arch/arm/mach-iop3xx/iop331-pci.c b/arch/arm/mach-iop3xx/iop331-pci.c
index 44dd213..99ef936 100644
--- a/arch/arm/mach-iop3xx/iop331-pci.c
+++ b/arch/arm/mach-iop3xx/iop331-pci.c
@@ -29,14 +29,10 @@ #include <asm/arch/iop331.h>
 #undef DEBUG
 #undef DEBUG1
 
-#ifdef DEBUG
-#define  DBG(x...) printk(x)
-#else
-#define  DBG(x...) do { } while (0)
-#endif
+#define  DBG(x...) pr_debug(x)
 
 #ifdef DEBUG1
-#define  DBG1(x...) printk(x)
+#define  DBG1(x...) printk(KERN_DEBUG x)
 #else
 #define  DBG1(x...) do { } while (0)
 #endif
diff --git a/arch/arm/mach-ixp23xx/pci.c b/arch/arm/mach-ixp23xx/pci.c
index 3b34fa3..b5c3a41 100644
--- a/arch/arm/mach-ixp23xx/pci.c
+++ b/arch/arm/mach-ixp23xx/pci.c
@@ -38,11 +38,7 @@ extern int (*external_fault) (unsigned l
 
 static int pci_master_aborts = 0;
 
-#ifdef DEBUG
-#define DBG(x...)	printk(x)
-#else
-#define DBG(x...)
-#endif
+#define DBG(x...)	pr_debug(x)
 
 int clear_master_aborts(void);
 
diff --git a/arch/arm/mach-lh7a40x/clcd.c b/arch/arm/mach-lh7a40x/clcd.c
index 93751fe..4473d3c 100644
--- a/arch/arm/mach-lh7a40x/clcd.c
+++ b/arch/arm/mach-lh7a40x/clcd.c
@@ -148,10 +148,10 @@ #endif
 	fb->fb.screen_base
 		= dma_alloc_writecombine (&fb->dev->dev, len,
 					  &dma, GFP_KERNEL);
-	printk ("CLCD: LCD setup fb virt 0x%p phys 0x%p l %x io 0x%p \n",
+	pr_info("CLCD: LCD setup fb virt 0x%p phys 0x%p l %x io 0x%p \n",
 		fb->fb.screen_base, (void*) dma, len,
 		(void*) io_p2v (CLCDC_PHYS));
-	printk ("CLCD: pixclock %d\n", lcd_panel.mode.pixclock);
+	pr_info("CLCD: pixclock %d\n", lcd_panel.mode.pixclock);
 
 	if (!fb->fb.screen_base) {
 		printk(KERN_ERR "CLCD: unable to map framebuffer\n");
@@ -232,10 +232,10 @@ void __init lh7a40x_clcd_init (void)
 {
 	int i;
 	int result;
-	printk ("CLCD: registering amba devices\n");
+	pr_info("CLCD: registering amba devices\n");
 	for (i = 0; i < ARRAY_SIZE(amba_devs); i++) {
 		struct amba_device *d = amba_devs[i];
 		result = amba_device_register(d, &iomem_resource);
-		printk ("  %d -> %d\n", i ,result);
+		pr_info("  %d -> %d\n", i ,result);
 	}
 }
diff --git a/arch/arm/mach-lh7a40x/ssp-cpld.c b/arch/arm/mach-lh7a40x/ssp-cpld.c
index a108301..90f722c 100644
--- a/arch/arm/mach-lh7a40x/ssp-cpld.c
+++ b/arch/arm/mach-lh7a40x/ssp-cpld.c
@@ -50,13 +50,8 @@ #include <asm/hardware.h>
 
 #include <asm/arch/ssp.h>
 
-//#define TALK
-
-#if defined (TALK)
-#define PRINTK(f...)		printk (f)
-#else
-#define PRINTK(f...)		do {} while (0)
-#endif
+#undef DEBUG
+#define DPRINTK(fmt, args...)		pr_debug(fmt, ## args)
 
 #if defined (CONFIG_ARCH_LH7A400)
 # define CPLD_SPID		__REGP16(CPLD06_VIRT) /* SPI data */
@@ -167,14 +162,14 @@ #if defined (CONFIG_MACH_LPD7A400)
 	    || ssp_configuration.device = DEVICE_TOUCH) {
 		int select = 0;
 
-		PRINTK ("spi(%d %d.%d) 0x%04x",
+		DPRINTK ("spi(%d %d.%d) 0x%04x",
 			ssp_configuration.device, cwrite, cread,
 			v);
-#if defined (TALK)
+#if defined (DEBUG)
 		if (ssp_configuration.device = DEVICE_CODEC)
-			PRINTK (" 0x%03x -> %2d", v & 0x1ff, (v >> 9) & 0x7f);
+			DPRINTK (" 0x%03x -> %2d", v & 0x1ff, (v >> 9) & 0x7f);
 #endif
-		PRINTK ("\n");
+		DPRINTK ("\n");
 
 		if (ssp_configuration.device = DEVICE_CODEC)
 			select = CPLD_SPIC_CS_CODEC;
@@ -211,7 +206,7 @@ #endif
 	}
 #endif
 
-	PRINTK ("spi(%d) 0x%04x -> 0x%x\r\n", ssp_configuration.device,
+	DPRINTK ("spi(%d) 0x%04x -> 0x%x\r\n", ssp_configuration.device,
 		v & 0x1ff, (v >> 9) & 0x7f);
 
 	enable_cs ();
diff --git a/arch/arm/mach-netx/generic.c b/arch/arm/mach-netx/generic.c
index af0b135..4a020ea 100644
--- a/arch/arm/mach-netx/generic.c
+++ b/arch/arm/mach-netx/generic.c
@@ -62,11 +62,7 @@ static struct platform_device *devices[]
 	&netx_rtc_device,
 };
 
-#if 0
-#define DEBUG_IRQ(fmt...)	printk(fmt)
-#else
-#define DEBUG_IRQ(fmt...)	while (0) {}
-#endif
+#define DEBUG_IRQ(fmt, args...)	pr_debug("%s: " fmt, __FUNCTION__, ## args)
 
 static void
 netx_hif_demux_handler(unsigned int irq_unused, struct irqdesc *desc,
diff --git a/arch/arm/mach-omap1/board-nokia770.c b/arch/arm/mach-omap1/board-nokia770.c
index 02b980d..1367a5b 100644
--- a/arch/arm/mach-omap1/board-nokia770.c
+++ b/arch/arm/mach-omap1/board-nokia770.c
@@ -186,7 +186,7 @@ static void nokia770_audio_pwr_up(void)
 		omap_set_gpio_dataout(AMPLIFIER_CTRL_GPIO, 1);
 	else
 		/* HP connected, do not turn on amplifier */
-		printk("HP connected\n");
+		pr_info("HP connected\n");
 }
 
 static void codec_delayed_power_down(void *arg)
diff --git a/arch/arm/mach-omap1/id.c b/arch/arm/mach-omap1/id.c
index da13c3e..e2d7f9f 100644
--- a/arch/arm/mach-omap1/id.c
+++ b/arch/arm/mach-omap1/id.c
@@ -121,19 +121,17 @@ void __init omap_check_revision(void)
 	die_rev = omap_get_die_rev();
 	omap_id = omap_readl(OMAP32_ID_0);
 
-#ifdef DEBUG
-	printk("OMAP_DIE_ID_0: 0x%08x\n", omap_readl(OMAP_DIE_ID_0));
-	printk("OMAP_DIE_ID_1: 0x%08x DIE_REV: %i\n",
+	pr_debug("OMAP_DIE_ID_0: 0x%08x\n", omap_readl(OMAP_DIE_ID_0));
+	pr_debug("OMAP_DIE_ID_1: 0x%08x DIE_REV: %i\n",
 		omap_readl(OMAP_DIE_ID_1),
-	       (omap_readl(OMAP_DIE_ID_1) >> 17) & 0xf);
-	printk("OMAP_PRODUCTION_ID_0: 0x%08x\n", omap_readl(OMAP_PRODUCTION_ID_0));
-	printk("OMAP_PRODUCTION_ID_1: 0x%08x JTAG_ID: 0x%04x\n",
+		(omap_readl(OMAP_DIE_ID_1) >> 17) & 0xf);
+	pr_debug("OMAP_PRODUCTION_ID_0: 0x%08x\n", omap_readl(OMAP_PRODUCTION_ID_0));
+	pr_debug("OMAP_PRODUCTION_ID_1: 0x%08x JTAG_ID: 0x%04x\n",
 		omap_readl(OMAP_PRODUCTION_ID_1),
 		omap_readl(OMAP_PRODUCTION_ID_1) & 0xffff);
-	printk("OMAP32_ID_0: 0x%08x\n", omap_readl(OMAP32_ID_0));
-	printk("OMAP32_ID_1: 0x%08x\n", omap_readl(OMAP32_ID_1));
-	printk("JTAG_ID: 0x%04x DIE_REV: %i\n", jtag_id, die_rev);
-#endif
+	pr_debug("OMAP32_ID_0: 0x%08x\n", omap_readl(OMAP32_ID_0));
+	pr_debug("OMAP32_ID_1: 0x%08x\n", omap_readl(OMAP32_ID_1));
+	pr_debug("JTAG_ID: 0x%04x DIE_REV: %i\n", jtag_id, die_rev);
 
 	system_serial_high = omap_readl(OMAP_DIE_ID_0);
 	system_serial_low = omap_readl(OMAP_DIE_ID_1);
@@ -183,10 +181,10 @@ #endif
 		system_rev |= 0x24;
 		break;
 	default:
-		printk("Unknown OMAP cpu type: 0x%02x\n", cpu_type);
+		pr_info("Unknown OMAP cpu type: 0x%02x\n", cpu_type);
 	}
 
-	printk("OMAP%04x", system_rev >> 16);
+	pr_info("OMAP%04x", system_rev >> 16);
 	if ((system_rev >> 8) & 0xff)
 		printk("%x", (system_rev >> 8) & 0xff);
 	printk(" revision %i handled as %02xxx id: %08x%08x\n",
diff --git a/arch/arm/mach-omap1/irq.c b/arch/arm/mach-omap1/irq.c
index 3ea140b..79e65b1 100644
--- a/arch/arm/mach-omap1/irq.c
+++ b/arch/arm/mach-omap1/irq.c
@@ -202,7 +202,7 @@ #if defined(CONFIG_ARCH_OMAP16XX)
 		irq_bank_count = ARRAY_SIZE(omap1610_irq_banks);
 	}
 #endif
-	printk("Total of %i interrupts in %i interrupt banks\n",
+	pr_info("Total of %i interrupts in %i interrupt banks\n",
 	       irq_bank_count * 32, irq_bank_count);
 
 	/* Mask and clear all interrupts */
diff --git a/arch/arm/mach-omap1/pm.c b/arch/arm/mach-omap1/pm.c
index cd76185..1adbf4b 100644
--- a/arch/arm/mach-omap1/pm.c
+++ b/arch/arm/mach-omap1/pm.c
@@ -247,7 +247,7 @@ void omap_pm_suspend(void)
 {
 	unsigned long arg0 = 0, arg1 = 0;
 
-	printk("PM: OMAP%x is trying to enter deep sleep...\n", system_rev);
+	pr_info("PM: OMAP%x is trying to enter deep sleep...\n", system_rev);
 
 	omap_serial_wake_trigger(1);
 
@@ -445,7 +445,7 @@ void omap_pm_suspend(void)
 
 	omap_serial_wake_trigger(0);
 
-	printk("PM: OMAP%x is re-starting from deep sleep...\n", system_rev);
+	pr_info("PM: OMAP%x is re-starting from deep sleep...\n", system_rev);
 
 	if (machine_is_omap_osk()) {
 		/* Let LED1 (D9) blink again */
@@ -705,7 +705,7 @@ static struct pm_ops omap_pm_ops ={
 
 static int __init omap_pm_init(void)
 {
-	printk("Power Management for TI OMAP.\n");
+	pr_info("Power Management for TI OMAP\n");
 
 	/*
 	 * We copy the assembler sleep/wakeup routines to SRAM.
diff --git a/arch/arm/mach-omap1/serial.c b/arch/arm/mach-omap1/serial.c
index 976edfb..a4966df 100644
--- a/arch/arm/mach-omap1/serial.c
+++ b/arch/arm/mach-omap1/serial.c
@@ -144,7 +144,7 @@ void __init omap_serial_init(void)
 		case 0:
 			uart1_ck = clk_get(NULL, "uart1_ck");
 			if (IS_ERR(uart1_ck))
-				printk("Could not get uart1_ck\n");
+				pr_info("Could not get uart1_ck\n");
 			else {
 				clk_enable(uart1_ck);
 				if (cpu_is_omap1510())
@@ -164,7 +164,7 @@ void __init omap_serial_init(void)
 		case 1:
 			uart2_ck = clk_get(NULL, "uart2_ck");
 			if (IS_ERR(uart2_ck))
-				printk("Could not get uart2_ck\n");
+				pr_info("Could not get uart2_ck\n");
 			else {
 				clk_enable(uart2_ck);
 				if (cpu_is_omap1510())
@@ -186,7 +186,7 @@ void __init omap_serial_init(void)
 		case 2:
 			uart3_ck = clk_get(NULL, "uart3_ck");
 			if (IS_ERR(uart3_ck))
-				printk("Could not get uart3_ck\n");
+				pr_info("Could not get uart3_ck\n");
 			else {
 				clk_enable(uart3_ck);
 				if (cpu_is_omap1510())
diff --git a/arch/arm/mach-omap2/pm.c b/arch/arm/mach-omap2/pm.c
index d7eee99..1436e34 100644
--- a/arch/arm/mach-omap2/pm.c
+++ b/arch/arm/mach-omap2/pm.c
@@ -105,11 +105,11 @@ #define INT2_WAKE_MASK	(OMAP_IRQ_BIT(INT
 			OMAP_IRQ_BIT(INT_24XX_UART2_IRQ) |	\
 			OMAP_IRQ_BIT(INT_24XX_UART3_IRQ))
 
-#define preg(reg)	printk("%s\t(0x%p):\t0x%08x\n", #reg, &reg, reg);
+#define preg(reg)	pr_info("%s\t(0x%p):\t0x%08x\n", #reg, &reg, reg);
 
 static void omap2_pm_debug(char * desc)
 {
-	printk("%s:\n", desc);
+	pr_info("%s:\n", desc);
 
 	preg(CM_CLKSTCTRL_MPU);
 	preg(CM_CLKSTCTRL_CORE);
@@ -378,7 +378,7 @@ static struct pm_ops omap_pm_ops = {
 
 int __init omap2_pm_init(void)
 {
-	printk("Power Management for TI OMAP.\n");
+	pr_info("Power Management for TI OMAP.\n");
 
 	vclk = clk_get(NULL, "virt_prcm_set");
 	if (IS_ERR(vclk)) {
diff --git a/arch/arm/mach-omap2/serial.c b/arch/arm/mach-omap2/serial.c
index 0884bc7..b8e5cbc 100644
--- a/arch/arm/mach-omap2/serial.c
+++ b/arch/arm/mach-omap2/serial.c
@@ -117,14 +117,14 @@ void __init omap_serial_init()
 		case 0:
 			uart1_ick = clk_get(NULL, "uart1_ick");
 			if (IS_ERR(uart1_ick))
-				printk("Could not get uart1_ick\n");
+				pr_info("Could not get uart1_ick\n");
 			else {
 				clk_enable(uart1_ick);
 			}
 
 			uart1_fck = clk_get(NULL, "uart1_fck");
 			if (IS_ERR(uart1_fck))
-				printk("Could not get uart1_fck\n");
+				pr_info("Could not get uart1_fck\n");
 			else {
 				clk_enable(uart1_fck);
 			}
@@ -132,14 +132,14 @@ void __init omap_serial_init()
 		case 1:
 			uart2_ick = clk_get(NULL, "uart2_ick");
 			if (IS_ERR(uart2_ick))
-				printk("Could not get uart2_ick\n");
+				pr_info("Could not get uart2_ick\n");
 			else {
 				clk_enable(uart2_ick);
 			}
 
 			uart2_fck = clk_get(NULL, "uart2_fck");
 			if (IS_ERR(uart2_fck))
-				printk("Could not get uart2_fck\n");
+				pr_info("Could not get uart2_fck\n");
 			else {
 				clk_enable(uart2_fck);
 			}
@@ -147,14 +147,14 @@ void __init omap_serial_init()
 		case 2:
 			uart3_ick = clk_get(NULL, "uart3_ick");
 			if (IS_ERR(uart3_ick))
-				printk("Could not get uart3_ick\n");
+				pr_info("Could not get uart3_ick\n");
 			else {
 				clk_enable(uart3_ick);
 			}
 
 			uart3_fck = clk_get(NULL, "uart3_fck");
 			if (IS_ERR(uart3_fck))
-				printk("Could not get uart3_fck\n");
+				pr_info("Could not get uart3_fck\n");
 			else {
 				clk_enable(uart3_fck);
 			}
diff --git a/arch/arm/mach-pnx4008/gpio.c b/arch/arm/mach-pnx4008/gpio.c
index e1ce050..3081c7a 100644
--- a/arch/arm/mach-pnx4008/gpio.c
+++ b/arch/arm/mach-pnx4008/gpio.c
@@ -233,7 +233,7 @@ int pnx4008_gpio_write_pin(unsigned shor
 
 	gpio_lock();
 	if (GPIO_ISOUT(pin)) {
-		printk( "writing '%x' to '%x'\n",
+		pr_info( "writing '%x' to '%x'\n",
 				gpio, output ? PIO_OUTP_SET : PIO_OUTP_CLR );
 		ret = gpio_set_bit(output ? PIO_OUTP_SET : PIO_OUTP_CLR, gpio);
 	} else if (GPIO_ISRAM(pin)) {
diff --git a/arch/arm/mach-pxa/idp.c b/arch/arm/mach-pxa/idp.c
index 6914d22..57db4dc 100644
--- a/arch/arm/mach-pxa/idp.c
+++ b/arch/arm/mach-pxa/idp.c
@@ -136,7 +136,7 @@ static struct pxamci_platform_data idp_m
 
 static void __init idp_init(void)
 {
-	printk("idp_init()\n");
+	pr_info("idp_init()\n");
 
 	platform_device_register(&smc91x_device);
 	//platform_device_register(&mst_audio_device);
diff --git a/arch/arm/mach-realview/clock.c b/arch/arm/mach-realview/clock.c
index 21325a4..82f44b1 100644
--- a/arch/arm/mach-realview/clock.c
+++ b/arch/arm/mach-realview/clock.c
@@ -80,7 +80,7 @@ int clk_set_rate(struct clk *clk, unsign
 		vco = icst307_khz_to_vco(clk->params, rate / 1000);
 		clk->rate = icst307_khz(clk->params, vco) * 1000;
 
-		printk("Clock %s: setting VCO reg params: S=%d R=%d V=%d\n",
+		pr_info("Clock %s: setting VCO reg params: S=%d R=%d V=%d\n",
 			clk->name, vco.s, vco.r, vco.v);
 
 		clk->setvco(clk, vco);
diff --git a/arch/arm/mach-realview/hotplug.c b/arch/arm/mach-realview/hotplug.c
index 09748cb..e451a9e 100644
--- a/arch/arm/mach-realview/hotplug.c
+++ b/arch/arm/mach-realview/hotplug.c
@@ -84,9 +84,7 @@ static inline void platform_do_lowpower(
 		 * possible, since we are currently running incoherently, and
 		 * therefore cannot safely call printk() or anything else
 		 */
-#ifdef DEBUG
-		printk("CPU%u: spurious wakeup call\n", cpu);
-#endif
+		pr_debug("CPU%u: spurious wakeup call\n", cpu);
 	}
 }
 
diff --git a/arch/arm/mach-realview/localtimer.c b/arch/arm/mach-realview/localtimer.c
index caf6b8b..4921cd8 100644
--- a/arch/arm/mach-realview/localtimer.c
+++ b/arch/arm/mach-realview/localtimer.c
@@ -57,7 +57,7 @@ void __cpuinit local_timer_setup(unsigne
 	 * the timer ticks
 	 */
 	if (mpcore_timer_rate = 0) {
-		printk("Calibrating local timer... ");
+		pr_info("Calibrating local timer... ");
 
 		/* Wait for a tick to start */
 		waitjiffies = get_jiffies_64() + 1;
diff --git a/arch/arm/mach-rpc/dma.c b/arch/arm/mach-rpc/dma.c
index ac511d4..fdfab5a 100644
--- a/arch/arm/mach-rpc/dma.c
+++ b/arch/arm/mach-rpc/dma.c
@@ -260,7 +260,7 @@ static void floppy_enable_dma(dmach_t ch
 	regs.ARM_fp  = (unsigned long)FLOPPYDMA_BASE;
 
 	if (claim_fiq(&fh)) {
-		printk("floppydma: couldn't claim FIQ.\n");
+		pr_info("floppydma: couldn't claim FIQ\n");
 		return;
 	}
 
diff --git a/arch/arm/mach-sa1100/assabet.c b/arch/arm/mach-sa1100/assabet.c
index be06d66..ef093d3 100644
--- a/arch/arm/mach-sa1100/assabet.c
+++ b/arch/arm/mach-sa1100/assabet.c
@@ -244,7 +244,7 @@ static void __init assabet_init(void)
 		ASSABET_BCR = BCR_value = ASSABET_BCR_DB1111;
 
 #ifndef CONFIG_ASSABET_NEPONSET
-		printk( "Warning: Neponset detected but full support "
+		pr_info( "Warning: Neponset detected but full support "
 			"hasn't been configured in the kernel\n" );
 #endif
 	}
@@ -309,7 +309,7 @@ fixup_assabet(struct machine_desc *desc,
 	get_assabet_scr();
 
 	if (machine_has_neponset())
-		printk("Neponset expansion board detected\n");
+		pr_info("Neponset expansion board detected\n");
 }
 
 
diff --git a/arch/arm/mach-sa1100/collie_pm.c b/arch/arm/mach-sa1100/collie_pm.c
index 1e25b1d..b3d088d 100644
--- a/arch/arm/mach-sa1100/collie_pm.c
+++ b/arch/arm/mach-sa1100/collie_pm.c
@@ -49,13 +49,13 @@ static void collie_charger_init(void)
 	/* Register interrupt handler. */
 	if ((err = request_irq(COLLIE_IRQ_GPIO_AC_IN, sharpsl_ac_isr, IRQF_DISABLED,
 			       "ACIN", sharpsl_ac_isr))) {
-		printk("Could not get irq %d.\n", COLLIE_IRQ_GPIO_AC_IN);
+		printk(KERN_ERR "Could not get irq %d.\n", COLLIE_IRQ_GPIO_AC_IN);
 		return;
 	}
 	if ((err = request_irq(COLLIE_IRQ_GPIO_CO, sharpsl_chrg_full_isr, IRQF_DISABLED,
 			       "CO", sharpsl_chrg_full_isr))) {
 		free_irq(COLLIE_IRQ_GPIO_AC_IN, sharpsl_ac_isr);
-		printk("Could not get irq %d.\n", COLLIE_IRQ_GPIO_CO);
+		printk(KERN_ERR "Could not get irq %d.\n", COLLIE_IRQ_GPIO_CO);
 		return;
 	}
 
@@ -125,7 +125,7 @@ int collie_read_backup_battery(void)
 	ucb1x00_io_write(ucb, 0, COLLIE_TC35143_GPIO_BBAT_ON);
 	ucb1x00_adc_disable(ucb);
 
-	printk("Backup battery = %d(%d)\n", ADCtoPower(voltage), voltage);
+	pr_info("Backup battery = %d(%d)\n", ADCtoPower(voltage), voltage);
 
 	return ADCtoPower(voltage);
 }
@@ -147,7 +147,7 @@ int collie_read_main_battery(void)
 	voltage_rev = voltage + ((ad_revise * voltage) / 652);
 	voltage_volts = ADCtoPower(voltage_rev);
 
-	printk("Main battery = %d(%d)\n", voltage_volts, voltage);
+	pr_info("Main battery = %d(%d)\n", voltage_volts, voltage);
 
 	if (voltage != -1)
 		return voltage_volts;
@@ -170,7 +170,7 @@ int collie_read_temp(void)
 	ucb1x00_io_write(ucb, 0, COLLIE_TC35143_GPIO_TMP_ON);
 	ucb1x00_adc_disable(ucb);
 
-	printk("Battery temp = %d\n", voltage);
+	pr_info("Battery temp = %d\n", voltage);
 	return voltage;
 }
 
@@ -185,12 +185,12 @@ static unsigned long read_devdata(int wh
 		return 500;
 	case SHARPSL_STATUS_ACIN: {
 		int ret = GPLR & COLLIE_GPIO_AC_IN;
-		printk("AC status = %d\n", ret);
+		pr_info("AC status = %d\n", ret);
 		return ret;
 	}
 	case SHARPSL_STATUS_FATAL: {
 		int ret = GPLR & COLLIE_GPIO_MAIN_BAT_LOW;
-		printk("Fatal bat = %d\n", ret);
+		pr_info("Fatal bat = %d\n", ret);
 		return ret;
 	}
 	default:
diff --git a/arch/arm/mach-sa1100/cpu-sa1110.c b/arch/arm/mach-sa1100/cpu-sa1110.c
index 6395977..bb7b62b 100644
--- a/arch/arm/mach-sa1100/cpu-sa1110.c
+++ b/arch/arm/mach-sa1100/cpu-sa1110.c
@@ -206,7 +206,7 @@ sdram_update_refresh(u_int cpu_khz, stru
 
 #ifdef DEBUG
 	mdelay(250);
-	printk("new dri value = %d\n", dri);
+	pr_debug("new dri value = %d\n", dri);
 #endif
 
 	sdram_set_refresh(dri);
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
diff --git a/arch/arm/mach-shark/irq.c b/arch/arm/mach-shark/irq.c
index b227052..f925e06 100644
--- a/arch/arm/mach-shark/irq.c
+++ b/arch/arm/mach-shark/irq.c
@@ -63,7 +63,7 @@ static void shark_ack_8259A_irq(unsigned
 
 static irqreturn_t bogus_int(int irq, void *dev_id, struct pt_regs *regs)
 {
-	printk("Got interrupt %i!\n",irq);
+	printk(KERN_WARNING "bogus interrupt %i!\n",irq);
 	return IRQ_NONE;
 }
 
diff --git a/arch/arm/mach-versatile/clock.c b/arch/arm/mach-versatile/clock.c
index 9858c96..49c7695 100644
--- a/arch/arm/mach-versatile/clock.c
+++ b/arch/arm/mach-versatile/clock.c
@@ -81,7 +81,7 @@ int clk_set_rate(struct clk *clk, unsign
 		vco = icst307_khz_to_vco(clk->params, rate / 1000);
 		clk->rate = icst307_khz(clk->params, vco) * 1000;
 
-		printk("Clock %s: setting VCO reg params: S=%d R=%d V=%d\n",
+		pr_info("Clock %s: setting VCO reg params: S=%d R=%d V=%d\n",
 			clk->name, vco.s, vco.r, vco.v);
 
 		clk->setvco(clk, vco);
diff --git a/arch/arm/mach-versatile/pci.c b/arch/arm/mach-versatile/pci.c
index 41b3700..67be698 100644
--- a/arch/arm/mach-versatile/pci.c
+++ b/arch/arm/mach-versatile/pci.c
@@ -65,7 +65,7 @@ static int __init versatile_pci_slot_ign
 
 	while ((retval = get_option(&str,&slot))) {
 		if ((slot < 0) || (slot > 31)) {
-			printk("Illegal slot value: %d\n",slot);
+			printk(KERN_ERR "Illegal slot value: %d\n",slot);
 		} else {
 			pci_slot_ignore |= (1 << slot);
 		}
@@ -243,7 +243,7 @@ int __init pci_versatile_setup(int nr, s
 
 	val = __raw_readl(SYS_PCICTL);
 	if (!(val & 1)) {
-		printk("Not plugged into PCI backplane!\n");
+		printk(KERN_ERR "Not plugged into PCI backplane!\n");
 		ret = -EIO;
 		goto out;
 	}
@@ -252,11 +252,11 @@ int __init pci_versatile_setup(int nr, s
 		sys->mem_offset = 0;
 		ret = pci_versatile_setup_resources(sys->resource);
 		if (ret < 0) {
-			printk("pci_versatile_setup: resources... oops?\n");
+			printk(KERN_ERR "pci_versatile_setup: resources... oops?\n");
 			goto out;
 		}
 	} else {
-		printk("pci_versatile_setup: resources... nr = 0??\n");
+		printk(KERN_ERR "pci_versatile_setup: resources... nr = 0??\n");
 		goto out;
 	}
 
@@ -272,12 +272,12 @@ int __init pci_versatile_setup(int nr, s
 		}
 
 	if (myslot = -1) {
-		printk("Cannot find PCI core!\n");
+		printk(KERN_ERR "Cannot find PCI core!\n");
 		ret = -EIO;
 		goto out;
 	}
 
-	printk("PCI core found (slot %d)\n",myslot);
+	pr_info("PCI core found (slot %d)\n",myslot);
 
 	__raw_writel(myslot, PCI_SELFID);
 	local_pci_cfg_base = (void *) VERSATILE_PCI_CFG_VIRT_BASE + (myslot << 11);
@@ -338,7 +338,7 @@ static int __init versatile_map_irq(stru
 	 */
 	irq = 27 + ((slot + pin - 1) & 3);
 
-	printk("PCI map irq: slot %d, pin %d, devslot %d, irq: %d\n",slot,pin,devslot,irq);
+	pr_info("PCI map irq: slot %d, pin %d, devslot %d, irq: %d\n",slot,pin,devslot,irq);
 
 	return irq;
 }
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
