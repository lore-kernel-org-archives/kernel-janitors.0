From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 21 May 2014 12:26:02 +0000
Subject: [patch] usb: gadget: return -ENOMEM on allocation failure
Message-Id: <20140521122602.GA23396@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

The error handling is confusing in this function, but if you look
closely it is returning success after the allocation fails.  I have
changed it to return -ENOMEM and re-written it to be more clear.

Fixes: 37a3a533429e ('usb: gadget: OS Feature Descriptors support')
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/usb/gadget/composite.c b/drivers/usb/gadget/composite.c
index 042c66b..8e70057 100644
--- a/drivers/usb/gadget/composite.c
+++ b/drivers/usb/gadget/composite.c
@@ -1924,24 +1924,19 @@ fail:
 int composite_os_desc_req_prepare(struct usb_composite_dev *cdev,
 				  struct usb_ep *ep0)
 {
-	int ret = 0;
-
 	cdev->os_desc_req = usb_ep_alloc_request(ep0, GFP_KERNEL);
-	if (!cdev->os_desc_req) {
-		ret = PTR_ERR(cdev->os_desc_req);
-		goto end;
-	}
+	if (!cdev->os_desc_req)
+		return -ENOMEM;
 
 	/* OS feature descriptor length <= 4kB */
 	cdev->os_desc_req->buf = kmalloc(4096, GFP_KERNEL);
 	if (!cdev->os_desc_req->buf) {
-		ret = PTR_ERR(cdev->os_desc_req->buf);
 		kfree(cdev->os_desc_req);
-		goto end;
+		return -ENOMEM;
 	}
 	cdev->os_desc_req->complete = composite_setup_complete;
-end:
-	return ret;
+
+	return 0;
 }
 
 void composite_dev_cleanup(struct usb_composite_dev *cdev)
