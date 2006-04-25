From: Henne <henne@nachtwindheim.de>
Date: Tue, 25 Apr 2006 12:23:38 +0000
Subject: [KJ] [PATCH] Marking the pci_device_id from the misc-subsys as
Message-Id: <444E14CA.8030906@nachtwindheim.de>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

From: Henrik Kretzschmar <henne@nachtwindheim.de>

Marking the pci_device_id from the misc-subsys as __devinitdata.
Signed-off-by: Henrik Kretzschmar <henne@nachtwindheim.de>
---

diff -urN linux-2.6.17-rc2/drivers/misc/ibmasm/module.c linux/drivers/misc/ibmasm/module.c
--- linux-2.6.17-rc2/drivers/misc/ibmasm/module.c       2006-03-20 06:53:29.000000000 +0100
+++ linux/drivers/misc/ibmasm/module.c  2006-04-25 14:21:02.000000000 +0200
@@ -189,7 +189,7 @@
         pci_disable_device(pdev);
  }

-static struct pci_device_id ibmasm_pci_table[] +static struct pci_device_id ibmasm_pci_table[] __devinitdata   {
         { PCI_DEVICE(VENDORID_IBM, DEVICEID_RSA) },
         {},
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
