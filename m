From: Michael Veeck <michael.veeck@gmx.net>
Date: Sat, 03 Jul 2004 15:05:23 +0000
Subject: [Kernel-janitors] [PATCH] drivers/char/esp.c MIN/MAX removal
Message-Id: <40E819CC.5010206@gmx.net>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="------------090102000806070100050608"
List-Id: <kernel-janitors.vger.kernel.org>
References: <40E819B9.60604@gmx.net>
In-Reply-To: <40E819B9.60604@gmx.net>
To: kernel-janitors@vger.kernel.org

This is a multi-part message in MIME format.
--------------090102000806070100050608
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit

Patch (against 2.6.7) removes unnecessary min/max macros and changes
calls to use kernel.h macros instead.

Feedback is always welcome
Michael








--------------090102000806070100050608
Content-Type: text/plain;
 name="patch-char-esp"
Content-Transfer-Encoding: 8bit
Content-Disposition: inline;
 filename="patch-char-esp"

--- linux-2.6.7-old/drivers/char/esp.c	2004-07-04 11:04:13.000000000 +0200
+++ linux-2.6.7-new/drivers/char/esp.c	2004-07-04 15:03:22.346728056 +0200
@@ -19,7 +19,7 @@
  *
  *  rs_set_termios fixed to look also for changes of the input
  *      flags INPCK, BRKINT, PARMRK, IGNPAR and IGNBRK.
- *                                            Bernd Anh���upl 05/17/96.
+ *                                            Bernd Anh���������pl 05/17/96.
  *
  * --- End of notices from serial.c ---
  *
@@ -140,7 +140,7 @@
 
 static void change_speed(struct esp_struct *info);
 static void rs_wait_until_sent(struct tty_struct *, int);
-	
+
 /*
  * The ESP card has a clock rate of 14.7456 MHz (that is, 2**ESPC_SCALE
  * times the normal 1.8432 Mhz clock of most serial boards).
@@ -150,10 +150,6 @@
 /* Standard COM flags (except for COM4, because of the 8514 problem) */
 #define STD_COM_FLAGS (ASYNC_BOOT_AUTOCONF | ASYNC_SKIP_TEST)
 
-#ifndef MIN
-#define MIN(a,b)	((a) < (b) ? (a) : (b))
-#endif
-
 /*
  * tmp_buf is used as a temporary buffer by serial_write.  We need to
  * lock it in case the memcpy_fromfs blocks while swapping in a page,

--------------090102000806070100050608
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--------------090102000806070100050608--
