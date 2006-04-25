From: Henne <henne@nachtwindheim.de>
Date: Tue, 25 Apr 2006 12:07:54 +0000
Subject: [KJ] [PATCH] Marking the pci_device_id tables of the parisc-subsys
Message-Id: <444E111A.1030802@nachtwindheim.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <444CEB94.4010109@nachtwindheim.de>
In-Reply-To: <444CEB94.4010109@nachtwindheim.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

From: Henrik Kretzschmar <henne@nachtwindheim.de>
Marking the pci_device_id tables of the parisc-subsys as __devinitdata.
Signed-off-by: Henrik Kretzschmar <henne@nachtwindheim.de>
---

diff -urN linux-2.6.17-rc2/drivers/parisc/superio.c linux/drivers/parisc/superio.c
--- linux-2.6.17-rc2/drivers/parisc/superio.c   2006-04-24 13:31:00.000000000 +0200
+++ linux/drivers/parisc/superio.c      2006-04-25 14:04:15.000000000 +0200
@@ -485,7 +485,7 @@
         return -ENODEV;
  }

-static struct pci_device_id superio_tbl[] = {
+static struct pci_device_id superio_tbl[] __devinitdata = {
         { PCI_DEVICE(PCI_VENDOR_ID_NS, PCI_DEVICE_ID_NS_87560_LIO) },
         { PCI_DEVICE(PCI_VENDOR_ID_NS, PCI_DEVICE_ID_NS_87560_USB) },
         { PCI_DEVICE(PCI_VENDOR_ID_NS, PCI_DEVICE_ID_NS_87415) },
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
