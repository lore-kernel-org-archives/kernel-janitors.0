From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Date: Sat, 16 Jul 2016 06:34:33 +0000
Subject: [PATCH 1/2] usb: gadget: composite: Fix return value in case of error
Message-Id: <1468650873-13929-1-git-send-email-christophe.jaillet@wanadoo.fr>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: balbi@kernel.org, gregkh@linuxfoundation.org
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Christophe JAILLET <christophe.jaillet@wanadoo.fr>

In 'composite_os_desc_req_prepare', if one of the memory allocations fail,
0 will be returned, which means success.
We should return -ENOMEM instead.

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
 drivers/usb/gadget/composite.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/gadget/composite.c b/drivers/usb/gadget/composite.c
index eb64848..8241856 100644
--- a/drivers/usb/gadget/composite.c
+++ b/drivers/usb/gadget/composite.c
@@ -2124,14 +2124,14 @@ int composite_os_desc_req_prepare(struct usb_composite_dev *cdev,
 
 	cdev->os_desc_req = usb_ep_alloc_request(ep0, GFP_KERNEL);
 	if (!cdev->os_desc_req) {
-		ret = PTR_ERR(cdev->os_desc_req);
+		ret = -ENOMEM;
 		goto end;
 	}
 
 	/* OS feature descriptor length <= 4kB */
 	cdev->os_desc_req->buf = kmalloc(4096, GFP_KERNEL);
 	if (!cdev->os_desc_req->buf) {
-		ret = PTR_ERR(cdev->os_desc_req->buf);
+		ret = -ENOMEM;
 		kfree(cdev->os_desc_req);
 		goto end;
 	}
-- 
2.7.4


---
L'absence de virus dans ce courrier électronique a été vérifiée par le logiciel antivirus Avast.
https://www.avast.com/antivirus

