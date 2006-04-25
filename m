From: Henne <henne@nachtwindheim.de>
Date: Tue, 25 Apr 2006 14:36:15 +0000
Subject: [KJ] [PATCH] Marking the pci_device_id tables of the char-subsys as
Message-Id: <444E33DF.1060000@nachtwindheim.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <444CEB94.4010109@nachtwindheim.de>
In-Reply-To: <444CEB94.4010109@nachtwindheim.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

From: Henrik Kretzschmar <henne@nachtwindheim.de>

Marking the pci_device_id tables of the char-subsys as __devinitdata.
Signed-off-by: Henrik Kretzschmar <henne@nachtwindheim.de>
---

diff -urN linux-2.6.17-rc2/drivers/char/agp/ali-agp.c linux/drivers/char/agp/ali-agp.c
--- linux-2.6.17-rc2/drivers/char/agp/ali-agp.c	2006-04-24 13:30:54.000000000 +0200
+++ linux/drivers/char/agp/ali-agp.c	2006-04-25 16:10:21.000000000 +0200
@@ -374,7 +374,7 @@
  	agp_put_bridge(bridge);
  }

-static struct pci_device_id agp_ali_pci_table[] = {
+static struct pci_device_id agp_ali_pci_table[] __devinitdata = {
  	{
  	.class		= (PCI_CLASS_BRIDGE_HOST << 8),
  	.class_mask	= ~0,
diff -urN linux-2.6.17-rc2/drivers/char/agp/amd64-agp.c linux/drivers/char/agp/amd64-agp.c
--- linux-2.6.17-rc2/drivers/char/agp/amd64-agp.c	2006-04-24 13:30:54.000000000 +0200
+++ linux/drivers/char/agp/amd64-agp.c	2006-04-25 16:10:58.000000000 +0200
@@ -622,7 +622,7 @@

  #endif /* CONFIG_PM */

-static struct pci_device_id agp_amd64_pci_table[] = {
+static struct pci_device_id agp_amd64_pci_table[] __devinitdata = {
  	{
  	.class		= (PCI_CLASS_BRIDGE_HOST << 8),
  	.class_mask	= ~0,
diff -urN linux-2.6.17-rc2/drivers/char/agp/amd-k7-agp.c linux/drivers/char/agp/amd-k7-agp.c
--- linux-2.6.17-rc2/drivers/char/agp/amd-k7-agp.c	2006-03-20 06:53:29.000000000 +0100
+++ linux/drivers/char/agp/amd-k7-agp.c	2006-04-25 16:11:56.000000000 +0200
@@ -484,7 +484,7 @@
  }

  /* must be the same order as name table above */
-static struct pci_device_id agp_amdk7_pci_table[] = {
+static struct pci_device_id agp_amdk7_pci_table[] __devinitdata = {
  	{
  	.class		= (PCI_CLASS_BRIDGE_HOST << 8),
  	.class_mask	= ~0,
diff -urN linux-2.6.17-rc2/drivers/char/agp/ati-agp.c linux/drivers/char/agp/ati-agp.c
--- linux-2.6.17-rc2/drivers/char/agp/ati-agp.c	2006-04-24 13:30:54.000000000 +0200
+++ linux/drivers/char/agp/ati-agp.c	2006-04-25 16:12:22.000000000 +0200
@@ -526,7 +526,7 @@
  	agp_put_bridge(bridge);
  }

-static struct pci_device_id agp_ati_pci_table[] = {
+static struct pci_device_id agp_ati_pci_table[] __devinitdata = {
  	{
  	.class		= (PCI_CLASS_BRIDGE_HOST << 8),
  	.class_mask	= ~0,
diff -urN linux-2.6.17-rc2/drivers/char/agp/efficeon-agp.c linux/drivers/char/agp/efficeon-agp.c
--- linux-2.6.17-rc2/drivers/char/agp/efficeon-agp.c	2006-04-24 13:30:54.000000000 +0200
+++ linux/drivers/char/agp/efficeon-agp.c	2006-04-25 16:12:36.000000000 +0200
@@ -420,7 +420,7 @@
  }


-static struct pci_device_id agp_efficeon_pci_table[] = {
+static struct pci_device_id agp_efficeon_pci_table[] __devinitdata = {
  	{
  	.class		= (PCI_CLASS_BRIDGE_HOST << 8),
  	.class_mask	= ~0,
diff -urN linux-2.6.17-rc2/drivers/char/agp/i460-agp.c linux/drivers/char/agp/i460-agp.c
--- linux-2.6.17-rc2/drivers/char/agp/i460-agp.c	2006-04-24 13:30:54.000000000 +0200
+++ linux/drivers/char/agp/i460-agp.c	2006-04-25 16:12:56.000000000 +0200
@@ -607,7 +607,7 @@
  	agp_put_bridge(bridge);
  }

-static struct pci_device_id agp_intel_i460_pci_table[] = {
+static struct pci_device_id agp_intel_i460_pci_table[] __devinitdata = {
  	{
  	.class		= (PCI_CLASS_BRIDGE_HOST << 8),
  	.class_mask	= ~0,
diff -urN linux-2.6.17-rc2/drivers/char/agp/intel-agp.c linux/drivers/char/agp/intel-agp.c
--- linux-2.6.17-rc2/drivers/char/agp/intel-agp.c	2006-04-24 13:30:54.000000000 +0200
+++ linux/drivers/char/agp/intel-agp.c	2006-04-25 16:13:17.000000000 +0200
@@ -1790,7 +1790,7 @@
  	return 0;
  }

-static struct pci_device_id agp_intel_pci_table[] = {
+static struct pci_device_id agp_intel_pci_table[] __devinitdata = {
  #define ID(x)						\
  	{						\
  	.class		= (PCI_CLASS_BRIDGE_HOST << 8),	\
diff -urN linux-2.6.17-rc2/drivers/char/agp/nvidia-agp.c linux/drivers/char/agp/nvidia-agp.c
--- linux-2.6.17-rc2/drivers/char/agp/nvidia-agp.c	2006-04-24 13:30:54.000000000 +0200
+++ linux/drivers/char/agp/nvidia-agp.c	2006-04-25 16:13:32.000000000 +0200
@@ -376,7 +376,7 @@
  	agp_put_bridge(bridge);
  }

-static struct pci_device_id agp_nvidia_pci_table[] = {
+static struct pci_device_id agp_nvidia_pci_table[] __devinitdata = {
  	{
  	.class		= (PCI_CLASS_BRIDGE_HOST << 8),
  	.class_mask	= ~0,
diff -urN linux-2.6.17-rc2/drivers/char/agp/sis-agp.c linux/drivers/char/agp/sis-agp.c
--- linux-2.6.17-rc2/drivers/char/agp/sis-agp.c	2006-04-24 13:30:54.000000000 +0200
+++ linux/drivers/char/agp/sis-agp.c	2006-04-25 16:13:46.000000000 +0200
@@ -317,7 +317,7 @@
  	agp_put_bridge(bridge);
  }

-static struct pci_device_id agp_sis_pci_table[] = {
+static struct pci_device_id agp_sis_pci_table[] __devinitdata = {
  	{
  	.class		= (PCI_CLASS_BRIDGE_HOST << 8),
  	.class_mask	= ~0,
diff -urN linux-2.6.17-rc2/drivers/char/agp/sworks-agp.c linux/drivers/char/agp/sworks-agp.c
--- linux-2.6.17-rc2/drivers/char/agp/sworks-agp.c	2006-04-24 13:30:54.000000000 +0200
+++ linux/drivers/char/agp/sworks-agp.c	2006-04-25 16:14:00.000000000 +0200
@@ -528,7 +528,7 @@
  	agp_put_bridge(bridge);
  }

-static struct pci_device_id agp_serverworks_pci_table[] = {
+static struct pci_device_id agp_serverworks_pci_table[] __devinitdata = {
  	{
  	.class		= (PCI_CLASS_BRIDGE_HOST << 8),
  	.class_mask	= ~0,
diff -urN linux-2.6.17-rc2/drivers/char/agp/uninorth-agp.c linux/drivers/char/agp/uninorth-agp.c
--- linux-2.6.17-rc2/drivers/char/agp/uninorth-agp.c	2006-04-24 13:30:54.000000000 +0200
+++ linux/drivers/char/agp/uninorth-agp.c	2006-04-25 16:14:15.000000000 +0200
@@ -647,7 +647,7 @@
  	agp_put_bridge(bridge);
  }

-static struct pci_device_id agp_uninorth_pci_table[] = {
+static struct pci_device_id agp_uninorth_pci_table[] __devinitdata = {
  	{
  	.class		= (PCI_CLASS_BRIDGE_HOST << 8),
  	.class_mask	= ~0,
diff -urN linux-2.6.17-rc2/drivers/char/agp/via-agp.c linux/drivers/char/agp/via-agp.c
--- linux-2.6.17-rc2/drivers/char/agp/via-agp.c	2006-03-20 06:53:29.000000000 +0100
+++ linux/drivers/char/agp/via-agp.c	2006-04-25 16:14:37.000000000 +0200
@@ -479,7 +479,7 @@
  #endif /* CONFIG_PM */

  /* must be the same order as name table above */
-static struct pci_device_id agp_via_pci_table[] = {
+static struct pci_device_id agp_via_pci_table[] __devinitdata = {
  #define ID(x) \
  	{						\
  	.class		= (PCI_CLASS_BRIDGE_HOST << 8),	\
diff -urN linux-2.6.17-rc2/drivers/char/applicom.c linux/drivers/char/applicom.c
--- linux-2.6.17-rc2/drivers/char/applicom.c	2006-04-24 13:30:54.000000000 +0200
+++ linux/drivers/char/applicom.c	2006-04-25 16:04:44.000000000 +0200
@@ -65,7 +65,7 @@
  	"PCI2000PFB"
  };

-static struct pci_device_id applicom_pci_tbl[] = {
+static struct pci_device_id applicom_pci_tbl[] __devinitdata = {
  	{ PCI_VENDOR_ID_APPLICOM, PCI_DEVICE_ID_APPLICOM_PCIGENERIC,
  	  PCI_ANY_ID, PCI_ANY_ID, 0, 0, 0 },
  	{ PCI_VENDOR_ID_APPLICOM, PCI_DEVICE_ID_APPLICOM_PCI2000IBS_CAN,
diff -urN linux-2.6.17-rc2/drivers/char/cs5535_gpio.c linux/drivers/char/cs5535_gpio.c
--- linux-2.6.17-rc2/drivers/char/cs5535_gpio.c	2006-03-20 06:53:29.000000000 +0100
+++ linux/drivers/char/cs5535_gpio.c	2006-04-25 16:05:02.000000000 +0200
@@ -39,7 +39,7 @@

  static u32 gpio_base;

-static struct pci_device_id divil_pci[] = {
+static struct pci_device_id divil_pci[] __devinitdata = {
  	{ PCI_DEVICE(PCI_VENDOR_ID_NS,  PCI_DEVICE_ID_NS_CS5535_ISA) },
  	{ PCI_DEVICE(PCI_VENDOR_ID_AMD, PCI_DEVICE_ID_AMD_CS5536_ISA) },
  	{ } /* NULL entry */
diff -urN linux-2.6.17-rc2/drivers/char/drm/i810_drv.c linux/drivers/char/drm/i810_drv.c
--- linux-2.6.17-rc2/drivers/char/drm/i810_drv.c	2006-03-20 06:53:29.000000000 +0100
+++ linux/drivers/char/drm/i810_drv.c	2006-04-25 16:15:22.000000000 +0200
@@ -38,7 +38,7 @@

  #include "drm_pciids.h"

-static struct pci_device_id pciidlist[] = {
+static struct pci_device_id pciidlist[] __devinitdata = {
  	i810_PCI_IDS
  };

diff -urN linux-2.6.17-rc2/drivers/char/drm/i830_drv.c linux/drivers/char/drm/i830_drv.c
--- linux-2.6.17-rc2/drivers/char/drm/i830_drv.c	2006-03-20 06:53:29.000000000 +0100
+++ linux/drivers/char/drm/i830_drv.c	2006-04-25 16:15:42.000000000 +0200
@@ -40,7 +40,7 @@

  #include "drm_pciids.h"

-static struct pci_device_id pciidlist[] = {
+static struct pci_device_id pciidlist[] __devinitdata = {
  	i830_PCI_IDS
  };

diff -urN linux-2.6.17-rc2/drivers/char/drm/i915_drv.c linux/drivers/char/drm/i915_drv.c
--- linux-2.6.17-rc2/drivers/char/drm/i915_drv.c	2006-03-20 06:53:29.000000000 +0100
+++ linux/drivers/char/drm/i915_drv.c	2006-04-25 16:15:58.000000000 +0200
@@ -34,7 +34,7 @@

  #include "drm_pciids.h"

-static struct pci_device_id pciidlist[] = {
+static struct pci_device_id pciidlist[] __devinitdata = {
  	i915_PCI_IDS
  };

diff -urN linux-2.6.17-rc2/drivers/char/drm/mga_drv.c linux/drivers/char/drm/mga_drv.c
--- linux-2.6.17-rc2/drivers/char/drm/mga_drv.c	2006-03-20 06:53:29.000000000 +0100
+++ linux/drivers/char/drm/mga_drv.c	2006-04-25 16:16:15.000000000 +0200
@@ -39,7 +39,7 @@

  static int mga_driver_device_is_agp(drm_device_t * dev);

-static struct pci_device_id pciidlist[] = {
+static struct pci_device_id pciidlist[] __devinitdata = {
  	mga_PCI_IDS
  };

diff -urN linux-2.6.17-rc2/drivers/char/drm/r128_drv.c linux/drivers/char/drm/r128_drv.c
--- linux-2.6.17-rc2/drivers/char/drm/r128_drv.c	2006-03-20 06:53:29.000000000 +0100
+++ linux/drivers/char/drm/r128_drv.c	2006-04-25 16:19:17.000000000 +0200
@@ -37,7 +37,7 @@

  #include "drm_pciids.h"

-static struct pci_device_id pciidlist[] = {
+static struct pci_device_id pciidlist[] __devinitdata = {
  	r128_PCI_IDS
  };

diff -urN linux-2.6.17-rc2/drivers/char/drm/radeon_drv.c linux/drivers/char/drm/radeon_drv.c
--- linux-2.6.17-rc2/drivers/char/drm/radeon_drv.c	2006-03-20 06:53:29.000000000 +0100
+++ linux/drivers/char/drm/radeon_drv.c	2006-04-25 16:16:29.000000000 +0200
@@ -53,7 +53,7 @@
  		        "r300"));
  }

-static struct pci_device_id pciidlist[] = {
+static struct pci_device_id pciidlist[] __devinitdata = {
  	radeon_PCI_IDS
  };

diff -urN linux-2.6.17-rc2/drivers/char/drm/savage_drv.c linux/drivers/char/drm/savage_drv.c
--- linux-2.6.17-rc2/drivers/char/drm/savage_drv.c	2006-03-20 06:53:29.000000000 +0100
+++ linux/drivers/char/drm/savage_drv.c	2006-04-25 16:16:46.000000000 +0200
@@ -30,7 +30,7 @@

  #include "drm_pciids.h"

-static struct pci_device_id pciidlist[] = {
+static struct pci_device_id pciidlist[] __devinitdata = {
  	savage_PCI_IDS
  };

diff -urN linux-2.6.17-rc2/drivers/char/drm/sis_drv.c linux/drivers/char/drm/sis_drv.c
--- linux-2.6.17-rc2/drivers/char/drm/sis_drv.c	2006-03-20 06:53:29.000000000 +0100
+++ linux/drivers/char/drm/sis_drv.c	2006-04-25 16:17:11.000000000 +0200
@@ -32,7 +32,7 @@

  #include "drm_pciids.h"

-static struct pci_device_id pciidlist[] = {
+static struct pci_device_id pciidlist[] __devinitdata = {
  	sisdrv_PCI_IDS
  };

diff -urN linux-2.6.17-rc2/drivers/char/drm/tdfx_drv.c linux/drivers/char/drm/tdfx_drv.c
--- linux-2.6.17-rc2/drivers/char/drm/tdfx_drv.c	2006-03-20 06:53:29.000000000 +0100
+++ linux/drivers/char/drm/tdfx_drv.c	2006-04-25 16:17:47.000000000 +0200
@@ -36,7 +36,7 @@

  #include "drm_pciids.h"

-static struct pci_device_id pciidlist[] = {
+static struct pci_device_id pciidlist[] __devinitdata = {
  	tdfx_PCI_IDS
  };

diff -urN linux-2.6.17-rc2/drivers/char/drm/via_drv.c linux/drivers/char/drm/via_drv.c
--- linux-2.6.17-rc2/drivers/char/drm/via_drv.c	2006-03-20 06:53:29.000000000 +0100
+++ linux/drivers/char/drm/via_drv.c	2006-04-25 16:18:01.000000000 +0200
@@ -34,7 +34,7 @@
  	return snprintf(buf, PAGE_SIZE, "unichrome");
  }

-static struct pci_device_id pciidlist[] = {
+static struct pci_device_id pciidlist[] __devinitdata = {
  	viadrv_PCI_IDS
  };

diff -urN linux-2.6.17-rc2/drivers/char/epca.c linux/drivers/char/epca.c
--- linux-2.6.17-rc2/drivers/char/epca.c	2006-04-24 13:30:54.000000000 +0200
+++ linux/drivers/char/epca.c	2006-04-25 16:05:25.000000000 +0200
@@ -3090,7 +3090,7 @@
  }


-static struct pci_device_id epca_pci_tbl[] = {
+static struct pci_device_id epca_pci_tbl[] __devinitdata = {
  	{ PCI_VENDOR_DIGI, PCI_DEVICE_XR, PCI_ANY_ID, PCI_ANY_ID, 0, 0, brd_xr },
  	{ PCI_VENDOR_DIGI, PCI_DEVICE_XEM, PCI_ANY_ID, PCI_ANY_ID, 0, 0, brd_xem },
  	{ PCI_VENDOR_DIGI, PCI_DEVICE_CX, PCI_ANY_ID, PCI_ANY_ID, 0, 0, brd_cx },
diff -urN linux-2.6.17-rc2/drivers/char/hw_random.c linux/drivers/char/hw_random.c
--- linux-2.6.17-rc2/drivers/char/hw_random.c	2006-03-20 06:53:29.000000000 +0100
+++ linux/drivers/char/hw_random.c	2006-04-25 16:05:55.000000000 +0200
@@ -165,7 +165,7 @@
   * register a pci_driver, because someone else might one day
   * want to register another driver on the same PCI id.
   */
-static struct pci_device_id rng_pci_tbl[] = {
+static struct pci_device_id rng_pci_tbl[] __devinitdata = {
  	{ 0x1022, 0x7443, PCI_ANY_ID, PCI_ANY_ID, 0, 0, rng_hw_amd },
  	{ 0x1022, 0x746b, PCI_ANY_ID, PCI_ANY_ID, 0, 0, rng_hw_amd },

diff -urN linux-2.6.17-rc2/drivers/char/ipmi/ipmi_si_intf.c linux/drivers/char/ipmi/ipmi_si_intf.c
--- linux-2.6.17-rc2/drivers/char/ipmi/ipmi_si_intf.c	2006-04-24 13:30:54.000000000 +0200
+++ linux/drivers/char/ipmi/ipmi_si_intf.c	2006-04-25 16:20:04.000000000 +0200
@@ -1905,7 +1905,7 @@
  }
  #endif

-static struct pci_device_id ipmi_pci_devices[] = {
+static struct pci_device_id ipmi_pci_devices[] __devinitdata = {
  	{ PCI_DEVICE(PCI_HP_VENDOR_ID, PCI_MMC_DEVICE_ID) },
  	{ PCI_DEVICE_CLASS(PCI_ERMC_CLASSCODE, PCI_ERMC_CLASSCODE) }
  };
diff -urN linux-2.6.17-rc2/drivers/char/isicom.c linux/drivers/char/isicom.c
--- linux-2.6.17-rc2/drivers/char/isicom.c	2006-03-20 06:53:29.000000000 +0100
+++ linux/drivers/char/isicom.c	2006-04-25 16:06:16.000000000 +0200
@@ -148,7 +148,7 @@
  static int isicom_probe(struct pci_dev *, const struct pci_device_id *);
  static void __devexit isicom_remove(struct pci_dev *);

-static struct pci_device_id isicom_pci_tbl[] = {
+static struct pci_device_id isicom_pci_tbl[] __devinitdata = {
  	{ PCI_DEVICE(VENDOR_ID, 0x2028) },
  	{ PCI_DEVICE(VENDOR_ID, 0x2051) },
  	{ PCI_DEVICE(VENDOR_ID, 0x2052) },
diff -urN linux-2.6.17-rc2/drivers/char/istallion.c linux/drivers/char/istallion.c
--- linux-2.6.17-rc2/drivers/char/istallion.c	2006-04-24 13:30:54.000000000 +0200
+++ linux/drivers/char/istallion.c	2006-04-25 16:07:29.000000000 +0200
@@ -418,7 +418,7 @@
  #define	PCI_DEVICE_ID_ECRA		0x0004
  #endif

-static struct pci_device_id istallion_pci_tbl[] = {
+static struct pci_device_id istallion_pci_tbl[] __devinitdata = {
  	{ PCI_VENDOR_ID_STALLION, PCI_DEVICE_ID_ECRA, PCI_ANY_ID, PCI_ANY_ID, 0, 0, 0 },
  	{ 0 }
  };
diff -urN linux-2.6.17-rc2/drivers/char/moxa.c linux/drivers/char/moxa.c
--- linux-2.6.17-rc2/drivers/char/moxa.c	2006-03-20 06:53:29.000000000 +0100
+++ linux/drivers/char/moxa.c	2006-04-25 16:07:52.000000000 +0200
@@ -105,7 +105,7 @@
  };

  #ifdef CONFIG_PCI
-static struct pci_device_id moxa_pcibrds[] = {
+static struct pci_device_id moxa_pcibrds[] __devinitdata = {
  	{ PCI_VENDOR_ID_MOXA, PCI_DEVICE_ID_C218, PCI_ANY_ID, PCI_ANY_ID,
  	  0, 0, MOXA_BOARD_C218_PCI },
  	{ PCI_VENDOR_ID_MOXA, PCI_DEVICE_ID_C320, PCI_ANY_ID, PCI_ANY_ID,
diff -urN linux-2.6.17-rc2/drivers/char/mxser.c linux/drivers/char/mxser.c
--- linux-2.6.17-rc2/drivers/char/mxser.c	2006-04-24 13:30:54.000000000 +0200
+++ linux/drivers/char/mxser.c	2006-04-25 16:08:16.000000000 +0200
@@ -204,7 +204,7 @@

  #ifdef CONFIG_PCI

-static struct pci_device_id mxser_pcibrds[] = {
+static struct pci_device_id mxser_pcibrds[] __devinitdata = {
  	{PCI_VENDOR_ID_MOXA, PCI_DEVICE_ID_MOXA_C168, PCI_ANY_ID, PCI_ANY_ID, 0, 0, MXSER_BOARD_C168_PCI},
  	{PCI_VENDOR_ID_MOXA, PCI_DEVICE_ID_MOXA_C104, PCI_ANY_ID, PCI_ANY_ID, 0, 0, MXSER_BOARD_C104_PCI},
  	{PCI_VENDOR_ID_MOXA, PCI_DEVICE_ID_MOXA_CP132, PCI_ANY_ID, PCI_ANY_ID, 0, 0, MXSER_BOARD_CP132},
diff -urN linux-2.6.17-rc2/drivers/char/sx.c linux/drivers/char/sx.c
--- linux-2.6.17-rc2/drivers/char/sx.c	2006-04-24 13:30:54.000000000 +0200
+++ linux/drivers/char/sx.c	2006-04-25 16:08:35.000000000 +0200
@@ -252,7 +252,7 @@
  #endif

  #ifdef CONFIG_PCI
-static struct pci_device_id sx_pci_tbl[] = {
+static struct pci_device_id sx_pci_tbl[] __devinitdata = {
  	{ PCI_VENDOR_ID_SPECIALIX, PCI_DEVICE_ID_SPECIALIX_SX_XIO_IO8, PCI_ANY_ID, PCI_ANY_ID },
  	{ 0 }
  };
diff -urN linux-2.6.17-rc2/drivers/char/synclink.c linux/drivers/char/synclink.c
--- linux-2.6.17-rc2/drivers/char/synclink.c	2006-04-24 13:30:54.000000000 +0200
+++ linux/drivers/char/synclink.c	2006-04-25 16:08:52.000000000 +0200
@@ -905,7 +905,7 @@
  				     const struct pci_device_id *ent);
  static void synclink_remove_one (struct pci_dev *dev);

-static struct pci_device_id synclink_pci_tbl[] = {
+static struct pci_device_id synclink_pci_tbl[] __devinitdata = {
  	{ PCI_VENDOR_ID_MICROGATE, PCI_DEVICE_ID_MICROGATE_USC, PCI_ANY_ID, PCI_ANY_ID, },
  	{ PCI_VENDOR_ID_MICROGATE, 0x0210, PCI_ANY_ID, PCI_ANY_ID, },
  	{ 0, }, /* terminate list */
diff -urN linux-2.6.17-rc2/drivers/char/synclink_gt.c linux/drivers/char/synclink_gt.c
--- linux-2.6.17-rc2/drivers/char/synclink_gt.c	2006-04-24 13:30:54.000000000 +0200
+++ linux/drivers/char/synclink_gt.c	2006-04-25 16:09:07.000000000 +0200
@@ -99,7 +99,7 @@
  #define MGSL_MAGIC 0x5401
  #define MAX_DEVICES 12

-static struct pci_device_id pci_table[] = {
+static struct pci_device_id pci_table[] __devinitdata = {
  	{PCI_VENDOR_ID_MICROGATE, SYNCLINK_GT_DEVICE_ID, PCI_ANY_ID, PCI_ANY_ID,},
  	{PCI_VENDOR_ID_MICROGATE, SYNCLINK_GT4_DEVICE_ID, PCI_ANY_ID, PCI_ANY_ID,},
  	{PCI_VENDOR_ID_MICROGATE, SYNCLINK_AC_DEVICE_ID, PCI_ANY_ID, PCI_ANY_ID,},
diff -urN linux-2.6.17-rc2/drivers/char/synclinkmp.c linux/drivers/char/synclinkmp.c
--- linux-2.6.17-rc2/drivers/char/synclinkmp.c	2006-04-24 13:30:54.000000000 +0200
+++ linux/drivers/char/synclinkmp.c	2006-04-25 16:09:26.000000000 +0200
@@ -491,7 +491,7 @@
  static int synclinkmp_init_one(struct pci_dev *dev,const struct pci_device_id *ent);
  static void synclinkmp_remove_one(struct pci_dev *dev);

-static struct pci_device_id synclinkmp_pci_tbl[] = {
+static struct pci_device_id synclinkmp_pci_tbl[] __devinitdata = {
  	{ PCI_VENDOR_ID_MICROGATE, PCI_DEVICE_ID_MICROGATE_SCA, PCI_ANY_ID, PCI_ANY_ID, },
  	{ 0, }, /* terminate list */
  };
diff -urN linux-2.6.17-rc2/drivers/char/watchdog/alim1535_wdt.c linux/drivers/char/watchdog/alim1535_wdt.c
--- linux-2.6.17-rc2/drivers/char/watchdog/alim1535_wdt.c	2006-03-20 06:53:29.000000000 +0100
+++ linux/drivers/char/watchdog/alim1535_wdt.c	2006-04-25 16:20:31.000000000 +0200
@@ -311,7 +311,7 @@
   *	want to register another driver on the same PCI id.
   */

-static struct pci_device_id ali_pci_tbl[] = {
+static struct pci_device_id ali_pci_tbl[] __devinitdata = {
  	{ PCI_VENDOR_ID_AL, 0x1535, PCI_ANY_ID, PCI_ANY_ID,},
  	{ 0, },
  };
diff -urN linux-2.6.17-rc2/drivers/char/watchdog/i6300esb.c linux/drivers/char/watchdog/i6300esb.c
--- linux-2.6.17-rc2/drivers/char/watchdog/i6300esb.c	2006-03-20 06:53:29.000000000 +0100
+++ linux/drivers/char/watchdog/i6300esb.c	2006-04-25 16:20:45.000000000 +0200
@@ -364,7 +364,7 @@
   * register a pci_driver, because someone else might one day
   * want to register another driver on the same PCI id.
   */
-static struct pci_device_id esb_pci_tbl[] = {
+static struct pci_device_id esb_pci_tbl[] __devinitdata = {
          { PCI_DEVICE(PCI_VENDOR_ID_INTEL, PCI_DEVICE_ID_INTEL_ESB_9), },
          { 0, },                 /* End of list */
  };
diff -urN linux-2.6.17-rc2/drivers/char/watchdog/i8xx_tco.c linux/drivers/char/watchdog/i8xx_tco.c
--- linux-2.6.17-rc2/drivers/char/watchdog/i8xx_tco.c	2006-03-20 06:53:29.000000000 +0100
+++ linux/drivers/char/watchdog/i8xx_tco.c	2006-04-25 16:21:02.000000000 +0200
@@ -380,7 +380,7 @@
   * register a pci_driver, because someone else might one day
   * want to register another driver on the same PCI id.
   */
-static struct pci_device_id i8xx_tco_pci_tbl[] = {
+static struct pci_device_id i8xx_tco_pci_tbl[] __devinitdata = {
  	{ PCI_VENDOR_ID_INTEL, PCI_DEVICE_ID_INTEL_82801AA_0,	PCI_ANY_ID, PCI_ANY_ID, },
  	{ PCI_VENDOR_ID_INTEL, PCI_DEVICE_ID_INTEL_82801AB_0,	PCI_ANY_ID, PCI_ANY_ID, },
  	{ PCI_VENDOR_ID_INTEL, PCI_DEVICE_ID_INTEL_82801BA_0,	PCI_ANY_ID, PCI_ANY_ID, },
diff -urN linux-2.6.17-rc2/drivers/char/watchdog/pcwd_pci.c linux/drivers/char/watchdog/pcwd_pci.c
--- linux-2.6.17-rc2/drivers/char/watchdog/pcwd_pci.c	2006-03-20 06:53:29.000000000 +0100
+++ linux/drivers/char/watchdog/pcwd_pci.c	2006-04-25 16:21:24.000000000 +0200
@@ -747,7 +747,7 @@
  	cards_found--;
  }

-static struct pci_device_id pcipcwd_pci_tbl[] = {
+static struct pci_device_id pcipcwd_pci_tbl[] __devinitdata = {
  	{ PCI_VENDOR_ID_QUICKLOGIC, PCI_DEVICE_ID_WATCHDOG_PCIPCWD,
  		PCI_ANY_ID, PCI_ANY_ID, },
  	{ 0 },			/* End of list */
diff -urN linux-2.6.17-rc2/drivers/char/watchdog/wdt_pci.c linux/drivers/char/watchdog/wdt_pci.c
--- linux-2.6.17-rc2/drivers/char/watchdog/wdt_pci.c	2006-03-20 06:53:29.000000000 +0100
+++ linux/drivers/char/watchdog/wdt_pci.c	2006-04-25 16:21:49.000000000 +0200
@@ -698,7 +698,7 @@
  }


-static struct pci_device_id wdtpci_pci_tbl[] = {
+static struct pci_device_id wdtpci_pci_tbl[] __devinitdata = {
  	{
  		.vendor	   = PCI_VENDOR_ID_ACCESSIO,
  		.device	   = PCI_DEVICE_ID_WDG_CSM,
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
