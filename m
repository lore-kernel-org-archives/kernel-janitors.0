From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Date: Thu, 06 Aug 2020 06:05:07 +0000
Subject: [PATCH] tty: serial: icom: switch from 'pci_' to 'dma_' API
Message-Id: <20200806060507.730142-1-christophe.jaillet@wanadoo.fr>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: gregkh@linuxfoundation.org, jirislaby@kernel.org
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Christophe JAILLET <christophe.jaillet@wanadoo.fr>

The wrappers in include/linux/pci-dma-compat.h should go away.

The patch has been generated with the coccinelle script below and has been
hand modified to replace GFP_ with a correct flag.
It has been compile tested.

When memory is allocated in 'get_port_memory()', GFP_KERNEL can be used
because it is only called from a probe function and no lock is acquired.
The call chain is:
   icom_probe				(the probe function)
      --> icom_load_ports
         --> get_port_memory


When memory is allocated in 'load_code()', GFP_KERNEL can be used because
it is only called from a .startup function.
   icom_open				(the .startup function of struct uart_ops)
      --> startup
         --> load_code
.startup functions are protected using a semaphore and no spinlock is
taken.

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
 drivers/tty/serial/icom.c | 32 ++++++++++++++++++--------------
 1 file changed, 18 insertions(+), 14 deletions(-)

diff --git a/drivers/tty/serial/icom.c b/drivers/tty/serial/icom.c
index 624f3d541c68..94c8281ddb5f 100644
--- a/drivers/tty/serial/icom.c
+++ b/drivers/tty/serial/icom.c
@@ -138,24 +138,24 @@ static void free_port_memory(struct icom_port *icom_port)
 
 	trace(icom_port, "RET_PORT_MEM", 0);
 	if (icom_port->recv_buf) {
-		pci_free_consistent(dev, 4096, icom_port->recv_buf,
-				    icom_port->recv_buf_pci);
+		dma_free_coherent(&dev->dev, 4096, icom_port->recv_buf,
+				  icom_port->recv_buf_pci);
 		icom_port->recv_buf = NULL;
 	}
 	if (icom_port->xmit_buf) {
-		pci_free_consistent(dev, 4096, icom_port->xmit_buf,
-				    icom_port->xmit_buf_pci);
+		dma_free_coherent(&dev->dev, 4096, icom_port->xmit_buf,
+				  icom_port->xmit_buf_pci);
 		icom_port->xmit_buf = NULL;
 	}
 	if (icom_port->statStg) {
-		pci_free_consistent(dev, 4096, icom_port->statStg,
-				    icom_port->statStg_pci);
+		dma_free_coherent(&dev->dev, 4096, icom_port->statStg,
+				  icom_port->statStg_pci);
 		icom_port->statStg = NULL;
 	}
 
 	if (icom_port->xmitRestart) {
-		pci_free_consistent(dev, 4096, icom_port->xmitRestart,
-				    icom_port->xmitRestart_pci);
+		dma_free_coherent(&dev->dev, 4096, icom_port->xmitRestart,
+				  icom_port->xmitRestart_pci);
 		icom_port->xmitRestart = NULL;
 	}
 }
@@ -169,7 +169,8 @@ static int get_port_memory(struct icom_port *icom_port)
 	struct pci_dev *dev = icom_port->adapter->pci_dev;
 
 	icom_port->xmit_buf -	    pci_alloc_consistent(dev, 4096, &icom_port->xmit_buf_pci);
+	    dma_alloc_coherent(&dev->dev, 4096, &icom_port->xmit_buf_pci,
+			       GFP_KERNEL);
 	if (!icom_port->xmit_buf) {
 		dev_err(&dev->dev, "Can not allocate Transmit buffer\n");
 		return -ENOMEM;
@@ -179,7 +180,8 @@ static int get_port_memory(struct icom_port *icom_port)
 	      (unsigned long) icom_port->xmit_buf);
 
 	icom_port->recv_buf -	    pci_alloc_consistent(dev, 4096, &icom_port->recv_buf_pci);
+	    dma_alloc_coherent(&dev->dev, 4096, &icom_port->recv_buf_pci,
+			       GFP_KERNEL);
 	if (!icom_port->recv_buf) {
 		dev_err(&dev->dev, "Can not allocate Receive buffer\n");
 		free_port_memory(icom_port);
@@ -189,7 +191,8 @@ static int get_port_memory(struct icom_port *icom_port)
 	      (unsigned long) icom_port->recv_buf);
 
 	icom_port->statStg -	    pci_alloc_consistent(dev, 4096, &icom_port->statStg_pci);
+	    dma_alloc_coherent(&dev->dev, 4096, &icom_port->statStg_pci,
+			       GFP_KERNEL);
 	if (!icom_port->statStg) {
 		dev_err(&dev->dev, "Can not allocate Status buffer\n");
 		free_port_memory(icom_port);
@@ -199,7 +202,8 @@ static int get_port_memory(struct icom_port *icom_port)
 	      (unsigned long) icom_port->statStg);
 
 	icom_port->xmitRestart -	    pci_alloc_consistent(dev, 4096, &icom_port->xmitRestart_pci);
+	    dma_alloc_coherent(&dev->dev, 4096, &icom_port->xmitRestart_pci,
+			       GFP_KERNEL);
 	if (!icom_port->xmitRestart) {
 		dev_err(&dev->dev,
 			"Can not allocate xmit Restart buffer\n");
@@ -414,7 +418,7 @@ static void load_code(struct icom_port *icom_port)
 	/*Set up data in icom DRAM to indicate where personality
 	 *code is located and its length.
 	 */
-	new_page = pci_alloc_consistent(dev, 4096, &temp_pci);
+	new_page = dma_alloc_coherent(&dev->dev, 4096, &temp_pci, GFP_KERNEL);
 
 	if (!new_page) {
 		dev_err(&dev->dev, "Can not allocate DMA buffer\n");
@@ -494,7 +498,7 @@ static void load_code(struct icom_port *icom_port)
 	}
 
 	if (new_page != NULL)
-		pci_free_consistent(dev, 4096, new_page, temp_pci);
+		dma_free_coherent(&dev->dev, 4096, new_page, temp_pci);
 }
 
 static int startup(struct icom_port *icom_port)
-- 
2.25.1
