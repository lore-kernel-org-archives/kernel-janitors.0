From: Tobias Klauser <tklauser@nuerscht.ch>
Date: Sat, 19 Mar 2005 21:43:45 +0000
Subject: [KJ] [UPDATE PATCH 13/16] drivers/net/tulip/winbond-840: Use the
Message-Id: <20050319214345.GM3306@localhost.localdomain>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============13458879501695731=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============13458879501695731==
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

--- linux-2.6.11.orig/drivers/net/tulip/winbond-840.c	2005-03-02 12:50:28.000000000 +0100
+++ linux-2.6.11/drivers/net/tulip/winbond-840.c	2005-03-19 20:33:01.000000000 +0100
@@ -121,6 +121,7 @@ static int full_duplex[MAX_UNITS] = {-1,
 #include <linux/slab.h>
 #include <linux/interrupt.h>
 #include <linux/pci.h>
+#include <linux/dma-mapping.h>
 #include <linux/netdevice.h>
 #include <linux/etherdevice.h>
 #include <linux/skbuff.h>
@@ -394,7 +395,7 @@ static int __devinit w840_probe1 (struct
 
 	irq = pdev->irq;
 
-	if (pci_set_dma_mask(pdev,0xFFFFffff)) {
+	if (pci_set_dma_mask(pdev, DMA_32BIT_MASK)) {
 		printk(KERN_WARNING "Winbond-840: Device %s disabled due to DMA limitations.\n",
 		       pci_name(pdev));
 		return -EIO;

--===============13458879501695731==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============13458879501695731==--
