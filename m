From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 07 Mar 2014 11:20:22 +0000
Subject: [patch 2/2] usb: dwc3: gadget: remove known conditions
Message-Id: <20140307112022.GD2351@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

We know what "value" is and it upsets static checkers that we appear to
have doubts about it.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/usb/dwc3/gadget.c b/drivers/usb/dwc3/gadget.c
index 95b9eae05617..a7df8120cf82 100644
--- a/drivers/usb/dwc3/gadget.c
+++ b/drivers/usb/dwc3/gadget.c
@@ -1233,8 +1233,7 @@ int __dwc3_gadget_ep_set_halt(struct dwc3_ep *dep, int value)
 		ret = dwc3_send_gadget_ep_cmd(dwc, dep->number,
 			DWC3_DEPCMD_SETSTALL, &params);
 		if (ret)
-			dev_err(dwc->dev, "failed to %s STALL on %s\n",
-					value ? "set" : "clear",
+			dev_err(dwc->dev, "failed to set STALL on %s\n",
 					dep->name);
 		else
 			dep->flags |= DWC3_EP_STALL;
@@ -1242,8 +1241,7 @@ int __dwc3_gadget_ep_set_halt(struct dwc3_ep *dep, int value)
 		ret = dwc3_send_gadget_ep_cmd(dwc, dep->number,
 			DWC3_DEPCMD_CLEARSTALL, &params);
 		if (ret)
-			dev_err(dwc->dev, "failed to %s STALL on %s\n",
-					value ? "set" : "clear",
+			dev_err(dwc->dev, "failed to clear STALL on %s\n",
 					dep->name);
 		else
 			dep->flags &= ~(DWC3_EP_STALL | DWC3_EP_WEDGE);
