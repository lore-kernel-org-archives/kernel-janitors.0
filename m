From: James Nelson <james4765@cwazy.co.uk>
Date: Tue, 25 Jan 2005 23:10:22 +0000
Subject: [KJ] [PATCH 13/53] cirrusfb: Clean up printk()'s in
Message-Id: <20050125231018.10418.950.72623@localhost.localdomain>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============34923723656505135=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============34923723656505135==

This patch adds KERN_ constants to all of the printk()'s that need them in
drivers/video/cirrusfb.c

Signed-off-by: James Nelson <james4765@gmail.com>

diff -urN --exclude='*~' linux-2.6.11-rc2-mm1-original/drivers/video/cirrusfb.c linux-2.6.11-rc2-mm1/drivers/video/cirrusfb.c
--- linux-2.6.11-rc2-mm1-original/drivers/video/cirrusfb.c	2005-01-24 17:15:49.000000000 -0500
+++ linux-2.6.11-rc2-mm1/drivers/video/cirrusfb.c	2005-01-24 19:07:02.624261940 -0500
@@ -93,7 +93,7 @@
 #ifndef CIRRUSFB_NDEBUG
 #define assert(expr) \
         if(!(expr)) { \
-        printk( "Assertion failed! %s,%s,%s,line=%d\n",\
+        printk(KERN_DEBUG "Assertion failed! %s,%s,%s,line=%d\n",\
         #expr,__FILE__,__FUNCTION__,__LINE__); \
         }
 #else
@@ -703,14 +703,14 @@
 		den = 1;
 		break;		/* 4 bytes per pixel */
 	default:
-		printk ("cirrusfb: mode %dx%dx%d rejected...color depth not supported.\n",
+		printk (KERN_WARNING "cirrusfb: mode %dx%dx%d rejected...color depth not supported.\n",
 			var->xres, var->yres, var->bits_per_pixel);
 		DPRINTK ("EXIT - EINVAL error\n");
 		return -EINVAL;
 	}
 
 	if (var->xres * nom / den * var->yres > cinfo->size) {
-		printk ("cirrusfb: mode %dx%dx%d rejected...resolution too high to fit into video memory!\n",
+		printk (KERN_WARNING "cirrusfb: mode %dx%dx%d rejected...resolution too high to fit into video memory!\n",
 			var->xres, var->yres, var->bits_per_pixel);
 		DPRINTK ("EXIT - EINVAL error\n");
 		return -EINVAL;
@@ -719,20 +719,20 @@
 	/* use highest possible virtual resolution */
 	if (var->xres_virtual == -1 &&
 	    var->yres_virtual == -1) {
-		printk ("cirrusfb: using maximum available virtual resolution\n");
+		pr_info ("cirrusfb: using maximum available virtual resolution\n");
 		for (i = 0; modes[i].xres != -1; i++) {
 			if (modes[i].xres * nom / den * modes[i].yres < cinfo->size / 2)
 				break;
 		}
 		if (modes[i].xres == -1) {
-			printk ("cirrusfb: could not find a virtual resolution that fits into video memory!!\n");
+			printk (KERN_WARNING "cirrusfb: could not find a virtual resolution that fits into video memory!!\n");
 			DPRINTK ("EXIT - EINVAL error\n");
 			return -EINVAL;
 		}
 		var->xres_virtual = modes[i].xres;
 		var->yres_virtual = modes[i].yres;
 
-		printk ("cirrusfb: virtual resolution set to maximum of %dx%d\n",
+		pr_info ("cirrusfb: virtual resolution set to maximum of %dx%d\n",
 			var->xres_virtual, var->yres_virtual);
 	}
 
@@ -2169,7 +2169,7 @@
 		/* 64-bit DRAM data bus width; assume 2MB. Also indicates 2MB memory
 		   * on the 5430. */
 	    case 0x18: mem = 2048 * 1024; break;
-	    default: printk ("CLgenfb: Unknown memory size!\n");
+	    default: printk (KERN_WARNING "CLgenfb: Unknown memory size!\n");
 		mem = 1024 * 1024;
 	}
 	if (SRF & 0x80) {
@@ -2354,7 +2354,7 @@
 
 	unregister_framebuffer (info);
 	fb_dealloc_cmap (&info->cmap);
-	printk ("Framebuffer unregistered\n");
+	pr_info ("Framebuffer unregistered\n");
 	cinfo->unmap(cinfo);
 
 	DPRINTK ("EXIT\n");
@@ -2439,6 +2439,9 @@
 	cinfo->size = board_size;
 	cinfo->unmap = cirrusfb_pci_unmap;
 
+	printk(KERN_INFO "cirrusfb: %s board detected; ",
+	       cirrusfb_board_info[btype].name);
+
 	printk (" RAM (%lu kB) at 0xx%lx, ", cinfo->size / KB_, board_addr);
 	printk ("Cirrus Logic chipset on PCI bus\n");
 	pci_set_drvdata(pdev, info);
@@ -2531,7 +2534,7 @@
 		goto err_release_fb;
 	}
 
-	printk (" RAM (%lu MB) at $%lx, ", board_size / MB_, board_addr);
+	pr_info (" RAM (%lu MB) at $%lx, ", board_size / MB_, board_addr);
 
 	ret = -EIO;
 

--===============34923723656505135==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============34923723656505135==--
