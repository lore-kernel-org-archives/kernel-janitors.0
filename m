From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 26 Jan 2021 10:26:54 +0000
Subject: [PATCH] USB: serial: mos7840: fix error code in mos7840_write()
Message-Id: <YA/ubifCUlJXxG5g@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Johan Hovold <johan@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Paul B Schroeder <pschroeder@uplogix.com>, linux-usb@vger.kernel.org, kernel-janitors@vger.kernel.org

This should return -ENOMEM instead of 0 if the kmalloc() fails.

Fixes: 3f5429746d91 ("USB: Moschip 7840 USB-Serial Driver")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 drivers/usb/serial/mos7840.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/serial/mos7840.c b/drivers/usb/serial/mos7840.c
index 23f91d658cb4..30c25ef0dacd 100644
--- a/drivers/usb/serial/mos7840.c
+++ b/drivers/usb/serial/mos7840.c
@@ -883,8 +883,10 @@ static int mos7840_write(struct tty_struct *tty, struct usb_serial_port *port,
 	if (urb->transfer_buffer = NULL) {
 		urb->transfer_buffer = kmalloc(URB_TRANSFER_BUFFER_SIZE,
 					       GFP_ATOMIC);
-		if (!urb->transfer_buffer)
+		if (!urb->transfer_buffer) {
+			bytes_sent = -ENOMEM;
 			goto exit;
+		}
 	}
 	transfer_size = min(count, URB_TRANSFER_BUFFER_SIZE);
 
-- 
2.29.2
