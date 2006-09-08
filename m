From: James Nelson <james4765@gmail.com>
Date: Fri, 08 Sep 2006 01:57:51 +0000
Subject: [KJ] [PATCH 13/72] arm: add KERN_ constants to
Message-Id: <20060908015751.10114.75599.sendpatchset@david.homenet>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Signed-off-by: James Nelson <james4765@gmail.com>
---
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
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
