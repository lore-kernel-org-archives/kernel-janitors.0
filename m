From: Tobias Klauser <tklauser@nuerscht.ch>
Date: Sat, 04 Jun 2005 14:56:49 +0000
Subject: [KJ] [PATCH -mm] drivers/net/chelsio/cxgb2: Use the DMA_{32,
Message-Id: <20050604145649.GA1432@mail.nuerscht.ch>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============021424623061424342=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============021424623061424342==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Use the DMA_{32,64}BIT_MASK constants from dma-mapping.h when calling
pci_set_dma_mask() or pci_set_consistent_dma_mask() instead of custom
macros.
This patch includes dma-mapping.h explicitly because it caused errors
on some architectures otherwise.
See http://marc.theaimsgroup.com/?t=108001993000001&r=1&w=2 for details

Signed-off-by: Tobias Klauser <tklauser@nuerscht.ch>

diff -urpN -X dontdiff linux-2.6.12-rc5-mm2/drivers/net/chelsio/cxgb2.c linux-2.6.12-rc5-mm2~dma_mask/drivers/net/chelsio/cxgb2.c
--- linux-2.6.12-rc5-mm2/drivers/net/chelsio/cxgb2.c	2005-06-02 21:04:29.000000000 +0200
+++ linux-2.6.12-rc5-mm2~dma_mask/drivers/net/chelsio/cxgb2.c	2005-06-02 21:13:10.000000000 +0200
@@ -50,6 +50,7 @@
 #include <linux/proc_fs.h>
 #include <linux/version.h>
 #include <linux/workqueue.h>
+#include <linux/dma-mapping.h>
 #include <asm/uaccess.h>
 
 #include "ch_ethtool.h"
@@ -84,9 +85,6 @@ static char driver_name[]    = DRV_NAME;
 static char driver_string[]  = "Chelsio " DRV_TYPE "Network Driver";
 static char driver_version[] = "2.1.0";
 
-#define PCI_DMA_64BIT ~0ULL
-#define PCI_DMA_32BIT 0xffffffffULL
-
 #define MAX_CMDQ_ENTRIES 16384
 #define MAX_CMDQ1_ENTRIES 1024
 #define MAX_RX_BUFFERS 16384
@@ -1006,15 +1004,15 @@ static int __devinit init_one(struct pci
 		goto out_disable_pdev;
 	}
 
-	if (!pci_set_dma_mask(pdev, PCI_DMA_64BIT)) {
+	if (!pci_set_dma_mask(pdev, DMA_64BIT_MASK)) {
 		pci_using_dac = 1;
-		if (pci_set_consistent_dma_mask(pdev, PCI_DMA_64BIT)) {
+		if (pci_set_consistent_dma_mask(pdev, DMA_64BIT_MASK)) {
 			CH_ERR("%s: unable to obtain 64-bit DMA for"
 			       "consistent allocations\n", pci_name(pdev));
 			err = -ENODEV;
 			goto out_disable_pdev;
 		}
-	} else if ((err = pci_set_dma_mask(pdev, PCI_DMA_32BIT)) != 0) {
+	} else if ((err = pci_set_dma_mask(pdev, DMA_32BIT_MASK)) != 0) {
 		CH_ERR("%s: no usable DMA configuration\n", pci_name(pdev));
 		goto out_disable_pdev;
 	}

--===============021424623061424342==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============021424623061424342==--
