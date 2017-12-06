From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Wed, 06 Dec 2017 11:52:14 +0000
Subject: [PATCH] USB: emi62: Delete an error message for a failed memory allocation in emi62_writememory()
Message-Id: <127ca958-ef62-dbda-5329-02252c1a2763@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-usb@vger.kernel.org, Felipe Balbi <felipe.balbi@linux.intel.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Johan Hovold <johan@kernel.org>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Wed, 6 Dec 2017 12:42:20 +0100

Omit an extra message for a memory allocation failure in this function.

This issue was detected by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/usb/misc/emi62.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/usb/misc/emi62.c b/drivers/usb/misc/emi62.c
index 3eea60437f56..f85946731aaa 100644
--- a/drivers/usb/misc/emi62.c
+++ b/drivers/usb/misc/emi62.c
@@ -51,10 +51,9 @@ static int emi62_writememory(struct usb_device *dev, int address,
 	int result;
 	unsigned char *buffer =  kmemdup(data, length, GFP_KERNEL);
 
-	if (!buffer) {
-		dev_err(&dev->dev, "kmalloc(%d) failed.\n", length);
+	if (!buffer)
 		return -ENOMEM;
-	}
+
 	/* Note: usb_control_msg returns negative value on error or length of the
 	 * 		 data that was written! */
 	result = usb_control_msg (dev, usb_sndctrlpipe(dev, 0), request, 0x40, address, 0, buffer, length, 300);
-- 
2.15.1

