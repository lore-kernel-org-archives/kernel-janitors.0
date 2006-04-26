From: Henne <henne@nachtwindheim.de>
Date: Wed, 26 Apr 2006 19:44:59 +0000
Subject: [KJ] [PATCH] __devinitdata to media-subsys
Message-Id: <444FCDBB.1060307@nachtwindheim.de>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

From: Henrik Kretzschmar <henne@nachtwindheim.de>

Marking the pci_device_id tables of the media-subsys as __devinitdata.
Signed-off-by: Henrik Kretzschmar <henne@nachtwindheim.de>
---

diff -urN linux-2.6.17-rc2/drivers/media/dvb/b2c2/flexcop-pci.c linux/drivers/media/dvb/b2c2/flexcop-pci.c
--- linux-2.6.17-rc2/drivers/media/dvb/b2c2/flexcop-pci.c	2006-03-20 06:53:29.000000000 +0100
+++ linux/drivers/media/dvb/b2c2/flexcop-pci.c	2006-04-26 21:25:05.000000000 +0200
@@ -402,7 +402,7 @@
  	flexcop_device_kfree(fc_pci->fc_dev);
  }

-static struct pci_device_id flexcop_pci_tbl[] = {
+static struct pci_device_id flexcop_pci_tbl[] __devinitdata = {
  	{ PCI_DEVICE(0x13d0, 0x2103) },
  /*	{ PCI_DEVICE(0x13d0, 0x2200) }, ? */
  	{ },
diff -urN linux-2.6.17-rc2/drivers/media/dvb/ttpci/av7110.c linux/drivers/media/dvb/ttpci/av7110.c
--- linux-2.6.17-rc2/drivers/media/dvb/ttpci/av7110.c	2006-04-24 13:30:56.000000000 +0200
+++ linux/drivers/media/dvb/ttpci/av7110.c	2006-04-26 21:26:18.000000000 +0200
@@ -2768,7 +2768,7 @@
  MAKE_AV7110_INFO(fss,        "Fujitsu Siemens DVB-S rev1.6");
  MAKE_AV7110_INFO(gxs_1_3,    "Galaxis DVB-S rev1.3");

-static struct pci_device_id pci_tbl[] = {
+static struct pci_device_id pci_tbl[] __devinitdata = {
  	MAKE_EXTENSION_PCI(fsc,         0x110a, 0x0000),
  	MAKE_EXTENSION_PCI(tts_1_X_fsc, 0x13c2, 0x0000),
  	MAKE_EXTENSION_PCI(ttt_1_X,     0x13c2, 0x0001),
diff -urN linux-2.6.17-rc2/drivers/media/dvb/ttpci/budget-av.c linux/drivers/media/dvb/ttpci/budget-av.c
--- linux-2.6.17-rc2/drivers/media/dvb/ttpci/budget-av.c	2006-04-24 13:30:56.000000000 +0200
+++ linux/drivers/media/dvb/ttpci/budget-av.c	2006-04-26 21:26:53.000000000 +0200
@@ -1299,7 +1299,7 @@
  MAKE_BUDGET_INFO(cin1200c, "Terratec Cinergy 1200 DVB-C", BUDGET_CIN1200C);
  MAKE_BUDGET_INFO(cin1200t, "Terratec Cinergy 1200 DVB-T", BUDGET_CIN1200T);

-static struct pci_device_id pci_tbl[] = {
+static struct pci_device_id pci_tbl[] __devinitdata = {
  	MAKE_EXTENSION_PCI(knc1s, 0x1131, 0x4f56),
  	MAKE_EXTENSION_PCI(knc1s, 0x1131, 0x0010),
  	MAKE_EXTENSION_PCI(knc1s, 0x1894, 0x0010),
diff -urN linux-2.6.17-rc2/drivers/media/dvb/ttpci/budget.c linux/drivers/media/dvb/ttpci/budget.c
--- linux-2.6.17-rc2/drivers/media/dvb/ttpci/budget.c	2006-04-24 13:30:56.000000000 +0200
+++ linux/drivers/media/dvb/ttpci/budget.c	2006-04-26 21:27:57.000000000 +0200
@@ -484,7 +484,7 @@
  MAKE_BUDGET_INFO(fsacs0, "Fujitsu Siemens Activy Budget-S PCI (rev GR/grundig frontend)", BUDGET_FS_ACTIVY);
  MAKE_BUDGET_INFO(fsacs1, "Fujitsu Siemens Activy Budget-S PCI (rev AL/alps frontend)", BUDGET_FS_ACTIVY);

-static struct pci_device_id pci_tbl[] = {
+static struct pci_device_id pci_tbl[] __devinitdata = {
  	MAKE_EXTENSION_PCI(ttbs,  0x13c2, 0x1003),
  	MAKE_EXTENSION_PCI(ttbc,  0x13c2, 0x1004),
  	MAKE_EXTENSION_PCI(ttbt,  0x13c2, 0x1005),
diff -urN linux-2.6.17-rc2/drivers/media/dvb/ttpci/budget-ci.c linux/drivers/media/dvb/ttpci/budget-ci.c
--- linux-2.6.17-rc2/drivers/media/dvb/ttpci/budget-ci.c	2006-04-24 13:30:56.000000000 +0200
+++ linux/drivers/media/dvb/ttpci/budget-ci.c	2006-04-26 21:28:13.000000000 +0200
@@ -1052,7 +1052,7 @@
  MAKE_BUDGET_INFO(ttbtci, "TT-Budget-T-CI PCI", BUDGET_TT);
  MAKE_BUDGET_INFO(ttbcci, "TT-Budget-C-CI PCI", BUDGET_TT);

-static struct pci_device_id pci_tbl[] = {
+static struct pci_device_id pci_tbl[] __devinitdata = {
  	MAKE_EXTENSION_PCI(ttbci, 0x13c2, 0x100c),
  	MAKE_EXTENSION_PCI(ttbci, 0x13c2, 0x100f),
  	MAKE_EXTENSION_PCI(ttbcci, 0x13c2, 0x1010),
diff -urN linux-2.6.17-rc2/drivers/media/dvb/ttpci/budget-patch.c linux/drivers/media/dvb/ttpci/budget-patch.c
--- linux-2.6.17-rc2/drivers/media/dvb/ttpci/budget-patch.c	2006-04-24 13:30:56.000000000 +0200
+++ linux/drivers/media/dvb/ttpci/budget-patch.c	2006-04-26 21:28:30.000000000 +0200
@@ -46,7 +46,7 @@
  MAKE_BUDGET_INFO(ttbp, "TT-Budget/Patch DVB-S 1.x PCI", BUDGET_PATCH);
  //MAKE_BUDGET_INFO(satel,"TT-Budget/Patch SATELCO PCI", BUDGET_TT_HW_DISEQC);

-static struct pci_device_id pci_tbl[] = {
+static struct pci_device_id pci_tbl[] __devinitdata = {
  	MAKE_EXTENSION_PCI(ttbp,0x13c2, 0x0000),
  //        MAKE_EXTENSION_PCI(satel, 0x13c2, 0x1013),
  	{
diff -urN linux-2.6.17-rc2/drivers/media/radio/radio-gemtek-pci.c linux/drivers/media/radio/radio-gemtek-pci.c
--- linux-2.6.17-rc2/drivers/media/radio/radio-gemtek-pci.c	2006-03-20 06:53:29.000000000 +0100
+++ linux/drivers/media/radio/radio-gemtek-pci.c	2006-04-26 21:30:20.000000000 +0200
@@ -285,7 +285,7 @@
  	"GEMTEK_PR103"
  };

-static struct pci_device_id gemtek_pci_id[] +static struct pci_device_id gemtek_pci_id[] __devinitdata   {
  	{ PCI_VENDOR_ID_GEMTEK, PCI_DEVICE_ID_GEMTEK_PR103,
  	  PCI_ANY_ID, PCI_ANY_ID, 0, 0, GEMTEK_PR103 },
diff -urN linux-2.6.17-rc2/drivers/media/radio/radio-maestro.c linux/drivers/media/radio/radio-maestro.c
--- linux-2.6.17-rc2/drivers/media/radio/radio-maestro.c	2006-04-24 13:30:56.000000000 +0200
+++ linux/drivers/media/radio/radio-maestro.c	2006-04-26 21:30:57.000000000 +0200
@@ -66,7 +66,7 @@
  static int maestro_probe(struct pci_dev *pdev, const struct pci_device_id *ent);
  static void maestro_remove(struct pci_dev *pdev);

-static struct pci_device_id maestro_r_pci_tbl[] = {
+static struct pci_device_id maestro_r_pci_tbl[] __devinitdata = {
  	{ PCI_DEVICE(PCI_VENDOR_ID_ESS, PCI_DEVICE_ID_ESS_ESS1968),
  		.class = PCI_CLASS_MULTIMEDIA_AUDIO << 8,
  		.class_mask = 0xffff00 },
diff -urN linux-2.6.17-rc2/drivers/media/radio/radio-maxiradio.c linux/drivers/media/radio/radio-maxiradio.c
--- linux-2.6.17-rc2/drivers/media/radio/radio-maxiradio.c	2006-04-24 13:30:56.000000000 +0200
+++ linux/drivers/media/radio/radio-maxiradio.c	2006-04-26 21:31:29.000000000 +0200
@@ -322,7 +322,7 @@
  	release_region(pci_resource_start(pdev, 0), pci_resource_len(pdev, 0));
  }

-static struct pci_device_id maxiradio_pci_tbl[] = {
+static struct pci_device_id maxiradio_pci_tbl[] __devinitdata = {
  	{ PCI_VENDOR_ID_GUILLEMOT, PCI_DEVICE_ID_GUILLEMOT_MAXIRADIO,
  		PCI_ANY_ID, PCI_ANY_ID, },
  	{ 0,}
diff -urN linux-2.6.17-rc2/drivers/media/video/bt8xx/bttv-driver.c linux/drivers/media/video/bt8xx/bttv-driver.c
--- linux-2.6.17-rc2/drivers/media/video/bt8xx/bttv-driver.c	2006-04-24 13:30:56.000000000 +0200
+++ linux/drivers/media/video/bt8xx/bttv-driver.c	2006-04-26 21:32:41.000000000 +0200
@@ -4260,7 +4260,7 @@
  	return 0;
  }

-static struct pci_device_id bttv_pci_tbl[] = {
+static struct pci_device_id bttv_pci_tbl[] __devinitdata = {
  	{PCI_VENDOR_ID_BROOKTREE, PCI_DEVICE_ID_BT848,
  	 PCI_ANY_ID, PCI_ANY_ID, 0, 0, 0},
  	{PCI_VENDOR_ID_BROOKTREE, PCI_DEVICE_ID_BT849,
diff -urN linux-2.6.17-rc2/drivers/media/video/cx88/cx88-blackbird.c linux/drivers/media/video/cx88/cx88-blackbird.c
--- linux-2.6.17-rc2/drivers/media/video/cx88/cx88-blackbird.c	2006-04-24 13:30:56.000000000 +0200
+++ linux/drivers/media/video/cx88/cx88-blackbird.c	2006-04-26 21:33:27.000000000 +0200
@@ -1735,7 +1735,7 @@
  	kfree(dev);
  }

-static struct pci_device_id cx8802_pci_tbl[] = {
+static struct pci_device_id cx8802_pci_tbl[] __devinitdata = {
  	{
  		.vendor       = 0x14f1,
  		.device       = 0x8802,
diff -urN linux-2.6.17-rc2/drivers/media/video/cx88/cx88-dvb.c linux/drivers/media/video/cx88/cx88-dvb.c
--- linux-2.6.17-rc2/drivers/media/video/cx88/cx88-dvb.c	2006-04-24 13:30:56.000000000 +0200
+++ linux/drivers/media/video/cx88/cx88-dvb.c	2006-04-26 21:33:52.000000000 +0200
@@ -781,7 +781,7 @@
  	kfree(dev);
  }

-static struct pci_device_id cx8802_pci_tbl[] = {
+static struct pci_device_id cx8802_pci_tbl[] __devinitdata = {
  	{
  		.vendor       = 0x14f1,
  		.device       = 0x8802,
diff -urN linux-2.6.17-rc2/drivers/media/video/cx88/cx88-video.c linux/drivers/media/video/cx88/cx88-video.c
--- linux-2.6.17-rc2/drivers/media/video/cx88/cx88-video.c	2006-04-24 13:30:56.000000000 +0200
+++ linux/drivers/media/video/cx88/cx88-video.c	2006-04-26 21:34:41.000000000 +0200
@@ -2065,7 +2065,7 @@

  /* ----------------------------------------------------------- */

-static struct pci_device_id cx8800_pci_tbl[] = {
+static struct pci_device_id cx8800_pci_tbl[] __devinitdata = {
  	{
  		.vendor       = 0x14f1,
  		.device       = 0x8800,
diff -urN linux-2.6.17-rc2/drivers/media/video/dpc7146.c linux/drivers/media/video/dpc7146.c
--- linux-2.6.17-rc2/drivers/media/video/dpc7146.c	2006-04-24 13:30:56.000000000 +0200
+++ linux/drivers/media/video/dpc7146.c	2006-04-26 21:35:46.000000000 +0200
@@ -338,7 +338,7 @@
  	.ext = &extension,
  };

-static struct pci_device_id pci_tbl[] = {
+static struct pci_device_id pci_tbl[] __devinitdata = {
  	{
  		.vendor    = PCI_VENDOR_ID_PHILIPS,
  		.device	   = PCI_DEVICE_ID_PHILIPS_SAA7146,
diff -urN linux-2.6.17-rc2/drivers/media/video/hexium_gemini.c linux/drivers/media/video/hexium_gemini.c
--- linux-2.6.17-rc2/drivers/media/video/hexium_gemini.c	2006-04-24 13:30:56.000000000 +0200
+++ linux/drivers/media/video/hexium_gemini.c	2006-04-26 21:36:02.000000000 +0200
@@ -486,7 +486,7 @@
  	.ext = &hexium_extension,
  };

-static struct pci_device_id pci_tbl[] = {
+static struct pci_device_id pci_tbl[] __devinitdata = {
  	{
  	 .vendor = PCI_VENDOR_ID_PHILIPS,
  	 .device = PCI_DEVICE_ID_PHILIPS_SAA7146,
diff -urN linux-2.6.17-rc2/drivers/media/video/hexium_orion.c linux/drivers/media/video/hexium_orion.c
--- linux-2.6.17-rc2/drivers/media/video/hexium_orion.c	2006-04-24 13:30:56.000000000 +0200
+++ linux/drivers/media/video/hexium_orion.c	2006-04-26 21:36:15.000000000 +0200
@@ -444,7 +444,7 @@
  	.ext = &extension,
  };

-static struct pci_device_id pci_tbl[] = {
+static struct pci_device_id pci_tbl[] __devinitdata = {
  	{
  	 .vendor = PCI_VENDOR_ID_PHILIPS,
  	 .device = PCI_DEVICE_ID_PHILIPS_SAA7146,
diff -urN linux-2.6.17-rc2/drivers/media/video/meye.c linux/drivers/media/video/meye.c
--- linux-2.6.17-rc2/drivers/media/video/meye.c	2006-04-24 13:30:56.000000000 +0200
+++ linux/drivers/media/video/meye.c	2006-04-26 21:36:37.000000000 +0200
@@ -2002,7 +2002,7 @@
  	printk(KERN_INFO "meye: removed\n");
  }

-static struct pci_device_id meye_pci_tbl[] = {
+static struct pci_device_id meye_pci_tbl[] __devinitdata = {
  	{ PCI_VENDOR_ID_KAWASAKI, PCI_DEVICE_ID_MCHIP_KL5A72002,
  	  PCI_ANY_ID, PCI_ANY_ID, 0, 0, 0 },
  	{ }
diff -urN linux-2.6.17-rc2/drivers/media/video/mxb.c linux/drivers/media/video/mxb.c
--- linux-2.6.17-rc2/drivers/media/video/mxb.c	2006-04-24 13:30:56.000000000 +0200
+++ linux/drivers/media/video/mxb.c	2006-04-26 21:36:58.000000000 +0200
@@ -979,7 +979,7 @@
  	.ext = &extension,
  };

-static struct pci_device_id pci_tbl[] = {
+static struct pci_device_id pci_tbl[] __devinitdata = {
  	{
  		.vendor    = PCI_VENDOR_ID_PHILIPS,
  		.device	   = PCI_DEVICE_ID_PHILIPS_SAA7146,
diff -urN linux-2.6.17-rc2/drivers/media/video/stradis.c linux/drivers/media/video/stradis.c
--- linux-2.6.17-rc2/drivers/media/video/stradis.c	2006-04-24 13:30:56.000000000 +0200
+++ linux/drivers/media/video/stradis.c	2006-04-26 21:37:13.000000000 +0200
@@ -2175,7 +2175,7 @@
  	stradis_release_saa(pdev);
  }

-static struct pci_device_id stradis_pci_tbl[] = {
+static struct pci_device_id stradis_pci_tbl[] __devinitdata = {
  	{ PCI_DEVICE(PCI_VENDOR_ID_PHILIPS, PCI_DEVICE_ID_PHILIPS_SAA7146) },
  	{ 0 }
  };
diff -urN linux-2.6.17-rc2/drivers/media/video/zoran_card.c linux/drivers/media/video/zoran_card.c
--- linux-2.6.17-rc2/drivers/media/video/zoran_card.c	2006-04-24 13:30:56.000000000 +0200
+++ linux/drivers/media/video/zoran_card.c	2006-04-26 21:37:34.000000000 +0200
@@ -147,7 +147,7 @@
  MODULE_AUTHOR("Serguei Miridonov");
  MODULE_LICENSE("GPL");

-static struct pci_device_id zr36067_pci_tbl[] = {
+static struct pci_device_id zr36067_pci_tbl[] __devinitdata = {
  	{PCI_VENDOR_ID_ZORAN, PCI_DEVICE_ID_ZORAN_36057,
  	 PCI_ANY_ID, PCI_ANY_ID, 0, 0, 0},
  	{0}
diff -urN linux-2.6.17-rc2/drivers/media/video/zr36120.c linux/drivers/media/video/zr36120.c
--- linux-2.6.17-rc2/drivers/media/video/zr36120.c	2006-04-24 13:30:56.000000000 +0200
+++ linux/drivers/media/video/zr36120.c	2006-04-26 21:38:05.000000000 +0200
@@ -59,7 +59,7 @@
  static int video_nr = -1;
  static int vbi_nr = -1;

-static struct pci_device_id zr36120_pci_tbl[] = {
+static struct pci_device_id zr36120_pci_tbl[] __devinitdata = {
  	{ PCI_VENDOR_ID_ZORAN,PCI_DEVICE_ID_ZORAN_36120,
  	  PCI_ANY_ID, PCI_ANY_ID, 0, 0, 0 },
  	{ 0 }
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
