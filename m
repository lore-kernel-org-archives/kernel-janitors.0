From: Henne <henne@nachtwindheim.de>
Date: Wed, 26 Apr 2006 12:34:21 +0000
Subject: [KJ] [PATCH] Marking pci_device_id tables in arch/i386 as
Message-Id: <444F68CD.2090200@nachtwindheim.de>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

From: Henrik Kretzschmar <henne@nachtwindheim.de>

Marking pci_device_id tables in arch/i386 as __devinitdata.
Singed-off-by: Henrik Kretzschmar <henne@nachtwindheim.de>
---

diff -ruN linux-2.6.17-rc2/arch/i386/kernel/cpu/cpufreq/gx-suspmod.c linux/arch/i386/kernel/cpu/cpufreq/gx-suspmod.c
--- linux-2.6.17-rc2/arch/i386/kernel/cpu/cpufreq/gx-suspmod.c	2006-04-24 13:30:51.000000000 +0200
+++ linux/arch/i386/kernel/cpu/cpufreq/gx-suspmod.c	2006-04-26 14:29:00.000000000 +0200
@@ -166,7 +166,7 @@
  /****************************************************************
   *	Low Level chipset interface				*
   ****************************************************************/
-static struct pci_device_id gx_chipset_tbl[] __initdata = {
+static struct pci_device_id gx_chipset_tbl[] __devinitdata = {
  	{ PCI_VENDOR_ID_CYRIX, PCI_DEVICE_ID_CYRIX_5530_LEGACY, PCI_ANY_ID, PCI_ANY_ID },
  	{ PCI_VENDOR_ID_CYRIX, PCI_DEVICE_ID_CYRIX_5520, PCI_ANY_ID, PCI_ANY_ID },
  	{ PCI_VENDOR_ID_CYRIX, PCI_DEVICE_ID_CYRIX_5510, PCI_ANY_ID, PCI_ANY_ID },
diff -ruN linux-2.6.17-rc2/arch/i386/kernel/cpu/cyrix.c linux/arch/i386/kernel/cpu/cyrix.c
--- linux-2.6.17-rc2/arch/i386/kernel/cpu/cyrix.c	2006-03-20 06:53:29.000000000 +0100
+++ linux/arch/i386/kernel/cpu/cyrix.c	2006-04-26 14:28:04.000000000 +0200
@@ -184,7 +184,7 @@


  #ifdef CONFIG_PCI
-static struct pci_device_id cyrix_55x0[] = {
+static struct pci_device_id cyrix_55x0[] __devinitdata = {
  	{ PCI_DEVICE(PCI_VENDOR_ID_CYRIX, PCI_DEVICE_ID_CYRIX_5510) },
  	{ PCI_DEVICE(PCI_VENDOR_ID_CYRIX, PCI_DEVICE_ID_CYRIX_5520) },
  	{ },
diff -ruN linux-2.6.17-rc2/arch/i386/kernel/scx200.c linux/arch/i386/kernel/scx200.c
--- linux-2.6.17-rc2/arch/i386/kernel/scx200.c	2006-03-20 06:53:29.000000000 +0100
+++ linux/arch/i386/kernel/scx200.c	2006-04-26 14:27:07.000000000 +0200
@@ -28,7 +28,7 @@

  unsigned scx200_cb_base = 0;

-static struct pci_device_id scx200_tbl[] = {
+static struct pci_device_id scx200_tbl[] __devinitdata = {
  	{ PCI_DEVICE(PCI_VENDOR_ID_NS, PCI_DEVICE_ID_NS_SCx200_BRIDGE) },
  	{ PCI_DEVICE(PCI_VENDOR_ID_NS, PCI_DEVICE_ID_NS_SC1100_BRIDGE) },
  	{ PCI_DEVICE(PCI_VENDOR_ID_NS, PCI_DEVICE_ID_NS_SCx200_XBUS)   },
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
