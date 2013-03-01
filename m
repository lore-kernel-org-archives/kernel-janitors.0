From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 01 Mar 2013 05:14:19 +0000
Subject: [patch] usb: storage: onetouch: tighten a range check
Message-Id: <20130301051419.GA2669@longonot.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Smatch complains because we only allocate ONETOUCH_PKT_LEN (2) bytes
but later when we call usb_fill_int_urb() we assume maxp can be up
to 8 bytes.  I talked to the maintainer and maxp should be capped at
ONETOUCH_PKT_LEN.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/usb/storage/onetouch.c b/drivers/usb/storage/onetouch.c
index cb79de6..2696489 100644
--- a/drivers/usb/storage/onetouch.c
+++ b/drivers/usb/storage/onetouch.c
@@ -195,6 +195,7 @@ static int onetouch_connect_input(struct us_data *ss)
 
 	pipe = usb_rcvintpipe(udev, endpoint->bEndpointAddress);
 	maxp = usb_maxpacket(udev, pipe, usb_pipeout(pipe));
+	maxp = min(maxp, ONETOUCH_PKT_LEN);
 
 	onetouch = kzalloc(sizeof(struct usb_onetouch), GFP_KERNEL);
 	input_dev = input_allocate_device();
@@ -245,8 +246,7 @@ static int onetouch_connect_input(struct us_data *ss)
 	input_dev->open = usb_onetouch_open;
 	input_dev->close = usb_onetouch_close;
 
-	usb_fill_int_urb(onetouch->irq, udev, pipe, onetouch->data,
-			 (maxp > 8 ? 8 : maxp),
+	usb_fill_int_urb(onetouch->irq, udev, pipe, onetouch->data, maxp,
 			 usb_onetouch_irq, onetouch, endpoint->bInterval);
 	onetouch->irq->transfer_dma = onetouch->data_dma;
 	onetouch->irq->transfer_flags |= URB_NO_TRANSFER_DMA_MAP;
