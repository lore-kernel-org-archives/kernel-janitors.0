From: Dan Carpenter <error27@gmail.com>
Date: Fri, 13 Aug 2010 12:38:11 +0000
Subject: [patch] usb/serial/ssu100: uninitialized variable
Message-Id: <20100813123811.GA31262@bicker>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Greg Kroah-Hartman <gregkh@suse.de>
Cc: Bill Pemberton <wfp5p@virginia.edu>, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

GCC complains about the original code, because we're using an
unintialized variable "flag".  I think we should be setting flag based
on the UART_LSR_BRK_ERROR_BITS but I'm not sure...  I don't have this
hardware.  Probably passing TTY_NORMAL is better than the current code?

Signed-off-by: Dan Carpenter <error27@gmail.com>

diff --git a/drivers/usb/serial/ssu100.c b/drivers/usb/serial/ssu100.c
index 6e82d4f..494998c 100644
--- a/drivers/usb/serial/ssu100.c
+++ b/drivers/usb/serial/ssu100.c
@@ -563,7 +563,6 @@ static int ssu100_process_packet(struct tty_struct *tty,
 				 char *packet, int len)
 {
 	int i;
-	char flag;
 	char *ch;
 
 	dbg("%s - port %d", __func__, port->number);
@@ -597,10 +596,10 @@ static int ssu100_process_packet(struct tty_struct *tty,
 	if (port->port.console && port->sysrq) {
 		for (i = 0; i < len; i++, ch++) {
 			if (!usb_serial_handle_sysrq_char(tty, port, *ch))
-				tty_insert_flip_char(tty, *ch, flag);
+				tty_insert_flip_char(tty, *ch, TTY_NORMAL);
 		}
 	} else
-		tty_insert_flip_string_fixed_flag(tty, ch, flag, len);
+		tty_insert_flip_string_fixed_flag(tty, ch, TTY_NORMAL, len);
 
 	return len;
 }
