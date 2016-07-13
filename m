From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 13 Jul 2016 10:14:33 +0000
Subject: [patch] usb: gadget: fsl_qe_udc: off by one in setup_received_handle()
Message-Id: <20160713101433.GI29468@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Li Yang <leoli@freescale.com>, Xie Xiaobo <X.Xie@freescale.com>
Cc: Felipe Balbi <balbi@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, kernel-janitors@vger.kernel.org

The udc->eps[] array has USB_MAX_ENDPOINTS elements so > should be >=.

Fixes: 3948f0e0c999 ('usb: add Freescale QE/CPM USB peripheral controller driver')
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/usb/gadget/udc/fsl_qe_udc.c b/drivers/usb/gadget/udc/fsl_qe_udc.c
index 93d28cb..cf8819a 100644
--- a/drivers/usb/gadget/udc/fsl_qe_udc.c
+++ b/drivers/usb/gadget/udc/fsl_qe_udc.c
@@ -2053,7 +2053,7 @@ static void setup_received_handle(struct qe_udc *udc,
 			struct qe_ep *ep;
 
 			if (wValue != 0 || wLength != 0
-				|| pipe > USB_MAX_ENDPOINTS)
+				|| pipe >= USB_MAX_ENDPOINTS)
 				break;
 			ep = &udc->eps[pipe];
 
