From: Henne <henne@nachtwindheim.de>
Date: Wed, 26 Apr 2006 07:34:27 +0000
Subject: [KJ] [PATCH] __devinitdata fot ide-subsys
Message-Id: <444F2283.5070707@nachtwindheim.de>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

From: Henrik Kretzschmar <henne@nachtwindheim.de>

Marking the pci_device_id tables of the ide-subsys as __devinitdata.
Signed-off-by: Henrik Kretzschmar <henne@nachtwindheim.de>
---

diff -ruN linux-2.6.17-rc2/drivers/ide/pci/aec62xx.c linux/drivers/ide/pci/aec62xx.c
--- linux-2.6.17-rc2/drivers/ide/pci/aec62xx.c	2006-03-20 06:53:29.000000000 +0100
+++ linux/drivers/ide/pci/aec62xx.c	2006-04-26 09:20:22.000000000 +0200
@@ -425,7 +425,7 @@
  	return d->init_setup(dev, d);
  }

-static struct pci_device_id aec62xx_pci_tbl[] = {
+static struct pci_device_id aec62xx_pci_tbl[] __devinitdata = {
  	{ PCI_VENDOR_ID_ARTOP, PCI_DEVICE_ID_ARTOP_ATP850UF, PCI_ANY_ID, PCI_ANY_ID, 0, 0, 0 },
  	{ PCI_VENDOR_ID_ARTOP, PCI_DEVICE_ID_ARTOP_ATP860,   PCI_ANY_ID, PCI_ANY_ID, 0, 0, 1 },
  	{ PCI_VENDOR_ID_ARTOP, PCI_DEVICE_ID_ARTOP_ATP860R,  PCI_ANY_ID, PCI_ANY_ID, 0, 0, 2 },
diff -ruN linux-2.6.17-rc2/drivers/ide/pci/alim15x3.c linux/drivers/ide/pci/alim15x3.c
--- linux-2.6.17-rc2/drivers/ide/pci/alim15x3.c	2006-03-20 06:53:29.000000000 +0100
+++ linux/drivers/ide/pci/alim15x3.c	2006-04-26 09:21:50.000000000 +0200
@@ -893,7 +893,7 @@
  }


-static struct pci_device_id alim15x3_pci_tbl[] = {
+static struct pci_device_id alim15x3_pci_tbl[] __devinitdata = {
  	{ PCI_VENDOR_ID_AL, PCI_DEVICE_ID_AL_M5229, PCI_ANY_ID, PCI_ANY_ID, 0, 0, 0 },
  	{ PCI_VENDOR_ID_AL, PCI_DEVICE_ID_AL_M5228, PCI_ANY_ID, PCI_ANY_ID, 0, 0, 0 },
  	{ 0, },
diff -ruN linux-2.6.17-rc2/drivers/ide/pci/amd74xx.c linux/drivers/ide/pci/amd74xx.c
--- linux-2.6.17-rc2/drivers/ide/pci/amd74xx.c	2006-04-24 13:30:55.000000000 +0200
+++ linux/drivers/ide/pci/amd74xx.c	2006-04-26 09:22:15.000000000 +0200
@@ -503,7 +503,7 @@
  	return ide_setup_pci_device(dev, amd_chipset);
  }

-static struct pci_device_id amd74xx_pci_tbl[] = {
+static struct pci_device_id amd74xx_pci_tbl[] __devinitdata = {
  	{ PCI_VENDOR_ID_AMD,	PCI_DEVICE_ID_AMD_COBRA_7401,		PCI_ANY_ID, PCI_ANY_ID, 0, 0,  0 },
  	{ PCI_VENDOR_ID_AMD,	PCI_DEVICE_ID_AMD_VIPER_7409,		PCI_ANY_ID, PCI_ANY_ID, 0, 0,  1 },
  	{ PCI_VENDOR_ID_AMD,	PCI_DEVICE_ID_AMD_VIPER_7411,		PCI_ANY_ID, PCI_ANY_ID, 0, 0,  2 },
diff -ruN linux-2.6.17-rc2/drivers/ide/pci/atiixp.c linux/drivers/ide/pci/atiixp.c
--- linux-2.6.17-rc2/drivers/ide/pci/atiixp.c	2006-03-20 06:53:29.000000000 +0100
+++ linux/drivers/ide/pci/atiixp.c	2006-04-26 09:22:46.000000000 +0200
@@ -344,7 +344,7 @@
  	return ide_setup_pci_device(dev, &atiixp_pci_info[id->driver_data]);
  }

-static struct pci_device_id atiixp_pci_tbl[] = {
+static struct pci_device_id atiixp_pci_tbl[] __devinitdata = {
  	{ PCI_VENDOR_ID_ATI, PCI_DEVICE_ID_ATI_IXP200_IDE, PCI_ANY_ID, PCI_ANY_ID, 0, 0, 0},
  	{ PCI_VENDOR_ID_ATI, PCI_DEVICE_ID_ATI_IXP300_IDE, PCI_ANY_ID, PCI_ANY_ID, 0, 0, 0},
  	{ PCI_VENDOR_ID_ATI, PCI_DEVICE_ID_ATI_IXP400_IDE, PCI_ANY_ID, PCI_ANY_ID, 0, 0, 0},
diff -ruN linux-2.6.17-rc2/drivers/ide/pci/cmd64x.c linux/drivers/ide/pci/cmd64x.c
--- linux-2.6.17-rc2/drivers/ide/pci/cmd64x.c	2006-03-20 06:53:29.000000000 +0100
+++ linux/drivers/ide/pci/cmd64x.c	2006-04-26 09:23:06.000000000 +0200
@@ -794,7 +794,7 @@
  	return ide_setup_pci_device(dev, &cmd64x_chipsets[id->driver_data]);
  }

-static struct pci_device_id cmd64x_pci_tbl[] = {
+static struct pci_device_id cmd64x_pci_tbl[] __devinitdata = {
  	{ PCI_VENDOR_ID_CMD, PCI_DEVICE_ID_CMD_643, PCI_ANY_ID, PCI_ANY_ID, 0, 0, 0},
  	{ PCI_VENDOR_ID_CMD, PCI_DEVICE_ID_CMD_646, PCI_ANY_ID, PCI_ANY_ID, 0, 0, 1},
  	{ PCI_VENDOR_ID_CMD, PCI_DEVICE_ID_CMD_648, PCI_ANY_ID, PCI_ANY_ID, 0, 0, 2},
diff -ruN linux-2.6.17-rc2/drivers/ide/pci/cs5520.c linux/drivers/ide/pci/cs5520.c
--- linux-2.6.17-rc2/drivers/ide/pci/cs5520.c	2006-03-20 06:53:29.000000000 +0100
+++ linux/drivers/ide/pci/cs5520.c	2006-04-26 09:23:23.000000000 +0200
@@ -248,7 +248,7 @@
  	return 0;
  }

-static struct pci_device_id cs5520_pci_tbl[] = {
+static struct pci_device_id cs5520_pci_tbl[] __devinitdata = {
  	{ PCI_VENDOR_ID_CYRIX, PCI_DEVICE_ID_CYRIX_5510, PCI_ANY_ID, PCI_ANY_ID, 0, 0, 0},
  	{ PCI_VENDOR_ID_CYRIX, PCI_DEVICE_ID_CYRIX_5520, PCI_ANY_ID, PCI_ANY_ID, 0, 0, 1},
  	{ 0, },
diff -ruN linux-2.6.17-rc2/drivers/ide/pci/cs5530.c linux/drivers/ide/pci/cs5530.c
--- linux-2.6.17-rc2/drivers/ide/pci/cs5530.c	2006-03-20 06:53:29.000000000 +0100
+++ linux/drivers/ide/pci/cs5530.c	2006-04-26 09:23:36.000000000 +0200
@@ -360,7 +360,7 @@
  	return ide_setup_pci_device(dev, &cs5530_chipset);
  }

-static struct pci_device_id cs5530_pci_tbl[] = {
+static struct pci_device_id cs5530_pci_tbl[] __devinitdata = {
  	{ PCI_VENDOR_ID_CYRIX, PCI_DEVICE_ID_CYRIX_5530_IDE, PCI_ANY_ID, PCI_ANY_ID, 0, 0, 0},
  	{ 0, },
  };
diff -ruN linux-2.6.17-rc2/drivers/ide/pci/cs5535.c linux/drivers/ide/pci/cs5535.c
--- linux-2.6.17-rc2/drivers/ide/pci/cs5535.c	2006-03-20 06:53:29.000000000 +0100
+++ linux/drivers/ide/pci/cs5535.c	2006-04-26 09:23:53.000000000 +0200
@@ -278,7 +278,7 @@
  	return ide_setup_pci_device(dev, &cs5535_chipset);
  }

-static struct pci_device_id cs5535_pci_tbl[] +static struct pci_device_id cs5535_pci_tbl[] __devinitdata   {
  	{ PCI_VENDOR_ID_NS, PCI_DEVICE_ID_NS_CS5535_IDE, PCI_ANY_ID,
  		PCI_ANY_ID, 0, 0, 0},
diff -ruN linux-2.6.17-rc2/drivers/ide/pci/cy82c693.c linux/drivers/ide/pci/cy82c693.c
--- linux-2.6.17-rc2/drivers/ide/pci/cy82c693.c	2006-03-20 06:53:29.000000000 +0100
+++ linux/drivers/ide/pci/cy82c693.c	2006-04-26 09:24:19.000000000 +0200
@@ -507,7 +507,7 @@
  	return ret;
  }

-static struct pci_device_id cy82c693_pci_tbl[] = {
+static struct pci_device_id cy82c693_pci_tbl[] __devinitdata = {
  	{ PCI_VENDOR_ID_CONTAQ, PCI_DEVICE_ID_CONTAQ_82C693, PCI_ANY_ID, PCI_ANY_ID, 0, 0, 0},
  	{ 0, },
  };
diff -ruN linux-2.6.17-rc2/drivers/ide/pci/generic.c linux/drivers/ide/pci/generic.c
--- linux-2.6.17-rc2/drivers/ide/pci/generic.c	2006-04-24 13:30:55.000000000 +0200
+++ linux/drivers/ide/pci/generic.c	2006-04-26 09:24:39.000000000 +0200
@@ -222,7 +222,7 @@
  	return ret;
  }

-static struct pci_device_id generic_pci_tbl[] = {
+static struct pci_device_id generic_pci_tbl[] __devinitdata = {
  	{ PCI_VENDOR_ID_NS,     PCI_DEVICE_ID_NS_87410,            PCI_ANY_ID, PCI_ANY_ID, 0, 0, 1},
  	{ PCI_VENDOR_ID_PCTECH, PCI_DEVICE_ID_PCTECH_SAMURAI_IDE,  PCI_ANY_ID, PCI_ANY_ID, 0, 0, 2},
  	{ PCI_VENDOR_ID_HOLTEK, PCI_DEVICE_ID_HOLTEK_6565,         PCI_ANY_ID, PCI_ANY_ID, 0, 0, 3},
diff -ruN linux-2.6.17-rc2/drivers/ide/pci/hpt34x.c linux/drivers/ide/pci/hpt34x.c
--- linux-2.6.17-rc2/drivers/ide/pci/hpt34x.c	2006-03-20 06:53:29.000000000 +0100
+++ linux/drivers/ide/pci/hpt34x.c	2006-04-26 09:24:59.000000000 +0200
@@ -254,7 +254,7 @@
  	return ide_setup_pci_device(dev, d);
  }

-static struct pci_device_id hpt34x_pci_tbl[] = {
+static struct pci_device_id hpt34x_pci_tbl[] __devinitdata = {
  	{ PCI_VENDOR_ID_TTI, PCI_DEVICE_ID_TTI_HPT343, PCI_ANY_ID, PCI_ANY_ID, 0, 0, 0},
  	{ 0, },
  };
diff -ruN linux-2.6.17-rc2/drivers/ide/pci/hpt366.c linux/drivers/ide/pci/hpt366.c
--- linux-2.6.17-rc2/drivers/ide/pci/hpt366.c	2006-03-20 06:53:29.000000000 +0100
+++ linux/drivers/ide/pci/hpt366.c	2006-04-26 09:25:19.000000000 +0200
@@ -1709,7 +1709,7 @@
  	return d->init_setup(dev, d);
  }

-static struct pci_device_id hpt366_pci_tbl[] = {
+static struct pci_device_id hpt366_pci_tbl[] __devinitdata = {
  	{ PCI_VENDOR_ID_TTI, PCI_DEVICE_ID_TTI_HPT366, PCI_ANY_ID, PCI_ANY_ID, 0, 0, 0},
  	{ PCI_VENDOR_ID_TTI, PCI_DEVICE_ID_TTI_HPT372, PCI_ANY_ID, PCI_ANY_ID, 0, 0, 1},
  	{ PCI_VENDOR_ID_TTI, PCI_DEVICE_ID_TTI_HPT302, PCI_ANY_ID, PCI_ANY_ID, 0, 0, 2},
diff -ruN linux-2.6.17-rc2/drivers/ide/pci/it8172.c linux/drivers/ide/pci/it8172.c
--- linux-2.6.17-rc2/drivers/ide/pci/it8172.c	2006-03-20 06:53:29.000000000 +0100
+++ linux/drivers/ide/pci/it8172.c	2006-04-26 09:25:37.000000000 +0200
@@ -284,7 +284,7 @@
  	return ide_setup_pci_device(dev, &it8172_chipsets[id->driver_data]);
  }

-static struct pci_device_id it8172_pci_tbl[] = {
+static struct pci_device_id it8172_pci_tbl[] __devinitdata = {
  	{ PCI_VENDOR_ID_ITE, PCI_DEVICE_ID_ITE_IT8172G, PCI_ANY_ID, PCI_ANY_ID, 0, 0, 0},
  	{ 0, },
  };
diff -ruN linux-2.6.17-rc2/drivers/ide/pci/it821x.c linux/drivers/ide/pci/it821x.c
--- linux-2.6.17-rc2/drivers/ide/pci/it821x.c	2006-03-20 06:53:29.000000000 +0100
+++ linux/drivers/ide/pci/it821x.c	2006-04-26 09:25:59.000000000 +0200
@@ -782,7 +782,7 @@
  	return 0;
  }

-static struct pci_device_id it821x_pci_tbl[] = {
+static struct pci_device_id it821x_pci_tbl[] __devinitdata = {
  	{ PCI_VENDOR_ID_ITE, PCI_DEVICE_ID_ITE_8211,  PCI_ANY_ID, PCI_ANY_ID, 0, 0, 0},
  	{ PCI_VENDOR_ID_ITE, PCI_DEVICE_ID_ITE_8212,  PCI_ANY_ID, PCI_ANY_ID, 0, 0, 0},
  	{ 0, },
diff -ruN linux-2.6.17-rc2/drivers/ide/pci/ns87415.c linux/drivers/ide/pci/ns87415.c
--- linux-2.6.17-rc2/drivers/ide/pci/ns87415.c	2006-03-20 06:53:29.000000000 +0100
+++ linux/drivers/ide/pci/ns87415.c	2006-04-26 09:26:26.000000000 +0200
@@ -291,7 +291,7 @@
  	return ide_setup_pci_device(dev, &ns87415_chipset);
  }

-static struct pci_device_id ns87415_pci_tbl[] = {
+static struct pci_device_id ns87415_pci_tbl[] __devinitdata = {
  	{ PCI_VENDOR_ID_NS, PCI_DEVICE_ID_NS_87415, PCI_ANY_ID, PCI_ANY_ID, 0, 0, 0},
  	{ 0, },
  };
diff -ruN linux-2.6.17-rc2/drivers/ide/pci/opti621.c linux/drivers/ide/pci/opti621.c
--- linux-2.6.17-rc2/drivers/ide/pci/opti621.c	2006-03-20 06:53:29.000000000 +0100
+++ linux/drivers/ide/pci/opti621.c	2006-04-26 09:27:26.000000000 +0200
@@ -369,7 +369,7 @@
  	return ide_setup_pci_device(dev, &opti621_chipsets[id->driver_data]);
  }

-static struct pci_device_id opti621_pci_tbl[] = {
+static struct pci_device_id opti621_pci_tbl[] __devinitdata = {
  	{ PCI_VENDOR_ID_OPTI, PCI_DEVICE_ID_OPTI_82C621, PCI_ANY_ID, PCI_ANY_ID, 0, 0, 0},
  	{ PCI_VENDOR_ID_OPTI, PCI_DEVICE_ID_OPTI_82C825, PCI_ANY_ID, PCI_ANY_ID, 0, 0, 1},
  	{ 0, },
diff -ruN linux-2.6.17-rc2/drivers/ide/pci/pdc202xx_new.c linux/drivers/ide/pci/pdc202xx_new.c
--- linux-2.6.17-rc2/drivers/ide/pci/pdc202xx_new.c	2006-03-20 06:53:29.000000000 +0100
+++ linux/drivers/ide/pci/pdc202xx_new.c	2006-04-26 09:27:47.000000000 +0200
@@ -472,7 +472,7 @@
  	return d->init_setup(dev, d);
  }

-static struct pci_device_id pdc202new_pci_tbl[] = {
+static struct pci_device_id pdc202new_pci_tbl[] __devinitdata = {
  	{ PCI_VENDOR_ID_PROMISE, PCI_DEVICE_ID_PROMISE_20268, PCI_ANY_ID, PCI_ANY_ID, 0, 0, 0},
  	{ PCI_VENDOR_ID_PROMISE, PCI_DEVICE_ID_PROMISE_20269, PCI_ANY_ID, PCI_ANY_ID, 0, 0, 1},
  	{ PCI_VENDOR_ID_PROMISE, PCI_DEVICE_ID_PROMISE_20270, PCI_ANY_ID, PCI_ANY_ID, 0, 0, 2},
diff -ruN linux-2.6.17-rc2/drivers/ide/pci/pdc202xx_old.c linux/drivers/ide/pci/pdc202xx_old.c
--- linux-2.6.17-rc2/drivers/ide/pci/pdc202xx_old.c	2006-03-20 06:53:29.000000000 +0100
+++ linux/drivers/ide/pci/pdc202xx_old.c	2006-04-26 09:27:58.000000000 +0200
@@ -849,7 +849,7 @@
  	return d->init_setup(dev, d);
  }

-static struct pci_device_id pdc202xx_pci_tbl[] = {
+static struct pci_device_id pdc202xx_pci_tbl[] __devinitdata = {
  	{ PCI_VENDOR_ID_PROMISE, PCI_DEVICE_ID_PROMISE_20246, PCI_ANY_ID, PCI_ANY_ID, 0, 0, 0},
  	{ PCI_VENDOR_ID_PROMISE, PCI_DEVICE_ID_PROMISE_20262, PCI_ANY_ID, PCI_ANY_ID, 0, 0, 1},
  	{ PCI_VENDOR_ID_PROMISE, PCI_DEVICE_ID_PROMISE_20263, PCI_ANY_ID, PCI_ANY_ID, 0, 0, 2},
diff -ruN linux-2.6.17-rc2/drivers/ide/pci/piix.c linux/drivers/ide/pci/piix.c
--- linux-2.6.17-rc2/drivers/ide/pci/piix.c	2006-03-20 06:53:29.000000000 +0100
+++ linux/drivers/ide/pci/piix.c	2006-04-26 09:28:19.000000000 +0200
@@ -627,7 +627,7 @@
  		printk(KERN_WARNING "piix: A BIOS update may resolve this.\n");
  }		

-static struct pci_device_id piix_pci_tbl[] = {
+static struct pci_device_id piix_pci_tbl[] __devinitdata = {
  	{ PCI_VENDOR_ID_INTEL, PCI_DEVICE_ID_INTEL_82371FB_0, PCI_ANY_ID, PCI_ANY_ID, 0, 0, 0},
  	{ PCI_VENDOR_ID_INTEL, PCI_DEVICE_ID_INTEL_82371FB_1, PCI_ANY_ID, PCI_ANY_ID, 0, 0, 1},
  	{ PCI_VENDOR_ID_INTEL, PCI_DEVICE_ID_INTEL_82371MX,   PCI_ANY_ID, PCI_ANY_ID, 0, 0, 2},
diff -ruN linux-2.6.17-rc2/drivers/ide/pci/rz1000.c linux/drivers/ide/pci/rz1000.c
--- linux-2.6.17-rc2/drivers/ide/pci/rz1000.c	2006-03-20 06:53:29.000000000 +0100
+++ linux/drivers/ide/pci/rz1000.c	2006-04-26 09:28:31.000000000 +0200
@@ -65,7 +65,7 @@
  	return ide_setup_pci_device(dev, &rz1000_chipset);
  }

-static struct pci_device_id rz1000_pci_tbl[] = {
+static struct pci_device_id rz1000_pci_tbl[] __devinitdata = {
  	{ PCI_VENDOR_ID_PCTECH, PCI_DEVICE_ID_PCTECH_RZ1000, PCI_ANY_ID, PCI_ANY_ID, 0, 0, 0},
  	{ PCI_VENDOR_ID_PCTECH, PCI_DEVICE_ID_PCTECH_RZ1001, PCI_ANY_ID, PCI_ANY_ID, 0, 0, 0},
  	{ 0, },
diff -ruN linux-2.6.17-rc2/drivers/ide/pci/sc1200.c linux/drivers/ide/pci/sc1200.c
--- linux-2.6.17-rc2/drivers/ide/pci/sc1200.c	2006-03-20 06:53:29.000000000 +0100
+++ linux/drivers/ide/pci/sc1200.c	2006-04-26 09:28:50.000000000 +0200
@@ -492,7 +492,7 @@
  	return ide_setup_pci_device(dev, &sc1200_chipset);
  }

-static struct pci_device_id sc1200_pci_tbl[] = {
+static struct pci_device_id sc1200_pci_tbl[] __devinitdata = {
  	{ PCI_VENDOR_ID_NS, PCI_DEVICE_ID_NS_SCx200_IDE, PCI_ANY_ID, PCI_ANY_ID, 0, 0, 0},
  	{ 0, },
  };
diff -ruN linux-2.6.17-rc2/drivers/ide/pci/serverworks.c linux/drivers/ide/pci/serverworks.c
--- linux-2.6.17-rc2/drivers/ide/pci/serverworks.c	2006-03-20 06:53:29.000000000 +0100
+++ linux/drivers/ide/pci/serverworks.c	2006-04-26 09:29:06.000000000 +0200
@@ -670,7 +670,7 @@
  	return d->init_setup(dev, d);
  }

-static struct pci_device_id svwks_pci_tbl[] = {
+static struct pci_device_id svwks_pci_tbl[] __devinitdata = {
  	{ PCI_VENDOR_ID_SERVERWORKS, PCI_DEVICE_ID_SERVERWORKS_OSB4IDE, PCI_ANY_ID, PCI_ANY_ID, 0, 0, 0},
  	{ PCI_VENDOR_ID_SERVERWORKS, PCI_DEVICE_ID_SERVERWORKS_CSB5IDE, PCI_ANY_ID, PCI_ANY_ID, 0, 0, 1},
  	{ PCI_VENDOR_ID_SERVERWORKS, PCI_DEVICE_ID_SERVERWORKS_CSB6IDE, PCI_ANY_ID, PCI_ANY_ID, 0, 0, 2},
diff -ruN linux-2.6.17-rc2/drivers/ide/pci/siimage.c linux/drivers/ide/pci/siimage.c
--- linux-2.6.17-rc2/drivers/ide/pci/siimage.c	2006-03-20 06:53:29.000000000 +0100
+++ linux/drivers/ide/pci/siimage.c	2006-04-26 09:29:18.000000000 +0200
@@ -1120,7 +1120,7 @@
  	return ide_setup_pci_device(dev, &siimage_chipsets[id->driver_data]);
  }

-static struct pci_device_id siimage_pci_tbl[] = {
+static struct pci_device_id siimage_pci_tbl[] __devinitdata = {
  	{ PCI_VENDOR_ID_CMD, PCI_DEVICE_ID_SII_680,  PCI_ANY_ID, PCI_ANY_ID, 0, 0, 0},
  #ifdef CONFIG_BLK_DEV_IDE_SATA
  	{ PCI_VENDOR_ID_CMD, PCI_DEVICE_ID_SII_3112, PCI_ANY_ID, PCI_ANY_ID, 0, 0, 1},
diff -ruN linux-2.6.17-rc2/drivers/ide/pci/sis5513.c linux/drivers/ide/pci/sis5513.c
--- linux-2.6.17-rc2/drivers/ide/pci/sis5513.c	2006-04-24 13:30:55.000000000 +0200
+++ linux/drivers/ide/pci/sis5513.c	2006-04-26 09:29:33.000000000 +0200
@@ -952,7 +952,7 @@
  	return ide_setup_pci_device(dev, &sis5513_chipset);
  }

-static struct pci_device_id sis5513_pci_tbl[] = {
+static struct pci_device_id sis5513_pci_tbl[] __devinitdata = {
  	{ PCI_VENDOR_ID_SI, PCI_DEVICE_ID_SI_5513, PCI_ANY_ID, PCI_ANY_ID, 0, 0, 0},
  	{ PCI_VENDOR_ID_SI, PCI_DEVICE_ID_SI_5518, PCI_ANY_ID, PCI_ANY_ID, 0, 0, 0},
  	{ 0, },
diff -ruN linux-2.6.17-rc2/drivers/ide/pci/sl82c105.c linux/drivers/ide/pci/sl82c105.c
--- linux-2.6.17-rc2/drivers/ide/pci/sl82c105.c	2006-03-20 06:53:29.000000000 +0100
+++ linux/drivers/ide/pci/sl82c105.c	2006-04-26 09:29:48.000000000 +0200
@@ -488,7 +488,7 @@
  	return ide_setup_pci_device(dev, &sl82c105_chipset);
  }

-static struct pci_device_id sl82c105_pci_tbl[] = {
+static struct pci_device_id sl82c105_pci_tbl[] __devinitdata = {
  	{ PCI_VENDOR_ID_WINBOND, PCI_DEVICE_ID_WINBOND_82C105, PCI_ANY_ID, PCI_ANY_ID, 0, 0, 0},
  	{ 0, },
  };
diff -ruN linux-2.6.17-rc2/drivers/ide/pci/slc90e66.c linux/drivers/ide/pci/slc90e66.c
--- linux-2.6.17-rc2/drivers/ide/pci/slc90e66.c	2006-03-20 06:53:29.000000000 +0100
+++ linux/drivers/ide/pci/slc90e66.c	2006-04-26 09:30:01.000000000 +0200
@@ -249,7 +249,7 @@
  	return ide_setup_pci_device(dev, &slc90e66_chipset);
  }

-static struct pci_device_id slc90e66_pci_tbl[] = {
+static struct pci_device_id slc90e66_pci_tbl[] __devinitdata = {
  	{ PCI_VENDOR_ID_EFAR, PCI_DEVICE_ID_EFAR_SLC90E66_1, PCI_ANY_ID, PCI_ANY_ID, 0, 0, 0},
  	{ 0, },
  };
diff -ruN linux-2.6.17-rc2/drivers/ide/pci/triflex.c linux/drivers/ide/pci/triflex.c
--- linux-2.6.17-rc2/drivers/ide/pci/triflex.c	2006-03-20 06:53:29.000000000 +0100
+++ linux/drivers/ide/pci/triflex.c	2006-04-26 09:30:15.000000000 +0200
@@ -161,7 +161,7 @@
  	return ide_setup_pci_device(dev, &triflex_device);
  }

-static struct pci_device_id triflex_pci_tbl[] = {
+static struct pci_device_id triflex_pci_tbl[] __devinitdata = {
  	{ PCI_VENDOR_ID_COMPAQ, PCI_DEVICE_ID_COMPAQ_TRIFLEX_IDE,
  	  PCI_ANY_ID, PCI_ANY_ID, 0, 0, 0 },
  	{ 0, },
diff -ruN linux-2.6.17-rc2/drivers/ide/pci/trm290.c linux/drivers/ide/pci/trm290.c
--- linux-2.6.17-rc2/drivers/ide/pci/trm290.c	2006-03-20 06:53:29.000000000 +0100
+++ linux/drivers/ide/pci/trm290.c	2006-04-26 09:30:29.000000000 +0200
@@ -345,7 +345,7 @@
  	return ide_setup_pci_device(dev, &trm290_chipset);
  }

-static struct pci_device_id trm290_pci_tbl[] = {
+static struct pci_device_id trm290_pci_tbl[] __devinitdata = {
  	{ PCI_VENDOR_ID_TEKRAM, PCI_DEVICE_ID_TEKRAM_DC290, PCI_ANY_ID, PCI_ANY_ID, 0, 0, 0},
  	{ 0, },
  };
diff -ruN linux-2.6.17-rc2/drivers/ide/pci/via82cxxx.c linux/drivers/ide/pci/via82cxxx.c
--- linux-2.6.17-rc2/drivers/ide/pci/via82cxxx.c	2006-04-24 13:30:55.000000000 +0200
+++ linux/drivers/ide/pci/via82cxxx.c	2006-04-26 09:30:44.000000000 +0200
@@ -494,7 +494,7 @@
  	return ide_setup_pci_device(dev, &via82cxxx_chipsets[id->driver_data]);
  }

-static struct pci_device_id via_pci_tbl[] = {
+static struct pci_device_id via_pci_tbl[] __devinitdata = {
  	{ PCI_VENDOR_ID_VIA, PCI_DEVICE_ID_VIA_82C576_1, PCI_ANY_ID, PCI_ANY_ID, 0, 0, 0},
  	{ PCI_VENDOR_ID_VIA, PCI_DEVICE_ID_VIA_82C586_1, PCI_ANY_ID, PCI_ANY_ID, 0, 0, 0},
  	{ PCI_VENDOR_ID_VIA, PCI_DEVICE_ID_VIA_6410,     PCI_ANY_ID, PCI_ANY_ID, 0, 0, 1},
diff -ruN linux-2.6.17-rc2/drivers/ide/ppc/pmac.c linux/drivers/ide/ppc/pmac.c
--- linux-2.6.17-rc2/drivers/ide/ppc/pmac.c	2006-04-24 13:30:55.000000000 +0200
+++ linux/drivers/ide/ppc/pmac.c	2006-04-26 09:18:05.000000000 +0200
@@ -1652,7 +1652,7 @@
  	.resume		= pmac_ide_macio_resume,
  };

-static struct pci_device_id pmac_ide_pci_match[] = {
+static struct pci_device_id pmac_ide_pci_match[] __devinitdata = {
  	{ PCI_VENDOR_ID_APPLE, PCI_DEVICE_ID_APPLE_UNI_N_ATA,
  	  PCI_ANY_ID, PCI_ANY_ID, 0, 0, 0},
  	{ PCI_VENDOR_ID_APPLE, PCI_DEVICE_ID_APPLE_IPID_ATA100,
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
