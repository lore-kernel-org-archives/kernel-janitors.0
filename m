From: Michael Veeck <michael.veeck@gmx.net>
Date: Sat, 03 Jul 2004 15:06:25 +0000
Subject: [Kernel-janitors] [PATCH] drivers/char/serial167.c MIN/MAX removal
Message-Id: <40E81A5B.4040404@gmx.net>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="------------030801090905060308030407"
List-Id: <kernel-janitors.vger.kernel.org>
References: <40E81A6A.5060904@gmx.net>
In-Reply-To: <40E81A6A.5060904@gmx.net>
To: kernel-janitors@vger.kernel.org

This is a multi-part message in MIME format.
--------------030801090905060308030407
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit

Patch (against 2.6.7) removes unnecessary min/max macros and changes
calls to use kernel.h macros instead.

Feedback is always welcome
Michael








--------------030801090905060308030407
Content-Type: text/plain;
 name="patch-char-serial167"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="patch-char-serial167"

--- linux-2.6.7-old/drivers/char/serial167.c	2004-07-04 11:04:14.000000000 +0200
+++ linux-2.6.7-new/drivers/char/serial167.c	2004-07-04 15:54:32.909931496 +0200
@@ -83,10 +83,6 @@
 #undef  CYCLOM_16Y_HACK
 #define  CYCLOM_ENABLE_MONITORING
 
-#ifndef MIN
-#define MIN(a,b)	((a) < (b) ? (a) : (b))
-#endif
-
 #define WAKEUP_CHARS 256
 
 #define STD_COM_FLAGS (0)
@@ -1238,8 +1234,8 @@
     if (from_user) {
 	    down(&tmp_buf_sem);
 	    while (1) {
-		    c = MIN(count, MIN(SERIAL_XMIT_SIZE - info->xmit_cnt - 1,
-				       SERIAL_XMIT_SIZE - info->xmit_head));
+		    c = min_t(int, count, min(SERIAL_XMIT_SIZE - info->xmit_cnt - 1,
+					      SERIAL_XMIT_SIZE - info->xmit_head));
 		    if (c <= 0)
 			    break;
 
@@ -1251,8 +1247,8 @@
 		    }
 
 		    local_irq_save(flags);
-		    c = MIN(c, MIN(SERIAL_XMIT_SIZE - info->xmit_cnt - 1,
-				   SERIAL_XMIT_SIZE - info->xmit_head));
+		    c = min_t(int, c, min(SERIAL_XMIT_SIZE - info->xmit_cnt - 1,
+					  SERIAL_XMIT_SIZE - info->xmit_head));
 		    memcpy(info->xmit_buf + info->xmit_head, tmp_buf, c);
 		    info->xmit_head = (info->xmit_head + c) & (SERIAL_XMIT_SIZE-1);
 		    info->xmit_cnt += c;
@@ -1266,8 +1262,8 @@
     } else {
 	    while (1) {
 		    local_irq_save(flags);
-		    c = MIN(count, MIN(SERIAL_XMIT_SIZE - info->xmit_cnt - 1,
-				       SERIAL_XMIT_SIZE - info->xmit_head));
+		    c = min_t(int, count, min(SERIAL_XMIT_SIZE - info->xmit_cnt - 1,
+					      SERIAL_XMIT_SIZE - info->xmit_head));
 		    if (c <= 0) {
 			    local_irq_restore(flags);
 			    break;

--------------030801090905060308030407
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--------------030801090905060308030407--
