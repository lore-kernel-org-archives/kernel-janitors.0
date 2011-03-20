From: Dan Carpenter <error27@gmail.com>
Date: Sun, 20 Mar 2011 11:14:36 +0000
Subject: [patch 1/4] USB: musb: add missing unlock in cppi_interrupt()
Message-Id: <20110320111436.GI2008@bicker>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

We should unlock before returning here.

Signed-off-by: Dan Carpenter <error27@gmail.com>
---
Compile tested only.  Isn't cppi->irq always true at this point?

diff --git a/drivers/usb/musb/cppi_dma.c b/drivers/usb/musb/cppi_dma.c
index de55a3c..6385eeb 100644
--- a/drivers/usb/musb/cppi_dma.c
+++ b/drivers/usb/musb/cppi_dma.c
@@ -1167,8 +1167,11 @@ irqreturn_t cppi_interrupt(int irq, void *dev_id)
 	tx = musb_readl(tibase, DAVINCI_TXCPPI_MASKED_REG);
 	rx = musb_readl(tibase, DAVINCI_RXCPPI_MASKED_REG);
 
-	if (!tx && !rx)
+	if (!tx && !rx) {
+		if (cppi->irq)
+			spin_unlock_irqrestore(&musb->lock, flags);
 		return IRQ_NONE;
+	}
 
 	DBG(4, "CPPI IRQ Tx%x Rx%x\n", tx, rx);
 
