From: Henne <henne@nachtwindheim.de>
Date: Mon, 24 Apr 2006 15:36:21 +0000
Subject: [KJ] [PATCH] Marking the pci_device_id tables of the pci-subsystem
Message-Id: <444CF075.3050608@nachtwindheim.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <444CEB94.4010109@nachtwindheim.de>
In-Reply-To: <444CEB94.4010109@nachtwindheim.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

From: Henrik Kretzschmar <henne@nachtwindheim.de>

Marking the pci_device_id tables of the pci-subsystem as __devinitdata.
Signed-off-by: Henrik Kretzschmar <henne@nachtwindheim.de>
---
Maybe this patch is bogus, since these drivers can't be compiled without
HOTPLUG_PCI with Kconfig. Decide yourself. :)

diff -urN linux-2.6.17-rc2/drivers/pci/hotplug/cpcihp_zt5550.c 
linux/drivers/pci/hotplug/cpcihp_zt5550.c
--- linux-2.6.17-rc2/drivers/pci/hotplug/cpcihp_zt5550.c	2006-03-20 
06:53:29.000000000 +0100
+++ linux/drivers/pci/hotplug/cpcihp_zt5550.c	2006-04-24 
17:26:02.000000000 +0200
@@ -279,7 +279,7 @@
  }


-static struct pci_device_id zt5550_hc_pci_tbl[] = {
+static struct pci_device_id zt5550_hc_pci_tbl[] __devinitdata = {
  	{ PCI_VENDOR_ID_ZIATECH, PCI_DEVICE_ID_ZIATECH_5550_HC, PCI_ANY_ID, 
PCI_ANY_ID, },
  	{ 0, }
  };
diff -urN linux-2.6.17-rc2/drivers/pci/hotplug/cpqphp_core.c 
linux/drivers/pci/hotplug/cpqphp_core.c
--- linux-2.6.17-rc2/drivers/pci/hotplug/cpqphp_core.c	2006-04-24 
13:31:00.000000000 +0200
+++ linux/drivers/pci/hotplug/cpqphp_core.c	2006-04-24 
17:26:33.000000000 +0200
@@ -1477,7 +1477,7 @@



-static struct pci_device_id hpcd_pci_tbl[] = {
+static struct pci_device_id hpcd_pci_tbl[] __devinitdata = {
  	{
  	/* handle any PCI Hotplug controller */
  	.class =        ((PCI_CLASS_SYSTEM_PCI_HOTPLUG << 8) | 0x00),
diff -urN linux-2.6.17-rc2/drivers/pci/hotplug/ibmphp_ebda.c 
linux/drivers/pci/hotplug/ibmphp_ebda.c
--- linux-2.6.17-rc2/drivers/pci/hotplug/ibmphp_ebda.c	2006-04-24 
13:31:00.000000000 +0200
+++ linux/drivers/pci/hotplug/ibmphp_ebda.c	2006-04-24 
17:28:40.000000000 +0200
@@ -1189,7 +1189,7 @@
  	}
  }

-static struct pci_device_id id_table[] = {
+static struct pci_device_id id_table[] __devinitdata = {
  	{
  		.vendor		= PCI_VENDOR_ID_IBM,
  		.device		= HPC_DEVICE_ID,
diff -urN linux-2.6.17-rc2/drivers/pci/hotplug/shpchp_core.c 
linux/drivers/pci/hotplug/shpchp_core.c
--- linux-2.6.17-rc2/drivers/pci/hotplug/shpchp_core.c	2006-04-24 
13:31:00.000000000 +0200
+++ linux/drivers/pci/hotplug/shpchp_core.c	2006-04-24 
17:29:05.000000000 +0200
@@ -470,7 +470,7 @@
  	kfree(ctrl);
  }

-static struct pci_device_id shpcd_pci_tbl[] = {
+static struct pci_device_id shpcd_pci_tbl[] __devinitdata = {
  	{PCI_DEVICE_CLASS(((PCI_CLASS_BRIDGE_PCI << 8) | 0x00), ~0)},
  	{ /* end: all zeroes */ }
  };
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
