From: Badari Pulavarty <pbadari@us.ibm.com>
Date: Wed, 27 Sep 2006 19:59:54 +0000
Subject: [KJ] [RFC] request_region() error handling fixes
Message-Id: <1159387194.1709.40.camel@dyn9047017100.beaverton.ibm.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hi,

I started working on request_region() error handling fixes.
Before I got too far, want to make sure its following approach
is acceptable. (not happy with too many "goto" statements). 
Is there a better way to do this ?

Please comment.

Thanks,
Badari

Signed-off-by: Badari Pulavarty <pbadari@us.ibm.com>

 arch/powerpc/platforms/chrp/setup.c  |   42 +++++++++++++++++++++++++-----
 arch/powerpc/platforms/pseries/pci.c |   41 +++++++++++++++++++++++++----
 arch/ppc/platforms/hdpu.c            |    4 ++
 arch/ppc/platforms/lopec.c           |   43 +++++++++++++++++++++++++-----
 arch/ppc/platforms/mvme5100.c        |   41 +++++++++++++++++++++++++----
 arch/ppc/platforms/pplus.c           |   49 ++++++++++++++++++++++++++++++-----
 6 files changed, 187 insertions(+), 33 deletions(-)

Index: linux-2.6.18/arch/powerpc/platforms/chrp/setup.c
=================================--- linux-2.6.18.orig/arch/powerpc/platforms/chrp/setup.c	2006-09-27 09:17:23.000000000 -0700
+++ linux-2.6.18/arch/powerpc/platforms/chrp/setup.c	2006-09-27 13:20:17.000000000 -0700
@@ -508,12 +508,30 @@
 	chrp_nvram_init();
 #endif
 
