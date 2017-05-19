From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Fri, 19 May 2017 20:37:13 +0000
Subject: [PATCH] ezusb: Delete an error message for a failed memory allocation in ezusb_writememory()
Message-Id: <8f0123de-6703-4c9c-5a34-b3930262aaec@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-usb@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Julia Lawall <julia.lawall@lip6.fr>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org, Wolfram Sang <wsa@the-dreams.de>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Fri, 19 May 2017 22:30:21 +0200

Omit an extra message for a memory allocation failure in this function.

This issue was detected by using the Coccinelle software.

Link: http://events.linuxfoundation.org/sites/events/files/slides/LCJ16-Refactor_Strings-WSang_0.pdf
Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/usb/misc/ezusb.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/usb/misc/ezusb.c b/drivers/usb/misc/ezusb.c
index 837208f14f86..6d5e468dc897 100644
--- a/drivers/usb/misc/ezusb.c
+++ b/drivers/usb/misc/ezusb.c
@@ -41,11 +41,9 @@ static int ezusb_writememory(struct usb_device *dev, int address,
 		return -ENODEV;
 
 	transfer_buffer = kmemdup(data, length, GFP_KERNEL);
-	if (!transfer_buffer) {
-		dev_err(&dev->dev, "%s - kmalloc(%d) failed.\n",
-							__func__, length);
+	if (!transfer_buffer)
 		return -ENOMEM;
-	}
+
 	result = usb_control_msg(dev, usb_sndctrlpipe(dev, 0), request,
 				 USB_DIR_OUT | USB_TYPE_VENDOR | USB_RECIP_DEVICE,
 				 address, 0, transfer_buffer, length, 3000);
-- 
2.13.0

