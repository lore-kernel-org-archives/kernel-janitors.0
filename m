From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Sat, 29 Nov 2014 12:49:17 +0000
Subject: [patch] usb: gadget: udc: missing curly braces
Message-Id: <20141129124917.GB27251@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

There were curly braces intended here.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/usb/gadget/udc/bdc/bdc_ep.c b/drivers/usb/gadget/udc/bdc/bdc_ep.c
index 15da5b1..ff67cea 100644
--- a/drivers/usb/gadget/udc/bdc/bdc_ep.c
+++ b/drivers/usb/gadget/udc/bdc/bdc_ep.c
@@ -457,10 +457,11 @@ static int setup_bd_list_xfr(struct bdc *bdc, struct bdc_req *req, int num_bds)
 			dword3 |= BD_SOT|BD_SBF|(tfs<<BD_TFS_SHIFT);
 			dword2 |= BD_LTF;
 			/* format of first bd for ep0 is different than other */
-			if (ep->ep_num = 1)
+			if (ep->ep_num = 1) {
 				ret = setup_first_bd_ep0(bdc, req, &dword3);
 				if (ret)
 					return ret;
+			}
 		}
 		if (!req->ep->dir)
 			dword3 |= BD_ISP;
