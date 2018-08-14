From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 14 Aug 2018 09:07:15 +0000
Subject: [PATCH] USB: serial: io_ti: array underflow in edge_interrupt_callback()
Message-Id: <20180814090715.z4amswxtv5cwdria@kili.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Johan Hovold <johan@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org, kernel-janitors@vger.kernel.org

A malicious USB device could set port_number to -3 and we would
underflow the edge_serial->serial->port[] array.

Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/usb/serial/io_ti.c b/drivers/usb/serial/io_ti.c
index 6d1d6efa3055..fa2af18c6efe 100644
--- a/drivers/usb/serial/io_ti.c
+++ b/drivers/usb/serial/io_ti.c
@@ -1629,7 +1629,7 @@ static void edge_interrupt_callback(struct urb *urb)
 	struct device *dev;
 	unsigned char *data = urb->transfer_buffer;
 	int length = urb->actual_length;
-	int port_number;
+	unsigned int port_number;
 	int function;
 	int retval;
 	__u8 lsr;
