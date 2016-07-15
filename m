From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 15 Jul 2016 11:15:47 +0000
Subject: [patch] usb: gadget: fsl_qe_udc: signedness bug in qe_get_frame()
Message-Id: <20160715111547.GF9258@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Li Yang <leoli@freescale.com>
Cc: Felipe Balbi <balbi@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, kernel-janitors@vger.kernel.org

We can't assign -EINVAL to a u16.

Fixes: 3948f0e0c999 ('usb: add Freescale QE/CPM USB peripheral controller driver')
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/usb/gadget/udc/fsl_qe_udc.c b/drivers/usb/gadget/udc/fsl_qe_udc.c
index 93d28cb..901366f 100644
--- a/drivers/usb/gadget/udc/fsl_qe_udc.c
+++ b/drivers/usb/gadget/udc/fsl_qe_udc.c
@@ -1878,11 +1878,8 @@ static int qe_get_frame(struct usb_gadget *gadget)
 
 	tmp = in_be16(&udc->usb_param->frame_n);
 	if (tmp & 0x8000)
-		tmp = tmp & 0x07ff;
-	else
-		tmp = -EINVAL;
-
-	return (int)tmp;
+		return tmp & 0x07ff;
+	return -EINVAL;
 }
 
 static int fsl_qe_start(struct usb_gadget *gadget,
