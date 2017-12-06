From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Wed, 06 Dec 2017 15:21:49 +0000
Subject: [PATCH] USB: dwc2: Delete an error message for a failed memory allocation in dwc2_hsotg_handle_unali
Message-Id: <00cd0611-0054-e5db-3fbb-1f7b6d0153fe@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-usb@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, John Youn <johnyoun@synopsys.com>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Wed, 6 Dec 2017 16:16:00 +0100

Omit an extra message for a memory allocation failure in this function.

This issue was detected by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/usb/dwc2/gadget.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/usb/dwc2/gadget.c b/drivers/usb/dwc2/gadget.c
index 88529d092503..3db80c0c4c74 100644
--- a/drivers/usb/dwc2/gadget.c
+++ b/drivers/usb/dwc2/gadget.c
@@ -1223,9 +1223,6 @@ static int dwc2_hsotg_handle_unaligned_buf_start(struct dwc2_hsotg *hsotg,
 	hs_req->req.buf = kmalloc(hs_req->req.length, GFP_ATOMIC);
 	if (!hs_req->req.buf) {
 		hs_req->req.buf = req_buf;
-		dev_err(hsotg->dev,
-			"%s: unable to allocate memory for bounce buffer\n",
-			__func__);
 		return -ENOMEM;
 	}
 
-- 
2.15.1

