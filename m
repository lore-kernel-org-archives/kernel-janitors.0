From: YueHaibing <yuehaibing@huawei.com>
Date: Fri, 07 Dec 2018 02:50:42 +0000
Subject: [PATCH -next] USB: serial: mos7840: remove set but not used variables 'number, serial'
Message-Id: <1544151042-120303-1-git-send-email-yuehaibing@huawei.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Johan Hovold <johan@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: YueHaibing <yuehaibing@huawei.com>, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

Fixes gcc '-Wunused-but-set-variable' warning:

drivers/usb/serial/mos7840.c: In function 'mos7840_send_cmd_write_baud_rate':
drivers/usb/serial/mos7840.c:1584:16: warning:
 variable 'number' set but not used [-Wunused-but-set-variable]

drivers/usb/serial/mos7840.c: In function 'mos7840_change_port_settings':
drivers/usb/serial/mos7840.c:1695:21: warning:
 variable 'serial' set but not used [-Wunused-but-set-variable]

'number' never used since introduction in commit 3f5429746d91 ("USB: Moschip
7840 USB-Serial Driver")

'serial' not used since commit 5833041f1b13 ("USB: serial: remove unnecessary
reinitialisations of urb->dev")

Signed-off-by: YueHaibing <yuehaibing@huawei.com>
---
 drivers/usb/serial/mos7840.c | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/drivers/usb/serial/mos7840.c b/drivers/usb/serial/mos7840.c
index 6ff6d67..a698d46 100644
--- a/drivers/usb/serial/mos7840.c
+++ b/drivers/usb/serial/mos7840.c
@@ -1581,7 +1581,6 @@ static int mos7840_send_cmd_write_baud_rate(struct moschip_port *mos7840_port,
 	int divisor = 0;
 	int status;
 	__u16 Data;
-	unsigned char number;
 	__u16 clk_sel_val;
 	struct usb_serial_port *port;
 
@@ -1595,8 +1594,6 @@ static int mos7840_send_cmd_write_baud_rate(struct moschip_port *mos7840_port,
 	if (mos7840_serial_paranoia_check(port->serial, __func__))
 		return -1;
 
-	number = mos7840_port->port->port_number;
-
 	dev_dbg(&port->dev, "%s - baud = %d\n", __func__, baudRate);
 	/* reset clk_uart_sel in spregOffset */
 	if (baudRate > 115200) {
@@ -1692,7 +1689,6 @@ static void mos7840_change_port_settings(struct tty_struct *tty,
 	int status;
 	__u16 Data;
 	struct usb_serial_port *port;
-	struct usb_serial *serial;
 
 	if (mos7840_port = NULL)
 		return;
@@ -1705,8 +1701,6 @@ static void mos7840_change_port_settings(struct tty_struct *tty,
 	if (mos7840_serial_paranoia_check(port->serial, __func__))
 		return;
 
-	serial = port->serial;
-
 	if (!mos7840_port->open) {
 		dev_dbg(&port->dev, "%s - port not opened\n", __func__);
 		return;
