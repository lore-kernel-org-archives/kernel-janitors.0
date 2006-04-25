From: Henne <henne@nachtwindheim.de>
Date: Tue, 25 Apr 2006 12:01:29 +0000
Subject: [KJ] [PATCH] Marking the pci_device_id tables of the parport-subsys
Message-Id: <444E0F99.5000509@nachtwindheim.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <444CEB94.4010109@nachtwindheim.de>
In-Reply-To: <444CEB94.4010109@nachtwindheim.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

From: Henrik Kretzschmar <henne@nachtwindheim.de>
Marking the pci_device_id tables of the parport-subsys as __devinitdata.
Signed-off-by: Henrik Kretzschmar <henne@nachtwindheim.de>
---

diff -urN linux-2.6.17-rc2/drivers/parport/parport_pc.c linux/drivers/parport/parport_pc.c
--- linux-2.6.17-rc2/drivers/parport/parport_pc.c	2006-04-24 13:31:00.000000000 +0200
+++ linux/drivers/parport/parport_pc.c	2006-04-25 13:57:58.000000000 +0200
@@ -2834,7 +2834,7 @@
  	/* netmos_9815 */               { 2, { { 0, -1 }, { 2, -1 }, } }, /* untested */
  };

-static const struct pci_device_id parport_pc_pci_tbl[] = {
+static const struct pci_device_id parport_pc_pci_tbl[] __devinitdata = {
  	/* Super-IO onboard chips */
  	{ 0x1106, 0x0686, PCI_ANY_ID, PCI_ANY_ID, 0, 0, sio_via_686a },
  	{ 0x1106, 0x8231, PCI_ANY_ID, PCI_ANY_ID, 0, 0, sio_via_8231 },
diff -urN linux-2.6.17-rc2/drivers/parport/parport_serial.c linux/drivers/parport/parport_serial.c
--- linux-2.6.17-rc2/drivers/parport/parport_serial.c	2006-04-24 13:31:00.000000000 +0200
+++ linux/drivers/parport/parport_serial.c	2006-04-25 13:58:41.000000000 +0200
@@ -88,7 +88,7 @@
  	/* siig_2s1p_20x */		{ 1, { { 2, 3 }, } },
  };

-static struct pci_device_id parport_serial_pci_tbl[] = {
+static struct pci_device_id parport_serial_pci_tbl[] __devinitdata = {
  	/* PCI cards */
  	{ PCI_VENDOR_ID_TITAN, PCI_DEVICE_ID_TITAN_110L,
  	  PCI_ANY_ID, PCI_ANY_ID, 0, 0, titan_110l },
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
