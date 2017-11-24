From: Colin King <colin.king@canonical.com>
Date: Fri, 24 Nov 2017 10:10:44 +0000
Subject: [PATCH] USB: gadget: udc: fix spelling mistake "unexpect" -> "unexpected"
Message-Id: <20171124101044.26554-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Li Yang <leoyang.li@nxp.com>, Felipe Balbi <balbi@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Trival fix to spelling mistake in ERR message

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/usb/gadget/udc/fsl_udc_core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/gadget/udc/fsl_udc_core.c b/drivers/usb/gadget/udc/fsl_udc_core.c
index d606d4f13098..e5b4ee96c4bf 100644
--- a/drivers/usb/gadget/udc/fsl_udc_core.c
+++ b/drivers/usb/gadget/udc/fsl_udc_core.c
@@ -1543,7 +1543,7 @@ static void ep0_req_complete(struct fsl_udc *udc, struct fsl_ep *ep0,
 		udc->ep0_state = WAIT_FOR_SETUP;
 		break;
 	case WAIT_FOR_SETUP:
-		ERR("Unexpect ep0 packets\n");
+		ERR("Unexpected ep0 packets\n");
 		break;
 	default:
 		ep0stall(udc);
-- 
2.14.1

