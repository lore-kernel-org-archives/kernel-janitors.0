From: Henne <henne@nachtwindheim.de>
Date: Tue, 25 Apr 2006 12:49:43 +0000
Subject: [KJ] [PATCH] Marking the pci_device_id tables od the isdn-subsys as
Message-Id: <444E1AE7.3030403@nachtwindheim.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <444CEB94.4010109@nachtwindheim.de>
In-Reply-To: <444CEB94.4010109@nachtwindheim.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

From: Henrik Kretzschmar <henne@nachtwindheim.de>

Marking the pci_device_id tables od the isdn-subsys as __devinitdata.
Signed-off-by: Henrik Kretzschmar <henne@nachtwindheim.de>
---

diff -urN linux-2.6.17-rc2/drivers/isdn/hardware/avm/b1pci.c linux/drivers/isdn/hardware/avm/b1pci.c
--- linux-2.6.17-rc2/drivers/isdn/hardware/avm/b1pci.c	2006-03-20 06:53:29.000000000 +0100
+++ linux/drivers/isdn/hardware/avm/b1pci.c	2006-04-25 14:36:44.000000000 +0200
@@ -32,7 +32,7 @@

  /* ------------------------------------------------------------- */

-static struct pci_device_id b1pci_pci_tbl[] = {
+static struct pci_device_id b1pci_pci_tbl[] __devinitdata = {
  	{ PCI_VENDOR_ID_AVM, PCI_DEVICE_ID_AVM_B1, PCI_ANY_ID, PCI_ANY_ID },
  	{ }				/* Terminating entry */
  };
diff -urN linux-2.6.17-rc2/drivers/isdn/hardware/avm/c4.c linux/drivers/isdn/hardware/avm/c4.c
--- linux-2.6.17-rc2/drivers/isdn/hardware/avm/c4.c	2006-04-24 13:30:55.000000000 +0200
+++ linux/drivers/isdn/hardware/avm/c4.c	2006-04-25 14:47:24.000000000 +0200
@@ -40,7 +40,7 @@

  static int suppress_pollack;

-static struct pci_device_id c4_pci_tbl[] = {
+static struct pci_device_id c4_pci_tbl[] __devinitdata = {
  	{ PCI_VENDOR_ID_DEC, PCI_DEVICE_ID_DEC_21285, PCI_VENDOR_ID_AVM, PCI_DEVICE_ID_AVM_C4, 0, 0, (unsigned long)4 },
  	{ PCI_VENDOR_ID_DEC, PCI_DEVICE_ID_DEC_21285, PCI_VENDOR_ID_AVM, PCI_DEVICE_ID_AVM_C2, 0, 0, (unsigned long)2 },
  	{ }			/* Terminating entry */
diff -urN linux-2.6.17-rc2/drivers/isdn/hardware/avm/t1pci.c linux/drivers/isdn/hardware/avm/t1pci.c
--- linux-2.6.17-rc2/drivers/isdn/hardware/avm/t1pci.c	2006-03-20 06:53:29.000000000 +0100
+++ linux/drivers/isdn/hardware/avm/t1pci.c	2006-04-25 14:37:39.000000000 +0200
@@ -33,7 +33,7 @@
  static char *revision = "$Revision: 1.1.2.2 $";
  /* ------------------------------------------------------------- */

-static struct pci_device_id t1pci_pci_tbl[] = {
+static struct pci_device_id t1pci_pci_tbl[] __devinitdata = {
  	{ PCI_VENDOR_ID_AVM, PCI_DEVICE_ID_AVM_T1, PCI_ANY_ID, PCI_ANY_ID },
  	{ }				/* Terminating entry */
  };
diff -urN linux-2.6.17-rc2/drivers/isdn/hardware/eicon/divasmain.c linux/drivers/isdn/hardware/eicon/divasmain.c
--- linux-2.6.17-rc2/drivers/isdn/hardware/eicon/divasmain.c	2006-03-20 06:53:29.000000000 +0100
+++ linux/drivers/isdn/hardware/eicon/divasmain.c	2006-04-25 14:39:19.000000000 +0200
@@ -116,7 +116,7 @@
  /*
    This table should be sorted by PCI device ID
    */
-static struct pci_device_id divas_pci_tbl[] = {
+static struct pci_device_id divas_pci_tbl[] __devinitdata = {
  /* Diva Server BRI-2M PCI 0xE010 */
  	{PCI_VENDOR_ID_EICON, PCI_DEVICE_ID_EICON_MAESTRA,
  	 PCI_ANY_ID, PCI_ANY_ID, 0, 0, CARDTYPE_MAESTRA_PCI},
diff -urN linux-2.6.17-rc2/drivers/isdn/hisax/config.c linux/drivers/isdn/hisax/config.c
--- linux-2.6.17-rc2/drivers/isdn/hisax/config.c	2006-04-24 13:30:55.000000000 +0200
+++ linux/drivers/isdn/hisax/config.c	2006-04-25 14:40:11.000000000 +0200
@@ -1876,7 +1876,7 @@
  #ifdef CONFIG_PCI
  #include <linux/pci.h>

-static struct pci_device_id hisax_pci_tbl[] __initdata = {
+static struct pci_device_id hisax_pci_tbl[] __devinitdata = {
  #ifdef CONFIG_HISAX_FRITZPCI
  	{PCI_VENDOR_ID_AVM,      PCI_DEVICE_ID_AVM_A1,           PCI_ANY_ID, PCI_ANY_ID},
  #endif
diff -urN linux-2.6.17-rc2/drivers/isdn/hisax/hfc4s8s_l1.c linux/drivers/isdn/hisax/hfc4s8s_l1.c
--- linux-2.6.17-rc2/drivers/isdn/hisax/hfc4s8s_l1.c	2006-03-20 06:53:29.000000000 +0100
+++ linux/drivers/isdn/hisax/hfc4s8s_l1.c	2006-04-25 14:40:45.000000000 +0200
@@ -86,7 +86,7 @@
  	char *device_name;
  } hfc4s8s_param;

-static struct pci_device_id hfc4s8s_ids[] = {
+static struct pci_device_id hfc4s8s_ids[] __devinitdata = {
  	{.vendor = PCI_VENDOR_ID_CCD,
  	 .device = PCI_DEVICE_ID_4S,
  	 .subvendor = 0x1397,
diff -urN linux-2.6.17-rc2/drivers/isdn/hisax/hisax_fcpcipnp.c linux/drivers/isdn/hisax/hisax_fcpcipnp.c
--- linux-2.6.17-rc2/drivers/isdn/hisax/hisax_fcpcipnp.c	2006-04-24 13:30:55.000000000 +0200
+++ linux/drivers/isdn/hisax/hisax_fcpcipnp.c	2006-04-25 14:42:01.000000000 +0200
@@ -51,7 +51,7 @@
  MODULE_AUTHOR("Kai Germaschewski <kai.germaschewski@gmx.de>/Karsten Keil <kkeil@suse.de>");
  MODULE_DESCRIPTION("AVM Fritz!PCI/PnP ISDN driver");

-static struct pci_device_id fcpci_ids[] = {
+static struct pci_device_id fcpci_ids[] __devinitdata = {
  	{ .vendor      = PCI_VENDOR_ID_AVM,
  	  .device      = PCI_DEVICE_ID_AVM_A1,
  	  .subvendor   = PCI_ANY_ID,
diff -urN linux-2.6.17-rc2/drivers/isdn/hysdn/hysdn_init.c linux/drivers/isdn/hysdn/hysdn_init.c
--- linux-2.6.17-rc2/drivers/isdn/hysdn/hysdn_init.c	2006-04-24 13:30:55.000000000 +0200
+++ linux/drivers/isdn/hysdn/hysdn_init.c	2006-04-25 14:42:48.000000000 +0200
@@ -20,7 +20,7 @@

  #include "hysdn_defs.h"

-static struct pci_device_id hysdn_pci_tbl[] = {
+static struct pci_device_id hysdn_pci_tbl[] __devinitdata = {
  	{PCI_VENDOR_ID_HYPERCOPE, PCI_DEVICE_ID_HYPERCOPE_PLX, PCI_ANY_ID, PCI_SUBDEVICE_ID_HYPERCOPE_METRO},
  	{PCI_VENDOR_ID_HYPERCOPE, PCI_DEVICE_ID_HYPERCOPE_PLX, PCI_ANY_ID, PCI_SUBDEVICE_ID_HYPERCOPE_CHAMP2},
  	{PCI_VENDOR_ID_HYPERCOPE, PCI_DEVICE_ID_HYPERCOPE_PLX, PCI_ANY_ID, PCI_SUBDEVICE_ID_HYPERCOPE_ERGO},
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
