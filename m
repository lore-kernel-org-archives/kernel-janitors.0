From: Michael Veeck <michael.veeck@gmx.net>
Date: Sat, 03 Jul 2004 15:05:46 +0000
Subject: [Kernel-janitors] [PATCH] drivers/char/riscom8.c MIN/MAX removal
Message-Id: <40E819FE.3090202@gmx.net>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="------------050007050802070102060309"
List-Id: <kernel-janitors.vger.kernel.org>
References: <40E81A3E.1090806@gmx.net>
In-Reply-To: <40E81A3E.1090806@gmx.net>
To: kernel-janitors@vger.kernel.org

This is a multi-part message in MIME format.
--------------050007050802070102060309
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit

Patch (against 2.6.7) removes unnecessary min/max macros and changes
calls to use kernel.h macros instead.

Feedback is always welcome
Michael








--------------050007050802070102060309
Content-Type: text/plain;
 name="patch-char-riscom8"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="patch-char-riscom8"

--- linux-2.6.7-old/drivers/char/riscom8.c	2004-07-04 11:04:14.000000000 +0200
+++ linux-2.6.7-new/drivers/char/riscom8.c	2004-07-04 15:51:50.013695488 +0200
@@ -75,10 +75,6 @@
 	 ASYNC_SPD_HI       | ASYNC_SPEED_VHI    | ASYNC_SESSION_LOCKOUT | \
 	 ASYNC_PGRP_LOCKOUT | ASYNC_CALLOUT_NOHUP)
 
-#ifndef MIN
-#define MIN(a,b) ((a) < (b) ? (a) : (b))
-#endif
-
 #define RS_EVENT_WRITE_WAKEUP	0
 
 static struct riscom_board * IRQ_to_board[16];
@@ -107,7 +103,7 @@
 };
 
 static struct riscom_port rc_port[RC_NBOARD * RC_NPORT];
-		
+
 /* RISCom/8 I/O ports addresses (without address translation) */
 static unsigned short rc_ioport[] =  {
 #if 1	
@@ -483,7 +479,7 @@
 				rc_out(bp, CD180_TDR, CD180_C_SBRK);
 				port->COR2 &= ~COR2_ETC;
 			}
-			count = MIN(port->break_length, 0xff);
+			count = min_t(int, port->break_length, 0xff);
 			rc_out(bp, CD180_TDR, CD180_C_ESC);
 			rc_out(bp, CD180_TDR, CD180_C_DELAY);
 			rc_out(bp, CD180_TDR, count);
@@ -1165,8 +1161,8 @@
 		down(&tmp_buf_sem);
 		while (1) {
 			cli();		
-			c = MIN(count, MIN(SERIAL_XMIT_SIZE - port->xmit_cnt - 1,
-					   SERIAL_XMIT_SIZE - port->xmit_head));
+			c = min_t(int, count, min(SERIAL_XMIT_SIZE - port->xmit_cnt - 1,
+						  SERIAL_XMIT_SIZE - port->xmit_head));
 			if (c <= 0)
 				break;
 
@@ -1178,8 +1174,8 @@
 			}
 
 			cli();
-			c = MIN(c, MIN(SERIAL_XMIT_SIZE - port->xmit_cnt - 1,
-				       SERIAL_XMIT_SIZE - port->xmit_head));
+			c = min_t(c, min(SERIAL_XMIT_SIZE - port->xmit_cnt - 1,
+					 SERIAL_XMIT_SIZE - port->xmit_head));
 			memcpy(port->xmit_buf + port->xmit_head, tmp_buf, c);
 			port->xmit_head = (port->xmit_head + c) & (SERIAL_XMIT_SIZE-1);
 			port->xmit_cnt += c;
@@ -1193,8 +1189,8 @@
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

--------------050007050802070102060309
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--------------050007050802070102060309--
