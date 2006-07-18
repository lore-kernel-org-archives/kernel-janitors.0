From: Henne <henne@nachtwindheim.de>
Date: Tue, 18 Jul 2006 21:13:07 +0000
Subject: Re: [KJ] [PATCH] Remove pci_module_init() from Intel I/OAT DMA
Message-Id: <44BD4EE3.7010509@nachtwindheim.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <44BD26E2.9080106@nachtwindheim.de>
In-Reply-To: <44BD26E2.9080106@nachtwindheim.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@lists.osdl.org
Cc: linux-kernel@vger.kernel.org

> Your email client corrupted your patch by changing tabs
> into spaces, therefore your patch does not apply and is
> unusable.
So this one should work. Thanks for reply.

Greets,
Henrik Kretzschmar

---
From: Henrik Kretzschmar <henne@nachtwindheim.de>

Changes pci_module_init() to pci_register_driver().
Signed-off-by: Henrik Kretzschmar <henne@nachtwindheim.de>
---

diff -ruN linux-2.6.18-rc2/drivers/dma/ioatdma.c linux/drivers/dma/ioatdma.c
--- linux-2.6.18-rc2/drivers/dma/ioatdma.c	2006-07-18 13:36:57.000000000 +0200
+++ linux/drivers/dma/ioatdma.c	2006-07-18 19:56:51.000000000 +0200
@@ -828,7 +828,7 @@
 	/* if forced, worst case is that rmmod hangs */
 	__unsafe(THIS_MODULE);

-	return pci_module_init(&ioat_pci_drv);
+	return pci_register_driver(&ioat_pci_drv);
 }

 module_init(ioat_init_module);


_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
