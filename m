From: Henne <henne@nachtwindheim.de>
Date: Mon, 24 Apr 2006 13:16:35 +0000
Subject: [KJ] [PATCH] i2c-subsys cleanup
Message-Id: <444CCFB3.5010006@nachtwindheim.de>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

From: Henrik Kretzschmar <henne@nachtwindheim.de>

Marking the pci_device tables of i2c-subsys as __devinit and
removing a double MODULE_DEVICE_TABLE in i2c-prosavage.c
Signed-off-by: <henne@nachtwindheim.de>
---

diff -urN linux-2.6.17-rc2/drivers/i2c/busses/i2c-ali1535.c 
linux/drivers/i2c/busses/i2c-ali1535.c
--- linux-2.6.17-rc2/drivers/i2c/busses/i2c-ali1535.c	2006-04-24 
13:30:54.000000000 +0200
+++ linux/drivers/i2c/busses/i2c-ali1535.c	2006-04-24 14:57:19.000000000 
+0200
@@ -479,7 +479,7 @@
  	.algo		= &smbus_algorithm,
  };

-static struct pci_device_id ali1535_ids[] = {
+static struct pci_device_id ali1535_ids[] __devinitdata = {
  	{ PCI_DEVICE(PCI_VENDOR_ID_AL, PCI_DEVICE_ID_AL_M7101) },
  	{ },
  };
diff -urN linux-2.6.17-rc2/drivers/i2c/busses/i2c-ali1563.c 
linux/drivers/i2c/busses/i2c-ali1563.c
--- linux-2.6.17-rc2/drivers/i2c/busses/i2c-ali1563.c	2006-03-20 
06:53:29.000000000 +0100
+++ linux/drivers/i2c/busses/i2c-ali1563.c	2006-04-24 14:57:48.000000000 
+0200
@@ -400,7 +400,7 @@
  	ali1563_shutdown(dev);
  }

-static struct pci_device_id __devinitdata ali1563_id_table[] = {
+static struct pci_device_id ali1563_id_table[] __devinitdata = {
  	{ PCI_DEVICE(PCI_VENDOR_ID_AL, PCI_DEVICE_ID_AL_M1563) },
  	{},
  };
diff -urN linux-2.6.17-rc2/drivers/i2c/busses/i2c-ali15x3.c 
linux/drivers/i2c/busses/i2c-ali15x3.c
--- linux-2.6.17-rc2/drivers/i2c/busses/i2c-ali15x3.c	2006-03-20 
06:53:29.000000000 +0100
+++ linux/drivers/i2c/busses/i2c-ali15x3.c	2006-04-24 14:58:22.000000000 
+0200
@@ -474,7 +474,7 @@
  	.algo		= &smbus_algorithm,
  };

-static struct pci_device_id ali15x3_ids[] = {
+static struct pci_device_id ali15x3_ids[] __devinitdata = {
  	{ PCI_DEVICE(PCI_VENDOR_ID_AL, PCI_DEVICE_ID_AL_M7101) },
  	{ 0, }
  };
diff -urN linux-2.6.17-rc2/drivers/i2c/busses/i2c-amd756.c 
linux/drivers/i2c/busses/i2c-amd756.c
--- linux-2.6.17-rc2/drivers/i2c/busses/i2c-amd756.c	2006-03-20 
06:53:29.000000000 +0100
+++ linux/drivers/i2c/busses/i2c-amd756.c	2006-04-24 14:59:34.000000000 
+0200
@@ -311,7 +311,7 @@
  	"nVidia nForce", "AMD8111",
  };

