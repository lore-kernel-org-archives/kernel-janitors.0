From: Dan Carpenter <error27@gmail.com>
Date: Sun, 20 Mar 2011 11:18:26 +0000
Subject: [patch 4/4] USB: musb: dereferencing an iomem pointer
Message-Id: <20110320111826.GL2008@bicker>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

"tx_ram" points to io memory.  We can't dereference it directly.  Sparse
complains about this: "drivers/usb/musb/cppi_dma.c:1205:25: warning: 
dereference of noderef expression"

Signed-off-by: Dan Carpenter <error27@gmail.com>
---
Compile tested.

diff --git a/drivers/usb/musb/cppi_dma.c b/drivers/usb/musb/cppi_dma.c
index eb9161a..ab434fb 100644
--- a/drivers/usb/musb/cppi_dma.c
+++ b/drivers/usb/musb/cppi_dma.c
@@ -1204,7 +1204,7 @@ irqreturn_t cppi_interrupt(int irq, void *dev_id)
 		 */
 		if (NULL = bd) {
 			DBG(1, "null BD\n");
-			tx_ram->tx_complete = 0;
+			musb_writel(&tx_ram->tx_complete, 0, 0);
 			continue;
 		}

