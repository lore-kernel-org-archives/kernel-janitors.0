From: Michael Veeck <michael.veeck@gmx.net>
Date: Sat, 03 Jul 2004 15:06:33 +0000
Subject: [Kernel-janitors] [PATCH] drivers/char/pcmcia/synclink_cs.c MIN/MAX
Message-Id: <40E81AB1.5050908@gmx.net>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="------------040408060203090506040206"
List-Id: <kernel-janitors.vger.kernel.org>
References: <40E819EC.1030207@gmx.net>
In-Reply-To: <40E819EC.1030207@gmx.net>
To: kernel-janitors@vger.kernel.org

This is a multi-part message in MIME format.
--------------040408060203090506040206
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit

Patch (against 2.6.7) removes unnecessary min/max macros and changes
calls to use kernel.h macros instead.

Feedback is always welcome
Michael








--------------040408060203090506040206
Content-Type: text/plain;
 name="patch-char-synclink_cs"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="patch-char-synclink_cs"

--- linux-2.6.7-old/drivers/char/pcmcia/synclink_cs.c	2004-07-04 11:04:14.000000000 +0200
+++ linux-2.6.7-new/drivers/char/pcmcia/synclink_cs.c	2004-07-04 16:11:02.180539504 +0200
@@ -499,10 +499,6 @@
 static void mgslpc_change_params(MGSLPC_INFO *info);
 static void mgslpc_wait_until_sent(struct tty_struct *tty, int timeout);
 
-#ifndef MIN
-#define MIN(a,b)	((a) < (b) ? (a) : (b))
-#endif
-
 /* PCMCIA prototypes */
 
 static void mgslpc_config(dev_link_t *link);
@@ -1197,7 +1193,7 @@
 		return;
 
 	while (info->tx_count && fifo_count) {
-		c = MIN(2, MIN(fifo_count, MIN(info->tx_count, TXBUFSIZE - info->tx_get)));
+		c = min(2, min_t(int, fifo_count, min(info->tx_count, TXBUFSIZE - info->tx_get)));
 		
 		if (c == 1) {
 			write_reg(info, CHA + TXFIFO, *(info->tx_buf + info->tx_get));
@@ -1760,8 +1756,8 @@
 	}
 
 	for (;;) {
-		c = MIN(count,
-			MIN(TXBUFSIZE - info->tx_count - 1,
+		c = min(count,
+			min(TXBUFSIZE - info->tx_count - 1,
 			    TXBUFSIZE - info->tx_put));
 		if (c <= 0)
 			break;
@@ -2647,7 +2643,7 @@
 		char_time = 1;
 		
 	if (timeout)
-		char_time = MIN(char_time, timeout);
+		char_time = min_t(unsigned long, char_time, timeout);
 		
 	if (info->params.mode == MGSL_MODE_HDLC) {
 		while (info->tx_active) {

--------------040408060203090506040206
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--------------040408060203090506040206--
