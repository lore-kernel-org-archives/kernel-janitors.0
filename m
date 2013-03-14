From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 14 Mar 2013 08:01:05 +0000
Subject: [patch] usb gadget: uvc: use capped length value
Message-Id: <20130314080105.GA30808@longonot.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

"req->length" is a capped version of "data->length".

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
Static analysis.  I have not tested this.

diff --git a/drivers/usb/gadget/uvc_v4l2.c b/drivers/usb/gadget/uvc_v4l2.c
index 2ca9386..8770cf0 100644
--- a/drivers/usb/gadget/uvc_v4l2.c
+++ b/drivers/usb/gadget/uvc_v4l2.c
@@ -43,7 +43,7 @@ uvc_send_response(struct uvc_device *uvc, struct uvc_request_data *data)
 	req->zero = data->length < uvc->event_length;
 	req->dma = DMA_ADDR_INVALID;
 
-	memcpy(req->buf, data->data, data->length);
+	memcpy(req->buf, data->data, req->length);
 
 	return usb_ep_queue(cdev->gadget->ep0, req, GFP_KERNEL);
 }
