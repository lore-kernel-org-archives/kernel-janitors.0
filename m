From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 29 Jul 2015 21:29:23 +0000
Subject: [patch] usb: gadget: fotg210-udc: remove duplicate conditions
Message-Id: <20150729212923.GB21784@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

We handle the "if (!req->req.length)" condition at the start of the
function and return.  We can delete this dead code.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
This code doesn't change the current behavior but it's also possible
that the current code is buggy.  Perhaps we should delete the earlier
check?

diff --git a/drivers/usb/gadget/udc/fotg210-udc.c b/drivers/usb/gadget/udc/fotg210-udc.c
index 1137e33..a99ed6d 100644
--- a/drivers/usb/gadget/udc/fotg210-udc.c
+++ b/drivers/usb/gadget/udc/fotg210-udc.c
@@ -384,25 +384,15 @@ static void fotg210_ep0_queue(struct fotg210_ep *ep,
 		return;
 	}
 	if (ep->dir_in) { /* if IN */
-		if (req->req.length) {
-			fotg210_start_dma(ep, req);
-		} else {
-			pr_err("%s : req->req.length = 0x%x\n",
-			       __func__, req->req.length);
-		}
+		fotg210_start_dma(ep, req);
 		if ((req->req.length = req->req.actual) ||
 		    (req->req.actual < ep->ep.maxpacket))
 			fotg210_done(ep, req, 0);
 	} else { /* OUT */
-		if (!req->req.length) {
-			fotg210_done(ep, req, 0);
-		} else {
-			u32 value = ioread32(ep->fotg210->reg +
-						FOTG210_DMISGR0);
+		u32 value = ioread32(ep->fotg210->reg + FOTG210_DMISGR0);
 
-			value &= ~DMISGR0_MCX_OUT_INT;
-			iowrite32(value, ep->fotg210->reg + FOTG210_DMISGR0);
-		}
+		value &= ~DMISGR0_MCX_OUT_INT;
+		iowrite32(value, ep->fotg210->reg + FOTG210_DMISGR0);
 	}
 }
 
