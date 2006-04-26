From: Henne <henne@nachtwindheim.de>
Date: Wed, 26 Apr 2006 07:01:58 +0000
Subject: [KJ] [PATCH] __devinitdata for hwmon-subsys
Message-Id: <444F1AE6.5060903@nachtwindheim.de>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

From: Henrik Kretzschmar <henne@nachtwindheim.de>

Marking the pci_device tables of hwmon-subsys as __devinitdata.
Signed-off-by: Henrik Kretzschmar <henne@nachtwindheim.de>
---

diff -urN linux-2.6.17-rc2/drivers/hwmon/sis5595.c linux/drivers/hwmon/sis5595.c
--- linux-2.6.17-rc2/drivers/hwmon/sis5595.c	2006-04-24 13:30:54.000000000 +0200
+++ linux/drivers/hwmon/sis5595.c	2006-04-24 14:45:29.000000000 +0200
@@ -713,7 +713,7 @@
  	return data;
  }

-static struct pci_device_id sis5595_pci_ids[] = {
+static struct pci_device_id sis5595_pci_ids[] __devinitdata = {
  	{ PCI_DEVICE(PCI_VENDOR_ID_SI, PCI_DEVICE_ID_SI_503) },
  	{ 0, }
  };
diff -urN linux-2.6.17-rc2/drivers/hwmon/via686a.c linux/drivers/hwmon/via686a.c
--- linux-2.6.17-rc2/drivers/hwmon/via686a.c	2006-04-24 13:30:54.000000000 +0200
+++ linux/drivers/hwmon/via686a.c	2006-04-24 14:46:10.000000000 +0200
@@ -794,7 +794,7 @@
  	return data;
  }

-static struct pci_device_id via686a_pci_ids[] = {
+static struct pci_device_id via686a_pci_ids[] __devinitdata = {
  	{ PCI_DEVICE(PCI_VENDOR_ID_VIA, PCI_DEVICE_ID_VIA_82C686_4) },
  	{ 0, }
  };
diff -urN linux-2.6.17-rc2/drivers/hwmon/vt8231.c linux/drivers/hwmon/vt8231.c
--- linux-2.6.17-rc2/drivers/hwmon/vt8231.c	2006-04-24 13:30:54.000000000 +0200
+++ linux/drivers/hwmon/vt8231.c	2006-04-24 14:46:33.000000000 +0200
@@ -593,7 +593,7 @@
  	.detach_client	= vt8231_detach_client,
  };

-static struct pci_device_id vt8231_pci_ids[] = {
+static struct pci_device_id vt8231_pci_ids[] __devinitdata = {
  	{ PCI_DEVICE(PCI_VENDOR_ID_VIA, PCI_DEVICE_ID_VIA_8231_4) },
  	{ 0, }
  };
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
