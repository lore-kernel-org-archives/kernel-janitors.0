From: Tobias Klauser <tklauser@nuerscht.ch>
Date: Sat, 19 Mar 2005 21:44:52 +0000
Subject: [KJ] [UPDATE PATCH 14/16] drivers/net/via-rhine: Use the
Message-Id: <20050319214452.GN3306@localhost.localdomain>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============42746287831390328=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============42746287831390328==
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

--- linux-2.6.11.orig/drivers/net/via-rhine.c	2005-03-02 12:50:29.000000000 +0100
+++ linux-2.6.11/drivers/net/via-rhine.c	2005-03-19 20:33:01.000000000 +0100
@@ -186,6 +186,7 @@ static const int multicast_filter_limit 
 #include <linux/slab.h>
 #include <linux/interrupt.h>
 #include <linux/pci.h>
+#include <linux/dma-mapping.h>
 #include <linux/netdevice.h>
 #include <linux/etherdevice.h>
 #include <linux/skbuff.h>
@@ -740,7 +741,7 @@ static int __devinit rhine_init_one(stru
 		goto err_out;
 
 	/* this should always be supported */
-	rc = pci_set_dma_mask(pdev, 0xffffffff);
+	rc = pci_set_dma_mask(pdev, DMA_32BIT_MASK);
 	if (rc) {
 		printk(KERN_ERR "32-bit PCI DMA addresses not supported by "
 		       "the card!?\n");

--===============42746287831390328==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============42746287831390328==--
