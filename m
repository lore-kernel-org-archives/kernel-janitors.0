From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 25 Nov 2014 15:56:22 +0000
Subject: [patch 2/2] usb: gadget: udc: remove bogus NULL check
Message-Id: <20141125155622.GB19894@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

"ep" isn't NULL here, and static checkers complain because we
dereferenced it on the previous line.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/usb/gadget/udc/bdc/bdc_ep.c b/drivers/usb/gadget/udc/bdc/bdc_ep.c
index 2f4ac6e..7e502ef 100644
--- a/drivers/usb/gadget/udc/bdc/bdc_ep.c
+++ b/drivers/usb/gadget/udc/bdc/bdc_ep.c
@@ -718,7 +718,7 @@ static int ep_queue(struct bdc_ep *ep, struct bdc_req *req)
 	int ret = 0;
 
 	bdc = ep->bdc;
-	if (!req || !ep || !ep->usb_ep.desc)
+	if (!req || !ep->usb_ep.desc)
 		return -EINVAL;
 
 	req->usb_req.actual = 0;
