From: Tobias Klauser <tklauser@nuerscht.ch>
Date: Sat, 19 Mar 2005 19:40:33 +0000
Subject: [KJ] [UPDATE PATCH 2/16] drivers/net/acenic: Use the DMA_{64,
Message-Id: <20050319194033.GB3306@localhost.localdomain>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============60815837814952944=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============60815837814952944==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

The previous patch did not compile cleanly on all architectures so
here's a fixed one.

Use the DMA_{64,32}BIT_MASK constants from dma-mapping.h when calling
pci_set_dma_mask() or pci_set_consistent_dma_mask()
This patch includes dma-mapping.h explicitly because it caused errors
on some architectures otherwise.
See http://marc.theaimsgroup.com/?t=108001993000001&r=1&w=2 for details

Signed-off-by: Tobias Klauser <tklauser@nuerscht.ch>

--- linux-2.6.11.orig/drivers/net/acenic.c	2005-03-02 12:50:29.000000000 +0100
+++ linux-2.6.11/drivers/net/acenic.c	2005-03-19 20:33:01.000000000 +0100
@@ -58,6 +58,7 @@
 #include <linux/errno.h>
 #include <linux/ioport.h>
 #include <linux/pci.h>
+#include <linux/dma-mapping.h>
 #include <linux/kernel.h>
 #include <linux/netdevice.h>
 #include <linux/etherdevice.h>
@@ -1167,9 +1168,9 @@ static int __devinit ace_init(struct net
 	/*
 	 * Configure DMA attributes.
 	 */
-	if (!pci_set_dma_mask(pdev, 0xffffffffffffffffULL)) {
+	if (!pci_set_dma_mask(pdev, DMA_64BIT_MASK)) {
 		ap->pci_using_dac = 1;
-	} else if (!pci_set_dma_mask(pdev, 0xffffffffULL)) {
+	} else if (!pci_set_dma_mask(pdev, DMA_32BIT_MASK)) {
 		ap->pci_using_dac = 0;
 	} else {
 		ecode = -ENODEV;

--===============60815837814952944==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============60815837814952944==--
