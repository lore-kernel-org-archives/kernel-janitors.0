From: Eric Sesterhenn <snakebyte@gmx.de>
Date: Wed, 06 Sep 2006 21:37:34 +0000
Subject: [KJ] [Patch] BUG_ON cleanup in drivers/net/tokenring/
Message-Id: <1157578654.17839.3.camel@alice>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@lists.osdl.org
Cc: netdev@vger.kernel.org

hi,

this patch converts one if() BUG(); to BUG_ON();
so it can be safely optimized away.

Signed-off-by: Eric Sesterhenn <snakebyte@gmx.de>

--- linux-2.6.18-rc6/drivers/net/tokenring/tmspci.c.orig	2006-09-06 23:32:41.000000000 +0200
+++ linux-2.6.18-rc6/drivers/net/tokenring/tmspci.c	2006-09-06 23:32:54.000000000 +0200
@@ -224,8 +224,7 @@ static void __devexit tms_pci_detach (st
 {
 	struct net_device *dev = pci_get_drvdata(pdev);
 
-	if (!dev)
-		BUG();
+	BUG_ON(!dev);
 	unregister_netdev(dev);
 	release_region(dev->base_addr, TMS_PCI_IO_EXTENT);
 	free_irq(dev->irq, dev);


_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