-static struct pci_device_id amd756_ids[] = {
+static struct pci_device_id amd756_ids[] __devinitdata = {
  	{ PCI_DEVICE(PCI_VENDOR_ID_AMD, PCI_DEVICE_ID_AMD_VIPER_740B),
  	  .driver_data = AMD756 },
  	{ PCI_DEVICE(PCI_VENDOR_ID_AMD, PCI_DEVICE_ID_AMD_VIPER_7413),
diff -urN linux-2.6.17-rc2/drivers/i2c/busses/i2c-amd8111.c 
linux/drivers/i2c/busses/i2c-amd8111.c
--- linux-2.6.17-rc2/drivers/i2c/busses/i2c-amd8111.c	2006-03-20 
06:53:29.000000000 +0100
+++ linux/drivers/i2c/busses/i2c-amd8111.c	2006-04-24 15:00:13.000000000 
+0200
@@ -322,7 +322,7 @@
  };


-static struct pci_device_id amd8111_ids[] = {
+static struct pci_device_id amd8111_ids[] __devinitdata = {
  	{ PCI_DEVICE(PCI_VENDOR_ID_AMD, PCI_DEVICE_ID_AMD_8111_SMBUS2) },
  	{ 0, }
  };
diff -urN linux-2.6.17-rc2/drivers/i2c/busses/i2c-hydra.c 
linux/drivers/i2c/busses/i2c-hydra.c
--- linux-2.6.17-rc2/drivers/i2c/busses/i2c-hydra.c	2006-03-20 
06:53:29.000000000 +0100
+++ linux/drivers/i2c/busses/i2c-hydra.c	2006-04-24 15:00:50.000000000 +0200
@@ -110,7 +110,7 @@
  	.algo_data	= &hydra_bit_data,
  };

-static struct pci_device_id hydra_ids[] = {
+static struct pci_device_id hydra_ids[] __devinitdata = {
  	{ PCI_DEVICE(PCI_VENDOR_ID_APPLE, PCI_DEVICE_ID_APPLE_HYDRA) },
  	{ 0, }
  };
diff -urN linux-2.6.17-rc2/drivers/i2c/busses/i2c-i801.c 
linux/drivers/i2c/busses/i2c-i801.c
--- linux-2.6.17-rc2/drivers/i2c/busses/i2c-i801.c	2006-03-20 
06:53:29.000000000 +0100
+++ linux/drivers/i2c/busses/i2c-i801.c	2006-04-24 15:02:31.000000000 +0200
@@ -517,7 +517,7 @@
  	.algo		= &smbus_algorithm,
  };

-static struct pci_device_id i801_ids[] = {
+static struct pci_device_id i801_ids[] __devinitdata = {
  	{ PCI_DEVICE(PCI_VENDOR_ID_INTEL, PCI_DEVICE_ID_INTEL_82801AA_3) },
  	{ PCI_DEVICE(PCI_VENDOR_ID_INTEL, PCI_DEVICE_ID_INTEL_82801AB_3) },
  	{ PCI_DEVICE(PCI_VENDOR_ID_INTEL, PCI_DEVICE_ID_INTEL_82801BA_2) },
diff -urN linux-2.6.17-rc2/drivers/i2c/busses/i2c-nforce2.c 
linux/drivers/i2c/busses/i2c-nforce2.c
--- linux-2.6.17-rc2/drivers/i2c/busses/i2c-nforce2.c	2006-03-20 
06:53:29.000000000 +0100
+++ linux/drivers/i2c/busses/i2c-nforce2.c	2006-04-24 15:03:00.000000000 
+0200
@@ -252,7 +252,7 @@
  }


-static struct pci_device_id nforce2_ids[] = {
+static struct pci_device_id nforce2_ids[] __devinitdata = {
  	{ PCI_DEVICE(PCI_VENDOR_ID_NVIDIA, PCI_DEVICE_ID_NVIDIA_NFORCE2_SMBUS) },
  	{ PCI_DEVICE(PCI_VENDOR_ID_NVIDIA, 
PCI_DEVICE_ID_NVIDIA_NFORCE2S_SMBUS) },
  	{ PCI_DEVICE(PCI_VENDOR_ID_NVIDIA, PCI_DEVICE_ID_NVIDIA_NFORCE3_SMBUS) },
diff -urN linux-2.6.17-rc2/drivers/i2c/busses/i2c-piix4.c 
linux/drivers/i2c/busses/i2c-piix4.c
--- linux-2.6.17-rc2/drivers/i2c/busses/i2c-piix4.c	2006-04-24 
13:30:54.000000000 +0200
+++ linux/drivers/i2c/busses/i2c-piix4.c	2006-04-24 15:03:27.000000000 +0200
@@ -410,7 +410,7 @@
  	.algo		= &smbus_algorithm,
  };

-static struct pci_device_id piix4_ids[] = {
+static struct pci_device_id piix4_ids[] __devinitdata = {
  	{ PCI_DEVICE(PCI_VENDOR_ID_INTEL, PCI_DEVICE_ID_INTEL_82371AB_3),
  	  .driver_data = 3 },
  	{ PCI_DEVICE(PCI_VENDOR_ID_SERVERWORKS, PCI_DEVICE_ID_SERVERWORKS_OSB4),
diff -urN linux-2.6.17-rc2/drivers/i2c/busses/i2c-prosavage.c 
linux/drivers/i2c/busses/i2c-prosavage.c
--- linux-2.6.17-rc2/drivers/i2c/busses/i2c-prosavage.c	2006-03-20 
06:53:29.000000000 +0100
+++ linux/drivers/i2c/busses/i2c-prosavage.c	2006-04-24 
15:04:45.000000000 +0200
@@ -292,7 +292,7 @@
  /*
   * Data for PCI driver interface
   */
-static struct pci_device_id prosavage_pci_tbl[] = {
+static struct pci_device_id prosavage_pci_tbl[] __devinitdata = {
  	{ PCI_DEVICE(PCI_VENDOR_ID_S3, PCI_DEVICE_ID_S3_SAVAGE4) },
  	{ PCI_DEVICE(PCI_VENDOR_ID_S3, PCI_DEVICE_ID_S3_PROSAVAGE8) },
  	{ 0, },
@@ -317,7 +317,6 @@
  	pci_unregister_driver(&prosavage_driver);
  }

-MODULE_DEVICE_TABLE(pci, prosavage_pci_tbl);
  MODULE_AUTHOR("Henk Vergonet");
  MODULE_DESCRIPTION("ProSavage VIA 8365/8375 smbus driver");
  MODULE_LICENSE("GPL");
diff -urN linux-2.6.17-rc2/drivers/i2c/busses/i2c-sis96x.c 
linux/drivers/i2c/busses/i2c-sis96x.c
--- linux-2.6.17-rc2/drivers/i2c/busses/i2c-sis96x.c	2006-04-24 
13:30:54.000000000 +0200
+++ linux/drivers/i2c/busses/i2c-sis96x.c	2006-04-24 15:05:32.000000000 
+0200
@@ -253,7 +253,7 @@
  	.algo		= &smbus_algorithm,
  };

-static struct pci_device_id sis96x_ids[] = {
+static struct pci_device_id sis96x_ids[] __devinitdata = {
  	{ PCI_DEVICE(PCI_VENDOR_ID_SI, PCI_DEVICE_ID_SI_SMBUS) },
  	{ 0, }
  };
diff -urN linux-2.6.17-rc2/drivers/i2c/busses/i2c-viapro.c 
linux/drivers/i2c/busses/i2c-viapro.c
--- linux-2.6.17-rc2/drivers/i2c/busses/i2c-viapro.c	2006-03-20 
06:53:29.000000000 +0100
+++ linux/drivers/i2c/busses/i2c-viapro.c	2006-04-24 15:06:08.000000000 
+0200
@@ -417,7 +417,7 @@
  	return error;
  }

-static struct pci_device_id vt596_ids[] = {
+static struct pci_device_id vt596_ids[] __devinitdata = {
  	{ PCI_DEVICE(PCI_VENDOR_ID_VIA, PCI_DEVICE_ID_VIA_82C596_3),
  	  .driver_data = SMBBA1 },
  	{ PCI_DEVICE(PCI_VENDOR_ID_VIA, PCI_DEVICE_ID_VIA_82C596B_3),
diff -urN linux-2.6.17-rc2/drivers/i2c/busses/scx200_acb.c 
linux/drivers/i2c/busses/scx200_acb.c
--- linux-2.6.17-rc2/drivers/i2c/busses/scx200_acb.c	2006-04-24 
13:30:54.000000000 +0200
+++ linux/drivers/i2c/busses/scx200_acb.c	2006-04-24 15:09:28.000000000 
+0200
@@ -474,13 +474,13 @@
  	return rc;
  }

-static struct pci_device_id scx200[] = {
+static struct pci_device_id scx200[] __devinitdata = {
  	{ PCI_DEVICE(PCI_VENDOR_ID_NS, PCI_DEVICE_ID_NS_SCx200_BRIDGE) },
  	{ PCI_DEVICE(PCI_VENDOR_ID_NS, PCI_DEVICE_ID_NS_SC1100_BRIDGE) },
  	{ },
  };

-static struct pci_device_id divil_pci[] = {
+static struct pci_device_id divil_pci[] __devinitdata = {
  	{ PCI_DEVICE(PCI_VENDOR_ID_NS,  PCI_DEVICE_ID_NS_CS5535_ISA) },
  	{ PCI_DEVICE(PCI_VENDOR_ID_AMD, PCI_DEVICE_ID_AMD_CS5536_ISA) },
  	{ } /* NULL entry */

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
