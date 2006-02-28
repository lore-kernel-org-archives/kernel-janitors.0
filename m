From: Tim Cooijmans <tim@aapopfiets.nl>
Date: Tue, 28 Feb 2006 06:18:58 +0000
Subject: [KJ] [PATCH] check request_region() return value in arch/ppc and
Message-Id: <200602280718.58358.tim@aapopfiets.nl>
List-Id: <kernel-janitors.vger.kernel.org>
References: <200602272229.51950.tim@aapopfiets.nl>
In-Reply-To: <200602272229.51950.tim@aapopfiets.nl>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

From: Tim Cooijmans <tim@aapopfiets.nl>

Check request_region() return value and warn on failure.  Note that releasing 
succeeded requests doesn't make much sense, as the calling code doesn't know 
if anything failed.  This is not the case in lopec.c, prep_setup.c and 
sandpoint.c.

The powerpc code has been compile tested.  The ppc code has not been tested, 
but the changes are very similar.

Signed-off-by: Tim Cooijmans <tim@aapopfiets.nl>
---
Note: this patch is quite different from the previous one, it also handles 
request_region() in lopec.c, prep_setup.c and sandpoint.c.  There's only one 
unchecked request_region() left in arch/p{ower,}pc now, in 
arch/ppc/platforms/hdpu.c:hdpu_ide_request_region().  That function is not 
used, so I don't know if the return type can be changed.

diff -uprN linux-2.6.16-rc5-orig/arch/powerpc/platforms/chrp/setup.c 
linux-2.6.16-rc5/arch/powerpc/platforms/chrp/setup.c
--- linux-2.6.16-rc5-orig/arch/powerpc/platforms/chrp/setup.c	2006-02-27 
20:36:36.000000000 +0100
+++ linux-2.6.16-rc5/arch/powerpc/platforms/chrp/setup.c	2006-02-28 
07:03:41.000000000 +0100
@@ -465,18 +465,25 @@ void __init chrp_init_IRQ(void)
 }
 
 void __init
+chrp_request_region(unsigned long start, unsigned long n, char *desc)
+{
+	if (!request_region(start, n, desc))
+		printk(KERN_WARNING "chrp: unable to allocate %s region.\n", desc);
+}
+
+void __init
 chrp_init2(void)
 {
 #ifdef CONFIG_NVRAM
 	chrp_nvram_init();
 #endif
 
-	request_region(0x20,0x20,"pic1");
-	request_region(0xa0,0x20,"pic2");
-	request_region(0x00,0x20,"dma1");
-	request_region(0x40,0x20,"timer");
-	request_region(0x80,0x10,"dma page reg");
-	request_region(0xc0,0x20,"dma2");
+	chrp_request_region(0x20,0x20,"pic1");
+	chrp_request_region(0xa0,0x20,"pic2");
+	chrp_request_region(0x00,0x20,"dma1");
+	chrp_request_region(0x40,0x20,"timer");
+	chrp_request_region(0x80,0x10,"dma page reg");
+	chrp_request_region(0xc0,0x20,"dma2");
 
 	if (ppc_md.progress)
 		ppc_md.progress("  Have fun!    ", 0x7777);
diff -uprN linux-2.6.16-rc5-orig/arch/powerpc/platforms/pseries/pci.c 
linux-2.6.16-rc5/arch/powerpc/platforms/pseries/pci.c
--- linux-2.6.16-rc5-orig/arch/powerpc/platforms/pseries/pci.c	2006-02-27 
20:36:36.000000000 +0100
+++ linux-2.6.16-rc5/arch/powerpc/platforms/pseries/pci.c	2006-02-28 
06:29:47.000000000 +0100
@@ -92,17 +92,24 @@ void __devinit pSeries_irq_bus_setup(str
 	}
 }
 
