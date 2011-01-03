From: Dan Carpenter <error27@gmail.com>
Date: Mon, 03 Jan 2011 05:44:38 +0000
Subject: [patch 1/2] Staging: tm6000: check usb_alloc_urb() return
Message-Id: <20110103054438.GQ1886@bicker>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

usb_alloc_urb() can return NULL so check for that and return
-ENOMEM if it happens.

Signed-off-by: Dan Carpenter <error27@gmail.com>

diff --git a/drivers/staging/tm6000/tm6000-input.c b/drivers/staging/tm6000/tm6000-input.c
index 21e7da4..aee5e85 100644
--- a/drivers/staging/tm6000/tm6000-input.c
+++ b/drivers/staging/tm6000/tm6000-input.c
@@ -313,6 +313,8 @@ int tm6000_ir_int_start(struct tm6000_core *dev)
 		return -ENODEV;
 
 	ir->int_urb = usb_alloc_urb(0, GFP_KERNEL);
+	if (!ir->int_urb)
+		return -ENOMEM;
 
 	pipe = usb_rcvintpipe(dev->udev,
 		dev->int_in.endp->desc.bEndpointAddress
