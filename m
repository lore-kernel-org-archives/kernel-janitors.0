From: James Nelson <james4765@cwazy.co.uk>
Date: Tue, 25 Jan 2005 23:09:44 +0000
Subject: [KJ] [PATCH 9/53] radeonfb: Clean up printk()'s in
Message-Id: <20050125230942.10418.15943.16188@localhost.localdomain>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============68577468709954603=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============68577468709954603==

This patch adds KERN_ constants to all of the printk()'s that need them in
drivers/video/radeonfb.c

Signed-off-by: James Nelson <james4765@gmail.com>

diff -urN --exclude='*~' linux-2.6.11-rc2-mm1-original/drivers/video/radeonfb.c linux-2.6.11-rc2-mm1/drivers/video/radeonfb.c
--- linux-2.6.11-rc2-mm1-original/drivers/video/radeonfb.c	2005-01-24 17:15:49.000000000 -0500
+++ linux-2.6.11-rc2-mm1/drivers/video/radeonfb.c	2005-01-24 19:07:03.907257777 -0500
@@ -28,6 +28,7 @@
  *
  */
 
+#undef DEBUG
 
 #define RADEON_VERSION	"0.1.6"
 
@@ -80,12 +81,8 @@
 #include <video/radeon.h>
 #include <linux/radeonfb.h>
 
-#define DEBUG	1
-
-#if DEBUG
-#define RTRACE		printk
-#else
-#define RTRACE		if(0) printk
+#ifdef DEBUG
+#define RTRACE		pr_debug
 #endif
 
 // XXX
@@ -807,7 +804,7 @@
         	rinfo->pll.ppll_min = pll.PCLK_min_freq;
         	rinfo->pll.ppll_max = pll.PCLK_max_freq;
 
-		printk("radeonfb: ref_clk=%d, ref_div=%d, xclk=%d from BIOS\n",
+		pr_info("radeonfb: ref_clk=%d, ref_div=%d, xclk=%d from BIOS\n",
 			rinfo->pll.ref_clk, rinfo->pll.ref_div, rinfo->pll.xclk);
 	} else {
 #ifdef CONFIG_PPC_OF
@@ -827,7 +824,7 @@
 			rinfo->pll.ppll_min = 12000;
 			rinfo->pll.ppll_max = 35000;
 
-			printk("radeonfb: ref_clk=%d, ref_div=%d, xclk=%d from OF\n",
+			pr_info("radeonfb: ref_clk=%d, ref_div=%d, xclk=%d from OF\n",
 				rinfo->pll.ref_clk, rinfo->pll.ref_div, rinfo->pll.xclk);
 
 			return;
@@ -887,7 +884,7 @@
 				break;
 		}
 
-		printk("radeonfb: ref_clk=%d, ref_div=%d, xclk=%d defaults\n",
+		pr_info("radeonfb: ref_clk=%d, ref_div=%d, xclk=%d defaults\n",
 			rinfo->pll.ref_clk, rinfo->pll.ref_div, rinfo->pll.xclk);
 	}
 }
@@ -1009,7 +1006,7 @@
 			rinfo->vAct_high = 1;
 	}
 
