From: Colin King <colin.king@canonical.com>
Date: Fri, 27 Sep 2019 08:50:31 +0000
Subject: [PATCH] USB: gadget: udc: clean up an indentation issue
Message-Id: <20190927085031.14739-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Felipe Balbi <balbi@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

There is a statement that is indented too deeply, remove
the extraneous tabs.

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/usb/gadget/udc/bdc/bdc_udc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/gadget/udc/bdc/bdc_udc.c b/drivers/usb/gadget/udc/bdc/bdc_udc.c
index 7bfd58c846f7..248426a3e88a 100644
--- a/drivers/usb/gadget/udc/bdc/bdc_udc.c
+++ b/drivers/usb/gadget/udc/bdc/bdc_udc.c
@@ -195,7 +195,7 @@ static void handle_link_state_change(struct bdc *bdc, u32 uspc)
 		break;
 	case BDC_LINK_STATE_U0:
 		if (bdc->devstatus & REMOTE_WAKEUP_ISSUED) {
-					bdc->devstatus &= ~REMOTE_WAKEUP_ISSUED;
+			bdc->devstatus &= ~REMOTE_WAKEUP_ISSUED;
 			if (bdc->gadget.speed = USB_SPEED_SUPER) {
 				bdc_function_wake_fh(bdc, 0);
 				bdc->devstatus |= FUNC_WAKE_ISSUED;
-- 
2.20.1
