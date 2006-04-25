From: Henne <henne@nachtwindheim.de>
Date: Tue, 25 Apr 2006 13:11:01 +0000
Subject: [KJ] [PATCH] Marking the pci_device_id tables of the
Message-Id: <444E1FE5.6010601@nachtwindheim.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <444CEB94.4010109@nachtwindheim.de>
In-Reply-To: <444CEB94.4010109@nachtwindheim.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

From: Henrik Kretzschmar <henne@nachtwindheim.de>

Marking the pci_device_id tables of the infiniband-subsys as __devinitdata.
Signed-off-by: Henrik Kretzschmar <henne@nachtwindheim.de>
---

diff -urN linux-2.6.17-rc2/drivers/infiniband/hw/ipath/ipath_driver.c linux/drivers/infiniband/hw/ipath/ipath_driver.c
--- linux-2.6.17-rc2/drivers/infiniband/hw/ipath/ipath_driver.c	2006-04-24 13:30:55.000000000 +0200
+++ linux/drivers/infiniband/hw/ipath/ipath_driver.c	2006-04-25 15:08:37.000000000 +0200
@@ -115,7 +115,7 @@
  #define PCI_DEVICE_ID_INFINIPATH_HT 0xd
  #define PCI_DEVICE_ID_INFINIPATH_PE800 0x10

-static const struct pci_device_id ipath_pci_tbl[] = {
+static const struct pci_device_id ipath_pci_tbl[] __devinitdata = {
  	{PCI_DEVICE(PCI_VENDOR_ID_PATHSCALE,
  		    PCI_DEVICE_ID_INFINIPATH_HT)},
  	{PCI_DEVICE(PCI_VENDOR_ID_PATHSCALE,
diff -urN linux-2.6.17-rc2/drivers/infiniband/hw/mthca/mthca_main.c linux/drivers/infiniband/hw/mthca/mthca_main.c
--- linux-2.6.17-rc2/drivers/infiniband/hw/mthca/mthca_main.c	2006-04-24 13:30:55.000000000 +0200
+++ linux/drivers/infiniband/hw/mthca/mthca_main.c	2006-04-25 15:07:53.000000000 +0200
@@ -1211,7 +1211,7 @@
  	}
  }

-static struct pci_device_id mthca_pci_table[] = {
+static struct pci_device_id mthca_pci_table[] __devinitdata = {
  	{ PCI_DEVICE(PCI_VENDOR_ID_MELLANOX, PCI_DEVICE_ID_MELLANOX_TAVOR),
  	  .driver_data = TAVOR },
  	{ PCI_DEVICE(PCI_VENDOR_ID_TOPSPIN, PCI_DEVICE_ID_MELLANOX_TAVOR),
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
