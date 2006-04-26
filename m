From: Henne <henne@nachtwindheim.de>
Date: Wed, 26 Apr 2006 06:55:50 +0000
Subject: [KJ] [PATCH] __devinitdata to w1-subsys
Message-Id: <444F1976.9000405@nachtwindheim.de>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

From: Henrik Kretzschmar <henne@nachtwindheim.de>

Marking the pci_device table of w1-subsys as __devinitdata.
Signed-off-by: Henrik Kretzschmar <henne@nachtwindheim.de>
---

diff -urN linux-2.6.17-rc2/drivers/w1/masters/matrox_w1.c linux/drivers/w1/masters/matrox_w1.c
--- linux-2.6.17-rc2/drivers/w1/masters/matrox_w1.c	2006-04-24 13:31:01.000000000 +0200
+++ linux/drivers/w1/masters/matrox_w1.c	2006-04-24 16:42:21.000000000 +0200
@@ -43,7 +43,7 @@
  MODULE_AUTHOR("Evgeniy Polyakov <johnpol@2ka.mipt.ru>");
  MODULE_DESCRIPTION("Driver for transport(Dallas 1-wire prtocol) over VGA DDC(matrox gpio).");

-static struct pci_device_id matrox_w1_tbl[] = {
+static struct pci_device_id matrox_w1_tbl[] __devinitdata = {
  	{ PCI_DEVICE(PCI_VENDOR_ID_MATROX, PCI_DEVICE_ID_MATROX_G400) },
  	{ },
  };
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
