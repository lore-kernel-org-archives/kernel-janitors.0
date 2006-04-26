From: Henne <henne@nachtwindheim.de>
Date: Wed, 26 Apr 2006 12:21:24 +0000
Subject: [KJ] [PATCH] __devinitdata to net-subsys (2/2)
Message-Id: <444F65C4.8050307@nachtwindheim.de>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

From: Henrik Kretzschmar <henne@nachtwindheim.de>

Marking the pci_device_id tables of net-subsys as __devinitdata.
Signed-off-by: Henrik Kretzschmar <henne@nachtwindheim.de>
---

diff -uN linux-2.6.17-rc2/drivers/net/3c59x.c linux/drivers/net/3c59x.c
--- linux-2.6.17-rc2/drivers/net/3c59x.c	2006-04-24 13:30:57.000000000 +0200
+++ linux/drivers/net/3c59x.c	2006-04-26 13:53:16.000000000 +0200
@@ -540,7 +540,7 @@
  };


-static struct pci_device_id vortex_pci_tbl[] = {
+static struct pci_device_id vortex_pci_tbl[] __devinitdata = {
  	{ 0x10B7, 0x5900, PCI_ANY_ID, PCI_ANY_ID, 0, 0, CH_3C590 },
  	{ 0x10B7, 0x5920, PCI_ANY_ID, PCI_ANY_ID, 0, 0, CH_3C592 },
  	{ 0x10B7, 0x5970, PCI_ANY_ID, PCI_ANY_ID, 0, 0, CH_3C597 },
diff -uN linux-2.6.17-rc2/drivers/net/8139cp.c linux/drivers/net/8139cp.c
--- linux-2.6.17-rc2/drivers/net/8139cp.c	2006-04-24 13:30:57.000000000 +0200
+++ linux/drivers/net/8139cp.c	2006-04-26 13:53:45.000000000 +0200
@@ -402,7 +402,7 @@
  static void cp_poll_controller(struct net_device *dev);
  #endif

-static struct pci_device_id cp_pci_tbl[] = {
+static struct pci_device_id cp_pci_tbl[] __devinitdata = {
  	{ PCI_VENDOR_ID_REALTEK, PCI_DEVICE_ID_REALTEK_8139,
  	  PCI_ANY_ID, PCI_ANY_ID, 0, 0, },
  	{ PCI_VENDOR_ID_TTTECH, PCI_DEVICE_ID_TTTECH_MC322,
diff -uN linux-2.6.17-rc2/drivers/net/8139too.c linux/drivers/net/8139too.c
--- linux-2.6.17-rc2/drivers/net/8139too.c	2006-04-24 13:30:57.000000000 +0200
+++ linux/drivers/net/8139too.c	2006-04-26 13:54:02.000000000 +0200
@@ -238,7 +238,7 @@
  };


-static struct pci_device_id rtl8139_pci_tbl[] = {
+static struct pci_device_id rtl8139_pci_tbl[] __devinitdata = {
  	{0x10ec, 0x8139, PCI_ANY_ID, PCI_ANY_ID, 0, 0, RTL8139 },
  	{0x10ec, 0x8138, PCI_ANY_ID, PCI_ANY_ID, 0, 0, RTL8139 },
  	{0x1113, 0x1211, PCI_ANY_ID, PCI_ANY_ID, 0, 0, RTL8139 },
diff -uN linux-2.6.17-rc2/drivers/net/acenic.c linux/drivers/net/acenic.c
--- linux-2.6.17-rc2/drivers/net/acenic.c	2006-03-20 06:53:29.000000000 +0100
+++ linux/drivers/net/acenic.c	2006-04-26 13:54:40.000000000 +0200
@@ -135,7 +135,7 @@
  #define PCI_DEVICE_ID_SGI_ACENIC	0x0009
  #endif

-static struct pci_device_id acenic_pci_tbl[] = {
+static struct pci_device_id acenic_pci_tbl[] __devinitdata = {
  	{ PCI_VENDOR_ID_ALTEON, PCI_DEVICE_ID_ALTEON_ACENIC_FIBRE,
  	  PCI_ANY_ID, PCI_ANY_ID, PCI_CLASS_NETWORK_ETHERNET << 8, 0xffff00, },
  	{ PCI_VENDOR_ID_ALTEON, PCI_DEVICE_ID_ALTEON_ACENIC_COPPER,
diff -uN linux-2.6.17-rc2/drivers/net/amd8111e.c linux/drivers/net/amd8111e.c
--- linux-2.6.17-rc2/drivers/net/amd8111e.c	2006-03-20 06:53:29.000000000 +0100
+++ linux/drivers/net/amd8111e.c	2006-04-26 13:55:11.000000000 +0200
@@ -114,7 +114,7 @@
  module_param_array(dynamic_ipg, bool, NULL, 0);
  MODULE_PARM_DESC(dynamic_ipg, "Enable or Disable dynamic IPG, 1: Enable, 0: Disable");

-static struct pci_device_id amd8111e_pci_tbl[] = {
+static struct pci_device_id amd8111e_pci_tbl[] __devinitdata = {
  		
  	{ PCI_VENDOR_ID_AMD, PCI_DEVICE_ID_AMD8111E_7462,
  	 PCI_ANY_ID, PCI_ANY_ID, 0, 0, 0UL },
Gemeinsame Unterverzeichnisse: linux-2.6.17-rc2/drivers/net/appletalk und linux/drivers/net/appletalk.
Gemeinsame Unterverzeichnisse: linux-2.6.17-rc2/drivers/net/arcnet und linux/drivers/net/arcnet.
Gemeinsame Unterverzeichnisse: linux-2.6.17-rc2/drivers/net/arm und linux/drivers/net/arm.
diff -uN linux-2.6.17-rc2/drivers/net/b44.c linux/drivers/net/b44.c
--- linux-2.6.17-rc2/drivers/net/b44.c	2006-04-24 13:30:57.000000000 +0200
+++ linux/drivers/net/b44.c	2006-04-26 13:55:34.000000000 +0200
@@ -87,7 +87,7 @@
  module_param(b44_debug, int, 0);
  MODULE_PARM_DESC(b44_debug, "B44 bitmapped debugging message enable value");

-static struct pci_device_id b44_pci_tbl[] = {
+static struct pci_device_id b44_pci_tbl[] __devinitdata = {
  	{ PCI_VENDOR_ID_BROADCOM, PCI_DEVICE_ID_BCM4401,
  	  PCI_ANY_ID, PCI_ANY_ID, 0, 0, 0UL },
  	{ PCI_VENDOR_ID_BROADCOM, PCI_DEVICE_ID_BCM4401B0,
diff -uN linux-2.6.17-rc2/drivers/net/bnx2.c linux/drivers/net/bnx2.c
--- linux-2.6.17-rc2/drivers/net/bnx2.c	2006-04-24 13:30:57.000000000 +0200
+++ linux/drivers/net/bnx2.c	2006-04-26 13:56:09.000000000 +0200
@@ -99,7 +99,7 @@
  	{ "Broadcom NetXtreme II BCM5708 1000Base-SX" },
  	};

-static struct pci_device_id bnx2_pci_tbl[] = {
+static struct pci_device_id bnx2_pci_tbl[] __devinitdata = {
  	{ PCI_VENDOR_ID_BROADCOM, PCI_DEVICE_ID_NX2_5706,
  	  PCI_VENDOR_ID_HP, 0x3101, 0, 0, NC370T },
  	{ PCI_VENDOR_ID_BROADCOM, PCI_DEVICE_ID_NX2_5706,
Gemeinsame Unterverzeichnisse: linux-2.6.17-rc2/drivers/net/bonding und linux/drivers/net/bonding.
Gemeinsame Unterverzeichnisse: linux-2.6.17-rc2/drivers/net/chelsio und linux/drivers/net/chelsio.
Gemeinsame Unterverzeichnisse: linux-2.6.17-rc2/drivers/net/cris und linux/drivers/net/cris.
diff -uN linux-2.6.17-rc2/drivers/net/defxx.c linux/drivers/net/defxx.c
--- linux-2.6.17-rc2/drivers/net/defxx.c	2006-03-20 06:53:29.000000000 +0100
+++ linux/drivers/net/defxx.c	2006-04-26 13:56:53.000000000 +0200
@@ -3407,7 +3407,7 @@
  	pci_set_drvdata(pdev, NULL);
  }

-static struct pci_device_id dfx_pci_tbl[] = {
+static struct pci_device_id dfx_pci_tbl[] __devinitdata = {
  	{ PCI_VENDOR_ID_DEC, PCI_DEVICE_ID_DEC_FDDI, PCI_ANY_ID, PCI_ANY_ID, },
  	{ 0, }
  };
diff -uN linux-2.6.17-rc2/drivers/net/dgrs.c linux/drivers/net/dgrs.c
--- linux-2.6.17-rc2/drivers/net/dgrs.c	2006-04-24 13:30:57.000000000 +0200
+++ linux/drivers/net/dgrs.c	2006-04-26 13:57:39.000000000 +0200
@@ -122,7 +122,7 @@
  #include "dgrs_bcomm.h"

  #ifdef CONFIG_PCI
-static struct pci_device_id dgrs_pci_tbl[] = {
+static struct pci_device_id dgrs_pci_tbl[] __devinitdata = {
  	{ SE6_PCI_VENDOR_ID, SE6_PCI_DEVICE_ID, PCI_ANY_ID, PCI_ANY_ID, },
  	{ }			/* Terminating entry */
  };
diff -uN linux-2.6.17-rc2/drivers/net/dl2k.h linux/drivers/net/dl2k.h
--- linux-2.6.17-rc2/drivers/net/dl2k.h	2006-03-20 06:53:29.000000000 +0100
+++ linux/drivers/net/dl2k.h	2006-04-26 13:58:13.000000000 +0200
@@ -695,7 +695,7 @@
          class_mask              of the class are honored during the comparison.
          driver_data             Data private to the driver.
  */
-static struct pci_device_id rio_pci_tbl[] = {
+static struct pci_device_id rio_pci_tbl[] __devinitdata = {
  	{0x1186, 0x4000, PCI_ANY_ID, PCI_ANY_ID, 0, 0, 0},
  	{0,}
  };
Gemeinsame Unterverzeichnisse: linux-2.6.17-rc2/drivers/net/e1000 und linux/drivers/net/e1000.
diff -uN linux-2.6.17-rc2/drivers/net/e100.c linux/drivers/net/e100.c
--- linux-2.6.17-rc2/drivers/net/e100.c	2006-04-24 13:30:57.000000000 +0200
+++ linux/drivers/net/e100.c	2006-04-26 13:58:37.000000000 +0200
@@ -184,7 +184,7 @@
  #define INTEL_8255X_ETHERNET_DEVICE(device_id, ich) {\
  	PCI_VENDOR_ID_INTEL, device_id, PCI_ANY_ID, PCI_ANY_ID, \
  	PCI_CLASS_NETWORK_ETHERNET << 8, 0xFFFF00, ich }
-static struct pci_device_id e100_id_table[] = {
+static struct pci_device_id e100_id_table[] __devinitdata = {
  	INTEL_8255X_ETHERNET_DEVICE(0x1029, 0),
  	INTEL_8255X_ETHERNET_DEVICE(0x1030, 0),
  	INTEL_8255X_ETHERNET_DEVICE(0x1031, 3),
diff -uN linux-2.6.17-rc2/drivers/net/eepro100.c linux/drivers/net/eepro100.c
--- linux-2.6.17-rc2/drivers/net/eepro100.c	2006-04-24 13:30:58.000000000 +0200
+++ linux/drivers/net/eepro100.c	2006-04-26 13:58:57.000000000 +0200
@@ -2344,7 +2344,7 @@
  	free_netdev(dev);
  }
  
-static struct pci_device_id eepro100_pci_tbl[] = {
+static struct pci_device_id eepro100_pci_tbl[] __devinitdata = {
  	{ PCI_VENDOR_ID_INTEL, 0x1229, PCI_ANY_ID, PCI_ANY_ID, },
  	{ PCI_VENDOR_ID_INTEL, 0x1209, PCI_ANY_ID, PCI_ANY_ID, },
  	{ PCI_VENDOR_ID_INTEL, 0x1029, PCI_ANY_ID, PCI_ANY_ID, },
diff -uN linux-2.6.17-rc2/drivers/net/epic100.c linux/drivers/net/epic100.c
--- linux-2.6.17-rc2/drivers/net/epic100.c	2006-04-24 13:30:58.000000000 +0200
+++ linux/drivers/net/epic100.c	2006-04-26 13:59:19.000000000 +0200
@@ -235,7 +235,7 @@
  };


-static struct pci_device_id epic_pci_tbl[] = {
+static struct pci_device_id epic_pci_tbl[] __devinitdata = {
  	{ 0x10B8, 0x0005, 0x1092, 0x0AB4, 0, 0, SMSC_83C170_0 },
  	{ 0x10B8, 0x0005, PCI_ANY_ID, PCI_ANY_ID, 0, 0, SMSC_83C170 },
  	{ 0x10B8, 0x0006, PCI_ANY_ID, PCI_ANY_ID,
diff -uN linux-2.6.17-rc2/drivers/net/fealnx.c linux/drivers/net/fealnx.c
--- linux-2.6.17-rc2/drivers/net/fealnx.c	2006-04-24 13:30:58.000000000 +0200
+++ linux/drivers/net/fealnx.c	2006-04-26 13:59:37.000000000 +0200
@@ -1969,7 +1969,7 @@
  	return 0;
  }

-static struct pci_device_id fealnx_pci_tbl[] = {
+static struct pci_device_id fealnx_pci_tbl[] __devinitdata = {
  	{0x1516, 0x0800, PCI_ANY_ID, PCI_ANY_ID, 0, 0, 0},
  	{0x1516, 0x0803, PCI_ANY_ID, PCI_ANY_ID, 0, 0, 1},
  	{0x1516, 0x0891, PCI_ANY_ID, PCI_ANY_ID, 0, 0, 2},
Gemeinsame Unterverzeichnisse: linux-2.6.17-rc2/drivers/net/fec_8xx und linux/drivers/net/fec_8xx.
diff -uN linux-2.6.17-rc2/drivers/net/forcedeth.c linux/drivers/net/forcedeth.c
--- linux-2.6.17-rc2/drivers/net/forcedeth.c	2006-04-24 13:30:58.000000000 +0200
+++ linux/drivers/net/forcedeth.c	2006-04-26 14:00:01.000000000 +0200
@@ -3176,7 +3176,7 @@
  	pci_set_drvdata(pci_dev, NULL);
  }

-static struct pci_device_id pci_tbl[] = {
+static struct pci_device_id pci_tbl[] __devinitdata = {
  	{	/* nForce Ethernet Controller */
  		PCI_DEVICE(PCI_VENDOR_ID_NVIDIA, PCI_DEVICE_ID_NVIDIA_NVENET_1),
  		.driver_data = DEV_NEED_TIMERIRQ|DEV_NEED_LINKTIMER,
Gemeinsame Unterverzeichnisse: linux-2.6.17-rc2/drivers/net/fs_enet und linux/drivers/net/fs_enet.
diff -uN linux-2.6.17-rc2/drivers/net/hamachi.c linux/drivers/net/hamachi.c
--- linux-2.6.17-rc2/drivers/net/hamachi.c	2006-04-24 13:30:58.000000000 +0200
+++ linux/drivers/net/hamachi.c	2006-04-26 14:00:19.000000000 +0200
@@ -1996,7 +1996,7 @@
  	}
  }

-static struct pci_device_id hamachi_pci_tbl[] = {
+static struct pci_device_id hamachi_pci_tbl[] __devinitdata = {
  	{ 0x1318, 0x0911, PCI_ANY_ID, PCI_ANY_ID, },
  	{ 0, }
  };
Gemeinsame Unterverzeichnisse: linux-2.6.17-rc2/drivers/net/hamradio und linux/drivers/net/hamradio.
diff -uN linux-2.6.17-rc2/drivers/net/hp100.c linux/drivers/net/hp100.c
--- linux-2.6.17-rc2/drivers/net/hp100.c	2006-04-24 13:30:58.000000000 +0200
+++ linux/drivers/net/hp100.c	2006-04-26 14:00:57.000000000 +0200
@@ -208,7 +208,7 @@
  #endif

  #ifdef CONFIG_PCI
-static struct pci_device_id hp100_pci_tbl[] = {
+static struct pci_device_id hp100_pci_tbl[] __devinitdata = {
  	{PCI_VENDOR_ID_HP, PCI_DEVICE_ID_HP_J2585A, PCI_ANY_ID, PCI_ANY_ID,},
  	{PCI_VENDOR_ID_HP, PCI_DEVICE_ID_HP_J2585B, PCI_ANY_ID, PCI_ANY_ID,},
  	{PCI_VENDOR_ID_HP, PCI_DEVICE_ID_HP_J2970A, PCI_ANY_ID, PCI_ANY_ID,},
Gemeinsame Unterverzeichnisse: linux-2.6.17-rc2/drivers/net/ibm_emac und linux/drivers/net/ibm_emac.
diff -uN linux-2.6.17-rc2/drivers/net/ioc3-eth.c linux/drivers/net/ioc3-eth.c
--- linux-2.6.17-rc2/drivers/net/ioc3-eth.c	2006-04-24 13:30:58.000000000 +0200
+++ linux/drivers/net/ioc3-eth.c	2006-04-26 14:01:17.000000000 +0200
@@ -1346,7 +1346,7 @@
  	 */
  }

-static struct pci_device_id ioc3_pci_tbl[] = {
+static struct pci_device_id ioc3_pci_tbl[] __devinitdata = {
  	{ PCI_VENDOR_ID_SGI, PCI_DEVICE_ID_SGI_IOC3, PCI_ANY_ID, PCI_ANY_ID },
  	{ 0 }
  };
Gemeinsame Unterverzeichnisse: linux-2.6.17-rc2/drivers/net/irda und linux/drivers/net/irda.
Gemeinsame Unterverzeichnisse: linux-2.6.17-rc2/drivers/net/ixgb und linux/drivers/net/ixgb.
Gemeinsame Unterverzeichnisse: linux-2.6.17-rc2/drivers/net/ixp2000 und linux/drivers/net/ixp2000.
diff -uN linux-2.6.17-rc2/drivers/net/natsemi.c linux/drivers/net/natsemi.c
--- linux-2.6.17-rc2/drivers/net/natsemi.c	2006-04-24 13:30:58.000000000 +0200
+++ linux/drivers/net/natsemi.c	2006-04-26 14:01:31.000000000 +0200
@@ -376,7 +376,7 @@
  	{ "NatSemi DP8381[56]", PCI_IOTYPE },
  };

-static struct pci_device_id natsemi_pci_tbl[] = {
+static struct pci_device_id natsemi_pci_tbl[] __devinitdata = {
  	{ PCI_VENDOR_ID_NS, PCI_DEVICE_ID_NS_83815, PCI_ANY_ID, PCI_ANY_ID, },
  	{ 0, },
  };
diff -uN linux-2.6.17-rc2/drivers/net/ne2k-pci.c linux/drivers/net/ne2k-pci.c
--- linux-2.6.17-rc2/drivers/net/ne2k-pci.c	2006-04-24 13:30:58.000000000 +0200
+++ linux/drivers/net/ne2k-pci.c	2006-04-26 14:13:55.000000000 +0200
@@ -136,7 +136,7 @@
  };


-static struct pci_device_id ne2k_pci_tbl[] = {
+static struct pci_device_id ne2k_pci_tbl[] __devinitdata = {
  	{ 0x10ec, 0x8029, PCI_ANY_ID, PCI_ANY_ID, 0, 0, CH_RealTek_RTL_8029 },
  	{ 0x1050, 0x0940, PCI_ANY_ID, PCI_ANY_ID, 0, 0, CH_Winbond_89C940 },
  	{ 0x11f6, 0x1401, PCI_ANY_ID, PCI_ANY_ID, 0, 0, CH_Compex_RL2000 },
diff -uN linux-2.6.17-rc2/drivers/net/ns83820.c linux/drivers/net/ns83820.c
--- linux-2.6.17-rc2/drivers/net/ns83820.c	2006-04-24 13:30:58.000000000 +0200
+++ linux/drivers/net/ns83820.c	2006-04-26 14:02:09.000000000 +0200
@@ -2156,7 +2156,7 @@
  	pci_set_drvdata(pci_dev, NULL);
  }

-static struct pci_device_id ns83820_pci_tbl[] = {
+static struct pci_device_id ns83820_pci_tbl[] __devinitdata = {
  	{ 0x100b, 0x0022, PCI_ANY_ID, PCI_ANY_ID, 0, .driver_data = 0, },
  	{ 0, },
  };
diff -uN linux-2.6.17-rc2/drivers/net/pci-skeleton.c linux/drivers/net/pci-skeleton.c
--- linux-2.6.17-rc2/drivers/net/pci-skeleton.c	2006-03-20 06:53:29.000000000 +0100
+++ linux/drivers/net/pci-skeleton.c	2006-04-26 14:02:31.000000000 +0200
@@ -212,7 +212,7 @@
  };


-static struct pci_device_id netdrv_pci_tbl[] = {
+static struct pci_device_id netdrv_pci_tbl[] __devinitdata = {
  	{0x10ec, 0x8139, PCI_ANY_ID, PCI_ANY_ID, 0, 0, RTL8139 },
  	{0x10ec, 0x8138, PCI_ANY_ID, PCI_ANY_ID, 0, 0, NETDRV_CB },
  	{0x1113, 0x1211, PCI_ANY_ID, PCI_ANY_ID, 0, 0, SMC1211TX },
Gemeinsame Unterverzeichnisse: linux-2.6.17-rc2/drivers/net/pcmcia und linux/drivers/net/pcmcia.
diff -uN linux-2.6.17-rc2/drivers/net/pcnet32.c linux/drivers/net/pcnet32.c
--- linux-2.6.17-rc2/drivers/net/pcnet32.c	2006-04-24 13:30:58.000000000 +0200
+++ linux/drivers/net/pcnet32.c	2006-04-26 14:02:56.000000000 +0200
@@ -57,7 +57,7 @@
  /*
   * PCI device identifiers for "new style" Linux PCI Device Drivers
   */
-static struct pci_device_id pcnet32_pci_tbl[] = {
+static struct pci_device_id pcnet32_pci_tbl[] __devinitdata = {
  	{ PCI_VENDOR_ID_AMD, PCI_DEVICE_ID_AMD_LANCE_HOME,
  	  PCI_ANY_ID, PCI_ANY_ID, 0, 0, 0},
  	{ PCI_VENDOR_ID_AMD, PCI_DEVICE_ID_AMD_LANCE,
Gemeinsame Unterverzeichnisse: linux-2.6.17-rc2/drivers/net/phy und linux/drivers/net/phy.
diff -uN linux-2.6.17-rc2/drivers/net/r8169.c linux/drivers/net/r8169.c
--- linux-2.6.17-rc2/drivers/net/r8169.c	2006-04-24 13:30:59.000000000 +0200
+++ linux/drivers/net/r8169.c	2006-04-26 14:03:13.000000000 +0200
@@ -182,7 +182,7 @@
  };
  #undef _R

-static struct pci_device_id rtl8169_pci_tbl[] = {
+static struct pci_device_id rtl8169_pci_tbl[] __devinitdata = {
  	{ PCI_DEVICE(PCI_VENDOR_ID_REALTEK,	0x8169), },
  	{ PCI_DEVICE(PCI_VENDOR_ID_DLINK,	0x4300), },
  	{ PCI_DEVICE(0x16ec,			0x0116), },
diff -uN linux-2.6.17-rc2/drivers/net/rrunner.c linux/drivers/net/rrunner.c
--- linux-2.6.17-rc2/drivers/net/rrunner.c	2006-03-20 06:53:29.000000000 +0100
+++ linux/drivers/net/rrunner.c	2006-04-26 14:03:36.000000000 +0200
@@ -1721,7 +1721,7 @@
  	}
  }

-static struct pci_device_id rr_pci_tbl[] = {
+static struct pci_device_id rr_pci_tbl[] __devinitdata = {
  	{ PCI_VENDOR_ID_ESSENTIAL, PCI_DEVICE_ID_ESSENTIAL_ROADRUNNER,
  		PCI_ANY_ID, PCI_ANY_ID, },
  	{ 0,}
diff -uN linux-2.6.17-rc2/drivers/net/saa9730.c linux/drivers/net/saa9730.c
--- linux-2.6.17-rc2/drivers/net/saa9730.c	2006-03-20 06:53:29.000000000 +0100
+++ linux/drivers/net/saa9730.c	2006-04-26 14:04:10.000000000 +0200
@@ -51,7 +51,7 @@

  #define DRV_MODULE_NAME "saa9730"

-static struct pci_device_id saa9730_pci_tbl[] = {
+static struct pci_device_id saa9730_pci_tbl[] __devinitdata = {
  	{ PCI_VENDOR_ID_PHILIPS, PCI_DEVICE_ID_PHILIPS_SAA9730,
  	  PCI_ANY_ID, PCI_ANY_ID, 0, 0, 0UL },
  	{ 0, }
diff -uN linux-2.6.17-rc2/drivers/net/sis900.c linux/drivers/net/sis900.c
--- linux-2.6.17-rc2/drivers/net/sis900.c	2006-04-24 13:30:59.000000000 +0200
+++ linux/drivers/net/sis900.c	2006-04-26 14:04:56.000000000 +0200
@@ -104,7 +104,7 @@
  	"SiS 900 PCI Fast Ethernet",
  	"SiS 7016 PCI Fast Ethernet"
  };
-static struct pci_device_id sis900_pci_tbl [] = {
+static struct pci_device_id sis900_pci_tbl[] __devinitdata = {
  	{PCI_VENDOR_ID_SI, PCI_DEVICE_ID_SI_900,
  	 PCI_ANY_ID, PCI_ANY_ID, 0, 0, SIS_900},
  	{PCI_VENDOR_ID_SI, PCI_DEVICE_ID_SI_7016,
Gemeinsame Unterverzeichnisse: linux-2.6.17-rc2/drivers/net/sk98lin und linux/drivers/net/sk98lin.
Gemeinsame Unterverzeichnisse: linux-2.6.17-rc2/drivers/net/skfp und linux/drivers/net/skfp.
diff -uN linux-2.6.17-rc2/drivers/net/skge.c linux/drivers/net/skge.c
--- linux-2.6.17-rc2/drivers/net/skge.c	2006-04-24 13:30:59.000000000 +0200
+++ linux/drivers/net/skge.c	2006-04-26 13:52:03.000000000 +0200
@@ -72,7 +72,7 @@
  module_param(debug, int, 0);
  MODULE_PARM_DESC(debug, "Debug level (0=none,...,16=all)");

-static const struct pci_device_id skge_id_table[] = {
+static const struct pci_device_id skge_id_table[] __devinitdata = {
  	{ PCI_DEVICE(PCI_VENDOR_ID_3COM, PCI_DEVICE_ID_3COM_3C940) },
  	{ PCI_DEVICE(PCI_VENDOR_ID_3COM, PCI_DEVICE_ID_3COM_3C940B) },
  	{ PCI_DEVICE(PCI_VENDOR_ID_SYSKONNECT, PCI_DEVICE_ID_SYSKONNECT_GE) },
diff -uN linux-2.6.17-rc2/drivers/net/sky2.c linux/drivers/net/sky2.c
--- linux-2.6.17-rc2/drivers/net/sky2.c	2006-04-24 13:30:59.000000000 +0200
+++ linux/drivers/net/sky2.c	2006-04-26 13:52:37.000000000 +0200
@@ -96,7 +96,7 @@
  module_param(disable_msi, int, 0);
  MODULE_PARM_DESC(disable_msi, "Disable Message Signaled Interrupt (MSI)");

-static const struct pci_device_id sky2_id_table[] = {
+static const struct pci_device_id sky2_id_table[] __devinitdata = {
  	{ PCI_DEVICE(PCI_VENDOR_ID_SYSKONNECT, 0x9000) },
  	{ PCI_DEVICE(PCI_VENDOR_ID_SYSKONNECT, 0x9E00) },
  	{ PCI_DEVICE(PCI_VENDOR_ID_MARVELL, 0x4340) },
diff -uN linux-2.6.17-rc2/drivers/net/spider_net.c linux/drivers/net/spider_net.c
--- linux-2.6.17-rc2/drivers/net/spider_net.c	2006-04-24 13:30:59.000000000 +0200
+++ linux/drivers/net/spider_net.c	2006-04-26 14:05:23.000000000 +0200
@@ -70,7 +70,7 @@

  char spider_net_driver_name[] = "spidernet";

-static struct pci_device_id spider_net_pci_tbl[] = {
+static struct pci_device_id spider_net_pci_tbl[] __devinitdata = {
  	{ PCI_VENDOR_ID_TOSHIBA_2, PCI_DEVICE_ID_TOSHIBA_SPIDER_NET,
  	  PCI_ANY_ID, PCI_ANY_ID, 0, 0, 0UL },
  	{ 0, }
diff -uN linux-2.6.17-rc2/drivers/net/starfire.c linux/drivers/net/starfire.c
--- linux-2.6.17-rc2/drivers/net/starfire.c	2006-04-24 13:30:59.000000000 +0200
+++ linux/drivers/net/starfire.c	2006-04-26 14:05:56.000000000 +0200
@@ -456,7 +456,7 @@
  	CH_6915 = 0,
  };

-static struct pci_device_id starfire_pci_tbl[] = {
+static struct pci_device_id starfire_pci_tbl[] __devinitdata = {
  	{ 0x9004, 0x6915, PCI_ANY_ID, PCI_ANY_ID, 0, 0, CH_6915 },
  	{ 0, }
  };
diff -uN linux-2.6.17-rc2/drivers/net/sundance.c linux/drivers/net/sundance.c
--- linux-2.6.17-rc2/drivers/net/sundance.c	2006-04-24 13:30:59.000000000 +0200
+++ linux/drivers/net/sundance.c	2006-04-26 14:06:17.000000000 +0200
@@ -280,7 +280,7 @@
  #define USE_IO_OPS 1
  #endif

-static struct pci_device_id sundance_pci_tbl[] = {
+static struct pci_device_id sundance_pci_tbl[] __devinitdata = {
  	{0x1186, 0x1002, 0x1186, 0x1002, 0, 0, 0},
  	{0x1186, 0x1002, 0x1186, 0x1003, 0, 0, 1},
  	{0x1186, 0x1002, 0x1186, 0x1012, 0, 0, 2},
diff -uN linux-2.6.17-rc2/drivers/net/sungem.c linux/drivers/net/sungem.c
--- linux-2.6.17-rc2/drivers/net/sungem.c	2006-04-24 13:30:59.000000000 +0200
+++ linux/drivers/net/sungem.c	2006-04-26 14:06:45.000000000 +0200
@@ -106,7 +106,7 @@
  #define GEM_MODULE_NAME	"gem"
  #define PFX GEM_MODULE_NAME ": "

-static struct pci_device_id gem_pci_tbl[] = {
+static struct pci_device_id gem_pci_tbl[] __devinitdata = {
  	{ PCI_VENDOR_ID_SUN, PCI_DEVICE_ID_SUN_GEM,
  	  PCI_ANY_ID, PCI_ANY_ID, 0, 0, 0UL },

diff -uN linux-2.6.17-rc2/drivers/net/sunhme.c linux/drivers/net/sunhme.c
--- linux-2.6.17-rc2/drivers/net/sunhme.c	2006-03-20 06:53:29.000000000 +0100
+++ linux/drivers/net/sunhme.c	2006-04-26 14:16:47.000000000 +0200
@@ -187,7 +187,7 @@
     where it could be referenced at any time due to hot plugging,
     the __initdata reference should be removed. */

-static struct pci_device_id happymeal_pci_ids[] = {
+static struct pci_device_id happymeal_pci_ids[] __devinitdata = {
  	{
  	  .vendor	= PCI_VENDOR_ID_SUN,
  	  .device	= PCI_DEVICE_ID_SUN_HAPPYMEAL,
diff -uN linux-2.6.17-rc2/drivers/net/tc35815.c linux/drivers/net/tc35815.c
--- linux-2.6.17-rc2/drivers/net/tc35815.c	2006-03-20 06:53:29.000000000 +0100
+++ linux/drivers/net/tc35815.c	2006-04-26 14:10:11.000000000 +0200
@@ -470,7 +470,7 @@
  /*
   * PCI device identifiers for "new style" Linux PCI Device Drivers
   */
-static struct pci_device_id tc35815_pci_tbl[] = {
+static struct pci_device_id tc35815_pci_tbl[] __devinitdata = {
      { PCI_VENDOR_ID_TOSHIBA_2, PCI_DEVICE_ID_TOSHIBA_TC35815CF, PCI_ANY_ID, PCI_ANY_ID, 0, 0, 0 },
      { 0, }
  };
diff -uN linux-2.6.17-rc2/drivers/net/tg3.c linux/drivers/net/tg3.c
--- linux-2.6.17-rc2/drivers/net/tg3.c	2006-04-24 13:30:59.000000000 +0200
+++ linux/drivers/net/tg3.c	2006-04-26 14:10:44.000000000 +0200
@@ -152,7 +152,7 @@
  module_param(tg3_debug, int, 0);
  MODULE_PARM_DESC(tg3_debug, "Tigon3 bitmapped debugging message enable value");

-static struct pci_device_id tg3_pci_tbl[] = {
+static struct pci_device_id tg3_pci_tbl[] __devinitdata = {
  	{ PCI_VENDOR_ID_BROADCOM, PCI_DEVICE_ID_TIGON3_5700,
  	  PCI_ANY_ID, PCI_ANY_ID, 0, 0, 0UL },
  	{ PCI_VENDOR_ID_BROADCOM, PCI_DEVICE_ID_TIGON3_5701,
diff -uN linux-2.6.17-rc2/drivers/net/tlan.c linux/drivers/net/tlan.c
--- linux-2.6.17-rc2/drivers/net/tlan.c	2006-03-20 06:53:29.000000000 +0100
+++ linux/drivers/net/tlan.c	2006-04-26 14:11:16.000000000 +0200
@@ -253,7 +253,7 @@
  	{ "Compaq NetFlex-3/E", TLAN_ADAPTER_ACTIVITY_LED, 0x83 }, /* EISA card */
  };

-static struct pci_device_id tlan_pci_tbl[] = {
+static struct pci_device_id tlan_pci_tbl[] __devinitdata = {
  	{ PCI_VENDOR_ID_COMPAQ, PCI_DEVICE_ID_COMPAQ_NETEL10,
  		PCI_ANY_ID, PCI_ANY_ID, 0, 0, 0 },
  	{ PCI_VENDOR_ID_COMPAQ, PCI_DEVICE_ID_COMPAQ_NETEL100,
Gemeinsame Unterverzeichnisse: linux-2.6.17-rc2/drivers/net/tokenring und linux/drivers/net/tokenring.
Gemeinsame Unterverzeichnisse: linux-2.6.17-rc2/drivers/net/tulip und linux/drivers/net/tulip.
diff -uN linux-2.6.17-rc2/drivers/net/typhoon.c linux/drivers/net/typhoon.c
--- linux-2.6.17-rc2/drivers/net/typhoon.c	2006-04-24 13:30:59.000000000 +0200
+++ linux/drivers/net/typhoon.c	2006-04-26 14:08:15.000000000 +0200
@@ -213,7 +213,7 @@
   * bit 8 indicates if this is a (0) copper or (1) fiber card
   * bits 12-16 indicate card type: (0) client and (1) server
   */
-static struct pci_device_id typhoon_pci_tbl[] = {
+static struct pci_device_id typhoon_pci_tbl[] __devinitdata = {
  	{ PCI_VENDOR_ID_3COM, PCI_DEVICE_ID_3COM_3CR990,
  	  PCI_ANY_ID, PCI_ANY_ID, 0, 0,TYPHOON_TX },
  	{ PCI_VENDOR_ID_3COM, PCI_DEVICE_ID_3COM_3CR990_TX_95,
diff -uN linux-2.6.17-rc2/drivers/net/via-rhine.c linux/drivers/net/via-rhine.c
--- linux-2.6.17-rc2/drivers/net/via-rhine.c	2006-04-24 13:30:59.000000000 +0200
+++ linux/drivers/net/via-rhine.c	2006-04-26 14:08:35.000000000 +0200
@@ -355,7 +355,7 @@
  /* Beware of PCI posted writes */
  #define IOSYNC	do { ioread8(ioaddr + StationAddr); } while (0)

-static struct pci_device_id rhine_pci_tbl[] +static struct pci_device_id rhine_pci_tbl[] __devinitdata   {
  	{0x1106, 0x3043, PCI_ANY_ID, PCI_ANY_ID, 0, 0, }, /* VT86C100A */
  	{0x1106, 0x3065, PCI_ANY_ID, PCI_ANY_ID, 0, 0, }, /* VT6102 */
Gemeinsame Unterverzeichnisse: linux-2.6.17-rc2/drivers/net/wan und linux/drivers/net/wan.
Gemeinsame Unterverzeichnisse: linux-2.6.17-rc2/drivers/net/wireless und linux/drivers/net/wireless.
diff -uN linux-2.6.17-rc2/drivers/net/yellowfin.c linux/drivers/net/yellowfin.c
--- linux-2.6.17-rc2/drivers/net/yellowfin.c	2006-04-24 13:31:00.000000000 +0200
+++ linux/drivers/net/yellowfin.c	2006-04-26 14:09:29.000000000 +0200
@@ -275,7 +275,7 @@
  	{NULL,},
  };

-static struct pci_device_id yellowfin_pci_tbl[] = {
+static struct pci_device_id yellowfin_pci_tbl[] __devinitdata = {
  	{ 0x1000, 0x0702, PCI_ANY_ID, PCI_ANY_ID, 0, 0, 0 },
  	{ 0x1000, 0x0701, PCI_ANY_ID, PCI_ANY_ID, 0, 0, 1 },
  	{ 0, }
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
