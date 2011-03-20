From: Dan Carpenter <error27@gmail.com>
Date: Sun, 20 Mar 2011 11:09:50 +0000
Subject: [patch] usb: pch_udc: unlock on allocation failure
Message-Id: <20110320110949.GF2008@bicker>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

There was an unlock missing on the error path.

Also I did a small cleanup by changing ep->dev->lock for just dev->lock.
They're the same lock, but dev->lock is shorter and that's how it is
used for the spin_unlock_irqrestore() call.

Signed-off-by: Dan Carpenter <error27@gmail.com>

diff --git a/drivers/usb/gadget/pch_udc.c b/drivers/usb/gadget/pch_udc.c
index 3e4b35e..68dbcc3 100644
--- a/drivers/usb/gadget/pch_udc.c
+++ b/drivers/usb/gadget/pch_udc.c
@@ -1608,7 +1608,7 @@ static int pch_udc_pcd_queue(struct usb_ep *usbep, struct usb_request *usbreq,
 		return -EINVAL;
 	if (!dev->driver || (dev->gadget.speed = USB_SPEED_UNKNOWN))
 		return -ESHUTDOWN;
-	spin_lock_irqsave(&ep->dev->lock, iflags);
+	spin_lock_irqsave(&dev->lock, iflags);
 	/* map the buffer for dma */
 	if (usbreq->length &&
 	    ((usbreq->dma = DMA_ADDR_INVALID) || !usbreq->dma)) {
@@ -1625,8 +1625,10 @@ static int pch_udc_pcd_queue(struct usb_ep *usbep, struct usb_request *usbreq,
 							     DMA_FROM_DEVICE);
 		} else {
 			req->buf = kzalloc(usbreq->length, GFP_ATOMIC);
-			if (!req->buf)
-				return -ENOMEM;
+			if (!req->buf) {
+				retval = -ENOMEM;
+				goto probe_end;
+			}
 			if (ep->in) {
 				memcpy(req->buf, usbreq->buf, usbreq->length);
 				req->dma = dma_map_single(&dev->pdev->dev,
