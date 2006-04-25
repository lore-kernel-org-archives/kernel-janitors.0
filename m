From: Henne <henne@nachtwindheim.de>
Date: Tue, 25 Apr 2006 16:31:15 +0000
Subject: [KJ] [PATCH] Marking the pci_device_id tables of the scsi-subsys as
Message-Id: <444E4ED3.9010205@nachtwindheim.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <444CEB94.4010109@nachtwindheim.de>
In-Reply-To: <444CEB94.4010109@nachtwindheim.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

From: Henrik Kretzschmar <henne@nachtwindheim.de>

Marking the pci_device_id tables of the scsi-subsys as __devinitdata.
Signed-off-by: Henrik Kretzschmar <henne@nachtwindheim.de>
---

diff -urN linux-2.6.17-rc2/drivers/scsi/a100u2w.c linux/drivers/scsi/a100u2w.c
--- linux-2.6.17-rc2/drivers/scsi/a100u2w.c	2006-04-24 13:31:00.000000000 +0200
+++ linux/drivers/scsi/a100u2w.c	2006-04-25 18:06:16.000000000 +0200
@@ -1172,7 +1172,7 @@
  	scsi_host_put(shost);
  }

-static struct pci_device_id inia100_pci_tbl[] = {
+static struct pci_device_id inia100_pci_tbl[] __devinitdata = {
  	{PCI_VENDOR_ID_INIT, 0x1060, PCI_ANY_ID, PCI_ANY_ID, 0, 0, 0},
  	{0,}
  };
diff -urN linux-2.6.17-rc2/drivers/scsi/aacraid/linit.c linux/drivers/scsi/aacraid/linit.c
--- linux-2.6.17-rc2/drivers/scsi/aacraid/linit.c	2006-04-24 13:31:00.000000000 +0200
+++ linux/drivers/scsi/aacraid/linit.c	2006-04-25 18:06:50.000000000 +0200
@@ -88,7 +88,7 @@
   *
   * Note: The last field is used to index into aac_drivers below.
   */
-static struct pci_device_id aac_pci_tbl[] = {
+static struct pci_device_id aac_pci_tbl[] __devinitdata = {
  	{ 0x1028, 0x0001, 0x1028, 0x0001, 0, 0, 0 }, /* PERC 2/Si (Iguana/PERC2Si) */
  	{ 0x1028, 0x0002, 0x1028, 0x0002, 0, 0, 1 }, /* PERC 3/Di (Opal/PERC3Di) */
  	{ 0x1028, 0x0003, 0x1028, 0x0003, 0, 0, 2 }, /* PERC 3/Si (SlimFast/PERC3Si */
diff -urN linux-2.6.17-rc2/drivers/scsi/ahci.c linux/drivers/scsi/ahci.c
--- linux-2.6.17-rc2/drivers/scsi/ahci.c	2006-04-24 13:31:00.000000000 +0200
+++ linux/drivers/scsi/ahci.c	2006-04-25 18:19:42.000000000 +0200
@@ -257,7 +257,7 @@
  	},
  };

-static const struct pci_device_id ahci_pci_tbl[] = {
+static const struct pci_device_id ahci_pci_tbl[] __devinitdata = {
  	{ PCI_VENDOR_ID_INTEL, 0x2652, PCI_ANY_ID, PCI_ANY_ID, 0, 0,
  	  board_ahci }, /* ICH6 */
  	{ PCI_VENDOR_ID_INTEL, 0x2653, PCI_ANY_ID, PCI_ANY_ID, 0, 0,
diff -urN linux-2.6.17-rc2/drivers/scsi/aic7xxx/aic79xx_osm_pci.c linux/drivers/scsi/aic7xxx/aic79xx_osm_pci.c
--- linux-2.6.17-rc2/drivers/scsi/aic7xxx/aic79xx_osm_pci.c	2006-03-20 06:53:29.000000000 +0100
+++ linux/drivers/scsi/aic7xxx/aic79xx_osm_pci.c	2006-04-25 18:08:14.000000000 +0200
@@ -58,7 +58,7 @@
  	ID2C(x),         \
  	ID2C(IDIROC(x))

-static struct pci_device_id ahd_linux_pci_id_table[] = {
+static struct pci_device_id ahd_linux_pci_id_table[] __devinitdata = {
  	/* aic7901 based controllers */
  	ID(ID_AHA_29320A),
  	ID(ID_AHA_29320ALP),
diff -urN linux-2.6.17-rc2/drivers/scsi/aic7xxx/aic7xxx_osm_pci.c linux/drivers/scsi/aic7xxx/aic7xxx_osm_pci.c
--- linux-2.6.17-rc2/drivers/scsi/aic7xxx/aic7xxx_osm_pci.c	2006-03-20 06:53:29.000000000 +0100
+++ linux/drivers/scsi/aic7xxx/aic7xxx_osm_pci.c	2006-04-25 18:08:31.000000000 +0200
@@ -55,7 +55,7 @@
  */
  #define ID(x)	ID_C(x, PCI_CLASS_STORAGE_SCSI)

-static struct pci_device_id ahc_linux_pci_id_table[] = {
+static struct pci_device_id ahc_linux_pci_id_table[] __devinitdata = {
  	/* aic7850 based controllers */
  	ID(ID_AHA_2902_04_10_15_20C_30C),
  	/* aic7860 based controllers */
diff -urN linux-2.6.17-rc2/drivers/scsi/ata_piix.c linux/drivers/scsi/ata_piix.c
--- linux-2.6.17-rc2/drivers/scsi/ata_piix.c	2006-04-24 13:31:01.000000000 +0200
+++ linux/drivers/scsi/ata_piix.c	2006-04-25 18:19:57.000000000 +0200
@@ -154,7 +154,7 @@

  static unsigned int in_module_init = 1;

-static const struct pci_device_id piix_pci_tbl[] = {
+static const struct pci_device_id piix_pci_tbl[] __devinitdata = {
  #ifdef ATA_ENABLE_PATA
  	{ 0x8086, 0x7111, PCI_ANY_ID, PCI_ANY_ID, 0, 0, piix4_pata },
  	{ 0x8086, 0x24db, PCI_ANY_ID, PCI_ANY_ID, 0, 0, ich5_pata },
diff -urN linux-2.6.17-rc2/drivers/scsi/atp870u.c linux/drivers/scsi/atp870u.c
--- linux-2.6.17-rc2/drivers/scsi/atp870u.c	2006-04-24 13:31:01.000000000 +0200
+++ linux/drivers/scsi/atp870u.c	2006-04-25 18:08:53.000000000 +0200
@@ -3238,7 +3238,7 @@
       .max_sectors		= ATP870U_MAX_SECTORS,
  };

-static struct pci_device_id atp870u_id_table[] = {
+static struct pci_device_id atp870u_id_table[] __devinitdata = {
  	{ PCI_DEVICE(PCI_VENDOR_ID_ARTOP, ATP885_DEVID)			  },
  	{ PCI_DEVICE(PCI_VENDOR_ID_ARTOP, ATP880_DEVID1)			  },
  	{ PCI_DEVICE(PCI_VENDOR_ID_ARTOP, ATP880_DEVID2)			  },
diff -urN linux-2.6.17-rc2/drivers/scsi/dc395x.c linux/drivers/scsi/dc395x.c
--- linux-2.6.17-rc2/drivers/scsi/dc395x.c	2006-03-20 06:53:29.000000000 +0100
+++ linux/drivers/scsi/dc395x.c	2006-04-25 18:09:12.000000000 +0200
@@ -4898,7 +4898,7 @@
  }


-static struct pci_device_id dc395x_pci_table[] = {
+static struct pci_device_id dc395x_pci_table[] __devinitdata = {
  	{
  		.vendor		= PCI_VENDOR_ID_TEKRAM,
  		.device		= PCI_DEVICE_ID_TEKRAM_TRMS1040,
diff -urN linux-2.6.17-rc2/drivers/scsi/dmx3191d.c linux/drivers/scsi/dmx3191d.c
--- linux-2.6.17-rc2/drivers/scsi/dmx3191d.c	2006-04-24 13:31:01.000000000 +0200
+++ linux/drivers/scsi/dmx3191d.c	2006-04-25 18:09:29.000000000 +0200
@@ -139,7 +139,7 @@
  	scsi_host_put(shost);
  }

-static struct pci_device_id dmx3191d_pci_tbl[] = {
+static struct pci_device_id dmx3191d_pci_tbl[] __devinitdata = {
  	{PCI_VENDOR_ID_DOMEX, PCI_DEVICE_ID_DOMEX_DMX3191D,
  		PCI_ANY_ID, PCI_ANY_ID, 0, 0, 4},
  	{ }
diff -urN linux-2.6.17-rc2/drivers/scsi/dpt_i2o.c linux/drivers/scsi/dpt_i2o.c
--- linux-2.6.17-rc2/drivers/scsi/dpt_i2o.c	2006-04-24 13:31:01.000000000 +0200
+++ linux/drivers/scsi/dpt_i2o.c	2006-04-25 18:09:50.000000000 +0200
@@ -168,7 +168,7 @@
   *======================================
   */

-static struct pci_device_id dptids[] = {
+static struct pci_device_id dptids[] __devinitdata = {
  	{ PCI_DPT_VENDOR_ID, PCI_DPT_DEVICE_ID, PCI_ANY_ID, PCI_ANY_ID,},
  	{ PCI_DPT_VENDOR_ID, PCI_DPT_RAPTOR_DEVICE_ID, PCI_ANY_ID, PCI_ANY_ID,},
  	{ 0, }
diff -urN linux-2.6.17-rc2/drivers/scsi/lpfc/lpfc_init.c linux/drivers/scsi/lpfc/lpfc_init.c
--- linux-2.6.17-rc2/drivers/scsi/lpfc/lpfc_init.c	2006-04-24 13:31:01.000000000 +0200
+++ linux/drivers/scsi/lpfc/lpfc_init.c	2006-04-25 18:12:49.000000000 +0200
@@ -1788,7 +1788,7 @@
  	pci_set_drvdata(pdev, NULL);
  }

-static struct pci_device_id lpfc_id_table[] = {
+static struct pci_device_id lpfc_id_table[] __devinitdata = {
  	{PCI_VENDOR_ID_EMULEX, PCI_DEVICE_ID_VIPER,
  		PCI_ANY_ID, PCI_ANY_ID, },
  	{PCI_VENDOR_ID_EMULEX, PCI_DEVICE_ID_FIREFLY,
diff -urN linux-2.6.17-rc2/drivers/scsi/megaraid/megaraid_mbox.c linux/drivers/scsi/megaraid/megaraid_mbox.c
--- linux-2.6.17-rc2/drivers/scsi/megaraid/megaraid_mbox.c	2006-04-24 13:31:01.000000000 +0200
+++ linux/drivers/scsi/megaraid/megaraid_mbox.c	2006-04-25 18:14:02.000000000 +0200
@@ -209,7 +209,7 @@
  /*
   * PCI table for all supported controllers.
   */
-static struct pci_device_id pci_id_table_g[] =  {
+static struct pci_device_id pci_id_table_g[] __devinitdata = {
  	{
  		PCI_VENDOR_ID_DELL,
  		PCI_DEVICE_ID_PERC4_DI_DISCOVERY,
diff -urN linux-2.6.17-rc2/drivers/scsi/megaraid/megaraid_sas.c linux/drivers/scsi/megaraid/megaraid_sas.c
--- linux-2.6.17-rc2/drivers/scsi/megaraid/megaraid_sas.c	2006-04-24 13:31:01.000000000 +0200
+++ linux/drivers/scsi/megaraid/megaraid_sas.c	2006-04-25 18:13:55.000000000 +0200
@@ -51,7 +51,7 @@
  /*
   * PCI ID table for all supported controllers
   */
-static struct pci_device_id megasas_pci_table[] = {
+static struct pci_device_id megasas_pci_table[] __devinitdata = {

  	{
  	 PCI_VENDOR_ID_LSI_LOGIC,
diff -urN linux-2.6.17-rc2/drivers/scsi/megaraid.c linux/drivers/scsi/megaraid.c
--- linux-2.6.17-rc2/drivers/scsi/megaraid.c	2006-04-24 13:31:01.000000000 +0200
+++ linux/drivers/scsi/megaraid.c	2006-04-25 18:14:22.000000000 +0200
@@ -5038,7 +5038,7 @@
  	__megaraid_shutdown(adapter);
  }

-static struct pci_device_id megaraid_pci_tbl[] = {
+static struct pci_device_id megaraid_pci_tbl[] __devinitdata = {
  	{PCI_VENDOR_ID_AMI, PCI_DEVICE_ID_AMI_MEGARAID,
  		PCI_ANY_ID, PCI_ANY_ID, 0, 0, 0},
  	{PCI_VENDOR_ID_AMI, PCI_DEVICE_ID_AMI_MEGARAID2,
diff -urN linux-2.6.17-rc2/drivers/scsi/pdc_adma.c linux/drivers/scsi/pdc_adma.c
--- linux-2.6.17-rc2/drivers/scsi/pdc_adma.c	2006-04-24 13:31:01.000000000 +0200
+++ linux/drivers/scsi/pdc_adma.c	2006-04-25 18:20:10.000000000 +0200
@@ -188,7 +188,7 @@
  	},
  };

-static const struct pci_device_id adma_ata_pci_tbl[] = {
+static const struct pci_device_id adma_ata_pci_tbl[] __devinitdata = {
  	{ PCI_VENDOR_ID_PDC, 0x1841, PCI_ANY_ID, PCI_ANY_ID, 0, 0,
  	  board_1841_idx },

diff -urN linux-2.6.17-rc2/drivers/scsi/qla1280.c linux/drivers/scsi/qla1280.c
--- linux-2.6.17-rc2/drivers/scsi/qla1280.c	2006-04-24 13:31:01.000000000 +0200
+++ linux/drivers/scsi/qla1280.c	2006-04-25 18:15:11.000000000 +0200
@@ -579,7 +579,7 @@
  };

  /* NOTE: the last argument in each entry is used to index ql1280_board_tbl */
-static struct pci_device_id qla1280_pci_tbl[] = {
+static struct pci_device_id qla1280_pci_tbl[] __devinitdata = {
  	{PCI_VENDOR_ID_QLOGIC, PCI_DEVICE_ID_QLOGIC_ISP12160,
  		PCI_ANY_ID, PCI_ANY_ID, 0, 0, 0},
  	{PCI_VENDOR_ID_QLOGIC, PCI_DEVICE_ID_QLOGIC_ISP1020,
diff -urN linux-2.6.17-rc2/drivers/scsi/qla2xxx/ql2100.c linux/drivers/scsi/qla2xxx/ql2100.c
--- linux-2.6.17-rc2/drivers/scsi/qla2xxx/ql2100.c	2006-03-20 06:53:29.000000000 +0100
+++ linux/drivers/scsi/qla2xxx/ql2100.c	2006-04-25 18:15:43.000000000 +0200
@@ -37,7 +37,7 @@
  	.fw_info	= qla_fw_tbl,
  };

-static struct pci_device_id qla2100_pci_tbl[] = {
+static struct pci_device_id qla2100_pci_tbl[] __devinitdata = {
  	{
  		.vendor		= PCI_VENDOR_ID_QLOGIC,
  		.device		= PCI_DEVICE_ID_QLOGIC_ISP2100,
diff -urN linux-2.6.17-rc2/drivers/scsi/qla2xxx/ql2200.c linux/drivers/scsi/qla2xxx/ql2200.c
--- linux-2.6.17-rc2/drivers/scsi/qla2xxx/ql2200.c	2006-03-20 06:53:29.000000000 +0100
+++ linux/drivers/scsi/qla2xxx/ql2200.c	2006-04-25 18:15:54.000000000 +0200
@@ -37,7 +37,7 @@
  	.fw_info	= qla_fw_tbl,
  };

-static struct pci_device_id qla2200_pci_tbl[] = {
+static struct pci_device_id qla2200_pci_tbl[] __devinitdata = {
  	{
  		.vendor		= PCI_VENDOR_ID_QLOGIC,
  		.device		= PCI_DEVICE_ID_QLOGIC_ISP2200,
diff -urN linux-2.6.17-rc2/drivers/scsi/qla2xxx/ql2300.c linux/drivers/scsi/qla2xxx/ql2300.c
--- linux-2.6.17-rc2/drivers/scsi/qla2xxx/ql2300.c	2006-04-24 13:31:01.000000000 +0200
+++ linux/drivers/scsi/qla2xxx/ql2300.c	2006-04-25 18:16:09.000000000 +0200
@@ -47,7 +47,7 @@
  	},
  };

-static struct pci_device_id qla2300_pci_tbl[] = {
+static struct pci_device_id qla2300_pci_tbl[] __devinitdata = {
  	{
  		.vendor		= PCI_VENDOR_ID_QLOGIC,
  		.device		= PCI_DEVICE_ID_QLOGIC_ISP2300,
diff -urN linux-2.6.17-rc2/drivers/scsi/qla2xxx/ql2322.c linux/drivers/scsi/qla2xxx/ql2322.c
--- linux-2.6.17-rc2/drivers/scsi/qla2xxx/ql2322.c	2006-04-24 13:31:01.000000000 +0200
+++ linux/drivers/scsi/qla2xxx/ql2322.c	2006-04-25 18:16:23.000000000 +0200
@@ -59,7 +59,7 @@
  	},
  };

-static struct pci_device_id qla2322_pci_tbl[] = {
+static struct pci_device_id qla2322_pci_tbl[] __devinitdata = {
  	{
  		.vendor		= PCI_VENDOR_ID_QLOGIC,
  		.device		= PCI_DEVICE_ID_QLOGIC_ISP2322,
diff -urN linux-2.6.17-rc2/drivers/scsi/qla2xxx/ql2400.c linux/drivers/scsi/qla2xxx/ql2400.c
--- linux-2.6.17-rc2/drivers/scsi/qla2xxx/ql2400.c	2006-04-24 13:31:01.000000000 +0200
+++ linux/drivers/scsi/qla2xxx/ql2400.c	2006-04-25 18:16:40.000000000 +0200
@@ -63,7 +63,7 @@
  	},
  };

-static struct pci_device_id qla24xx_pci_tbl[] = {
+static struct pci_device_id qla24xx_pci_tbl[] __devinitdata = {
  	{
  		.vendor		= PCI_VENDOR_ID_QLOGIC,
  		.device		= PCI_DEVICE_ID_QLOGIC_ISP2422,
diff -urN linux-2.6.17-rc2/drivers/scsi/qla2xxx/qla_os.c linux/drivers/scsi/qla2xxx/qla_os.c
--- linux-2.6.17-rc2/drivers/scsi/qla2xxx/qla_os.c	2006-04-24 13:31:01.000000000 +0200
+++ linux/drivers/scsi/qla2xxx/qla_os.c	2006-04-25 18:16:59.000000000 +0200
@@ -2668,7 +2668,7 @@
  	.drv_name       = "qla2xxx",
  };

-static struct pci_device_id qla2xxx_pci_tbl[] = {
+static struct pci_device_id qla2xxx_pci_tbl[] __devinitdata = {
  	{ PCI_VENDOR_ID_QLOGIC, PCI_DEVICE_ID_QLOGIC_ISP2100,
  		PCI_ANY_ID, PCI_ANY_ID, },
  	{ PCI_VENDOR_ID_QLOGIC, PCI_DEVICE_ID_QLOGIC_ISP2200,
diff -urN linux-2.6.17-rc2/drivers/scsi/sata_mv.c linux/drivers/scsi/sata_mv.c
--- linux-2.6.17-rc2/drivers/scsi/sata_mv.c	2006-04-24 13:31:01.000000000 +0200
+++ linux/drivers/scsi/sata_mv.c	2006-04-25 18:20:28.000000000 +0200
@@ -525,7 +525,7 @@
  	},
  };

-static const struct pci_device_id mv_pci_tbl[] = {
+static const struct pci_device_id mv_pci_tbl[] __devinitdata = {
  	{PCI_DEVICE(PCI_VENDOR_ID_MARVELL, 0x5040), 0, 0, chip_504x},
  	{PCI_DEVICE(PCI_VENDOR_ID_MARVELL, 0x5041), 0, 0, chip_504x},
  	{PCI_DEVICE(PCI_VENDOR_ID_MARVELL, 0x5080), 0, 0, chip_5080},
diff -urN linux-2.6.17-rc2/drivers/scsi/sata_nv.c linux/drivers/scsi/sata_nv.c
--- linux-2.6.17-rc2/drivers/scsi/sata_nv.c	2006-04-24 13:31:01.000000000 +0200
+++ linux/drivers/scsi/sata_nv.c	2006-04-25 18:20:45.000000000 +0200
@@ -117,7 +117,7 @@
  	CK804
  };

-static const struct pci_device_id nv_pci_tbl[] = {
+static const struct pci_device_id nv_pci_tbl[] __devinitdata = {
  	{ PCI_VENDOR_ID_NVIDIA, PCI_DEVICE_ID_NVIDIA_NFORCE2S_SATA,
  		PCI_ANY_ID, PCI_ANY_ID, 0, 0, NFORCE2 },
  	{ PCI_VENDOR_ID_NVIDIA, PCI_DEVICE_ID_NVIDIA_NFORCE3S_SATA,
diff -urN linux-2.6.17-rc2/drivers/scsi/sata_promise.c linux/drivers/scsi/sata_promise.c
--- linux-2.6.17-rc2/drivers/scsi/sata_promise.c	2006-04-24 13:31:01.000000000 +0200
+++ linux/drivers/scsi/sata_promise.c	2006-04-25 18:21:04.000000000 +0200
@@ -229,7 +229,7 @@
  	},
  };

-static const struct pci_device_id pdc_ata_pci_tbl[] = {
+static const struct pci_device_id pdc_ata_pci_tbl[] __devinitdata = {
  	{ PCI_VENDOR_ID_PROMISE, 0x3371, PCI_ANY_ID, PCI_ANY_ID, 0, 0,
  	  board_2037x },
  	{ PCI_VENDOR_ID_PROMISE, 0x3570, PCI_ANY_ID, PCI_ANY_ID, 0, 0,
diff -urN linux-2.6.17-rc2/drivers/scsi/sata_qstor.c linux/drivers/scsi/sata_qstor.c
--- linux-2.6.17-rc2/drivers/scsi/sata_qstor.c	2006-04-24 13:31:01.000000000 +0200
+++ linux/drivers/scsi/sata_qstor.c	2006-04-25 18:21:20.000000000 +0200
@@ -182,7 +182,7 @@
  	},
  };

-static const struct pci_device_id qs_ata_pci_tbl[] = {
+static const struct pci_device_id qs_ata_pci_tbl[] __devinitdata = {
  	{ PCI_VENDOR_ID_PDC, 0x2068, PCI_ANY_ID, PCI_ANY_ID, 0, 0,
  	  board_2068_idx },

diff -urN linux-2.6.17-rc2/drivers/scsi/sata_sil24.c linux/drivers/scsi/sata_sil24.c
--- linux-2.6.17-rc2/drivers/scsi/sata_sil24.c	2006-04-24 13:31:01.000000000 +0200
+++ linux/drivers/scsi/sata_sil24.c	2006-04-25 18:21:36.000000000 +0200
@@ -260,7 +260,7 @@
  static void sil24_host_stop(struct ata_host_set *host_set);
  static int sil24_init_one(struct pci_dev *pdev, const struct pci_device_id *ent);

-static const struct pci_device_id sil24_pci_tbl[] = {
+static const struct pci_device_id sil24_pci_tbl[] __devinitdata = {
  	{ 0x1095, 0x3124, PCI_ANY_ID, PCI_ANY_ID, 0, 0, BID_SIL3124 },
  	{ 0x8086, 0x3124, PCI_ANY_ID, PCI_ANY_ID, 0, 0, BID_SIL3124 },
  	{ 0x1095, 0x3132, PCI_ANY_ID, PCI_ANY_ID, 0, 0, BID_SIL3132 },
diff -urN linux-2.6.17-rc2/drivers/scsi/sata_sil.c linux/drivers/scsi/sata_sil.c
--- linux-2.6.17-rc2/drivers/scsi/sata_sil.c	2006-04-24 13:31:01.000000000 +0200
+++ linux/drivers/scsi/sata_sil.c	2006-04-25 18:21:50.000000000 +0200
@@ -98,7 +98,7 @@
  static void sil_post_set_mode (struct ata_port *ap);


-static const struct pci_device_id sil_pci_tbl[] = {
+static const struct pci_device_id sil_pci_tbl[] __devinitdata = {
  	{ 0x1095, 0x3112, PCI_ANY_ID, PCI_ANY_ID, 0, 0, sil_3112 },
  	{ 0x1095, 0x0240, PCI_ANY_ID, PCI_ANY_ID, 0, 0, sil_3112 },
  	{ 0x1095, 0x3512, PCI_ANY_ID, PCI_ANY_ID, 0, 0, sil_3512 },
diff -urN linux-2.6.17-rc2/drivers/scsi/sata_sis.c linux/drivers/scsi/sata_sis.c
--- linux-2.6.17-rc2/drivers/scsi/sata_sis.c	2006-04-24 13:31:01.000000000 +0200
+++ linux/drivers/scsi/sata_sis.c	2006-04-25 18:22:13.000000000 +0200
@@ -67,7 +67,7 @@
  static u32 sis_scr_read (struct ata_port *ap, unsigned int sc_reg);
  static void sis_scr_write (struct ata_port *ap, unsigned int sc_reg, u32 val);

-static const struct pci_device_id sis_pci_tbl[] = {
+static const struct pci_device_id sis_pci_tbl[] __devinitdata = {
  	{ PCI_VENDOR_ID_SI, 0x180, PCI_ANY_ID, PCI_ANY_ID, 0, 0, sis_180 },
  	{ PCI_VENDOR_ID_SI, 0x181, PCI_ANY_ID, PCI_ANY_ID, 0, 0, sis_180 },
  	{ PCI_VENDOR_ID_SI, 0x182, PCI_ANY_ID, PCI_ANY_ID, 0, 0, sis_180 },
diff -urN linux-2.6.17-rc2/drivers/scsi/sata_svw.c linux/drivers/scsi/sata_svw.c
--- linux-2.6.17-rc2/drivers/scsi/sata_svw.c	2006-04-24 13:31:01.000000000 +0200
+++ linux/drivers/scsi/sata_svw.c	2006-04-25 18:24:26.000000000 +0200
@@ -465,7 +465,7 @@
   * 0x24a is device ID for BCM5785 (aka HT1000) HT southbridge integrated SATA
   * controller
   * */
-static const struct pci_device_id k2_sata_pci_tbl[] = {
+static const struct pci_device_id k2_sata_pci_tbl[] __devinitdata = {
  	{ 0x1166, 0x0240, PCI_ANY_ID, PCI_ANY_ID, 0, 0, 4 },
  	{ 0x1166, 0x0241, PCI_ANY_ID, PCI_ANY_ID, 0, 0, 4 },
  	{ 0x1166, 0x0242, PCI_ANY_ID, PCI_ANY_ID, 0, 0, 8 },
diff -urN linux-2.6.17-rc2/drivers/scsi/sata_sx4.c linux/drivers/scsi/sata_sx4.c
--- linux-2.6.17-rc2/drivers/scsi/sata_sx4.c	2006-04-24 13:31:01.000000000 +0200
+++ linux/drivers/scsi/sata_sx4.c	2006-04-25 18:22:35.000000000 +0200
@@ -227,7 +227,7 @@

  };

-static const struct pci_device_id pdc_sata_pci_tbl[] = {
+static const struct pci_device_id pdc_sata_pci_tbl[] __devinitdata = {
  	{ PCI_VENDOR_ID_PROMISE, 0x6622, PCI_ANY_ID, PCI_ANY_ID, 0, 0,
  	  board_20621 },
  	{ }	/* terminate list */
diff -urN linux-2.6.17-rc2/drivers/scsi/sata_uli.c linux/drivers/scsi/sata_uli.c
--- linux-2.6.17-rc2/drivers/scsi/sata_uli.c	2006-04-24 13:31:01.000000000 +0200
+++ linux/drivers/scsi/sata_uli.c	2006-04-25 18:22:55.000000000 +0200
@@ -61,7 +61,7 @@
  static u32 uli_scr_read (struct ata_port *ap, unsigned int sc_reg);
  static void uli_scr_write (struct ata_port *ap, unsigned int sc_reg, u32 val);

-static const struct pci_device_id uli_pci_tbl[] = {
+static const struct pci_device_id uli_pci_tbl[] __devinitdata = {
  	{ PCI_VENDOR_ID_AL, 0x5289, PCI_ANY_ID, PCI_ANY_ID, 0, 0, uli_5289 },
  	{ PCI_VENDOR_ID_AL, 0x5287, PCI_ANY_ID, PCI_ANY_ID, 0, 0, uli_5287 },
  	{ PCI_VENDOR_ID_AL, 0x5281, PCI_ANY_ID, PCI_ANY_ID, 0, 0, uli_5281 },
diff -urN linux-2.6.17-rc2/drivers/scsi/sata_via.c linux/drivers/scsi/sata_via.c
--- linux-2.6.17-rc2/drivers/scsi/sata_via.c	2006-04-24 13:31:01.000000000 +0200
+++ linux/drivers/scsi/sata_via.c	2006-04-25 18:23:24.000000000 +0200
@@ -75,7 +75,7 @@
  static u32 svia_scr_read (struct ata_port *ap, unsigned int sc_reg);
  static void svia_scr_write (struct ata_port *ap, unsigned int sc_reg, u32 val);

-static const struct pci_device_id svia_pci_tbl[] = {
+static const struct pci_device_id svia_pci_tbl[] __devinitdata = {
  	{ 0x1106, 0x3149, PCI_ANY_ID, PCI_ANY_ID, 0, 0, vt6420 },
  	{ 0x1106, 0x3249, PCI_ANY_ID, PCI_ANY_ID, 0, 0, vt6421 },

diff -urN linux-2.6.17-rc2/drivers/scsi/sata_vsc.c linux/drivers/scsi/sata_vsc.c
--- linux-2.6.17-rc2/drivers/scsi/sata_vsc.c	2006-04-24 13:31:01.000000000 +0200
+++ linux/drivers/scsi/sata_vsc.c	2006-04-25 18:23:44.000000000 +0200
@@ -437,7 +437,7 @@
   * 0x8086/0x3200 is the Intel 31244, which is supposed to be identical
   * compatibility is untested as of yet
   */
-static const struct pci_device_id vsc_sata_pci_tbl[] = {
+static const struct pci_device_id vsc_sata_pci_tbl[] __devinitdata = {
  	{ 0x1725, 0x7174, PCI_ANY_ID, PCI_ANY_ID, 0x10600, 0xFFFFFF, 0 },
  	{ 0x8086, 0x3200, PCI_ANY_ID, PCI_ANY_ID, 0x10600, 0xFFFFFF, 0 },
  	{ }
diff -urN linux-2.6.17-rc2/drivers/scsi/tmscsim.c linux/drivers/scsi/tmscsim.c
--- linux-2.6.17-rc2/drivers/scsi/tmscsim.c	2006-03-20 06:53:29.000000000 +0100
+++ linux/drivers/scsi/tmscsim.c	2006-04-25 18:17:32.000000000 +0200
@@ -2645,7 +2645,7 @@
  	pci_set_drvdata(dev, NULL);
  }

-static struct pci_device_id tmscsim_pci_tbl[] = {
+static struct pci_device_id tmscsim_pci_tbl[] __devinitdata = {
  	{ PCI_VENDOR_ID_AMD, PCI_DEVICE_ID_AMD53C974,
  		PCI_ANY_ID, PCI_ANY_ID, 0, 0, 0 },
  	{ }
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
