From: Michael Veeck <michael.veeck@gmx.net>
Date: Sat, 03 Jul 2004 15:07:57 +0000
Subject: [Kernel-janitors] [PATCH] drivers/char/amiserial.c MIN/MAX removal
Message-Id: <40E819A8.9030601@gmx.net>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="------------000400030808060108000004"
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

This is a multi-part message in MIME format.
--------------000400030808060108000004
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit

Patch (against 2.6.7) removes unnecessary min/max macros and changes
calls to use kernel.h macros instead.

Feedback is always welcome
Michael








--------------000400030808060108000004
Content-Type: text/plain;
 name="patch-char-amiserial"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="patch-char-amiserial"

--- linux-2.6.7-old/drivers/char/amiserial.c	2004-07-04 11:04:14.000000000 +0200
+++ linux-2.6.7-new/drivers/char/amiserial.c	2004-07-04 15:23:36.616131048 +0200
@@ -118,10 +118,6 @@
 
 #define NR_PORTS	(sizeof(rs_table)/sizeof(struct serial_state))
 
-#ifndef MIN
-#define MIN(a,b)	((a) < (b) ? (a) : (b))
-#endif
-
 /*
  * tmp_buf is used as a temporary buffer by serial_write.  We need to
  * lock it in case the copy_from_user blocks while swapping in a page,
@@ -1610,7 +1606,7 @@
 	if (char_time == 0)
 		char_time = 1;
 	if (timeout)
-	  char_time = MIN(char_time, timeout);
+	  char_time = min_t(unsigned long, char_time, timeout);
 	/*
 	 * If the transmitter hasn't cleared in twice the approximate
 	 * amount of time to send the entire FIFO, it probably won't

--------------000400030808060108000004
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--------------000400030808060108000004--
