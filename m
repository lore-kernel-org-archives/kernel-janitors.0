From: Tobias Klauser <tklauser@nuerscht.ch>
Date: Sat, 19 Mar 2005 19:38:58 +0000
Subject: [KJ] [UPDATE PATCH 1/16] drivers/net/8139cp: Use the DMA_{64,
Message-Id: <20050319193858.GA3306@localhost.localdomain>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============30259998947604161=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============30259998947604161==
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

--- linux-2.6.11.orig/drivers/net/8139cp.c	2005-03-02 12:50:29.000000000 +0100
+++ linux-2.6.11/drivers/net/8139cp.c	2005-03-19 20:33:01.000000000 +0100
@@ -60,6 +60,7 @@
 #include <linux/etherdevice.h>
 #include <linux/init.h>
 #include <linux/pci.h>
+#include <linux/dma-mapping.h>
 #include <linux/delay.h>
 #include <linux/ethtool.h>
 #include <linux/mii.h>
@@ -1701,19 +1702,19 @@ static int cp_init_one (struct pci_dev *
 
 	/* Configure DMA attributes. */
 	if ((sizeof(dma_addr_t) > 4) &&
-	    !pci_set_consistent_dma_mask(pdev, 0xffffffffffffffffULL) &&
-	    !pci_set_dma_mask(pdev, 0xffffffffffffffffULL)) {
+	    !pci_set_consistent_dma_mask(pdev, DMA_64BIT_MASK) &&
+	    !pci_set_dma_mask(pdev, DMA_64BIT_MASK)) {
 		pci_using_dac = 1;
 	} else {
 		pci_using_dac = 0;
 
-		rc = pci_set_dma_mask(pdev, 0xffffffffULL);
+		rc = pci_set_dma_mask(pdev, DMA_32BIT_MASK);
 		if (rc) {
 			printk(KERN_ERR PFX "No usable DMA configuration, "
 			       "aborting.\n");
 			goto err_out_res;
 		}
-		rc = pci_set_consistent_dma_mask(pdev, 0xffffffffULL);
+		rc = pci_set_consistent_dma_mask(pdev, DMA_32BIT_MASK);
 		if (rc) {
 			printk(KERN_ERR PFX "No usable consistent DMA configuration, "
 			       "aborting.\n");

--===============30259998947604161==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============30259998947604161==--
