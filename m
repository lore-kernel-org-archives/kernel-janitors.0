From: Michael Veeck <michael.veeck@gmx.net>
Date: Mon, 12 Jul 2004 15:32:00 +0000
Subject: Re: [Kernel-janitors] [PATCH] drivers/char/riscom8.c MIN/MAX removal
Message-Id: <40F2AEF0.70004@gmx.net>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="------------000509080506040808040408"
List-Id: <kernel-janitors.vger.kernel.org>
References: <40E81A3E.1090806@gmx.net>
In-Reply-To: <40E81A3E.1090806@gmx.net>
To: kernel-janitors@vger.kernel.org

This is a multi-part message in MIME format.
--------------000509080506040808040408
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit

Sorry, one bug was in the last patch, so heres the new one, against 
2.6.8-rc1.

Michael Veeck schrieb:

> Patch (against 2.6.7) removes unnecessary min/max macros and changes
> calls to use kernel.h macros instead.
> 
> Feedback is always welcome
> Michael
> 


--------------000509080506040808040408
Content-Type: text/plain;
 name="drivers-char-riscom8-minmax.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="drivers-char-riscom8-minmax.patch"

--- linux-2.6.8-rc1-old/drivers/char/riscom8.c	2004-07-04 11:04:14.000000000 +0200
+++ linux-2.6.8-rc1-new/drivers/char/riscom8.c	2004-07-12 17:22:47.988047720 +0200
@@ -75,10 +75,6 @@
 	 ASYNC_SPD_HI       | ASYNC_SPEED_VHI    | ASYNC_SESSION_LOCKOUT | \
 	 ASYNC_PGRP_LOCKOUT | ASYNC_CALLOUT_NOHUP)
 
-#ifndef MIN
-#define MIN(a,b) ((a) < (b) ? (a) : (b))
-#endif
-
 #define RS_EVENT_WRITE_WAKEUP	0
 
 static struct riscom_board * IRQ_to_board[16];
@@ -454,7 +450,6 @@ static inline void rc_transmit(struct ri
 	struct tty_struct *tty;
 	unsigned char count;
 	
-	
 	if (!(port = rc_get_port(bp, "Transmit")))
 		return;
 	
@@ -483,7 +478,7 @@ static inline void rc_transmit(struct ri
 				rc_out(bp, CD180_TDR, CD180_C_SBRK);
 				port->COR2 &= ~COR2_ETC;
 			}
-			count = MIN(port->break_length, 0xff);
+			count = min_t(unsigned char, port->break_length, 0xff);
 			rc_out(bp, CD180_TDR, CD180_C_ESC);
 			rc_out(bp, CD180_TDR, CD180_C_DELAY);
 			rc_out(bp, CD180_TDR, count);
@@ -1165,8 +1160,8 @@ static int rc_write(struct tty_struct * 
 		down(&tmp_buf_sem);
 		while (1) {
 			cli();		
-			c = MIN(count, MIN(SERIAL_XMIT_SIZE - port->xmit_cnt - 1,
-					   SERIAL_XMIT_SIZE - port->xmit_head));
+			c = min_t(int, count, min(SERIAL_XMIT_SIZE - port->xmit_cnt - 1,
+						  SERIAL_XMIT_SIZE - port->xmit_head));
 			if (c <= 0)
 				break;
 
@@ -1178,8 +1173,8 @@ static int rc_write(struct tty_struct * 
 			}
 
 			cli();
-			c = MIN(c, MIN(SERIAL_XMIT_SIZE - port->xmit_cnt - 1,
-				       SERIAL_XMIT_SIZE - port->xmit_head));
+			c = min_t(int, c, min(SERIAL_XMIT_SIZE - port->xmit_cnt - 1,
+					      SERIAL_XMIT_SIZE - port->xmit_head));
 			memcpy(port->xmit_buf + port->xmit_head, tmp_buf, c);
 			port->xmit_head = (port->xmit_head + c) & (SERIAL_XMIT_SIZE-1);
 			port->xmit_cnt += c;
@@ -1193,8 +1188,8 @@ static int rc_write(struct tty_struct * 
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

--------------000509080506040808040408
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--------------000509080506040808040408--
