From: Tobias Klauser <tklauser@nuerscht.ch>
Date: Sat, 19 Mar 2005 21:42:45 +0000
Subject: [KJ] [UPDATE PATCH 12/16] drivers/net/tulip/dmfe: Use the
Message-Id: <20050319214245.GL3306@localhost.localdomain>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============7203951637104804=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============7203951637104804==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

The previous patch did not compile cleanly on all architectures so
here's a fixed one.

Use the DMA_32BIT_MASK constant from dma-mapping.h when calling
pci_set_dma_mask() or pci_set_consistent_dma_mask()
This patch includes dma-mapping.h explicitly because it caused errors
on some architectures otherwise.
See http://marc.theaimsgroup.com/?t=108001993000001&r=1&w=2 for details

Signed-off-by: Tobias Klauser <tklauser@nuerscht.ch>

--- linux-2.6.11.orig/drivers/net/tulip/dmfe.c	2005-03-02 12:50:28.000000000 +0100
+++ linux-2.6.11/drivers/net/tulip/dmfe.c	2005-03-19 20:33:01.000000000 +0100
@@ -78,6 +78,7 @@
 #include <linux/slab.h>
 #include <linux/interrupt.h>
 #include <linux/pci.h>
+#include <linux/dma-mapping.h>
 #include <linux/init.h>
 #include <linux/netdevice.h>
 #include <linux/etherdevice.h>
@@ -354,7 +355,7 @@ static int __devinit dmfe_init_one (stru
 	SET_MODULE_OWNER(dev);
 	SET_NETDEV_DEV(dev, &pdev->dev);
 
-	if (pci_set_dma_mask(pdev, 0xffffffff)) {
+	if (pci_set_dma_mask(pdev, DMA_32BIT_MASK)) {
 		printk(KERN_WARNING DRV_NAME ": 32-bit PCI DMA not available.\n");
 		err = -ENODEV;
 		goto err_out_free;

--===============7203951637104804==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============7203951637104804==--
