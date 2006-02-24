From: Tim Cooijmans <tim@aapopfiets.nl>
Date: Fri, 24 Feb 2006 21:49:22 +0000
Subject: [KJ] [PATCH] check request_region return value
Message-Id: <200602242249.22568.tim@aapopfiets.nl>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

From: Tim Cooijmans <tim@aapopfiets.nl>

Check request_region return value in arch/powerpc/platform/chrp/setup.c.  
Passed compilation.

Signed-off-by: Tim Cooijmans <tim@aapopfiets.nl>
---
--- linux-2.6.16-rc4-orig/arch/powerpc/platforms/chrp/setup.c	2006-02-21 
20:18:41.000000000 +0100
+++ linux-2.6.16-rc4/arch/powerpc/platforms/chrp/setup.c	2006-02-24 
18:30:10.000000000 +0100
@@ -471,15 +471,54 @@ chrp_init2(void)
 	chrp_nvram_init();
 #endif
 
-	request_region(0x20,0x20,"pic1");
-	request_region(0xa0,0x20,"pic2");
-	request_region(0x00,0x20,"dma1");
-	request_region(0x40,0x20,"timer");
-	request_region(0x80,0x10,"dma page reg");
-	request_region(0xc0,0x20,"dma2");
+	if (request_region(0x20,0x20,"pic1") = NULL) {
+		printk(KERN_WARNING "chrp_init2: could not "
+				    "allocate pic1 region\n");
+		goto out_pic1;
+	}
+	if (request_region(0xa0,0x20,"pic2") = NULL) {
+		printk(KERN_WARNING "chrp_init2: could not "
+				    "allocate pic2 region\n");
+		goto out_pic2;
+	}
+	if (request_region(0x00,0x20,"dma1") = NULL) {
+		printk(KERN_WARNING "chrp_init2: could not "
+				    "allocate dma1 region\n");
+		goto out_dma1;
+	}
+	if (request_region(0x40,0x20,"timer") = NULL) {
+		printk(KERN_WARNING "chrp_init2: could not "
+				    "allocate timer region\n");
+		goto out_timer;
+	}
+	if (request_region(0x80,0x10,"dma page reg") = NULL) {
+		printk(KERN_WARNING "chrp_init2: could not "
+				    "allocate dma page reg region\n");
+		goto out_dma_page_reg;
+	}
+	if (request_region(0xc0,0x20,"dma2") = NULL) {
+		printk(KERN_WARNING "chrp_init2: could not "
+				    "allocate dma2 region\n");
+		goto out_dma2;
+	}
 
 	if (ppc_md.progress)
 		ppc_md.progress("  Have fun!    ", 0x7777);
+
+	return;
+
+out_dma2:
+	release_region(0x80,0x10);
+out_dma_page_reg:
+	release_region(0x40,0x20);
+out_timer:
+	release_region(0x00,0x20);
+out_dma1:
+	release_region(0xa0,0x20);
+out_pic2:
+	release_region(0x20,0x20);
+out_pic1:
+	return;
 }
 
 void __init chrp_init(void)
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
