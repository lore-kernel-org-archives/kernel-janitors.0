From: Henne <henne@nachtwindheim.de>
Date: Tue, 18 Jul 2006 18:22:26 +0000
Subject: [KJ] [PATCH] Remove pci_module_init() from Intel I/OAT DMA engine
Message-Id: <44BD26E2.9080106@nachtwindheim.de>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: davem@davemloft.net
Cc: linux-kernel@vger.kernel.org, kernel-janitors@lists.osdl.org

From: Henrik Kretzschmar <henne@nachtwindheim.de>

Changes pci_module_init() to pci_register_driver().
Signed-off-by: Henrik Kretzschmar <henne@nachtwindheim.de>
---

diff -ruN linux-2.6.18-rc2/drivers/dma/ioatdma.c linux/drivers/dma/ioatdma.c
--- linux-2.6.18-rc2/drivers/dma/ioatdma.c      2006-07-18 13:36:57.000000000 +0200
+++ linux/drivers/dma/ioatdma.c 2006-07-18 19:56:51.000000000 +0200
@@ -828,7 +828,7 @@
        /* if forced, worst case is that rmmod hangs */
        __unsafe(THIS_MODULE);

-       return pci_module_init(&ioat_pci_drv);
+       return pci_register_driver(&ioat_pci_drv);
 }

 module_init(ioat_init_module);
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
