From: Tobias Klauser <tklauser@nuerscht.ch>
Date: Sat, 19 Mar 2005 21:36:36 +0000
Subject: [KJ] [UPDATE PATCH 8/16] drivers/net/sungem: Use the DMA_{64,
Message-Id: <20050319213636.GH3306@localhost.localdomain>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============034895495000926147=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============034895495000926147==
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

--- linux-2.6.11.orig/drivers/net/sungem.c	2005-03-02 12:50:29.000000000 +0100
+++ linux-2.6.11/drivers/net/sungem.c	2005-03-19 20:33:01.000000000 +0100
@@ -28,6 +28,7 @@
 #include <linux/init.h>
 #include <linux/errno.h>
 #include <linux/pci.h>
+#include <linux/dma-mapping.h>
 #include <linux/netdevice.h>
 #include <linux/etherdevice.h>
 #include <linux/skbuff.h>
@@ -2816,10 +2817,10 @@ static int __devinit gem_init_one(struct
 	 */
 	if (pdev->vendor == PCI_VENDOR_ID_SUN &&
 	    pdev->device == PCI_DEVICE_ID_SUN_GEM &&
-	    !pci_set_dma_mask(pdev, (u64) 0xffffffffffffffffULL)) {
+	    !pci_set_dma_mask(pdev, DMA_64BIT_MASK)) {
 		pci_using_dac = 1;
 	} else {
-		err = pci_set_dma_mask(pdev, (u64) 0xffffffff);
+		err = pci_set_dma_mask(pdev, DMA_32BIT_MASK);
 		if (err) {
 			printk(KERN_ERR PFX "No usable DMA configuration, "
 			       "aborting.\n");

--===============034895495000926147==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============034895495000926147==--
