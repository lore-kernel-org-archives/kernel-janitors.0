From: James Nelson <james4765@gmail.com>
Date: Tue, 12 Sep 2006 03:21:03 +0000
Subject: [KJ] [PATCH 3/7][RESEND] arm: add KERN_* constants to printk()'s in
Message-Id: <20060912032103.5999.30565.sendpatchset@david.homenet>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Diffstat:

 cpu.c           |    2 +-
 dma.c           |   18 +++++++++---------
 irq.c           |    6 +++---
 pm.c            |    2 +-
 s3c2410-clock.c |    2 +-
 s3c2410.c       |    4 ++--
 s3c2412-clock.c |    2 +-
 s3c2412.c       |    4 ++--
 s3c2440-clock.c |    2 +-
 s3c2440-irq.c   |    2 +-
 s3c2440.c       |    2 +-
 s3c2442-clock.c |    2 +-
 s3c2442.c       |    2 +-
 s3c244x.c       |    2 +-
 time.c          |    2 +-
 usb-simtec.c    |    2 +-
 16 files changed, 28 insertions(+), 28 deletions(-)

Signed-off-by: James Nelson <james4765@gmail.com>

---
diff --git a/arch/arm/mach-s3c2410/cpu.c b/arch/arm/mach-s3c2410/cpu.c
index 1c3c6ad..a236fa3 100644
--- a/arch/arm/mach-s3c2410/cpu.c
+++ b/arch/arm/mach-s3c2410/cpu.c
@@ -220,7 +220,7 @@ void __init s3c24xx_init_io(struct map_d
 		panic("Unknown S3C24XX CPU");
 	}
 
