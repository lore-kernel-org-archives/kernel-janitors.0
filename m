From: Colin King <colin.king@canonical.com>
Date: Fri, 13 Jul 2018 10:08:31 +0000
Subject: [PATCH] usb: serial: mos7720: remove redundant variables iflag, mask and serial
Message-Id: <20180713100831.29120-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Johan Hovold <johan@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Variables iflag, mask and serial are being assigned but ar never used
hence are redundant and can be removed.

Cleans up clang warnings:
warning: variable 'iflag' set but not used [-Wunused-but-set-variable]
warning: variable 'mask' set but not used [-Wunused-but-set-variable]
warning: variable 'serial' set but not used [-Wunused-but-set-variable]

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/usb/serial/mos7720.c | 9 ---------
 1 file changed, 9 deletions(-)

diff --git a/drivers/usb/serial/mos7720.c b/drivers/usb/serial/mos7720.c
index 8f11e759ad61..27109522fd8b 100644
--- a/drivers/usb/serial/mos7720.c
+++ b/drivers/usb/serial/mos7720.c
@@ -1527,8 +1527,6 @@ static void change_port_settings(struct tty_struct *tty,
 	struct usb_serial *serial;
 	int baud;
 	unsigned cflag;
-	unsigned iflag;
-	__u8 mask = 0xff;
 	__u8 lData;
 	__u8 lParity;
 	__u8 lStop;
@@ -1552,23 +1550,19 @@ static void change_port_settings(struct tty_struct *tty,
 	lParity = 0x00;	/* No parity */
 
 	cflag = tty->termios.c_cflag;
-	iflag = tty->termios.c_iflag;
 
 	/* Change the number of bits */
 	switch (cflag & CSIZE) {
 	case CS5:
 		lData = UART_LCR_WLEN5;
-		mask = 0x1f;
 		break;
 
 	case CS6:
 		lData = UART_LCR_WLEN6;
-		mask = 0x3f;
 		break;
 
 	case CS7:
 		lData = UART_LCR_WLEN7;
-		mask = 0x7f;
 		break;
 	default:
 	case CS8:
@@ -1686,11 +1680,8 @@ static void mos7720_set_termios(struct tty_struct *tty,
 		struct usb_serial_port *port, struct ktermios *old_termios)
 {
 	int status;
-	struct usb_serial *serial;
 	struct moschip_port *mos7720_port;
 
-	serial = port->serial;
-
 	mos7720_port = usb_get_serial_port_data(port);
 
 	if (mos7720_port = NULL)
-- 
2.17.1

