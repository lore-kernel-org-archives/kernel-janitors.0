From: Michael Veeck <michael.veeck@gmx.net>
Date: Sat, 03 Jul 2004 15:05:44 +0000
Subject: [Kernel-janitors] [PATCH] drivers/char/specialix.c MIN/MAX removal
Message-Id: <40E81A6A.5060904@gmx.net>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="------------020202080301010602030408"
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

This is a multi-part message in MIME format.
--------------020202080301010602030408
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit

Patch (against 2.6.7) removes unnecessary min/max macros and changes
calls to use kernel.h macros instead.

Feedback is always welcome
Michael








--------------020202080301010602030408
Content-Type: text/plain;
 name="patch-char-specialix"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="patch-char-specialix"

--- linux-2.6.7-old/drivers/char/specialix.c	2004-07-04 11:04:14.000000000 +0200
+++ linux-2.6.7-new/drivers/char/specialix.c	2004-07-04 15:49:25.246703416 +0200
@@ -135,10 +135,6 @@
 	 ASYNC_SPD_HI       | ASYNC_SPEED_VHI    | ASYNC_SESSION_LOCKOUT | \
 	 ASYNC_PGRP_LOCKOUT | ASYNC_CALLOUT_NOHUP)
 
-#ifndef MIN
-#define MIN(a,b) ((a) < (b) ? (a) : (b))
-#endif
-
 #undef RS_EVENT_WRITE_WAKEUP
 #define RS_EVENT_WRITE_WAKEUP	0
 
@@ -159,7 +155,7 @@
 };
 
 static struct specialix_port sx_port[SX_NBOARD * SX_NPORT];
-		
+
 
 #ifdef SPECIALIX_TIMER
 static struct timer_list missed_irq_timer;
@@ -715,7 +711,7 @@
 				sx_out(bp, CD186x_TDR, CD186x_C_SBRK);
 				port->COR2 &= ~COR2_ETC;
 			}
-			count = MIN(port->break_length, 0xff);
+			count = min_t(int, port->break_length, 0xff);
 			sx_out(bp, CD186x_TDR, CD186x_C_ESC);
 			sx_out(bp, CD186x_TDR, CD186x_C_DELAY);
 			sx_out(bp, CD186x_TDR, count);
@@ -1506,7 +1502,7 @@
 	if (from_user) {
 		down(&tmp_buf_sem);
 		while (1) {
-			c = MIN(count, MIN(SERIAL_XMIT_SIZE - port->xmit_cnt - 1,
+			c = min_t(int, count, min(SERIAL_XMIT_SIZE - port->xmit_cnt - 1,
 					   SERIAL_XMIT_SIZE - port->xmit_head));
 			if (c <= 0)
 				break;
@@ -1519,7 +1515,7 @@
 			}
 
 			cli();
-			c = MIN(c, MIN(SERIAL_XMIT_SIZE - port->xmit_cnt - 1,
+			c = min_t(int, c, min(SERIAL_XMIT_SIZE - port->xmit_cnt - 1,
 				       SERIAL_XMIT_SIZE - port->xmit_head));
 			memcpy(port->xmit_buf + port->xmit_head, tmp_buf, c);
 			port->xmit_head = (port->xmit_head + c) & (SERIAL_XMIT_SIZE-1);
@@ -1534,7 +1530,7 @@
 	} else {
 		while (1) {
 			cli();
-			c = MIN(count, MIN(SERIAL_XMIT_SIZE - port->xmit_cnt - 1,
+			c = min_t(int, count, min(SERIAL_XMIT_SIZE - port->xmit_cnt - 1,
 					   SERIAL_XMIT_SIZE - port->xmit_head));
 			if (c <= 0) {
 				restore_flags(flags);

--------------020202080301010602030408
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--------------020202080301010602030408--
