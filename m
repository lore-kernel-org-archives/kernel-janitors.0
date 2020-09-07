From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Date: Mon, 07 Sep 2020 20:19:42 +0000
Subject: [PATCH] airo: switch from 'pci_' to 'dma_' API
Message-Id: <20200907201942.321568-1-christophe.jaillet@wanadoo.fr>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kvalo@codeaurora.org, davem@davemloft.net, kuba@kernel.org, lee.jones@linaro.org, mpe@ellerman.id.au, adobriyan@gmail.com, dan.carpenter@oracle.com, vulab@iscas.ac.cn
Cc: linux-wireless@vger.kernel.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Christophe JAILLET <christophe.jaillet@wanadoo.fr>

The wrappers in include/linux/pci-dma-compat.h should go away.

The patch has been generated with the coccinelle script below and has been
hand modified to replace GFP_ with a correct flag.
It has been compile tested.

When memory is allocated in 'mpi_map_card()' GFP_KERNEL can be used because
this function is called from a probe or a module_init() function and no
spinlock is taken in the between.

The call chains are:
  airo_init_module				module_init function in 'airo.c'
or
  airo_probe				.probe function in 'airo_cs.c'
    --> airo_config

followed in both cases by:
      --> init_airo_card
        --> _init_airo_card
          --> mpi_map_card


@@
@@
-    PCI_DMA_BIDIRECTIONAL
+    DMA_BIDIRECTIONAL

@@
@@
-    PCI_DMA_TODEVICE
+    DMA_TO_DEVICE

@@
@@
-    PCI_DMA_FROMDEVICE
+    DMA_FROM_DEVICE

@@
@@
-    PCI_DMA_NONE
+    DMA_NONE

@@
expression e1, e2, e3;
@@
-    pci_alloc_consistent(e1, e2, e3)
+    dma_alloc_coherent(&e1->dev, e2, e3, GFP_)

@@
expression e1, e2, e3;
@@
-    pci_zalloc_consistent(e1, e2, e3)
+    dma_alloc_coherent(&e1->dev, e2, e3, GFP_)

@@
expression e1, e2, e3, e4;
@@
-    pci_free_consistent(e1, e2, e3, e4)
+    dma_free_coherent(&e1->dev, e2, e3, e4)

@@
expression e1, e2, e3, e4;
@@
-    pci_map_single(e1, e2, e3, e4)
+    dma_map_single(&e1->dev, e2, e3, e4)

@@
expression e1, e2, e3, e4;
@@
-    pci_unmap_single(e1, e2, e3, e4)
+    dma_unmap_single(&e1->dev, e2, e3, e4)

@@
expression e1, e2, e3, e4, e5;
@@
-    pci_map_page(e1, e2, e3, e4, e5)
+    dma_map_page(&e1->dev, e2, e3, e4, e5)

@@
expression e1, e2, e3, e4;
@@
-    pci_unmap_page(e1, e2, e3, e4)
+    dma_unmap_page(&e1->dev, e2, e3, e4)

@@
expression e1, e2, e3, e4;
@@
-    pci_map_sg(e1, e2, e3, e4)
+    dma_map_sg(&e1->dev, e2, e3, e4)

@@
expression e1, e2, e3, e4;
@@
-    pci_unmap_sg(e1, e2, e3, e4)
+    dma_unmap_sg(&e1->dev, e2, e3, e4)

@@
expression e1, e2, e3, e4;
@@
-    pci_dma_sync_single_for_cpu(e1, e2, e3, e4)
+    dma_sync_single_for_cpu(&e1->dev, e2, e3, e4)

@@
expression e1, e2, e3, e4;
@@
-    pci_dma_sync_single_for_device(e1, e2, e3, e4)
+    dma_sync_single_for_device(&e1->dev, e2, e3, e4)

@@
expression e1, e2, e3, e4;
@@
-    pci_dma_sync_sg_for_cpu(e1, e2, e3, e4)
+    dma_sync_sg_for_cpu(&e1->dev, e2, e3, e4)

@@
expression e1, e2, e3, e4;
@@
-    pci_dma_sync_sg_for_device(e1, e2, e3, e4)
+    dma_sync_sg_for_device(&e1->dev, e2, e3, e4)

@@
expression e1, e2;
@@
-    pci_dma_mapping_error(e1, e2)
+    dma_mapping_error(&e1->dev, e2)

@@
expression e1, e2;
@@
-    pci_set_dma_mask(e1, e2)
+    dma_set_mask(&e1->dev, e2)

@@
expression e1, e2;
@@
-    pci_set_consistent_dma_mask(e1, e2)
+    dma_set_coherent_mask(&e1->dev, e2)

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
If needed, see post from Christoph Hellwig on the kernel-janitors ML:
   https://marc.info/?l=kernel-janitors&m8745678307186&w=4
---
 drivers/net/wireless/cisco/airo.c | 15 +++++++++------
 1 file changed, 9 insertions(+), 6 deletions(-)

diff --git a/drivers/net/wireless/cisco/airo.c b/drivers/net/wireless/cisco/airo.c
index dd78c415d6e7..87b9398b03fd 100644
--- a/drivers/net/wireless/cisco/airo.c
+++ b/drivers/net/wireless/cisco/airo.c
@@ -2430,8 +2430,8 @@ void stop_airo_card(struct net_device *dev, int freeres)
 				iounmap(ai->pcimem);
 			if (ai->pciaux)
 				iounmap(ai->pciaux);
-			pci_free_consistent(ai->pci, PCI_SHARED_LEN,
-				ai->shared, ai->shared_dma);
+			dma_free_coherent(&ai->pci->dev, PCI_SHARED_LEN,
+					  ai->shared, ai->shared_dma);
 		}
         }
 	crypto_free_sync_skcipher(ai->tfm);
@@ -2581,9 +2581,10 @@ static int mpi_map_card(struct airo_info *ai, struct pci_dev *pci)
 	}
 
 	/* Reserve PKTSIZE for each fid and 2K for the Rids */
-	ai->shared = pci_alloc_consistent(pci, PCI_SHARED_LEN, &ai->shared_dma);
+	ai->shared = dma_alloc_coherent(&pci->dev, PCI_SHARED_LEN,
+					&ai->shared_dma, GFP_KERNEL);
 	if (!ai->shared) {
-		airo_print_err("", "Couldn't alloc_consistent %d",
+		airo_print_err("", "Couldn't alloc_coherent %d",
 			PCI_SHARED_LEN);
 		goto free_auxmap;
 	}
@@ -2643,7 +2644,8 @@ static int mpi_map_card(struct airo_info *ai, struct pci_dev *pci)
 
 	return 0;
  free_shared:
-	pci_free_consistent(pci, PCI_SHARED_LEN, ai->shared, ai->shared_dma);
+	dma_free_coherent(&pci->dev, PCI_SHARED_LEN, ai->shared,
+			  ai->shared_dma);
  free_auxmap:
 	iounmap(ai->pciaux);
  free_memmap:
@@ -2930,7 +2932,8 @@ static struct net_device *_init_airo_card(unsigned short irq, int port,
 	unregister_netdev(dev);
 err_out_map:
 	if (test_bit(FLAG_MPI,&ai->flags) && pci) {
-		pci_free_consistent(pci, PCI_SHARED_LEN, ai->shared, ai->shared_dma);
+		dma_free_coherent(&pci->dev, PCI_SHARED_LEN, ai->shared,
+				  ai->shared_dma);
 		iounmap(ai->pciaux);
 		iounmap(ai->pcimem);
 		mpi_unmap_card(ai->pci);
-- 
2.25.1
