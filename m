From: Henne <henne@nachtwindheim.de>
Date: Tue, 25 Apr 2006 11:53:54 +0000
Subject: [KJ] [PATCH] Marking the pci_device_id tables of the video-subsys
Message-Id: <444E0DD2.60606@nachtwindheim.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <444CEB94.4010109@nachtwindheim.de>
In-Reply-To: <444CEB94.4010109@nachtwindheim.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

From: Henrik Kretzschmar <henne@nachtwindheim.de>
Marking the pci_device_id tables of the video-subsys as __devinitdata.
Signed-off-by: Henrik Kretzschmar <henne@nachtwindheim.de>
---

diff -urN linux-2.6.17-rc2/drivers/video/aty/aty128fb.c linux/drivers/video/aty/aty128fb.c
--- linux-2.6.17-rc2/drivers/video/aty/aty128fb.c	2006-04-24 13:31:01.000000000 +0200
+++ linux/drivers/video/aty/aty128fb.c	2006-04-25 13:38:51.000000000 +0200
@@ -172,7 +172,7 @@
  static int aty128_do_resume(struct pci_dev *pdev);

  /* supported Rage128 chipsets */
-static struct pci_device_id aty128_pci_tbl[] = {
+static struct pci_device_id aty128_pci_tbl[] __devinitdata = {
  	{ PCI_VENDOR_ID_ATI, PCI_DEVICE_ID_ATI_RAGE128_LE,
  	  PCI_ANY_ID, PCI_ANY_ID, 0, 0, rage_M3_pci },
  	{ PCI_VENDOR_ID_ATI, PCI_DEVICE_ID_ATI_RAGE128_LF,
diff -urN linux-2.6.17-rc2/drivers/video/aty/atyfb_base.c linux/drivers/video/aty/atyfb_base.c
--- linux-2.6.17-rc2/drivers/video/aty/atyfb_base.c	2006-04-24 13:31:01.000000000 +0200
+++ linux/drivers/video/aty/atyfb_base.c	2006-04-25 13:39:18.000000000 +0200
@@ -3620,7 +3620,7 @@
   * probe() function find out what's up. That also mean we don't have
   * a module ID table though.
   */
-static struct pci_device_id atyfb_pci_tbl[] = {
+static struct pci_device_id atyfb_pci_tbl[] __devinitdata = {
  	{ PCI_VENDOR_ID_ATI, PCI_ANY_ID, PCI_ANY_ID, PCI_ANY_ID,
  	  PCI_BASE_CLASS_DISPLAY << 16, 0xff0000, 0 },
  	{ 0, }
diff -urN linux-2.6.17-rc2/drivers/video/aty/radeon_base.c linux/drivers/video/aty/radeon_base.c
--- linux-2.6.17-rc2/drivers/video/aty/radeon_base.c	2006-04-24 13:31:01.000000000 +0200
+++ linux/drivers/video/aty/radeon_base.c	2006-04-25 13:40:35.000000000 +0200
@@ -105,7 +105,7 @@
  #define CHIP_DEF(id, family, flags)					\
  	{ PCI_VENDOR_ID_ATI, id, PCI_ANY_ID, PCI_ANY_ID, 0, 0, (flags) | (CHIP_FAMILY_##family) }

-static struct pci_device_id radeonfb_pci_table[] = {
+static struct pci_device_id radeonfb_pci_table[] __devinitdata = {
  	/* Mobility M6 */
  	CHIP_DEF(PCI_CHIP_RADEON_LY, 	RV100,	CHIP_HAS_CRTC2 | CHIP_IS_MOBILITY),
  	CHIP_DEF(PCI_CHIP_RADEON_LZ,	RV100,	CHIP_HAS_CRTC2 | CHIP_IS_MOBILITY),
diff -urN linux-2.6.17-rc2/drivers/video/chipsfb.c linux/drivers/video/chipsfb.c
--- linux-2.6.17-rc2/drivers/video/chipsfb.c	2006-04-24 13:31:01.000000000 +0200
+++ linux/drivers/video/chipsfb.c	2006-04-25 13:27:49.000000000 +0200
@@ -488,7 +488,7 @@
  #endif /* CONFIG_PM */


-static struct pci_device_id chipsfb_pci_tbl[] = {
+static struct pci_device_id chipsfb_pci_tbl[] __devinitdata = {
  	{ PCI_VENDOR_ID_CT, PCI_DEVICE_ID_CT_65550, PCI_ANY_ID, PCI_ANY_ID },
  	{ 0 }
  };
diff -urN linux-2.6.17-rc2/drivers/video/cirrusfb.c linux/drivers/video/cirrusfb.c
--- linux-2.6.17-rc2/drivers/video/cirrusfb.c	2006-04-24 13:31:01.000000000 +0200
+++ linux/drivers/video/cirrusfb.c	2006-04-25 13:28:54.000000000 +0200
@@ -277,7 +277,7 @@
  #define CHIP(id, btype) \
  	{ PCI_VENDOR_ID_CIRRUS, id, PCI_ANY_ID, PCI_ANY_ID, 0, 0, (btype) }

-static struct pci_device_id cirrusfb_pci_table[] = {
+static struct pci_device_id cirrusfb_pci_table[] __devinitdata = {
  	CHIP( PCI_DEVICE_ID_CIRRUS_5436, BT_ALPINE ),
  	CHIP( PCI_DEVICE_ID_CIRRUS_5434_8, BT_ALPINE ),
  	CHIP( PCI_DEVICE_ID_CIRRUS_5434_4, BT_ALPINE ),
diff -urN linux-2.6.17-rc2/drivers/video/console/sticore.c linux/drivers/video/console/sticore.c
--- linux-2.6.17-rc2/drivers/video/console/sticore.c	2006-04-24 13:31:01.000000000 +0200
+++ linux/drivers/video/console/sticore.c	2006-04-25 13:41:23.000000000 +0200
@@ -980,7 +980,7 @@
  }


-static struct pci_device_id sti_pci_tbl[] = {
+static struct pci_device_id sti_pci_tbl[] __devinitdata = {
  	{ PCI_DEVICE(PCI_VENDOR_ID_HP, PCI_DEVICE_ID_HP_VISUALIZE_EG) },
  	{ PCI_DEVICE(PCI_VENDOR_ID_HP, PCI_DEVICE_ID_HP_VISUALIZE_FX6) },
  	{ PCI_DEVICE(PCI_VENDOR_ID_HP, PCI_DEVICE_ID_HP_VISUALIZE_FX4) },
diff -urN linux-2.6.17-rc2/drivers/video/cyber2000fb.c linux/drivers/video/cyber2000fb.c
--- linux-2.6.17-rc2/drivers/video/cyber2000fb.c	2006-03-20 06:53:29.000000000 +0100
+++ linux/drivers/video/cyber2000fb.c	2006-04-25 13:32:17.000000000 +0200
@@ -1686,7 +1686,7 @@
  	return 0;
  }

-static struct pci_device_id cyberpro_pci_table[] = {
+static struct pci_device_id cyberpro_pci_table[] __devinitdata = {
  //	Not yet
  //	{ PCI_VENDOR_ID_INTERG, PCI_DEVICE_ID_INTERG_1682,
  //		PCI_ANY_ID, PCI_ANY_ID, 0, 0, ID_IGA_1682 },
diff -urN linux-2.6.17-rc2/drivers/video/cyblafb.c linux/drivers/video/cyblafb.c
--- linux-2.6.17-rc2/drivers/video/cyblafb.c	2006-03-20 06:53:29.000000000 +0100
+++ linux/drivers/video/cyblafb.c	2006-04-25 13:32:47.000000000 +0200
@@ -1595,7 +1595,7 @@
  //
  // List of boards that we are trying to support
  //
-static struct pci_device_id cybla_devices[] = {
+static struct pci_device_id cybla_devices[] __devinitdata = {
  	{PCI_VENDOR_ID_TRIDENT, CYBERBLADEi1, PCI_ANY_ID, PCI_ANY_ID, 0, 0, 0},
  	{0,}
  };
diff -urN linux-2.6.17-rc2/drivers/video/geode/gx1fb_core.c linux/drivers/video/geode/gx1fb_core.c
--- linux-2.6.17-rc2/drivers/video/geode/gx1fb_core.c	2006-03-20 06:53:29.000000000 +0100
+++ linux/drivers/video/geode/gx1fb_core.c	2006-04-25 13:41:55.000000000 +0200
@@ -405,7 +405,7 @@
  	framebuffer_release(info);
  }

-static struct pci_device_id gx1fb_id_table[] = {
+static struct pci_device_id gx1fb_id_table[] __devinitdata = {
  	{ PCI_VENDOR_ID_CYRIX, PCI_DEVICE_ID_CYRIX_5530_VIDEO,
  	  PCI_ANY_ID, PCI_ANY_ID, PCI_BASE_CLASS_DISPLAY << 16,
  	  0xff0000, 0 },
diff -urN linux-2.6.17-rc2/drivers/video/geode/gxfb_core.c linux/drivers/video/geode/gxfb_core.c
--- linux-2.6.17-rc2/drivers/video/geode/gxfb_core.c	2006-04-24 13:31:01.000000000 +0200
+++ linux/drivers/video/geode/gxfb_core.c	2006-04-25 13:42:13.000000000 +0200
@@ -383,7 +383,7 @@
  	framebuffer_release(info);
  }

-static struct pci_device_id gxfb_id_table[] = {
+static struct pci_device_id gxfb_id_table[] __devinitdata = {
  	{ PCI_VENDOR_ID_NS, PCI_DEVICE_ID_NS_CS5535_VIDEO,
  	  PCI_ANY_ID, PCI_ANY_ID, PCI_BASE_CLASS_DISPLAY << 16,
  	  0xff0000, 0 },
diff -urN linux-2.6.17-rc2/drivers/video/i810/i810_main.c linux/drivers/video/i810/i810_main.c
--- linux-2.6.17-rc2/drivers/video/i810/i810_main.c	2006-04-24 13:31:01.000000000 +0200
+++ linux/drivers/video/i810/i810_main.c	2006-04-25 13:43:17.000000000 +0200
@@ -108,7 +108,7 @@
  	"Intel(R) 815 (Internal Graphics with AGP) Framebuffer Device"
  };

-static struct pci_device_id i810fb_pci_tbl[] = {
+static struct pci_device_id i810fb_pci_tbl[] __devinitdata = {
  	{ PCI_VENDOR_ID_INTEL, PCI_DEVICE_ID_INTEL_82810_IG1,
  	  PCI_ANY_ID, PCI_ANY_ID, 0, 0, 0 },
  	{ PCI_VENDOR_ID_INTEL, PCI_DEVICE_ID_INTEL_82810_IG3,
diff -urN linux-2.6.17-rc2/drivers/video/imsttfb.c linux/drivers/video/imsttfb.c
--- linux-2.6.17-rc2/drivers/video/imsttfb.c	2006-04-24 13:31:01.000000000 +0200
+++ linux/drivers/video/imsttfb.c	2006-04-25 13:35:00.000000000 +0200
@@ -1320,7 +1320,7 @@
  	}
  }

-static struct pci_device_id imsttfb_pci_tbl[] = {
+static struct pci_device_id imsttfb_pci_tbl[] __devinitdata = {
  	{ PCI_VENDOR_ID_IMS, PCI_DEVICE_ID_IMS_TT128,
  	  PCI_ANY_ID, PCI_ANY_ID, 0, 0, IBM },
  	{ PCI_VENDOR_ID_IMS, PCI_DEVICE_ID_IMS_TT3D,
diff -urN linux-2.6.17-rc2/drivers/video/kyro/fbdev.c linux/drivers/video/kyro/fbdev.c
--- linux-2.6.17-rc2/drivers/video/kyro/fbdev.c	2006-03-20 06:53:29.000000000 +0100
+++ linux/drivers/video/kyro/fbdev.c	2006-04-25 13:43:54.000000000 +0200
@@ -644,7 +644,7 @@
  	return 0;
  }

-static struct pci_device_id kyrofb_pci_tbl[] = {
+static struct pci_device_id kyrofb_pci_tbl[] __devinitdata = {
  	{ PCI_VENDOR_ID_ST, PCI_DEVICE_ID_STG4000,
  	  PCI_ANY_ID, PCI_ANY_ID, 0, 0, 0 },
  	{ 0, }
diff -urN linux-2.6.17-rc2/drivers/video/matrox/matroxfb_base.c linux/drivers/video/matrox/matroxfb_base.c
--- linux-2.6.17-rc2/drivers/video/matrox/matroxfb_base.c	2006-04-24 13:31:01.000000000 +0200
+++ linux/drivers/video/matrox/matroxfb_base.c	2006-04-25 13:45:08.000000000 +0200
@@ -2097,7 +2097,7 @@
  	matroxfb_remove(PMINFO 1);
  }

-static struct pci_device_id matroxfb_devices[] = {
+static struct pci_device_id matroxfb_devices[] __devinitdata = {
  #ifdef CONFIG_FB_MATROX_MILLENIUM
  	{PCI_VENDOR_ID_MATROX,	PCI_DEVICE_ID_MATROX_MIL,
  		PCI_ANY_ID,	PCI_ANY_ID,	0, 0, 0},
diff -urN linux-2.6.17-rc2/drivers/video/neofb.c linux/drivers/video/neofb.c
--- linux-2.6.17-rc2/drivers/video/neofb.c	2006-04-24 13:31:01.000000000 +0200
+++ linux/drivers/video/neofb.c	2006-04-25 13:35:20.000000000 +0200
@@ -2230,7 +2230,7 @@
  	}
  }

-static struct pci_device_id neofb_devices[] = {
+static struct pci_device_id neofb_devices[] __devinitdata = {
  	{PCI_VENDOR_ID_NEOMAGIC, PCI_CHIP_NM2070,
  	 PCI_ANY_ID, PCI_ANY_ID, 0, 0, FB_ACCEL_NEOMAGIC_NM2070},

diff -urN linux-2.6.17-rc2/drivers/video/nvidia/nvidia.c linux/drivers/video/nvidia/nvidia.c
--- linux-2.6.17-rc2/drivers/video/nvidia/nvidia.c	2006-04-24 13:31:01.000000000 +0200
+++ linux/drivers/video/nvidia/nvidia.c	2006-04-25 13:46:32.000000000 +0200
@@ -69,7 +69,7 @@
  /* HW cursor parameters */
  #define MAX_CURS		32

-static struct pci_device_id nvidiafb_pci_tbl[] = {
+static struct pci_device_id nvidiafb_pci_tbl[] __devinitdata = {
  	{PCI_VENDOR_ID_NVIDIA, PCI_DEVICE_ID_NVIDIA_TNT,
  	 PCI_ANY_ID, PCI_ANY_ID, 0, 0, 0},
  	{PCI_VENDOR_ID_NVIDIA, PCI_DEVICE_ID_NVIDIA_TNT2,
diff -urN linux-2.6.17-rc2/drivers/video/pm2fb.c linux/drivers/video/pm2fb.c
--- linux-2.6.17-rc2/drivers/video/pm2fb.c	2006-03-20 06:53:29.000000000 +0100
+++ linux/drivers/video/pm2fb.c	2006-04-25 13:35:37.000000000 +0200
@@ -1234,7 +1234,7 @@
  	kfree(info);
  }

-static struct pci_device_id pm2fb_id_table[] = {
+static struct pci_device_id pm2fb_id_table[] __devinitdata = {
  	{ PCI_VENDOR_ID_TI, PCI_DEVICE_ID_TI_TVP4020,
  	  PCI_ANY_ID, PCI_ANY_ID, PCI_BASE_CLASS_DISPLAY << 16,
  	  0xff0000, 0 },
diff -urN linux-2.6.17-rc2/drivers/video/riva/fbdev.c linux/drivers/video/riva/fbdev.c
--- linux-2.6.17-rc2/drivers/video/riva/fbdev.c	2006-04-24 13:31:01.000000000 +0200
+++ linux/drivers/video/riva/fbdev.c	2006-04-25 13:47:14.000000000 +0200
@@ -112,7 +112,7 @@
   *
   * ------------------------------------------------------------------------- */

-static struct pci_device_id rivafb_pci_tbl[] = {
+static struct pci_device_id rivafb_pci_tbl[] __devinitdata = {
  	{ PCI_VENDOR_ID_NVIDIA_SGS, PCI_DEVICE_ID_NVIDIA_SGS_RIVA128,
  	  PCI_ANY_ID, PCI_ANY_ID, 0, 0, 0 },
  	{ PCI_VENDOR_ID_NVIDIA, PCI_DEVICE_ID_NVIDIA_TNT,
diff -urN linux-2.6.17-rc2/drivers/video/sis/sis_main.h linux/drivers/video/sis/sis_main.h
--- linux-2.6.17-rc2/drivers/video/sis/sis_main.h	2006-03-20 06:53:29.000000000 +0100
+++ linux/drivers/video/sis/sis_main.h	2006-04-25 13:49:07.000000000 +0200
@@ -125,7 +125,7 @@
  	{ XGI_40,     SIS_315_VGA, 1, HW_CURSOR_AREA_SIZE_315 * 4, SIS_CRT2_WENABLE_315, "XGI V3XT/V5/V8" },
  };

-static struct pci_device_id __devinitdata sisfb_pci_table[] = {
+static struct pci_device_id sisfb_pci_table[] __devinitdata = {
  #ifdef CONFIG_FB_SIS_300
  	{ PCI_VENDOR_ID_SI, PCI_DEVICE_ID_SI_300,     PCI_ANY_ID, PCI_ANY_ID, 0, 0, 0},
  	{ PCI_VENDOR_ID_SI, PCI_DEVICE_ID_SI_540_VGA, PCI_ANY_ID, PCI_ANY_ID, 0, 0, 1},
diff -urN linux-2.6.17-rc2/drivers/video/sstfb.c linux/drivers/video/sstfb.c
--- linux-2.6.17-rc2/drivers/video/sstfb.c	2006-04-24 13:31:01.000000000 +0200
+++ linux/drivers/video/sstfb.c	2006-04-25 13:36:08.000000000 +0200
@@ -1543,7 +1543,7 @@
  }


-static struct pci_device_id sstfb_id_tbl[] = {
+static struct pci_device_id sstfb_id_tbl[] __devinitdata = {
  	{ PCI_VENDOR_ID_3DFX, PCI_DEVICE_ID_3DFX_VOODOO,
  	  PCI_ANY_ID, PCI_ANY_ID, 0, 0, ID_VOODOO1 },
  	{ PCI_VENDOR_ID_3DFX, PCI_DEVICE_ID_3DFX_VOODOO2,
diff -urN linux-2.6.17-rc2/drivers/video/tdfxfb.c linux/drivers/video/tdfxfb.c
--- linux-2.6.17-rc2/drivers/video/tdfxfb.c	2006-03-20 06:53:29.000000000 +0100
+++ linux/drivers/video/tdfxfb.c	2006-04-25 13:36:25.000000000 +0200
@@ -129,7 +129,7 @@
  				  const struct pci_device_id *id);
  static void __devexit tdfxfb_remove(struct pci_dev *pdev);

-static struct pci_device_id tdfxfb_id_table[] = {
+static struct pci_device_id tdfxfb_id_table[] __devinitdata = {
  	{ PCI_VENDOR_ID_3DFX, PCI_DEVICE_ID_3DFX_BANSHEE,
  	  PCI_ANY_ID, PCI_ANY_ID, PCI_BASE_CLASS_DISPLAY << 16,
  	  0xff0000, 0 },
diff -urN linux-2.6.17-rc2/drivers/video/tgafb.c linux/drivers/video/tgafb.c
--- linux-2.6.17-rc2/drivers/video/tgafb.c	2006-03-20 06:53:29.000000000 +0100
+++ linux/drivers/video/tgafb.c	2006-04-25 13:37:07.000000000 +0200
@@ -70,7 +70,7 @@
   *  PCI registration operations
   */

-static struct pci_device_id const tgafb_pci_table[] = {
+static struct pci_device_id const tgafb_pci_table[] __devinitdata = {
  	{ PCI_VENDOR_ID_DEC, PCI_DEVICE_ID_DEC_TGA, PCI_ANY_ID, PCI_ANY_ID,
  	  0, 0, 0 }
  };
diff -urN linux-2.6.17-rc2/drivers/video/tridentfb.c linux/drivers/video/tridentfb.c
--- linux-2.6.17-rc2/drivers/video/tridentfb.c	2006-03-20 06:53:29.000000000 +0100
+++ linux/drivers/video/tridentfb.c	2006-04-25 13:37:36.000000000 +0200
@@ -1194,7 +1194,7 @@
  }

  /* List of boards that we are trying to support */
-static struct pci_device_id trident_devices[] = {
+static struct pci_device_id trident_devices[] __devinitdata = {
  	{PCI_VENDOR_ID_TRIDENT,	BLADE3D, PCI_ANY_ID,PCI_ANY_ID,0,0,0},
  	{PCI_VENDOR_ID_TRIDENT,	CYBERBLADEi7, PCI_ANY_ID,PCI_ANY_ID,0,0,0},
  	{PCI_VENDOR_ID_TRIDENT,	CYBERBLADEi7D, PCI_ANY_ID,PCI_ANY_ID,0,0,0},
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
