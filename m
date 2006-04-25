From: Henne <henne@nachtwindheim.de>
Date: Tue, 25 Apr 2006 13:03:00 +0000
Subject: [KJ] [PATCH] Marking the pci_device_id tables of the input-subsys
Message-Id: <444E1E04.9010005@nachtwindheim.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <444CEB94.4010109@nachtwindheim.de>
In-Reply-To: <444CEB94.4010109@nachtwindheim.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

From: Henrik Kretzschmar <henne@nachtwindheim.de>

Marking the pci_device_id tables of the input-subsys as __devinitdata.
Signed-off-by: Henrik Kretzschmar <henne@nachtwindheim.de>
---

diff -urN linux-2.6.17-rc2/drivers/input/gameport/emu10k1-gp.c linux/drivers/input/gameport/emu10k1-gp.c
--- linux-2.6.17-rc2/drivers/input/gameport/emu10k1-gp.c	2006-03-20 06:53:29.000000000 +0100
+++ linux/drivers/input/gameport/emu10k1-gp.c	2006-04-25 14:59:23.000000000 +0200
@@ -49,7 +49,7 @@
  	int size;
  };

-static struct pci_device_id emu_tbl[] = {
+static struct pci_device_id emu_tbl[] __devinitdata = {

  	{ 0x1102, 0x7002, PCI_ANY_ID, PCI_ANY_ID }, /* SB Live gameport */
  	{ 0x1102, 0x7003, PCI_ANY_ID, PCI_ANY_ID }, /* Audigy gameport */
diff -urN linux-2.6.17-rc2/drivers/input/gameport/fm801-gp.c linux/drivers/input/gameport/fm801-gp.c
--- linux-2.6.17-rc2/drivers/input/gameport/fm801-gp.c	2006-03-20 06:53:29.000000000 +0100
+++ linux/drivers/input/gameport/fm801-gp.c	2006-04-25 14:59:47.000000000 +0200
@@ -132,7 +132,7 @@
  	}
  }

-static struct pci_device_id fm801_gp_id_table[] = {
+static struct pci_device_id fm801_gp_id_table[] __devinitdata = {
  	{ PCI_VENDOR_ID_FORTEMEDIA, PCI_DEVICE_ID_FM801_GP, PCI_ANY_ID, PCI_ANY_ID, 0, 0, 0  },
  	{ 0 }
  };
diff -urN linux-2.6.17-rc2/drivers/input/serio/pcips2.c linux/drivers/input/serio/pcips2.c
--- linux-2.6.17-rc2/drivers/input/serio/pcips2.c	2006-03-20 06:53:29.000000000 +0100
+++ linux/drivers/input/serio/pcips2.c	2006-04-25 15:00:15.000000000 +0200
@@ -188,7 +188,7 @@
  	pci_disable_device(dev);
  }

-static struct pci_device_id pcips2_ids[] = {
+static struct pci_device_id pcips2_ids[] __devinitdata = {
  	{
  		.vendor		= 0x14f2,	/* MOBILITY */
  		.device		= 0x0123,	/* Keyboard */

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
