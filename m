From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 04 Jan 2012 07:20:09 +0000
Subject: [patch] usb: gadget: mv_udc: remove unneeded NULL check
Message-Id: <20120104072009.GD30978@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

We've dereferenced req already, and we checked for bogus parameters at
the start of the function.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/usb/gadget/mv_udc_core.c b/drivers/usb/gadget/mv_udc_core.c
index f97e737..8dd398b 100644
--- a/drivers/usb/gadget/mv_udc_core.c
+++ b/drivers/usb/gadget/mv_udc_core.c
@@ -771,8 +771,7 @@ mv_ep_queue(struct usb_ep *_ep, struct usb_request *_req, gfp_t gfp_flags)
 		udc->ep0_state = DATA_STATE_XMIT;
 
 	/* irq handler advances the queue */
-	if (req != NULL)
-		list_add_tail(&req->queue, &ep->queue);
+	list_add_tail(&req->queue, &ep->queue);
 	spin_unlock_irqrestore(&udc->lock, flags);
 
 	return 0;
