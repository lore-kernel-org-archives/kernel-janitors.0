From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Date: Sat, 16 Jul 2016 06:57:39 +0000
Subject: [PATCH] usb: gadget: composite: Fix function used to free memory
Message-Id: <1468652259-15621-1-git-send-email-christophe.jaillet@wanadoo.fr>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: balbi@kernel.org, gregkh@linuxfoundation.org
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Christophe JAILLET <christophe.jaillet@wanadoo.fr>

'cdev->os_desc_req' has been allocated with 'usb_ep_alloc_request' so
'usb_ep_free_request' should be used to free it.

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
 drivers/usb/gadget/composite.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/gadget/composite.c b/drivers/usb/gadget/composite.c
index 8241856..9fe73cf 100644
--- a/drivers/usb/gadget/composite.c
+++ b/drivers/usb/gadget/composite.c
@@ -2132,7 +2132,7 @@ int composite_os_desc_req_prepare(struct usb_composite_dev *cdev,
 	cdev->os_desc_req->buf = kmalloc(4096, GFP_KERNEL);
 	if (!cdev->os_desc_req->buf) {
 		ret = -ENOMEM;
-		kfree(cdev->os_desc_req);
+		usb_ep_free_request(ep0, cdev->os_desc_req);
 		goto end;
 	}
 	cdev->os_desc_req->context = cdev;
-- 
2.7.4


---
L'absence de virus dans ce courrier électronique a été vérifiée par le logiciel antivirus Avast.
https://www.avast.com/antivirus