-	printk("CPU %s (id 0x%08lx)\n", cpu->name, idcode);
+	pr_info("CPU %s (id 0x%08lx)\n", cpu->name, idcode);
 
 	if (cpu->map_io = NULL || cpu->init = NULL) {
 		printk(KERN_ERR "CPU %s support not enabled\n", cpu->name);
diff --git a/arch/arm/mach-s3c2410/dma.c b/arch/arm/mach-s3c2410/dma.c
index cc92a7b..fa4d41c 100644
--- a/arch/arm/mach-s3c2410/dma.c
+++ b/arch/arm/mach-s3c2410/dma.c
@@ -66,7 +66,7 @@ struct s3c2410_dma_chan s3c2410_chans[S3
 
 #define BUF_MAGIC (0xcafebabe)
 
-#define dmawarn(fmt...) printk(KERN_DEBUG fmt)
+#define DMAWARN(fmt...) printk(KERN_DEBUG fmt)
 
 #define dma_regaddr(chan, reg) ((chan)->regs + (reg))
 
@@ -239,18 +239,18 @@ s3c2410_dma_loadbuffer(struct s3c2410_dm
 		 buf, (unsigned long)buf->data, buf->size);
 
 	if (buf = NULL) {
-		dmawarn("buffer is NULL\n");
+		DMAWARN("buffer is NULL\n");
 		return -EINVAL;
 	}
 
 	/* check the state of the channel before we do anything */
 
 	if (chan->load_state = S3C2410_DMALOAD_1LOADED) {
-		dmawarn("load_state is S3C2410_DMALOAD_1LOADED\n");
+		DMAWARN("load_state is S3C2410_DMALOAD_1LOADED\n");
 	}
 
 	if (chan->load_state = S3C2410_DMALOAD_1LOADED_1RUNNING) {
-		dmawarn("state is S3C2410_DMALOAD_1LOADED_1RUNNING\n");
+		DMAWARN("state is S3C2410_DMALOAD_1LOADED_1RUNNING\n");
 	}
 
 	/* it would seem sensible if we are the last buffer to not bother
@@ -267,7 +267,7 @@ s3c2410_dma_loadbuffer(struct s3c2410_dm
 	}
 
 	if ((buf->data & 0xf0000000) != 0x30000000) {
-		dmawarn("dmaload: buffer is %p\n", (void *)buf->data);
+		DMAWARN("dmaload: buffer is %p\n", (void *)buf->data);
 	}
 
 	writel(buf->data, chan->addr_reg);
@@ -289,7 +289,7 @@ s3c2410_dma_loadbuffer(struct s3c2410_dm
 		break;
 
 	default:
-		dmawarn("dmaload: unknown state %d in loadbuffer\n",
+		DMAWARN("dmaload: unknown state %d in loadbuffer\n",
 			chan->load_state);
 		break;
 	}
@@ -549,7 +549,7 @@ s3c2410_dma_freebuf(struct s3c2410_dma_b
 	if (magicok) {
 		kmem_cache_free(dma_kmem, buf);
 	} else {
-		printk("s3c2410_dma_freebuf: buff %p with bad magic\n", buf);
+		pr_info("s3c2410_dma_freebuf: buff %p with bad magic\n", buf);
 	}
 }
 
@@ -1274,7 +1274,7 @@ static int __init s3c2410_init_dma(void)
 	int channel;
 	int ret;
 
-	printk("S3C2410 DMA Driver, (c) 2003-2004 Simtec Electronics\n");
+	pr_info("S3C2410 DMA Driver, (c) 2003-2004 Simtec Electronics\n");
 
 	dma_base = ioremap(S3C24XX_PA_DMA, 0x200);
 	if (dma_base = NULL) {
@@ -1322,7 +1322,7 @@ static int __init s3c2410_init_dma(void)
 		cp->dev.id  = channel;
 		ret = sysdev_register(&cp->dev);
 
-		printk("DMA channel %d at %p, irq %d\n",
+		pr_info("DMA channel %d at %p, irq %d\n",
 		       cp->number, cp->regs, cp->irq);
 	}
 
diff --git a/arch/arm/mach-s3c2410/irq.c b/arch/arm/mach-s3c2410/irq.c
index 6822dc7..771c2d6 100644
--- a/arch/arm/mach-s3c2410/irq.c
+++ b/arch/arm/mach-s3c2410/irq.c
@@ -610,7 +610,7 @@ void __init s3c24xx_init_irq(void)
 			break;
 
 		__raw_writel(pend, S3C24XX_EINTPEND);
-		printk("irq: clearing pending ext status %08x\n", (int)pend);
+		pr_info("irq: clearing pending ext status %08x\n", (int)pend);
 		last = pend;
 	}
 
@@ -623,7 +623,7 @@ void __init s3c24xx_init_irq(void)
 
 		__raw_writel(pend, S3C2410_SRCPND);
 		__raw_writel(pend, S3C2410_INTPND);
-		printk("irq: clearing pending status %08x\n", (int)pend);
+		pr_info("irq: clearing pending status %08x\n", (int)pend);
 		last = pend;
 	}
 
@@ -634,7 +634,7 @@ void __init s3c24xx_init_irq(void)
 		if (pend = 0 || pend = last)
 			break;
 
-		printk("irq: clearing subpending status %08x\n", (int)pend);
+		pr_info("irq: clearing subpending status %08x\n", (int)pend);
 		__raw_writel(pend, S3C2410_SUBSRCPND);
 		last = pend;
 	}
diff --git a/arch/arm/mach-s3c2410/pm.c b/arch/arm/mach-s3c2410/pm.c
index a589fe7..f227c71 100644
--- a/arch/arm/mach-s3c2410/pm.c
+++ b/arch/arm/mach-s3c2410/pm.c
@@ -670,7 +670,7 @@ static struct pm_ops s3c2410_pm_ops = {
 
 int __init s3c2410_pm_init(void)
 {
-	printk("S3C2410 Power Management, (c) 2004 Simtec Electronics\n");
+	pr_info("S3C2410 Power Management, (c) 2004 Simtec Electronics\n");
 
 	pm_set_ops(&s3c2410_pm_ops);
 	return 0;
diff --git a/arch/arm/mach-s3c2410/s3c2410-clock.c b/arch/arm/mach-s3c2410/s3c2410-clock.c
index 9971866..69a5271 100644
--- a/arch/arm/mach-s3c2410/s3c2410-clock.c
+++ b/arch/arm/mach-s3c2410/s3c2410-clock.c
@@ -260,7 +260,7 @@ int __init s3c2410_baseclk_add(void)
 
 	xtal = clk_get(NULL, "xtal");
 
-	printk("CLOCK: Slow mode (%ld.%ld MHz), %s, MPLL %s, UPLL %s\n",
+	pr_info("CLOCK: Slow mode (%ld.%ld MHz), %s, MPLL %s, UPLL %s\n",
 	       print_mhz(clk_get_rate(xtal) /
 			 ( 2 * S3C2410_CLKSLOW_GET_SLOWVAL(clkslow))),
 	       (clkslow & S3C2410_CLKSLOW_SLOW) ? "slow" : "fast",
diff --git a/arch/arm/mach-s3c2410/s3c2410.c b/arch/arm/mach-s3c2410/s3c2410.c
index a110cff..6b51214 100644
--- a/arch/arm/mach-s3c2410/s3c2410.c
+++ b/arch/arm/mach-s3c2410/s3c2410.c
@@ -101,7 +101,7 @@ void __init s3c2410_init_clocks(int xtal
 
 	/* print brieft summary of clocks, etc */
 
-	printk("S3C2410: core %ld.%03ld MHz, memory %ld.%03ld MHz, peripheral %ld.%03ld MHz\n",
+	pr_info("S3C2410: core %ld.%03ld MHz, memory %ld.%03ld MHz, peripheral %ld.%03ld MHz\n",
 	       print_mhz(fclk), print_mhz(hclk), print_mhz(pclk));
 
 	/* initialise the clocks here, to allow other things like the
@@ -135,7 +135,7 @@ core_initcall(s3c2410_core_init);
 
 int __init s3c2410_init(void)
 {
-	printk("S3C2410: Initialising architecture\n");
+	pr_info("S3C2410: Initialising architecture\n");
 
 	return sysdev_register(&s3c2410_sysdev);
 }
diff --git a/arch/arm/mach-s3c2410/s3c2412-clock.c b/arch/arm/mach-s3c2410/s3c2412-clock.c
index c95ed3e..bd72824 100644
--- a/arch/arm/mach-s3c2410/s3c2412-clock.c
+++ b/arch/arm/mach-s3c2410/s3c2412-clock.c
@@ -663,7 +663,7 @@ int __init s3c2412_baseclk_add(void)
 		clk_set_rate(&clk_usbsrc, 48*1000*1000);
 	}
 
-	printk("S3C2412: upll %s, %ld.%03ld MHz, usb-bus %ld.%03ld MHz\n",
+	pr_info("S3C2412: upll %s, %ld.%03ld MHz, usb-bus %ld.%03ld MHz\n",
 	       (__raw_readl(S3C2410_UPLLCON) & S3C2412_PLLCON_OFF) ? "off":"on",
 	       print_mhz(clk_get_rate(&clk_upll)),
 	       print_mhz(clk_get_rate(&clk_usb_bus)));
diff --git a/arch/arm/mach-s3c2410/s3c2412.c b/arch/arm/mach-s3c2410/s3c2412.c
index e24ffd5..593ebcd 100644
--- a/arch/arm/mach-s3c2410/s3c2412.c
+++ b/arch/arm/mach-s3c2410/s3c2412.c
@@ -115,7 +115,7 @@ void __init s3c2412_init_clocks(int xtal
 
 	/* print brieft summary of clocks, etc */
 
-	printk("S3C2412: core %ld.%03ld MHz, memory %ld.%03ld MHz, peripheral %ld.%03ld MHz\n",
+	pr_info("S3C2412: core %ld.%03ld MHz, memory %ld.%03ld MHz, peripheral %ld.%03ld MHz\n",
 	       print_mhz(fclk), print_mhz(hclk), print_mhz(pclk));
 
 	/* initialise the clocks here, to allow other things like the
@@ -189,7 +189,7 @@ static struct sys_device s3c2412_sysdev 
 
 int __init s3c2412_init(void)
 {
-	printk("S3C2412: Initialising architecture\n");
+	pr_info("S3C2412: Initialising architecture\n");
 
 	return sysdev_register(&s3c2412_sysdev);
 }
diff --git a/arch/arm/mach-s3c2410/s3c2440-clock.c b/arch/arm/mach-s3c2410/s3c2440-clock.c
index 1579686..6c66916 100644
--- a/arch/arm/mach-s3c2410/s3c2440-clock.c
+++ b/arch/arm/mach-s3c2410/s3c2440-clock.c
@@ -117,7 +117,7 @@ static int s3c2440_clk_add(struct sys_de
 	struct clk *clk_p;
 	struct clk *clk_upll;
 
-	printk("S3C2440: Clock Support, DVS %s\n",
+	pr_info("S3C2440: Clock Support, DVS %s\n",
 	       (camdivn & S3C2440_CAMDIVN_DVSEN) ? "on" : "off");
 
 	clk_p = clk_get(NULL, "pclk");
diff --git a/arch/arm/mach-s3c2410/s3c2440-irq.c b/arch/arm/mach-s3c2410/s3c2440-irq.c
index acfe387..b5a4570 100644
--- a/arch/arm/mach-s3c2410/s3c2440-irq.c
+++ b/arch/arm/mach-s3c2410/s3c2440-irq.c
@@ -104,7 +104,7 @@ static int s3c2440_irq_add(struct sys_de
 {
 	unsigned int irqno;
 
-	printk("S3C2440: IRQ Support\n");
+	pr_info("S3C2440: IRQ Support\n");
 
 	/* add new chained handler for wdt, ac7 */
 
diff --git a/arch/arm/mach-s3c2410/s3c2440.c b/arch/arm/mach-s3c2410/s3c2440.c
index 0ab50f4..039b99c 100644
--- a/arch/arm/mach-s3c2410/s3c2440.c
+++ b/arch/arm/mach-s3c2410/s3c2440.c
@@ -46,7 +46,7 @@ static struct sys_device s3c2440_sysdev 
 
 int __init s3c2440_init(void)
 {
-	printk("S3C2440: Initialising architecture\n");
+	pr_info("S3C2440: Initialising architecture\n");
 
 	/* change irq for watchdog */
 
diff --git a/arch/arm/mach-s3c2410/s3c2442-clock.c b/arch/arm/mach-s3c2410/s3c2442-clock.c
index d9f54b5..73c78ba 100644
--- a/arch/arm/mach-s3c2410/s3c2442-clock.c
+++ b/arch/arm/mach-s3c2410/s3c2442-clock.c
@@ -121,7 +121,7 @@ static int s3c2442_clk_add(struct sys_de
 	struct clk *clk_p;
 	struct clk *clk_upll;
 
-	printk("S3C2442: Clock Support, DVS %s\n",
+	pr_info("S3C2442: Clock Support, DVS %s\n",
 	       (camdivn & S3C2440_CAMDIVN_DVSEN) ? "on" : "off");
 
 	clk_p = clk_get(NULL, "pclk");
diff --git a/arch/arm/mach-s3c2410/s3c2442.c b/arch/arm/mach-s3c2410/s3c2442.c
index debae24..fcfc642 100644
--- a/arch/arm/mach-s3c2410/s3c2442.c
+++ b/arch/arm/mach-s3c2410/s3c2442.c
@@ -46,7 +46,7 @@ static struct sys_device s3c2442_sysdev 
 
 int __init s3c2442_init(void)
 {
-	printk("S3C2442: Initialising architecture\n");
+	pr_info("S3C2442: Initialising architecture\n");
 
 	return sysdev_register(&s3c2442_sysdev);
 }
diff --git a/arch/arm/mach-s3c2410/s3c244x.c b/arch/arm/mach-s3c2410/s3c244x.c
index 9a22582..cce778f 100644
--- a/arch/arm/mach-s3c2410/s3c244x.c
+++ b/arch/arm/mach-s3c2410/s3c244x.c
@@ -112,7 +112,7 @@ void __init s3c244x_init_clocks(int xtal
 
 	/* print brief summary of clocks, etc */
 
-	printk("S3C244X: core %ld.%03ld MHz, memory %ld.%03ld MHz, peripheral %ld.%03ld MHz\n",
+	pr_info("S3C244X: core %ld.%03ld MHz, memory %ld.%03ld MHz, peripheral %ld.%03ld MHz\n",
 	       print_mhz(fclk), print_mhz(hclk), print_mhz(pclk));
 
 	/* initialise the clocks here, to allow other things like the
diff --git a/arch/arm/mach-s3c2410/time.c b/arch/arm/mach-s3c2410/time.c
index 00d1cfc..0283209 100644
--- a/arch/arm/mach-s3c2410/time.c
+++ b/arch/arm/mach-s3c2410/time.c
@@ -218,7 +218,7 @@ static void s3c2410_timer_setup (void)
 
 	tcnt--;
 
-	printk("timer tcon=%08lx, tcnt %04lx, tcfg %08lx,%08lx, usec %08lx\n",
+	pr_info("timer tcon=%08lx, tcnt %04lx, tcfg %08lx,%08lx, usec %08lx\n",
 	       tcon, tcnt, tcfg0, tcfg1, timer_usec_ticks);
 
 	/* check to see if timer is within 16bit range... */
diff --git a/arch/arm/mach-s3c2410/usb-simtec.c b/arch/arm/mach-s3c2410/usb-simtec.c
index 6b22d8f..302e683 100644
--- a/arch/arm/mach-s3c2410/usb-simtec.c
+++ b/arch/arm/mach-s3c2410/usb-simtec.c
@@ -111,7 +111,7 @@ static struct s3c2410_hcd_info usb_simte
 
 int usb_simtec_init(void)
 {
-	printk("USB Power Control, (c) 2004 Simtec Electronics\n");
+	pr_info("USB Power Control, (c) 2004 Simtec Electronics\n");
 	s3c_device_usb.dev.platform_data = &usb_simtec_info;
 
 	s3c2410_gpio_cfgpin(S3C2410_GPB4, S3C2410_GPB4_OUTP);
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
