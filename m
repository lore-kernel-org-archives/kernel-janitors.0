From: Michael Veeck <michael.veeck@gmx.net>
Date: Sat, 03 Jul 2004 15:05:55 +0000
Subject: [Kernel-janitors] [PATCH] drivers/char/mxser.c MIN/MAX removal
Message-Id: <40E819DD.6070404@gmx.net>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="------------080505050509040204080406"
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

This is a multi-part message in MIME format.
--------------080505050509040204080406
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit

Patch (against 2.6.7) removes unnecessary min/max macros and changes
calls to use kernel.h macros instead.

Feedback is always welcome
Michael








--------------080505050509040204080406
Content-Type: text/plain;
 name="patch-char-mxser"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="patch-char-mxser"

--- linux-2.6.7-old/drivers/char/mxser.c	2004-07-04 11:04:14.000000000 +0200
+++ linux-2.6.7-new/drivers/char/mxser.c	2004-07-04 15:39:39.915687256 +0200
@@ -101,10 +101,6 @@
 
 #define IRQ_T(info) ((info->flags & ASYNC_SHARE_IRQ) ? SA_SHIRQ : SA_INTERRUPT)
 
-#ifndef MIN
-#define MIN(a,b)	((a) < (b) ? (a) : (b))
-#endif
-
 /*
  *    Define the Moxa PCI vendor and device IDs.
  */
@@ -847,7 +843,7 @@
 	if (from_user) {
 		down(&mxvar_tmp_buf_sem);
 		while (1) {
-			c = MIN(count, MIN(SERIAL_XMIT_SIZE - info->xmit_cnt - 1,
+			c = min_t(int, count, min(SERIAL_XMIT_SIZE - info->xmit_cnt - 1,
 					   SERIAL_XMIT_SIZE - info->xmit_head));
 			if (c <= 0)
 				break;
@@ -860,7 +856,7 @@
 			}
 
 			cli();
-			c = MIN(c, MIN(SERIAL_XMIT_SIZE - info->xmit_cnt - 1,
+			c = min_t(int, c, min(SERIAL_XMIT_SIZE - info->xmit_cnt - 1,
 				       SERIAL_XMIT_SIZE - info->xmit_head));
 			memcpy(info->xmit_buf + info->xmit_head, mxvar_tmp_buf, c);
 			info->xmit_head = (info->xmit_head + c) & (SERIAL_XMIT_SIZE - 1);
@@ -875,7 +871,7 @@
 	} else {
 		while (1) {
 			cli();
-			c = MIN(count, MIN(SERIAL_XMIT_SIZE - info->xmit_cnt - 1,
+			c = min_t(int, count, min(SERIAL_XMIT_SIZE - info->xmit_cnt - 1,
 					   SERIAL_XMIT_SIZE - info->xmit_head));
 			if (c <= 0) {
 				restore_flags(flags);

--------------080505050509040204080406
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--------------080505050509040204080406--