+void __init
+pSeries_request_region(unsigned long start, unsigned long n, char *desc)
+{
+	if (!request_region(start, n, desc))
+		printk(KERN_WARNING "pSeries: unable to allocate %s region.\n", desc);
+}
+
 static void __init pSeries_request_regions(void)
 {
 	if (!isa_io_base)
 		return;
 
-	request_region(0x20,0x20,"pic1");
-	request_region(0xa0,0x20,"pic2");
-	request_region(0x00,0x20,"dma1");
-	request_region(0x40,0x20,"timer");
-	request_region(0x80,0x10,"dma page reg");
-	request_region(0xc0,0x20,"dma2");
+	pSeries_request_region(0x20,0x20,"pic1");
+	pSeries_request_region(0xa0,0x20,"pic2");
+	pSeries_request_region(0x00,0x20,"dma1");
+	pSeries_request_region(0x40,0x20,"timer");
+	pSeries_request_region(0x80,0x10,"dma page reg");
+	pSeries_request_region(0xc0,0x20,"dma2");
 }
 
 void __init pSeries_final_fixup(void)
diff -uprN linux-2.6.16-rc5-orig/arch/ppc/platforms/chrp_setup.c 
linux-2.6.16-rc5/arch/ppc/platforms/chrp_setup.c
--- linux-2.6.16-rc5-orig/arch/ppc/platforms/chrp_setup.c	2006-02-27 
20:36:36.000000000 +0100
+++ linux-2.6.16-rc5/arch/ppc/platforms/chrp_setup.c	2006-02-28 
07:03:56.000000000 +0100
@@ -450,18 +450,25 @@ void __init chrp_init_IRQ(void)
 }
 
 void __init
+chrp_request_region(unsigned long start, unsigned long n, char *desc)
+{
+	if (!request_region(start, n, desc))
+		printk(KERN_WARNING "chrp: unable to allocate %s region.\n", desc);
+}
+
+void __init
 chrp_init2(void)
 {
 #ifdef CONFIG_NVRAM
 	chrp_nvram_init();
 #endif
 
-	request_region(0x20,0x20,"pic1");
-	request_region(0xa0,0x20,"pic2");
-	request_region(0x00,0x20,"dma1");
-	request_region(0x40,0x20,"timer");
-	request_region(0x80,0x10,"dma page reg");
-	request_region(0xc0,0x20,"dma2");
+	chrp_request_region(0x20,0x20,"pic1");
+	chrp_request_region(0xa0,0x20,"pic2");
+	chrp_request_region(0x00,0x20,"dma1");
+	chrp_request_region(0x40,0x20,"timer");
+	chrp_request_region(0x80,0x10,"dma page reg");
+	chrp_request_region(0xc0,0x20,"dma2");
 
 	if (ppc_md.progress)
 		ppc_md.progress("  Have fun!    ", 0x7777);
diff -uprN linux-2.6.16-rc5-orig/arch/ppc/platforms/lopec.c 
linux-2.6.16-rc5/arch/ppc/platforms/lopec.c
--- linux-2.6.16-rc5-orig/arch/ppc/platforms/lopec.c	2006-02-27 
20:36:36.000000000 +0100
+++ linux-2.6.16-rc5/arch/ppc/platforms/lopec.c	2006-02-28 06:47:09.000000000 
+0100
@@ -274,18 +274,33 @@ lopec_init_IRQ(void)
 	i8259_init(0xfef00000, 0);
 }
 
+struct resource * __init
+lopec_request_region(unsigned long start, unsigned long n, char *desc)
+{
+	struct resource *res = request_region(start, n, desc);
+	if (!res)
+		printk(KERN_WARNING "lopec: unable to allocate %s region.\n", desc);
+	return res;
+}
+
 static int __init
 lopec_request_io(void)
 {
 	outb(0x00, 0x4d0);
 	outb(0xc0, 0x4d1);
 
-	request_region(0x00, 0x20, "dma1");
-	request_region(0x20, 0x20, "pic1");
-	request_region(0x40, 0x20, "timer");
-	request_region(0x80, 0x10, "dma page reg");
-	request_region(0xa0, 0x20, "pic2");
-	request_region(0xc0, 0x20, "dma2");
+	if (!lopec_request_region(0x00, 0x20, "dma1"))
+		return -EBUSY;
+	if (!lopec_request_region(0x20, 0x20, "pic1"))
+		return -EBUSY;
+	if (!lopec_request_region(0x40, 0x20, "timer"))
+		return -EBUSY;
+	if (!lopec_request_region(0x80, 0x10, "dma page reg"))
+		return -EBUSY;
+	if (!lopec_request_region(0xa0, 0x20, "pic2"))
+		return -EBUSY;
+	if (!lopec_request_region(0xc0, 0x20, "dma2"))
+		return -EBUSY;
 
 	return 0;
 }
