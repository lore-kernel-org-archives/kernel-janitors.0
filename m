From: Michael Veeck <michael.veeck@gmx.net>
Date: Sat, 03 Jul 2004 15:07:01 +0000
Subject: [Kernel-janitors] [PATCH] drivers/tc/zs.c MIN/MAX removal
Message-Id: <40E81AEC.2020804@gmx.net>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="------------040709010406090301090704"
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

This is a multi-part message in MIME format.
--------------040709010406090301090704
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit

Patch (against 2.6.7) removes unnecessary min/max macros and changes
calls to use kernel.h macros instead.

Feedback is always welcome
Michael








--------------040709010406090301090704
Content-Type: text/plain;
 name="patch-tc-zs"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="patch-tc-zs"

--- linux-2.6.7-old/drivers/tc/zs.c	2004-07-04 11:04:02.000000000 +0200
+++ linux-2.6.7-new/drivers/tc/zs.c	2004-07-04 16:13:31.169889680 +0200
@@ -211,10 +211,6 @@
 static void change_speed(struct dec_serial *info);
 static void rs_wait_until_sent(struct tty_struct *tty, int timeout);
 
-#ifndef MIN
-#define MIN(a,b)	((a) < (b) ? (a) : (b))
-#endif
-
 /*
  * tmp_buf is used as a temporary buffer by serial_write.  We need to
  * lock it in case the copy_from_user blocks while swapping in a page,
@@ -950,16 +946,16 @@
 	save_flags(flags);
 	while (1) {
 		cli();		
-		c = MIN(count, MIN(SERIAL_XMIT_SIZE - info->xmit_cnt - 1,
-				   SERIAL_XMIT_SIZE - info->xmit_head));
+		c = min_t(int, count, min(SERIAL_XMIT_SIZE - info->xmit_cnt - 1,
+					  SERIAL_XMIT_SIZE - info->xmit_head));
 		if (c <= 0)
 			break;
 
 		if (from_user) {
 			down(&tmp_buf_sem);
 			copy_from_user(tmp_buf, buf, c);
-			c = MIN(c, MIN(SERIAL_XMIT_SIZE - info->xmit_cnt - 1,
-				       SERIAL_XMIT_SIZE - info->xmit_head));
+			c = min_t(int, c, min(SERIAL_XMIT_SIZE - info->xmit_cnt - 1,
+					      SERIAL_XMIT_SIZE - info->xmit_head));
 			memcpy(info->xmit_buf + info->xmit_head, tmp_buf, c);
 			up(&tmp_buf_sem);
 		} else
@@ -1446,7 +1442,7 @@
 	if (char_time == 0)
 		char_time = 1;
 	if (timeout)
-		char_time = MIN(char_time, timeout);
+		char_time = min_t(unsigned long, char_time, timeout);
 	while ((read_zsreg(info->zs_channel, 1) & Tx_BUF_EMP) == 0) {
 		current->state = TASK_INTERRUPTIBLE;
 		schedule_timeout(char_time);

--------------040709010406090301090704
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--------------040709010406090301090704--
