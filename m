From: Michael Veeck <michael.veeck@gmx.net>
Date: Sat, 03 Jul 2004 15:07:45 +0000
Subject: [Kernel-janitors] [PATCH] drivers/macintosh/macserial.c MIN/MAX
Message-Id: <40E81ADE.3050406@gmx.net>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="------------050500080603040406060603"
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

This is a multi-part message in MIME format.
--------------050500080603040406060603
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit

Patch (against 2.6.7) removes unnecessary min/max macros and changes
calls to use kernel.h macros instead.

Feedback is always welcome
Michael








--------------050500080603040406060603
Content-Type: text/plain;
 name="patch-mac-macserial"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="patch-mac-macserial"

--- linux-2.6.7-old/drivers/macintosh/macserial.c	2004-07-04 11:04:21.000000000 +0200
+++ linux-2.6.7-new/drivers/macintosh/macserial.c	2004-07-04 16:27:01.121758280 +0200
@@ -158,10 +158,6 @@
 static void rxdma_start(struct mac_serial * info, int current);
 static void rxdma_to_tty(struct mac_serial * info);
 
-#ifndef MIN
-#define MIN(a,b)	((a) < (b) ? (a) : (b))
-#endif
-
 /*
  * tmp_buf is used as a temporary buffer by serial_write.  We need to
  * lock it in case the copy_from_user blocks while swapping in a page,
@@ -1485,9 +1481,8 @@
 	if (from_user) {
 		down(&tmp_buf_sem);
 		while (1) {
-			c = MIN(count,
-				MIN(SERIAL_XMIT_SIZE - info->xmit_cnt - 1,
-				    SERIAL_XMIT_SIZE - info->xmit_head));
+			c = min_t(int, count, min(SERIAL_XMIT_SIZE - info->xmit_cnt - 1,
+						  SERIAL_XMIT_SIZE - info->xmit_head));
 			if (c <= 0)
 				break;
 
@@ -1498,8 +1493,8 @@
 				break;
 			}
 			spin_lock_irqsave(&info->lock, flags);
-			c = MIN(c, MIN(SERIAL_XMIT_SIZE - info->xmit_cnt - 1,
-				       SERIAL_XMIT_SIZE - info->xmit_head));
+			c = min_t(int, c, min(SERIAL_XMIT_SIZE - info->xmit_cnt - 1,
+					      SERIAL_XMIT_SIZE - info->xmit_head));
 			memcpy(info->xmit_buf + info->xmit_head, tmp_buf, c);
 			info->xmit_head = ((info->xmit_head + c) &
 					   (SERIAL_XMIT_SIZE-1));
@@ -1513,9 +1508,8 @@
 	} else {
 		while (1) {
 			spin_lock_irqsave(&info->lock, flags);
-			c = MIN(count,
-				MIN(SERIAL_XMIT_SIZE - info->xmit_cnt - 1,
-				    SERIAL_XMIT_SIZE - info->xmit_head));
+			c = min_t(int, count, min(SERIAL_XMIT_SIZE - info->xmit_cnt - 1,
+						  SERIAL_XMIT_SIZE - info->xmit_head));
 			if (c <= 0) {
 				spin_unlock_irqrestore(&info->lock, flags);
 				break;
@@ -2052,7 +2046,7 @@
 	} else if (char_time == 0)
 		char_time = 1;
 	if (timeout)
-		char_time = MIN(char_time, timeout);
+		char_time = min_t(unsigned long, char_time, timeout);
 	while ((read_zsreg(info->zs_channel, 1) & ALL_SNT) == 0) {
 		current->state = TASK_INTERRUPTIBLE;
 		schedule_timeout(char_time);

--------------050500080603040406060603
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--------------050500080603040406060603--
