From: James Nelson <james4765@cwazy.co.uk>
Date: Tue, 25 Jan 2005 23:09:14 +0000
Subject: [KJ] [PATCH 6/53] radeonfb: Clean up printk()'s in
Message-Id: <20050125230911.10418.3160.30244@localhost.localdomain>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============96097374192801732=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============96097374192801732==

This patch adds KERN_ constants to all of the printk()'s that need them in
drivers/video/aty/radeon_base.c

Signed-off-by: James Nelson <james4765@gmail.com>

diff -urN --exclude='*~' linux-2.6.11-rc2-mm1-original/drivers/video/aty/radeon_base.c linux-2.6.11-rc2-mm1/drivers/video/aty/radeon_base.c
--- linux-2.6.11-rc2-mm1-original/drivers/video/aty/radeon_base.c	2005-01-24 17:15:49.000000000 -0500
+++ linux-2.6.11-rc2-mm1/drivers/video/aty/radeon_base.c	2005-01-24 19:07:02.367262774 -0500
@@ -710,12 +710,12 @@
 	if (rinfo->pll.sclk == 0)
 		rinfo->pll.sclk = 20000;
 
-	printk("radeonfb: Reference=%d.%02d MHz (RefDiv=%d) Memory=%d.%02d Mhz, System=%d.%02d MHz\n",
+	pr_info("radeonfb: Reference=%d.%02d MHz (RefDiv=%d) Memory=%d.%02d Mhz, System=%d.%02d MHz\n",
 	       rinfo->pll.ref_clk / 100, rinfo->pll.ref_clk % 100,
 	       rinfo->pll.ref_div,
 	       rinfo->pll.mclk / 100, rinfo->pll.mclk % 100,
 	       rinfo->pll.sclk / 100, rinfo->pll.sclk % 100);
-	printk("radeonfb: PLL min %d max %d\n", rinfo->pll.ppll_min, rinfo->pll.ppll_max);
+	pr_info("radeonfb: PLL min %d max %d\n", rinfo->pll.ppll_min, rinfo->pll.ppll_max);
 }
 
 static int radeonfb_check_var (struct fb_var_screeninfo *var, struct fb_info *info)
@@ -795,7 +795,7 @@
                         v.transp.length = 8;
                         break;
                 default:
-                        printk ("radeonfb: mode %dx%dx%d rejected, color depth invalid\n",
+                        printk (KERN_ERR "radeonfb: mode %dx%dx%d rejected, color depth invalid\n",
                                 var->xres, var->yres, var->bits_per_pixel);
                         return -EINVAL;
         }
@@ -2391,7 +2391,7 @@
 	}
 #endif
 
-	printk ("radeonfb (%s): %s\n", pci_name(rinfo->pdev), rinfo->name);
+	pr_info ("radeonfb (%s): %s\n", pci_name(rinfo->pdev), rinfo->name);
 
 	if (rinfo->bios_seg)
 		radeon_unmap_ROM(rinfo, pdev);

--===============96097374192801732==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============96097374192801732==--
