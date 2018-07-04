From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 04 Jul 2018 09:29:38 +0000
Subject: [PATCH] USB: serial: ch341: type promotion bug in ch341_control_in()
Message-Id: <20180704092938.g3woukcm5ir6zr7e@kili.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Johan Hovold <johan@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org, kernel-janitors@vger.kernel.org

The "r" variable is an int and "bufsize" is an unsigned int so the
comparison is type promoted to unsigned.  If usb_control_msg() returns a
negative that is treated as a high positive value and the error handling
doesn't work.

Fixes: 2d5a9c72d0c4 ("USB: serial: ch341: fix control-message error handling")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/usb/serial/ch341.c b/drivers/usb/serial/ch341.c
index bdd7a5ad3bf1..3bb1fff02bed 100644
--- a/drivers/usb/serial/ch341.c
+++ b/drivers/usb/serial/ch341.c
@@ -128,7 +128,7 @@ static int ch341_control_in(struct usb_device *dev,
 	r = usb_control_msg(dev, usb_rcvctrlpipe(dev, 0), request,
 			    USB_TYPE_VENDOR | USB_RECIP_DEVICE | USB_DIR_IN,
 			    value, index, buf, bufsize, DEFAULT_TIMEOUT);
-	if (r < bufsize) {
+	if (r < (int)bufsize) {
 		if (r >= 0) {
 			dev_err(&dev->dev,
 				"short control message received (%d < %u)\n",
