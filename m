From: Tobias Klauser <tklauser@nuerscht.ch>
Date: Sat, 19 Mar 2005 21:27:05 +0000
Subject: [KJ] [UPDATE PATCH 4/16] drivers/net/hp100: Use the DMA_32BIT_MASK
Message-Id: <20050319212705.GD3306@localhost.localdomain>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============98038576458408944=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============98038576458408944==
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

--- linux-2.6.11.orig/drivers/net/hp100.c	2005-03-02 12:50:29.000000000 +0100
+++ linux-2.6.11/drivers/net/hp100.c	2005-03-19 20:33:01.000000000 +0100
@@ -106,6 +106,7 @@
 #include <linux/interrupt.h>
 #include <linux/eisa.h>
 #include <linux/pci.h>
+#include <linux/dma-mapping.h>
 #include <linux/spinlock.h>
 #include <linux/netdevice.h>
 #include <linux/etherdevice.h>
@@ -562,7 +563,7 @@ static int __devinit hp100_probe1(struct
 			 * Also, we can have EISA Busmaster cards (not tested),
 			 * so beware !!! - Jean II */
 			if((bus == HP100_BUS_PCI) &&
-			   (pci_set_dma_mask(pci_dev, 0xffffffff))) {
+			   (pci_set_dma_mask(pci_dev, DMA_32BIT_MASK))) {
 				/* Gracefully fallback to shared memory */
 				goto busmasterfail;
 			}

--===============98038576458408944==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============98038576458408944==--
