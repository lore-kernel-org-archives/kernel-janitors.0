From: Michael Veeck <michael.veeck@gmx.net>
Date: Sat, 03 Jul 2004 15:07:34 +0000
Subject: [Kernel-janitors] [PATCH] drivers/char/rocket.c MIN/MAX removal
Message-Id: <40E81A12.2080700@gmx.net>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="------------050107050601060206020408"
List-Id: <kernel-janitors.vger.kernel.org>
References: <40E81A3E.1090806@gmx.net>
In-Reply-To: <40E81A3E.1090806@gmx.net>
To: kernel-janitors@vger.kernel.org

This is a multi-part message in MIME format.
--------------050107050601060206020408
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit

Patch (against 2.6.7) removes unnecessary min/max macros and changes
calls to use kernel.h macros instead.

Feedback is always welcome
Michael








--------------050107050601060206020408
Content-Type: text/plain;
 name="patch-char-rocket"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="patch-char-rocket"

--- linux-2.6.7-old/drivers/char/rocket.c	2004-07-04 11:04:14.000000000 +0200
+++ linux-2.6.7-new/drivers/char/rocket.c	2004-07-04 16:34:13.544020104 +0200
@@ -389,7 +389,7 @@
 	while (1) {
 		if (tty->stopped || tty->hw_stopped)
 			break;
-		c = MIN(info->xmit_fifo_room, MIN(info->xmit_cnt, XMIT_BUF_SIZE - info->xmit_tail));
+		c = min(info->xmit_fifo_room, min(info->xmit_cnt, XMIT_BUF_SIZE - info->xmit_tail));
 		if (c <= 0 || info->xmit_fifo_room <= 0)
 			break;
 		sOutStrW(sGetTxRxDataIO(cp), (unsigned short *) (info->xmit_buf + info->xmit_tail), c / 2);
@@ -1661,7 +1661,7 @@
 	 *  into FIFO.  Use the write queue for temp storage.
          */
 	if (!tty->stopped && !tty->hw_stopped && info->xmit_cnt == 0 && info->xmit_fifo_room > 0) {
-		c = MIN(count, info->xmit_fifo_room);
+		c = min(count, info->xmit_fifo_room);
 		b = buf;
 		if (from_user) {
 			if (copy_from_user(info->xmit_buf, buf, c)) {
@@ -1671,7 +1671,7 @@
 			if (info->tty == 0)
 				goto end;
 			b = info->xmit_buf;
-			c = MIN(c, info->xmit_fifo_room);
+			c = min(c, info->xmit_fifo_room);
 		}
 
 		/*  Push data into FIFO, 2 bytes at a time */
@@ -1699,7 +1699,7 @@
 		if (info->tty == 0)	/*   Seemingly obligatory check... */
 			goto end;
 
-		c = MIN(count, MIN(XMIT_BUF_SIZE - info->xmit_cnt - 1, XMIT_BUF_SIZE - info->xmit_head));
+		c = min(count, min(XMIT_BUF_SIZE - info->xmit_cnt - 1, XMIT_BUF_SIZE - info->xmit_head));
 		if (c <= 0)
 			break;
 

--------------050107050601060206020408
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--------------050107050601060206020408--