diff -uprN linux-2.6.16-rc5-orig/arch/ppc/platforms/mvme5100.c 
linux-2.6.16-rc5/arch/ppc/platforms/mvme5100.c
--- linux-2.6.16-rc5-orig/arch/ppc/platforms/mvme5100.c	2006-02-27 
20:36:36.000000000 +0100
+++ linux-2.6.16-rc5/arch/ppc/platforms/mvme5100.c	2006-02-28 
06:29:47.000000000 +0100
@@ -189,16 +189,23 @@ mvme5100_setup_arch(void)
 	return;
 }
 
+void __init
+mvme5100_request_region(unsigned long start, unsigned long n, char *desc)
+{
+	if (!request_region(start, n, desc))
+		printk(KERN_WARNING "mvme5100: unable to allocate %s region.\n", desc);
+}
+
 static void __init
 mvme5100_init2(void)
 {
 #ifdef CONFIG_MVME5100_IPMC761_PRESENT
-		request_region(0x00,0x20,"dma1");
-		request_region(0x20,0x20,"pic1");
-		request_region(0x40,0x20,"timer");
-		request_region(0x80,0x10,"dma page reg");
-		request_region(0xa0,0x20,"pic2");
-		request_region(0xc0,0x20,"dma2");
+		mvme5100_request_region(0x00,0x20,"dma1");
+		mvme5100_request_region(0x20,0x20,"pic1");
+		mvme5100_request_region(0x40,0x20,"timer");
+		mvme5100_request_region(0x80,0x10,"dma page reg");
+		mvme5100_request_region(0xa0,0x20,"pic2");
+		mvme5100_request_region(0xc0,0x20,"dma2");
 #endif
 	return;
 }
diff -uprN linux-2.6.16-rc5-orig/arch/ppc/platforms/pplus.c 
linux-2.6.16-rc5/arch/ppc/platforms/pplus.c
--- linux-2.6.16-rc5-orig/arch/ppc/platforms/pplus.c	2006-02-27 
20:36:36.000000000 +0100
+++ linux-2.6.16-rc5/arch/ppc/platforms/pplus.c	2006-02-28 06:56:32.000000000 
+0100
@@ -814,17 +814,24 @@ static void __init pplus_map_io(void)
 	io_block_mapping(0xfef80000, 0xfef80000, 0x00080000, _PAGE_IO);
 }
 
