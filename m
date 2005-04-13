From: Tobias Klauser <tklauser@nuerscht.ch>
Date: Wed, 13 Apr 2005 13:31:52 +0000
Subject: [KJ] [PATCH] net/ioc3-eth: Use the DMA_{32,64}BIT_MASK constants
Message-Id: <20050413133147.GA9864@argon.tklauser.home>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============040083548654371359=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@lists.osdl.org
Cc: ralf@linux-mips.org, linux-mips@linux-mips.org

--===============040083548654371359==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Use the DMA_{32,64}BIT_MASK constants from dma-mapping.h when calling
pci_set_dma_mask() or pci_set_consistent_dma_mask()
This patch includes dma-mapping.h explicitly because patches caused
errors on some architectures otherwise.
See http://marc.theaimsgroup.com/?t=108001993000001&r=1&w=2 for details

Signed-off-by: Tobias Klauser <tklauser@nuerscht.ch>

diff -urpN linux-2.6.12-rc2-mm3/drivers/net/ioc3-eth.c linux-2.6.12-rc2-mm3-tk/drivers/net/ioc3-eth.c
--- linux-2.6.12-rc2-mm3/drivers/net/ioc3-eth.c	2005-04-12 16:56:40.000000000 +0200
+++ linux-2.6.12-rc2-mm3-tk/drivers/net/ioc3-eth.c	2005-04-12 17:28:55.470878176 +0200
@@ -38,6 +38,7 @@
 #include <linux/errno.h>
 #include <linux/module.h>
 #include <linux/pci.h>
+#include <linux/dma-mapping.h>
 #include <linux/crc32.h>
 #include <linux/mii.h>
 #include <linux/in.h>
@@ -1193,17 +1194,17 @@ static int ioc3_probe(struct pci_dev *pd
 	int err, pci_using_dac;
 
 	/* Configure DMA attributes. */
-	err = pci_set_dma_mask(pdev, 0xffffffffffffffffULL);
+	err = pci_set_dma_mask(pdev, DMA_64BIT_MASK);
 	if (!err) {
 		pci_using_dac = 1;
-		err = pci_set_consistent_dma_mask(pdev, 0xffffffffffffffffULL);
+		err = pci_set_consistent_dma_mask(pdev, DMA_64BIT_MASK);
 		if (err < 0) {
 			printk(KERN_ERR "%s: Unable to obtain 64 bit DMA "
 			       "for consistent allocations\n", pci_name(pdev));
 			goto out;
 		}
 	} else {
-		err = pci_set_dma_mask(pdev, 0xffffffffULL);
+		err = pci_set_dma_mask(pdev, DMA_32BIT_MASK);
 		if (err) {
 			printk(KERN_ERR "%s: No usable DMA configuration, "
 			       "aborting.\n", pci_name(pdev));

--===============040083548654371359==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============040083548654371359==--
