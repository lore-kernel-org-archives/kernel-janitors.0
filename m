From: James Nelson <james4765@cwazy.co.uk>
Date: Tue, 25 Jan 2005 23:13:50 +0000
Subject: [KJ] [PATCH 32/53] macfb: Clean up printk()'s in
Message-Id: <20050125231349.10418.2309.67226@localhost.localdomain>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============65417292764995483=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============65417292764995483==

This patch adds KERN_ constants to all of the printk()'s that need them in
drivers/video/macfb.c

Signed-off-by: James Nelson <james4765@gmail.com>

diff -urN --exclude='*~' linux-2.6.11-rc2-mm1-original/drivers/video/macfb.c linux-2.6.11-rc2-mm1/drivers/video/macfb.c
--- linux-2.6.11-rc2-mm1-original/drivers/video/macfb.c	2005-01-24 17:15:49.000000000 -0500
+++ linux-2.6.11-rc2-mm1/drivers/video/macfb.c	2005-01-24 19:07:03.462259221 -0500
@@ -639,9 +639,9 @@
 	   Mac */
 	fb_info.screen_base = ioremap(mac_bi_data.videoaddr, macfb_fix.smem_len);
 	
-	printk("macfb: framebuffer at 0x%08lx, mapped to 0x%p, size %dk\n",
+	pr_info("macfb: framebuffer at 0x%08lx, mapped to 0x%p, size %dk\n",
 	       macfb_fix.smem_start, fb_info.screen_base, macfb_fix.smem_len/1024);
-	printk("macfb: mode is %dx%dx%d, linelength=%d\n",
+	pr_info("macfb: mode is %dx%dx%d, linelength=%d\n",
 	       macfb_defined.xres, macfb_defined.yres, macfb_defined.bits_per_pixel, macfb_fix.line_length);
 	
 	/*
@@ -653,7 +653,7 @@
 	macfb_defined.height = PIXEL_TO_MM(macfb_defined.yres);
 	macfb_defined.width  = PIXEL_TO_MM(macfb_defined.xres);	 
 
-	printk("macfb: scrolling: redraw\n");
+	pr_info("macfb: scrolling: redraw\n");
 	macfb_defined.yres_virtual = macfb_defined.yres;
 
 	/* some dummy values for timing to make fbset happy */
@@ -689,7 +689,7 @@
 		macfb_defined.green.length = 5;
 		macfb_defined.blue.offset = 0;
 		macfb_defined.blue.length = 5;
-		printk("macfb: directcolor: "
+		pr_info("macfb: directcolor: "
 		       "size=1:5:5:5, shift=15:10:5:0\n");
 		video_cmap_len = 16;
 		/* Should actually be FB_VISUAL_DIRECTCOLOR, but this
@@ -706,14 +706,14 @@
 		macfb_defined.green.length = 8;
 		macfb_defined.blue.offset = 0;
 		macfb_defined.blue.length = 8;
-		printk("macfb: truecolor: "
+		pr_info("macfb: truecolor: "
 		       "size=0:8:8:8, shift=0:16:8:0\n");
 		video_cmap_len = 16;
 		macfb_fix.visual = FB_VISUAL_TRUECOLOR;
 	default:
 		video_cmap_len = 0;
 		macfb_fix.visual = FB_VISUAL_MONO01;
-		printk("macfb: unknown or unsupported bit depth: %d\n", macfb_defined.bits_per_pixel);
+		printk(KERN_WARNING "macfb: unknown or unsupported bit depth: %d\n", macfb_defined.bits_per_pixel);
 		break;
 	}
 	
@@ -962,7 +962,7 @@
 	if (register_framebuffer(&fb_info) < 0)
 		return;
 
-	printk("fb%d: %s frame buffer device\n",
+	pr_info("fb%d: %s frame buffer device\n",
 	       fb_info.node, fb_info.fix.id);
 }
 

--===============65417292764995483==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============65417292764995483==--