+void __init
+pplus_request_region(unsigned long start, unsigned long n, char *desc)
+{
+	if (!request_region(start, n, desc))
+		printk(KERN_WARNING "pplus: unable to allocate %s region.\n", desc);
+}
+
 static void __init pplus_init2(void)
 {
 #ifdef CONFIG_NVRAM
-	request_region(PREP_NVRAM_AS0, 0x8, "nvram");
+	pplus_request_region(PREP_NVRAM_AS0, 0x8, "nvram");
 #endif
-	request_region(0x20, 0x20, "pic1");
-	request_region(0xa0, 0x20, "pic2");
-	request_region(0x00, 0x20, "dma1");
-	request_region(0x40, 0x20, "timer");
-	request_region(0x80, 0x10, "dma page reg");
-	request_region(0xc0, 0x20, "dma2");
+	pplus_request_region(0x20, 0x20, "pic1");
+	pplus_request_region(0xa0, 0x20, "pic2");
+	pplus_request_region(0x00, 0x20, "dma1");
+	pplus_request_region(0x40, 0x20, "timer");
+	pplus_request_region(0x80, 0x10, "dma page reg");
+	pplus_request_region(0xc0, 0x20, "dma2");
 }
 
 /*
diff -uprN linux-2.6.16-rc5-orig/arch/ppc/platforms/prep_setup.c 
linux-2.6.16-rc5/arch/ppc/platforms/prep_setup.c
--- linux-2.6.16-rc5-orig/arch/ppc/platforms/prep_setup.c	2006-02-27 
20:36:36.000000000 +0100
+++ linux-2.6.16-rc5/arch/ppc/platforms/prep_setup.c	2006-02-28 
06:49:43.000000000 +0100
@@ -1066,17 +1066,31 @@ prep_map_io(void)
 	io_block_mapping(0xf0000000, PREP_ISA_MEM_BASE, 0x08000000, _PAGE_IO);
 }
 
+struct resource * __init
+prep_request_region(unsigned long start, unsigned long n, char *desc)
+{
+	struct resource *res = request_region(start, n, desc);
+	if (!res)
+		printk(KERN_WARNING "prep: unable to allocate %s region.\n", desc);
+	return res;
+}
+
 static int __init
 prep_request_io(void)
 {
 	if (_machine = _MACH_prep) {
 #ifdef CONFIG_NVRAM
-		request_region(PREP_NVRAM_AS0, 0x8, "nvram");
+		if (!prep_request_region(PREP_NVRAM_AS0, 0x8, "nvram"))
+			return -EBUSY;
 #endif
-		request_region(0x00,0x20,"dma1");
-		request_region(0x40,0x20,"timer");
-		request_region(0x80,0x10,"dma page reg");
-		request_region(0xc0,0x20,"dma2");
+		if (!prep_request_region(0x00,0x20,"dma1"))
+			return -EBUSY;
+		if (!prep_request_region(0x40,0x20,"timer"))
+			return -EBUSY;
+		if (!prep_request_region(0x80,0x10,"dma page reg"))
+			return -EBUSY;
+		if (!prep_request_region(0xc0,0x20,"dma2"))
+			return -EBUSY;
 	}
 
 	return 0;
diff -uprN linux-2.6.16-rc5-orig/arch/ppc/platforms/sandpoint.c 
linux-2.6.16-rc5/arch/ppc/platforms/sandpoint.c
--- linux-2.6.16-rc5-orig/arch/ppc/platforms/sandpoint.c	2006-02-27 
20:36:36.000000000 +0100
+++ linux-2.6.16-rc5/arch/ppc/platforms/sandpoint.c	2006-02-28 
06:51:53.000000000 +0100
@@ -460,15 +460,30 @@ sandpoint_setup_natl_87308(void)
 
 arch_initcall(sandpoint_setup_natl_87308);
 
+struct resource * __init
+sandpoint_request_region(unsigned long start, unsigned long n, char *desc)
+{
+	struct resource *res = request_region(start, n, desc);
+	if (!res)
+		printk(KERN_WARNING "sandpoint: unable to allocate %s region.\n", desc);
+	return res;
+}
+
 static int __init
 sandpoint_request_io(void)
 {
-	request_region(0x00,0x20,"dma1");
-	request_region(0x20,0x20,"pic1");
-	request_region(0x40,0x20,"timer");
-	request_region(0x80,0x10,"dma page reg");
-	request_region(0xa0,0x20,"pic2");
-	request_region(0xc0,0x20,"dma2");
+	if (!sandpoint_request_region(0x00, 0x20, "dma1"))
+		return -EBUSY;
+	if (!sandpoint_request_region(0x20, 0x20, "pic1"))
+		return -EBUSY;
+	if (!sandpoint_request_region(0x40, 0x20, "timer"))
+		return -EBUSY;
+	if (!sandpoint_request_region(0x80, 0x10, "dma page reg"))
+		return -EBUSY;
+	if (!sandpoint_request_region(0xa0, 0x20, "pic2"))
+		return -EBUSY;
+	if (!sandpoint_request_region(0xc0, 0x20, "dma2"))
+		return -EBUSY;
 
 	return 0;
 }
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
