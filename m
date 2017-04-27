From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 27 Apr 2017 09:11:18 +0000
Subject: [PATCH] usb: gadget: udc-xilinx: clean up a variable name
Message-Id: <20170427091118.tm53zsyq53hhbzws@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Felipe Balbi <balbi@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Michal Simek <michal.simek@xilinx.com>, =?iso-8859-1?Q?S=F6ren?= Brinkmann <soren.brinkmann@xilinx.com>, Wolfram Sang <wsa-dev@sang-engineering.com>, Michal Nazarewicz <mina86@mina86.com>, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

"ep->udc->lock" and "udc->lock" are the same thing.  It confuses Smatch
if we don't use the same name consistently.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/usb/gadget/udc/udc-xilinx.c b/drivers/usb/gadget/udc/udc-xilinx.c
index 588e2531b8b8..de207a90571e 100644
--- a/drivers/usb/gadget/udc/udc-xilinx.c
+++ b/drivers/usb/gadget/udc/udc-xilinx.c
@@ -1151,7 +1151,7 @@ static int xudc_ep_dequeue(struct usb_ep *_ep, struct usb_request *_req)
 			break;
 	}
 	if (&req->usb_req != _req) {
-		spin_unlock_irqrestore(&ep->udc->lock, flags);
+		spin_unlock_irqrestore(&udc->lock, flags);
 		return -EINVAL;
 	}
 	xudc_done(ep, req, -ECONNRESET);
