From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Date: Fri, 15 Jan 2021 21:34:03 +0000
Subject: [PATCH] media: smipcie: switch from 'pci_' to 'dma_' API
Message-Id: <20210115213403.498637-1-christophe.jaillet@wanadoo.fr>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mchehab@kernel.org, romain.perier@gmail.com, allen.lkml@gmail.com, hverkuil-cisco@xs4all.nl
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Christophe JAILLET <christophe.jaillet@wanadoo.fr>

The wrappers in include/linux/pci-dma-compat.h should go away.

The patch has been generated with the coccinelle script below and has been
hand modified to replace GFP_ with a correct flag.
It has been compile tested.

When memory is allocated in 'smi_port_init()' GFP_KERNEL can be used
because this function is called only from the probe function and no lock
is taken in between.

The call chain is:
  smi_probe()
    --> smi_port_attach()
      --> smi_port_init()

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
 drivers/media/pci/smipcie/smipcie-main.c | 26 ++++++++++++++----------
 1 file changed, 15 insertions(+), 11 deletions(-)

diff --git a/drivers/media/pci/smipcie/smipcie-main.c b/drivers/media/pci/smipcie/smipcie-main.c
index e7604b7ecc8d..0c300d019d9c 100644
--- a/drivers/media/pci/smipcie/smipcie-main.c
+++ b/drivers/media/pci/smipcie/smipcie-main.c
@@ -351,13 +351,15 @@ static void smi_dma_xfer(struct tasklet_struct *t)
 static void smi_port_dma_free(struct smi_port *port)
 {
 	if (port->cpu_addr[0]) {
-		pci_free_consistent(port->dev->pci_dev, SMI_TS_DMA_BUF_SIZE,
-				    port->cpu_addr[0], port->dma_addr[0]);
+		dma_free_coherent(&port->dev->pci_dev->dev,
+				  SMI_TS_DMA_BUF_SIZE, port->cpu_addr[0],
+				  port->dma_addr[0]);
 		port->cpu_addr[0] = NULL;
 	}
 	if (port->cpu_addr[1]) {
-		pci_free_consistent(port->dev->pci_dev, SMI_TS_DMA_BUF_SIZE,
-				    port->cpu_addr[1], port->dma_addr[1]);
+		dma_free_coherent(&port->dev->pci_dev->dev,
+				  SMI_TS_DMA_BUF_SIZE, port->cpu_addr[1],
+				  port->dma_addr[1]);
 		port->cpu_addr[1] = NULL;
 	}
 }
@@ -398,9 +400,10 @@ static int smi_port_init(struct smi_port *port, int dmaChanUsed)
 	}
 
 	if (port->_dmaInterruptCH0) {
-		port->cpu_addr[0] = pci_alloc_consistent(port->dev->pci_dev,
-					SMI_TS_DMA_BUF_SIZE,
-					&port->dma_addr[0]);
+		port->cpu_addr[0] = dma_alloc_coherent(&port->dev->pci_dev->dev,
+						       SMI_TS_DMA_BUF_SIZE,
+						       &port->dma_addr[0],
+						       GFP_KERNEL);
 		if (!port->cpu_addr[0]) {
 			dev_err(&port->dev->pci_dev->dev,
 				"Port[%d] DMA CH0 memory allocation failed!\n",
@@ -410,9 +413,10 @@ static int smi_port_init(struct smi_port *port, int dmaChanUsed)
 	}
 
 	if (port->_dmaInterruptCH1) {
-		port->cpu_addr[1] = pci_alloc_consistent(port->dev->pci_dev,
-					SMI_TS_DMA_BUF_SIZE,
-					&port->dma_addr[1]);
+		port->cpu_addr[1] = dma_alloc_coherent(&port->dev->pci_dev->dev,
+						       SMI_TS_DMA_BUF_SIZE,
+						       &port->dma_addr[1],
+						       GFP_KERNEL);
 		if (!port->cpu_addr[1]) {
 			dev_err(&port->dev->pci_dev->dev,
 				"Port[%d] DMA CH1 memory allocation failed!\n",
@@ -963,7 +967,7 @@ static int smi_probe(struct pci_dev *pdev, const struct pci_device_id *id)
 	}
 
 	/* should we set to 32bit DMA? */
-	ret = pci_set_dma_mask(pdev, DMA_BIT_MASK(32));
+	ret = dma_set_mask(&pdev->dev, DMA_BIT_MASK(32));
 	if (ret < 0)
 		goto err_pci_iounmap;
 
-- 
2.27.0
