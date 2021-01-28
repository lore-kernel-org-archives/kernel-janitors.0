From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 28 Jan 2021 09:35:23 +0000
Subject: [PATCH] USB: serial: mos7720: Fix error code in mos7720_write()
Message-Id: <YBKFW60qMJbtjvum@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Johan Hovold <johan@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org, kernel-janitors@vger.kernel.org

This code should return -ENOMEM if the kmalloc() fails but instead
it returns success.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
The first error path is probably wrong as well?

drivers/usb/serial/mos7720.c
  1077          /* try to find a free urb in the list */
  1078          urb = NULL;
  1079  
  1080          for (i = 0; i < NUM_URBS; ++i) {
  1081                  if (mos7720_port->write_urb_pool[i] &&
  1082                      mos7720_port->write_urb_pool[i]->status != -EINPROGRESS) {
  1083                          urb = mos7720_port->write_urb_pool[i];
  1084                          dev_dbg(&port->dev, "URB:%d\n", i);
  1085                          break;
  1086                  }
  1087          }
  1088  
  1089          if (urb = NULL) {
  1090                  dev_dbg(&port->dev, "%s - no more free urbs\n", __func__);
  1091                  goto exit;

Should return -ENODEV?

  1092          }

 drivers/usb/serial/mos7720.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/serial/mos7720.c b/drivers/usb/serial/mos7720.c
index ed347a6d50ba..aa55169796a3 100644
--- a/drivers/usb/serial/mos7720.c
+++ b/drivers/usb/serial/mos7720.c
@@ -1094,8 +1094,10 @@ static int mos7720_write(struct tty_struct *tty, struct usb_serial_port *port,
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