-	request_region(0x20,0x20,"pic1");
-	request_region(0xa0,0x20,"pic2");
-	request_region(0x00,0x20,"dma1");
-	request_region(0x40,0x20,"timer");
-	request_region(0x80,0x10,"dma page reg");
-	request_region(0xc0,0x20,"dma2");
+	if (!request_region(0x20,0x20,"pic1")) {
+		printk(KERN_WARNING"chrp_init: pic1 request region failed\n");
+		return;
+	}
+	if (!request_region(0xa0,0x20,"pic2")) {
+		printk(KERN_WARNING"chrp_init: pic2 request region failed\n");
+		goto out5;
+	}
+	if (!request_region(0x00,0x20,"dma1")) {
+		printk(KERN_WARNING"chrp_init: dma1 request region failed\n");
+		goto out4;
+	}
+	if (!request_region(0x40,0x20,"timer")) {
+		printk(KERN_WARNING"chrp_init: timer1 request region failed\n");
+		goto out3;
+	}
+	if (!request_region(0x80,0x10,"dma page reg")) {
+		printk(KERN_WARNING"chrp_init: dma page request region failed\n");
+		goto out2;
+	}
+	if (!request_region(0xc0,0x20,"dma2")) {
+		printk(KERN_WARNING"chrp_init: dma2 request region failed\n");
+		goto out1;
+	}
 
 	/* Get the event scan rate for the rtas so we know how
 	 * often it expects a heartbeat. -- Cort
@@ -551,6 +569,18 @@
 
 	if (ppc_md.progress)
 		ppc_md.progress("  Have fun!    ", 0x7777);
+	return;
+out1:
+	release_region(0x80, 0x10);
+out2:
+	release_region(0x40, 0x20);
+out3:
+	release_region(0x00, 0x20);
+out4:
+	release_region(0xa0, 0x20);
+out5:
+	release_region(0x20, 0x20);
+	return;
 }
 
 static int __init chrp_probe(void)
Index: linux-2.6.18/arch/ppc/platforms/lopec.c
=================================--- linux-2.6.18.orig/arch/ppc/platforms/lopec.c	2006-09-19 20:42:06.000000000 -0700
+++ linux-2.6.18/arch/ppc/platforms/lopec.c	2006-09-27 09:35:40.000000000 -0700
@@ -277,14 +277,43 @@
 	outb(0x00, 0x4d0);
 	outb(0xc0, 0x4d1);
 
-	request_region(0x00, 0x20, "dma1");
-	request_region(0x20, 0x20, "pic1");
-	request_region(0x40, 0x20, "timer");
-	request_region(0x80, 0x10, "dma page reg");
-	request_region(0xa0, 0x20, "pic2");
-	request_region(0xc0, 0x20, "dma2");
-
+	if (!request_region(0x00, 0x20, "dma1")) {
+		printk(KERN_WARNING"lopec: dma1 request region failed\n");
+		goto out6;
+	}
+	if (!request_region(0x20, 0x20, "pic1")) {
+		printk(KERN_WARNING"lopec: pic1 request region failed\n");
+		goto out5;
+	}
+	if (!request_region(0x40, 0x20, "timer")) {
+		printk(KERN_WARNING"lopec: timer request region failed\n");
+		goto out4;
+	}
+	if (!request_region(0x80, 0x10, "dma page reg")) {
+		printk(KERN_WARNING"lopec: dma page request region failed\n");
+		goto out3;
+	}
+	if (!request_region(0xa0, 0x20, "pic2")) {
+		printk(KERN_WARNING"lopec: pic2 request region failed\n");
+		goto out2;
+	}
+	if (!request_region(0xc0, 0x20, "dma2")) {
+		printk(KERN_WARNING"lopec: dma2 request region failed\n");
+		goto out1;
+	}
 	return 0;
+out1:
+	release_region(0xa0, 0x20);
+out2:
+	release_region(0x80, 0x10);
+out3:
+	release_region(0x40, 0x20);
+out4:
+	release_region(0x20, 0x20);
+out5:
+	release_region(0x00, 0x20);
+out6:
+	return -EIO;
 }
 
 device_initcall(lopec_request_io);
Index: linux-2.6.18/arch/powerpc/platforms/pseries/pci.c
=================================--- linux-2.6.18.orig/arch/powerpc/platforms/pseries/pci.c	2006-09-19 20:42:06.000000000 -0700
+++ linux-2.6.18/arch/powerpc/platforms/pseries/pci.c	2006-09-27 09:44:02.000000000 -0700
@@ -95,12 +95,41 @@
 	if (!isa_io_base)
 		return;
 
-	request_region(0x20,0x20,"pic1");
-	request_region(0xa0,0x20,"pic2");
-	request_region(0x00,0x20,"dma1");
-	request_region(0x40,0x20,"timer");
-	request_region(0x80,0x10,"dma page reg");
-	request_region(0xc0,0x20,"dma2");
+	if (!request_region(0x20,0x20,"pic1")) {
+		printk(KERN_WARNING"pSeries pic1 request region failed\n");
+		return;
+	}
+	if (!request_region(0xa0,0x20,"pic2")) {
+		printk(KERN_WARNING"pSeries pic2 request region failed\n");
+		goto out5;
+	}
+	if (!request_region(0x00,0x20,"dma1")) {
+		printk(KERN_WARNING"pSeries dma1 request region failed\n");
+		goto out4;
+	}
+	if (!request_region(0x40,0x20,"timer")) {
+		printk(KERN_WARNING"pSeries timer request region failed\n");
+		goto out3;
+	}
+	if (!request_region(0x80,0x10,"dma page reg")) {
+		printk(KERN_WARNING"pSeries dma page request region failed\n");
+		goto out2;
+	}
+	if (!request_region(0xc0,0x20,"dma2")) {
+		printk(KERN_WARNING"pSeries dma2 request region failed\n");
+		goto out1;
+	}
+	return;
+out1:
+	release_region(0x80, 0x10);
+out2:
+	release_region(0x40, 0x20);
+out3:
+	release_region(0x00, 0x20);
+out4:
+	release_region(0xa0, 0x20);
+out5:
+	release_region(0x20, 0x20);
 }
 
 void __init pSeries_final_fixup(void)
Index: linux-2.6.18/arch/ppc/platforms/hdpu.c
=================================--- linux-2.6.18.orig/arch/ppc/platforms/hdpu.c	2006-09-19 20:42:06.000000000 -0700
+++ linux-2.6.18/arch/ppc/platforms/hdpu.c	2006-09-27 09:47:25.000000000 -0700
@@ -608,7 +608,9 @@
 static void
 hdpu_ide_request_region(ide_ioreg_t from, unsigned int extent, const char *name)
 {
-	request_region(from, extent, name);
+	if (!request_region(from, extent, name)) {
+		printk("hdpe ide request region failed\n");
+	}
 	return;
 }
 
Index: linux-2.6.18/arch/ppc/platforms/mvme5100.c
=================================--- linux-2.6.18.orig/arch/ppc/platforms/mvme5100.c	2006-09-19 20:42:06.000000000 -0700
+++ linux-2.6.18/arch/ppc/platforms/mvme5100.c	2006-09-27 09:51:37.000000000 -0700
@@ -190,12 +190,41 @@
 mvme5100_init2(void)
 {
 #ifdef CONFIG_MVME5100_IPMC761_PRESENT
-		request_region(0x00,0x20,"dma1");
-		request_region(0x20,0x20,"pic1");
-		request_region(0x40,0x20,"timer");
-		request_region(0x80,0x10,"dma page reg");
-		request_region(0xa0,0x20,"pic2");
-		request_region(0xc0,0x20,"dma2");
+	if (!request_region(0x00, 0x20, "dma1")) {
+		printk(KERN_WARNING"mvme5100: dma1 request region failed\n");
+		return;
+	}
+	if (!request_region(0x20, 0x20, "pic1")) {
+		printk(KERN_WARNING"mvme5100: pic1 request region failed\n");
+		goto out5;
+	}
+	if (!request_region(0x40, 0x20, "timer")) {
+		printk(KERN_WARNING"mvme5100: timer request region failed\n");
+		goto out4;
+	}
+	if (!request_region(0x80, 0x10, "dma page reg")) {
+		printk(KERN_WARNING"mvme5100: dma page request region failed\n");
+		goto out3;
+	}
+	if (!request_region(0xa0, 0x20, "pic2")) {
+		printk(KERN_WARNING"mvme5100: pic2 request region failed\n");
+		goto out2;
+	}
+	if (!request_region(0xc0, 0x20, "dma2")) {
+		printk(KERN_WARNING"mvme5100: dma2 request region failed\n");
+		goto out1;
+	}
+	return 0;
+out1:
+	release_region(0xa0, 0x20);
+out2:
+	release_region(0x80, 0x10);
+out3:
+	release_region(0x40, 0x20);
+out4:
+	release_region(0x20, 0x20);
+out5:
+	release_region(0x00, 0x20);
 #endif
 	return;
 }
Index: linux-2.6.18/arch/ppc/platforms/pplus.c
=================================--- linux-2.6.18.orig/arch/ppc/platforms/pplus.c	2006-09-19 20:42:06.000000000 -0700
+++ linux-2.6.18/arch/ppc/platforms/pplus.c	2006-09-27 10:02:48.000000000 -0700
@@ -814,14 +814,49 @@
 static void __init pplus_init2(void)
 {
 #ifdef CONFIG_NVRAM
-	request_region(PREP_NVRAM_AS0, 0x8, "nvram");
+	if (request_region(PREP_NVRAM_AS0, 0x8, "nvram")) {
+		printk(KERN_WARNING"pplus_init nvram request region failed\n");
+		return;
+	}
 #endif
-	request_region(0x20, 0x20, "pic1");
-	request_region(0xa0, 0x20, "pic2");
-	request_region(0x00, 0x20, "dma1");
-	request_region(0x40, 0x20, "timer");
-	request_region(0x80, 0x10, "dma page reg");
-	request_region(0xc0, 0x20, "dma2");
+	if (!request_region(0x20,0x20,"pic1")) {
+		printk(KERN_WARNING"pplus_init pic1 request region failed\n");
+#ifdef CONFIG_NVRAM
+		release_region(PREP_NVRAM_AS0);
+#endif
+		return;
+	}
+	if (!request_region(0xa0,0x20,"pic2")) {
+		printk(KERN_WARNING"pplus_init pic2 request region failed\n");
+		goto out5;
+	}
+	if (!request_region(0x00,0x20,"dma1")) {
+		printk(KERN_WARNING"pplus_init dma1 request region failed\n");
+		goto out4;
+	}
+	if (!request_region(0x40,0x20,"timer")) {
+		printk(KERN_WARNING"pplus_init timer request region failed\n");
+		goto out3;
+	}
+	if (!request_region(0x80,0x10,"dma page reg")) {
+		printk(KERN_WARNING"pplus_init dma page request region failed\n");
+		goto out2;
+	}
+	if (!request_region(0xc0,0x20,"dma2")) {
+		printk(KERN_WARNING"pplus_init dma2 request region failed\n");
+		goto out1;
+	}
+	return;
+out1:
+	release_region(0x80, 0x10);
+out2:
+	release_region(0x40, 0x20);
+out3:
+	release_region(0x00, 0x20);
+out4:
+	release_region(0xa0, 0x20);
+out5:
+	release_region(0x20, 0x20);
 }
 
 /*




_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
