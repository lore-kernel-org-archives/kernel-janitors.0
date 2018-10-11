From: YueHaibing <yuehaibing@huawei.com>
Date: Thu, 11 Oct 2018 07:44:33 +0000
Subject: [PATCH -next] USB: serial: quatech2: remove set but not used variable 'port_priv'
Message-Id: <1539243873-41457-1-git-send-email-yuehaibing@huawei.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Johan Hovold <johan@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: YueHaibing <yuehaibing@huawei.com>, linux-usb@vger.kernel.org, kernel-janitors@vger.kernel.org

Fixes gcc '-Wunused-but-set-variable' warning:

drivers/usb/serial/quatech2.c: In function 'qt2_process_read_urb':
drivers/usb/serial/quatech2.c:503:27: warning:
 variable 'port_priv' set but not used [-Wunused-but-set-variable]

It not used any more after
commit 2be818a116b2 ("Revert "USB: quatech2: only write to the tty if the port is open."")

Signed-off-by: YueHaibing <yuehaibing@huawei.com>
---
 drivers/usb/serial/quatech2.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/usb/serial/quatech2.c b/drivers/usb/serial/quatech2.c
index f2fbe1e..a62981c 100644
--- a/drivers/usb/serial/quatech2.c
+++ b/drivers/usb/serial/quatech2.c
@@ -500,7 +500,6 @@ static void qt2_process_read_urb(struct urb *urb)
 	struct usb_serial *serial;
 	struct qt2_serial_private *serial_priv;
 	struct usb_serial_port *port;
-	struct qt2_port_private *port_priv;
 	bool escapeflag;
 	unsigned char *ch;
 	int i;
@@ -514,7 +513,6 @@ static void qt2_process_read_urb(struct urb *urb)
 	serial = urb->context;
 	serial_priv = usb_get_serial_data(serial);
 	port = serial->port[serial_priv->current_port];
-	port_priv = usb_get_serial_port_data(port);
 
 	for (i = 0; i < urb->actual_length; i++) {
 		ch = (unsigned char *)urb->transfer_buffer + i;
@@ -566,7 +564,6 @@ static void qt2_process_read_urb(struct urb *urb)
 
 				serial_priv->current_port = newport;
 				port = serial->port[serial_priv->current_port];
-				port_priv = usb_get_serial_port_data(port);
 				i += 3;
 				escapeflag = true;
 				break;
