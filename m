From: Marcelo Feitoza Parisi <marcelo@feitoza.com.br>
Date: Wed, 13 Jul 2005 05:51:34 +0000
Subject: [KJ] [PATCH] drivers/usb/input/ati_remote.c : Use of time_after and
Message-Id: <42D4ABE6.6010601@feitoza.com.br>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="------------060804030900020509080908"
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

This is a multi-part message in MIME format.
--------------060804030900020509080908
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit



--------------060804030900020509080908
Content-Type: text/x-patch;
 name="ati_remote.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="ati_remote.patch"

Use of time_after and time_before macros, defined at linux/jiffies.h, which deal
with wrapping correctly and are nicer to read.

Signed-off-by: Marcelo Feitoza Parisi <marcelo@feitoza.com.br>

--- linux/drivers/usb/input/ati_remote.c	2005-07-07 19:11:55.000000000 -0300
+++ linux-kj/drivers/usb/input/ati_remote.c	2005-07-13 02:49:17.210994184 -0300
@@ -95,6 +95,7 @@
 #include <linux/input.h>
 #include <linux/usb.h>
 #include <linux/wait.h>
+#include <linux/jiffies.h>
 
 /*
  * Module and Version Information, Module Parameters
@@ -510,16 +511,22 @@
 	 * pad down, so we increase acceleration, ramping up over two seconds to
 	 * a maximum speed.  The acceleration curve is #defined above.
 	 */
-	if ((jiffies - ati_remote->old_jiffies) > (HZ >> 2)) {
+	if (time_after(jiffies, ati_remote->old_jiffies + (HZ >> 2))) {
 		acc = 1;
 		ati_remote->acc_jiffies = jiffies;
 	}
-	else if ((jiffies - ati_remote->acc_jiffies) < (HZ >> 3))  acc = accel[0];
-	else if ((jiffies - ati_remote->acc_jiffies) < (HZ >> 2))  acc = accel[1];
-	else if ((jiffies - ati_remote->acc_jiffies) < (HZ >> 1))  acc = accel[2];
-	else if ((jiffies - ati_remote->acc_jiffies) < HZ )        acc = accel[3];
-	else if ((jiffies - ati_remote->acc_jiffies) < HZ+(HZ>>1)) acc = accel[4];
-	else if ((jiffies - ati_remote->acc_jiffies) < (HZ << 1))  acc = accel[5];
+	else if (time_before(jiffies, ati_remote->acc_jiffies + (HZ >> 3)))
+		acc = accel[0];
+	else if (time_before(jiffies, ati_remote->acc_jiffies + (HZ >> 2)))
+		acc = accel[1];
+	else if (time_before(jiffies, ati_remote->acc_jiffies + (HZ >> 1)))
+		acc = accel[2];
+	else if (time_before(jiffies, ati_remote->acc_jiffies + HZ ))
+		acc = accel[3];
+	else if (time_before(jiffies, ati_remote->acc_jiffies + HZ+(HZ>>1)))
+		acc = accel[4];
+	else if (time_before(jiffies, ati_remote->acc_jiffies + (HZ << 1)))
+		acc = accel[5];
 	else acc = accel[6];
 
 	input_regs(dev, regs);

--------------060804030900020509080908
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--------------060804030900020509080908--
