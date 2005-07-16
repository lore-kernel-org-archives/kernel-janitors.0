From: Marcelo Feitoza Parisi <marcelo@feitoza.com.br>
Date: Sat, 16 Jul 2005 07:07:51 +0000
Subject: [KJ] [PATCH] drivers/media/dvb/ttusb-budget/dvb-ttusb-budget.c :
Message-Id: <42D8B247.1050608@feitoza.com.br>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="------------030000000506030001080206"
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

This is a multi-part message in MIME format.
--------------030000000506030001080206
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit



--------------030000000506030001080206
Content-Type: text/x-patch;
 name="dvb-ttusb-budget.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="dvb-ttusb-budget.patch"

Use of the time_after_eq() macro, defined at linux/jiffies.h, which deal
with wrapping correctly and are nicer to read.

Signed-off-by: Marcelo Feitoza Parisi <marcelo@feitoza.com.br>

--- linux/drivers/media/dvb/ttusb-budget/dvb-ttusb-budget.c	2005-07-13 17:52:17.000000000 -0300
+++ linux-kj/drivers/media/dvb/ttusb-budget/dvb-ttusb-budget.c	2005-07-15 21:46:29.050584920 -0300
@@ -18,6 +18,7 @@
 #include <linux/delay.h>
 #include <linux/time.h>
 #include <linux/errno.h>
+#include <linux/jiffies.h>
 #include <asm/semaphore.h>
 
 #include "dvb_frontend.h"
@@ -570,7 +571,8 @@
 				  const u8 * data, int len);
 #endif
 
-static int numpkt = 0, lastj, numts, numstuff, numsec, numinvalid;
+static int numpkt = 0, numts, numstuff, numsec, numinvalid;
+static unsigned long lastj;
 
 static void ttusb_process_muxpack(struct ttusb *ttusb, const u8 * muxpack,
 			   int len)
@@ -779,7 +781,7 @@
 			u8 *data;
 			int len;
 			numpkt++;
-			if ((jiffies - lastj) >= HZ) {
+			if (time_after_eq(jiffies, lastj + HZ)) {
 #if DEBUG > 2
 				printk
 				    ("frames/s: %d (ts: %d, stuff %d, sec: %d, invalid: %d, all: %d)\n",

--------------030000000506030001080206
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--------------030000000506030001080206--