-	printk("radeonfb: detected DFP panel size from EDID: %dx%d\n",
+	pr_info("radeonfb: detected DFP panel size from EDID: %dx%d\n",
 		rinfo->panel_xres, rinfo->panel_yres);
 
 	rinfo->got_dfpinfo = 1;
@@ -1061,22 +1058,22 @@
 		return 0;
 
 	if (!(fpbiosstart = rinfo->bios_seg + readw(rinfo->bios_seg + 0x48))) {
-		printk("radeonfb: Failed to detect DFP panel info using BIOS\n");
+		printk(KERN_NOTICE "radeonfb: Failed to detect DFP panel info using BIOS\n");
 		return 0;
 	}
 
 	if (!(tmp = rinfo->bios_seg + readw(fpbiosstart + 0x40))) {
-		printk("radeonfb: Failed to detect DFP panel info using BIOS\n");
+		printk(KERN_NOTICE "radeonfb: Failed to detect DFP panel info using BIOS\n");
 		return 0;
 	}
 
 	for(i=0; i<24; i++)
 		stmp[i] = readb(tmp+i+1);
 	stmp[24] = 0;
-	printk("radeonfb: panel ID string: %s\n", stmp);
+	pr_info("radeonfb: panel ID string: %s\n", stmp);
 	rinfo->panel_xres = readw(tmp + 25);
 	rinfo->panel_yres = readw(tmp + 27);
-	printk("radeonfb: detected DFP panel size from BIOS: %dx%d\n",
+	pr_info("radeonfb: detected DFP panel size from BIOS: %dx%d\n",
 		rinfo->panel_xres, rinfo->panel_yres);
 
 	for(i=0; i<32; i++) {
@@ -1152,11 +1149,11 @@
 				rinfo->panel_xres = 1600;
 				break;
 			default:
-				printk("radeonfb: Failed to detect DFP panel size\n");
+				printk(KERN_NOTICE "radeonfb: Failed to detect DFP panel size\n");
 				return 0;
 		}
 
-		printk("radeonfb: detected DFP panel size from registers: %dx%d\n",
+		pr_info("radeonfb: detected DFP panel size from registers: %dx%d\n",
 			rinfo->panel_xres, rinfo->panel_yres);
 
 		tmp = INREG(FP_CRTC_H_TOTAL_DISP);
@@ -1326,20 +1323,20 @@
   
         /* use highest possible virtual resolution */
         if (v->xres_virtual == -1 && v->yres_virtual == -1) {
-                printk("radeonfb: using max available virtual resolution\n");
+                pr_info("radeonfb: using max available virtual resolution\n");
                 for (i=0; modes[i].xres != -1; i++) {
                         if (modes[i].xres * nom / den * modes[i].yres <
                             rinfo->video_ram / 2)
                                 break;
                 }
                 if (modes[i].xres == -1) {
-                        printk("radeonfb: could not find virtual resolution that fits into video memory!\n");
+                        printk(KERN_NOTICE "radeonfb: could not find virtual resolution that fits into video memory!\n");
                         return -EINVAL;
                 }
                 v->xres_virtual = modes[i].xres;  
                 v->yres_virtual = modes[i].yres;
                 
-                printk("radeonfb: virtual resolution set to max of %dx%d\n",
+                pr_info("radeonfb: virtual resolution set to max of %dx%d\n",
                         v->xres_virtual, v->yres_virtual);
         } else if (v->xres_virtual == -1) {
                 v->xres_virtual = (rinfo->video_ram * den /   
@@ -1444,7 +1441,7 @@
                         v.transp.length = 8;
                         break;
                 default:
-                        printk ("radeonfb: mode %dx%dx%d rejected, color depth invalid\n",
+                        printk (KERN_ERR "radeonfb: mode %dx%dx%d rejected, color depth invalid\n",
                                 var->xres, var->yres, var->bits_per_pixel);
                         return -EINVAL;
         }
@@ -1977,7 +1974,7 @@
 	RTRACE("vclk_freq = %d, per = %d\n", vclk_freq, xclk_per_trans_precise);
 
 	if ((ron + rinfo->ram.rloop) >= roff) {
-		printk("radeonfb: error ron out of range\n");
+		printk(KERN_ERR "radeonfb: error ron out of range\n");
 		return -EINVAL;
 	}
 
@@ -2769,7 +2766,7 @@
 
 				radeonfb_blank(0, (struct fb_info *)rinfo);
 				release_console_sem();
-				printk("CLK_PIN_CNTL on wakeup was: %08x\n", dbg_clk);
+				printk(KERN_DEBUG "CLK_PIN_CNTL on wakeup was: %08x\n", dbg_clk);
 				break;
 		}
 	}
@@ -2796,7 +2793,7 @@
 
 	rinfo = kmalloc (sizeof (struct radeonfb_info), GFP_KERNEL);
 	if (!rinfo) {
-		printk ("radeonfb: could not allocate memory\n");
+		printk (KERN_ERR "radeonfb: could not allocate memory\n");
 		return -ENODEV;
 	}
 
@@ -2813,14 +2810,14 @@
 	/* request the mem regions */
 	if (!request_mem_region (rinfo->fb_base_phys,
 				 pci_resource_len(pdev, 0), "radeonfb")) {
-		printk ("radeonfb: cannot reserve FB region\n");
+		printk (KERN_ERR "radeonfb: cannot reserve FB region\n");
 		kfree (rinfo);
 		return -ENODEV;
 	}
 
 	if (!request_mem_region (rinfo->mmio_base_phys,
 				 pci_resource_len(pdev, 2), "radeonfb")) {
-		printk ("radeonfb: cannot reserve MMIO region\n");
+		printk (KERN_ERR "radeonfb: cannot reserve MMIO region\n");
 		release_mem_region (rinfo->fb_base_phys,
 				    pci_resource_len(pdev, 0));
 		kfree (rinfo);
@@ -2830,7 +2827,7 @@
 	/* map the regions */
 	rinfo->mmio_base = ioremap (rinfo->mmio_base_phys, RADEON_REGSIZE);
 	if (!rinfo->mmio_base) {
-		printk ("radeonfb: cannot map MMIO\n");
+		printk (KERN_ERR "radeonfb: cannot map MMIO\n");
 		release_mem_region (rinfo->mmio_base_phys,
 				    pci_resource_len(pdev, 2));
 		release_mem_region (rinfo->fb_base_phys,
@@ -2859,7 +2856,7 @@
 	}
 #endif
 	if (mirror)
-		printk("radeonfb: mirroring display to CRT\n");
+		pr_info("radeonfb: mirroring display to CRT\n");
 
 	/* framebuffer size */
 	tmp = INREG(CONFIG_MEMSIZE);
@@ -2967,7 +2964,7 @@
 
 	rinfo->fb_base = ioremap (rinfo->fb_base_phys, rinfo->video_ram);
 	if (!rinfo->fb_base) {
-		printk ("radeonfb: cannot map FB\n");
+		printk (KERN_ERR "radeonfb: cannot map FB\n");
 		iounmap(rinfo->mmio_base);
 		release_mem_region (rinfo->mmio_base_phys,
 				    pci_resource_len(pdev, 2));
@@ -3019,7 +3016,7 @@
 	board_list = rinfo;
 	((struct fb_info *) rinfo)->device = &pdev->dev;
 	if (register_framebuffer ((struct fb_info *) rinfo) < 0) {
-		printk ("radeonfb: could not register framebuffer\n");
+		printk (KERN_ERR "radeonfb: could not register framebuffer\n");
 		iounmap(rinfo->fb_base);
 		iounmap(rinfo->mmio_base);
 		release_mem_region (rinfo->mmio_base_phys,
@@ -3049,16 +3046,16 @@
 	}
 #endif
 
-	printk ("radeonfb: ATI Radeon %s %s %d MB\n", rinfo->name, rinfo->ram_type,
+	pr_info ("radeonfb: ATI Radeon %s %s %d MB\n", rinfo->name, rinfo->ram_type,
 		(rinfo->video_ram/(1024*1024)));
 
 	if (rinfo->hasCRTC2) {
-		printk("radeonfb: DVI port %s monitor connected\n",
+		pr_info("radeonfb: DVI port %s monitor connected\n",
 			GET_MON_NAME(rinfo->dviDisp_type));
-		printk("radeonfb: CRT port %s monitor connected\n",
+		pr_info("radeonfb: CRT port %s monitor connected\n",
 			GET_MON_NAME(rinfo->crtDisp_type));
 	} else {
-		printk("radeonfb: CRT port %s monitor connected\n",
+		pr_info("radeonfb: CRT port %s monitor connected\n",
 			GET_MON_NAME(rinfo->crtDisp_type));
 	}
 

--===============68577468709954603==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============68577468709954603==--
