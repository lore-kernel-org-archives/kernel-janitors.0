From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 25 Nov 2014 15:55:57 +0000
Subject: [patch 1/2] usb: gadget: udc: clean up a printk
Message-Id: <20141125155557.GA19894@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

We already know what "value" is, so there is no need to check.  It
puzzles static checkers to have the unneeded condition.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/usb/gadget/udc/bdc/bdc_ep.c b/drivers/usb/gadget/udc/bdc/bdc_ep.c
index 15da5b1..2f4ac6e 100644
--- a/drivers/usb/gadget/udc/bdc/bdc_ep.c
+++ b/drivers/usb/gadget/udc/bdc/bdc_ep.c
@@ -880,8 +880,8 @@ static int ep_set_halt(struct bdc_ep *ep, u32 value)
 
 		ret = bdc_ep_set_stall(bdc, ep->ep_num);
 		if (ret)
-			dev_err(bdc->dev, "failed to %s STALL on %s\n",
-				value ? "set" : "clear", ep->name);
+			dev_err(bdc->dev, "failed to set STALL on %s\n",
+				ep->name);
 		else
 			ep->flags |= BDC_EP_STALL;
 	} else {
@@ -889,8 +889,8 @@ static int ep_set_halt(struct bdc_ep *ep, u32 value)
 		dev_dbg(bdc->dev, "Before Clear\n");
 		ret = bdc_ep_clear_stall(bdc, ep->ep_num);
 		if (ret)
-			dev_err(bdc->dev, "failed to %s STALL on %s\n",
-				value ? "set" : "clear", ep->name);
+			dev_err(bdc->dev, "failed to clear STALL on %s\n",
+				ep->name);
 		else
 			ep->flags &= ~BDC_EP_STALL;
 		dev_dbg(bdc->dev, "After  Clear\n");
