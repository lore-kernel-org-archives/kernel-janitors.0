From: Michael Veeck <michael.veeck@gmx.net>
Date: Mon, 12 Jul 2004 15:38:36 +0000
Subject: [Kernel-janitors] [PATCH] drivers/sbus/char/ minmax removal and
Message-Id: <40F2B07C.9050108@gmx.net>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="------------090407080201060709020006"
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

This is a multi-part message in MIME format.
--------------090407080201060709020006
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit

This patch (against 2.6.8-rc1) removes minmax-macros and changes calls
to use kernel.h macros instead.

Now heres the problem: Since all that is left on my minmax-todolist are 
arch-specific-files, is there a way to cross-compile the kernel image so 
that I can at least test if the patches compile? Sort of like "compile 
everything there is, even if its hardware that wont ever exist on my 
plattform" ?

Best regards
Veeck



--------------090407080201060709020006
Content-Type: text/plain;
 name="drivers-sbus-minmax.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="drivers-sbus-minmax.patch"

diff -uprN -X dontdiff linux-2.6.8-rc1-old/drivers/sbus/char/aurora.c linux-2.6.8-rc1-new/drivers/sbus/char/aurora.c
--- linux-2.6.8-rc1-old/drivers/sbus/char/aurora.c	2004-07-04 11:04:15.000000000 +0200
+++ linux-2.6.8-rc1-new/drivers/sbus/char/aurora.c	2004-07-12 17:01:09.432458176 +0200
@@ -81,10 +81,6 @@ unsigned char irqs[4] = {
 int irqhit=0;
 #endif
 
-#ifndef MIN
-#define MIN(a,b) ((a) < (b) ? (a) : (b))
-#endif
-
 static struct tty_driver *aurora_driver;
 static struct Aurora_board aurora_board[AURORA_NBOARD] = {
 	{0,},
@@ -594,7 +590,7 @@ static void aurora_transmit(struct Auror
 					    &bp->r[chip]->r[CD180_TDR]);
 				port->COR2 &= ~COR2_ETC;
 			}
-			count = MIN(port->break_length, 0xff);
+			count = min_t(unsigned char, port->break_length, 0xff);
 			sbus_writeb(CD180_C_ESC,
 				    &bp->r[chip]->r[CD180_TDR]);
 			sbus_writeb(CD180_C_DELAY,
@@ -1577,8 +1573,8 @@ static int aurora_write(struct tty_struc
 	if (from_user) {
 		down(&tmp_buf_sem);
 		while (1) {
-			c = MIN(count, MIN(SERIAL_XMIT_SIZE - port->xmit_cnt - 1,
-					   SERIAL_XMIT_SIZE - port->xmit_head));
+			c = min_t(int, count, min(SERIAL_XMIT_SIZE - port->xmit_cnt - 1,
+						  SERIAL_XMIT_SIZE - port->xmit_head));
 			if (c <= 0)
 				break;
 
@@ -1589,8 +1585,8 @@ static int aurora_write(struct tty_struc
 				break;
 			}
 			cli();
-			c = MIN(c, MIN(SERIAL_XMIT_SIZE - port->xmit_cnt - 1,
-				       SERIAL_XMIT_SIZE - port->xmit_head));
+			c = min_t(int, c, min(SERIAL_XMIT_SIZE - port->xmit_cnt - 1,
+					      SERIAL_XMIT_SIZE - port->xmit_head));
 			memcpy(port->xmit_buf + port->xmit_head, tmp_buf, c);
 			port->xmit_head = (port->xmit_head + c) & (SERIAL_XMIT_SIZE-1);
 			port->xmit_cnt += c;
@@ -1604,8 +1600,8 @@ static int aurora_write(struct tty_struc
 	} else {
 		while (1) {
 			cli();
-			c = MIN(count, MIN(SERIAL_XMIT_SIZE - port->xmit_cnt - 1,
-					   SERIAL_XMIT_SIZE - port->xmit_head));
+			c = min_t(int, count, min(SERIAL_XMIT_SIZE - port->xmit_cnt - 1,
+						  SERIAL_XMIT_SIZE - port->xmit_head));
 			if (c <= 0) {
 				restore_flags(flags);
 				break;

--------------090407080201060709020006
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--------------090407080201060709020006--
