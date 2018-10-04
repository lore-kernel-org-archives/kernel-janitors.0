From: YueHaibing <yuehaibing@huawei.com>
Date: Thu, 04 Oct 2018 06:58:39 +0000
Subject: [PATCH v2 -next] USB: cypress_m8: remove set but not used variables 'iflag'
Message-Id: <1538636993-126815-1-git-send-email-yuehaibing@huawei.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Johan Hovold <johan@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: YueHaibing <yuehaibing@huawei.com>, linux-usb@vger.kernel.org, kernel-janitors@vger.kernel.org

Fixes gcc '-Wunused-but-set-variable' warning:

drivers/usb/serial/cypress_m8.c: In function 'cypress_set_termios':
drivers/usb/serial/cypress_m8.c:866:18: warning:
 variable 'iflag' set but not used [-Wunused-but-set-variable]

Signed-off-by: YueHaibing <yuehaibing@huawei.com>
---
v2: only fix 'iflag' warning
---
 drivers/usb/serial/cypress_m8.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/usb/serial/cypress_m8.c b/drivers/usb/serial/cypress_m8.c
index 31c6091..8236997 100644
--- a/drivers/usb/serial/cypress_m8.c
+++ b/drivers/usb/serial/cypress_m8.c
@@ -863,7 +863,7 @@ static void cypress_set_termios(struct tty_struct *tty,
 	struct cypress_private *priv = usb_get_serial_port_data(port);
 	struct device *dev = &port->dev;
 	int data_bits, stop_bits, parity_type, parity_enable;
-	unsigned cflag, iflag;
+	unsigned int cflag;
 	unsigned long flags;
 	__u8 oldlines;
 	int linechange = 0;
@@ -899,7 +899,6 @@ static void cypress_set_termios(struct tty_struct *tty,
 	tty->termios.c_cflag &= ~(CMSPAR|CRTSCTS);
 
 	cflag = tty->termios.c_cflag;
-	iflag = tty->termios.c_iflag;
 
 	/* check if there are new settings */
 	if (old_termios) {
