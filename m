From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Wed, 06 Dec 2017 16:13:25 +0000
Subject: [PATCH] USB: hub: Delete an error message for a failed memory allocation in usb_hub_clear_tt_buffer(
Message-Id: <659939f3-da51-0cfd-2eb2-8a726cb1a42f@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-usb@vger.kernel.org, Alan Stern <stern@rowland.harvard.edu>, Daniel Drake <drake@endlessm.com>, Dmitry Fleytman <dmitry@daynix.com>, Eugene Korenevsky <ekorenevsky@gmail.com>, Geert Uytterhoeven <geert@linux-m68k.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, =?UTF-8?B?R8O8bnRlciBSw7Zjaw==?= <linux@roeck-us.net>, Johan Hovold <johan@kernel.org>, Mathias Nyman <mathias.nyman@linux.intel.com>, Peter Chen <peter.chen@nxp.com>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Wed, 6 Dec 2017 17:00:18 +0100

Omit an extra message for a memory allocation failure in this function.

This issue was detected by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/usb/core/hub.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/usb/core/hub.c b/drivers/usb/core/hub.c
index 7ccdd3d4db84..9fbb908e9552 100644
--- a/drivers/usb/core/hub.c
+++ b/drivers/usb/core/hub.c
@@ -829,7 +829,6 @@ int usb_hub_clear_tt_buffer(struct urb *urb)
 	 */
 	clear = kmalloc(sizeof *clear, GFP_ATOMIC);
 	if (clear = NULL) {
-		dev_err(&udev->dev, "can't save CLEAR_TT_BUFFER state\n");
 		/* FIXME recover somehow ... RESET_TT? */
 		return -ENOMEM;
 	}
-- 
2.15.1

