From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Date: Wed, 04 Jan 2017 05:30:16 +0000
Subject: [PATCH] usb: gadget: composite: Fix function used to free memory
Message-Id: <20170104053016.2153-1-christophe.jaillet@wanadoo.fr>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: balbi@kernel.org, gregkh@linuxfoundation.org
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Christophe JAILLET <christophe.jaillet@wanadoo.fr>

'cdev->os_desc_req' has been allocated with 'usb_ep_alloc_request()' so
'usb_ep_free_request()' should be used to free it.

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
 drivers/usb/gadget/composite.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/gadget/composite.c b/drivers/usb/gadget/composite.c
index 002822d98fda..49d685ad0da9 100644
--- a/drivers/usb/gadget/composite.c
+++ b/drivers/usb/gadget/composite.c
@@ -2147,7 +2147,7 @@ int composite_os_desc_req_prepare(struct usb_composite_dev *cdev,
 	cdev->os_desc_req->buf = kmalloc(4096, GFP_KERNEL);
 	if (!cdev->os_desc_req->buf) {
 		ret = -ENOMEM;
-		kfree(cdev->os_desc_req);
+		usb_ep_free_request(ep0, cdev->os_desc_req);
 		goto end;
 	}
 	cdev->os_desc_req->context = cdev;
-- 
2.9.3

