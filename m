From: Michael Veeck <michael.veeck@gmx.net>
Date: Sat, 03 Jul 2004 15:05:20 +0000
Subject: [Kernel-janitors] [PATCH] drivers/char/isicom.c MIN/MAX removal
Message-Id: <40E81A24.1040001@gmx.net>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="------------040409020209030408080607"
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

This is a multi-part message in MIME format.
--------------040409020209030408080607
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit

Patch (against 2.6.7) removes unnecessary min/max macros and changes
calls to use kernel.h macros instead.

Feedback is always welcome
Michael








--------------040409020209030408080607
Content-Type: text/plain;
 name="patch-char-isicom"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="patch-char-isicom"

--- linux-2.6.7-old/drivers/char/isicom.c	2004-07-04 11:04:14.000000000 +0200
+++ linux-2.6.7-new/drivers/char/isicom.c	2004-07-04 16:24:01.332090464 +0200
@@ -388,7 +388,7 @@
 		
 		tty = port->tty;
 		save_flags(flags); cli();
-		txcount = MIN(TX_SIZE, port->xmit_cnt);
+		txcount = min_t(short, TX_SIZE, port->xmit_cnt);
 		if ((txcount <= 0) || tty->stopped || tty->hw_stopped) {
 			restore_flags(flags);
 			continue;
@@ -420,7 +420,7 @@
 		residue = NO;
 		wrd = 0;			
 		while (1) {
-			cnt = MIN(txcount, (SERIAL_XMIT_SIZE - port->xmit_tail));
+			cnt = min_t(int, txcount, (SERIAL_XMIT_SIZE - port->xmit_tail));
 			if (residue == YES) {
 				residue = NO;
 				if (cnt > 0) {
@@ -649,7 +649,7 @@
 		}	 
 	}
 	else {				/* Data   Packet */
-		count = MIN(byte_count, (TTY_FLIPBUF_SIZE - tty->flip.count));
+		count = min_t(unsigned short, byte_count, (TTY_FLIPBUF_SIZE - tty->flip.count));
 #ifdef ISICOM_DEBUG
 		printk(KERN_DEBUG "ISICOM: Intr: Can rx %d of %d bytes.\n", 
 					count, byte_count);
@@ -1162,8 +1162,8 @@
 	save_flags(flags);
 	while(1) {	
 		cli();
-		cnt = MIN(count, MIN(SERIAL_XMIT_SIZE - port->xmit_cnt - 1,
-			SERIAL_XMIT_SIZE - port->xmit_head));
+		cnt = min_t(int, count, min(SERIAL_XMIT_SIZE - port->xmit_cnt - 1,
+					    SERIAL_XMIT_SIZE - port->xmit_head));
 		if (cnt <= 0) 
 			break;
 		
@@ -1179,8 +1179,8 @@
 				return -EFAULT;
 			}
 			cli();
-			cnt = MIN(cnt, MIN(SERIAL_XMIT_SIZE - port->xmit_cnt - 1,
-			SERIAL_XMIT_SIZE - port->xmit_head));
+			cnt = min_t(int, cnt, min(SERIAL_XMIT_SIZE - port->xmit_cnt - 1,
+						  SERIAL_XMIT_SIZE - port->xmit_head));
 			memcpy(port->xmit_buf + port->xmit_head, tmp_buf, cnt);
 		}	
 		else

--------------040409020209030408080607
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--------------040409020209030408080607--
