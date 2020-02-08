From: Colin King <colin.king@canonical.com>
Date: Sat, 08 Feb 2020 16:46:01 +0000
Subject: [PATCH] USB: serial: digi_acceleport: remove redundant assignment to pointer priv
Message-Id: <20200208164601.30032-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Johan Hovold <johan@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Pointer priv is being assigned with a value that is never read, it is
assigned a new value later on in a for-loop. The assignment is
redundant and can be removed.

Addresses-Coverity: ("Unused value")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/usb/serial/digi_acceleport.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/serial/digi_acceleport.c b/drivers/usb/serial/digi_acceleport.c
index 578ebdd86520..91055a191995 100644
--- a/drivers/usb/serial/digi_acceleport.c
+++ b/drivers/usb/serial/digi_acceleport.c
@@ -1472,7 +1472,7 @@ static int digi_read_oob_callback(struct urb *urb)
 	struct usb_serial_port *port = urb->context;
 	struct usb_serial *serial = port->serial;
 	struct tty_struct *tty;
-	struct digi_port *priv = usb_get_serial_port_data(port);
+	struct digi_port *priv;
 	unsigned char *buf = urb->transfer_buffer;
 	int opcode, line, status, val;
 	unsigned long flags;
-- 
2.25.0
