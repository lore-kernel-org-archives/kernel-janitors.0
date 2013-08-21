From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 21 Aug 2013 08:38:21 +0000
Subject: [patch] usb: musb: unlock on error in cppi41_dma_callback()
Message-Id: <20130821083821.GI5240@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

We need to unlock and enable IRQs before returning on error.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
I cannot compile this code.

diff --git a/drivers/usb/musb/musb_cppi41.c b/drivers/usb/musb/musb_cppi41.c
index e64701d..5c42fc1 100644
--- a/drivers/usb/musb/musb_cppi41.c
+++ b/drivers/usb/musb/musb_cppi41.c
@@ -151,7 +151,7 @@ static void cppi41_dma_callback(void *private_data)
 				direction,
 				DMA_PREP_INTERRUPT | DMA_CTRL_ACK);
 		if (WARN_ON(!dma_desc))
-			return;
+			goto out_unlock;
 
 		dma_desc->callback = cppi41_dma_callback;
 		dma_desc->callback_param = channel;
@@ -164,6 +164,7 @@ static void cppi41_dma_callback(void *private_data)
 			musb_writew(epio, MUSB_RXCSR, csr);
 		}
 	}
+out_unlock:
 	spin_unlock_irqrestore(&musb->lock, flags);
 }
 
