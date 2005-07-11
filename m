From: Marcelo Feitoza Parisi <marcelo@feitoza.com.br>
Date: Mon, 11 Jul 2005 19:13:11 +0000
Subject: [KJ] [PATCH] drivers/net/ns83820.c : Use of time_after_eq macro
Message-Id: <42D2C4C7.2050305@feitoza.com.br>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="------------010909030500010608000808"
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

This is a multi-part message in MIME format.
--------------010909030500010608000808
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit


--------------010909030500010608000808
Content-Type: text/x-patch;
 name="ns83820.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="ns83820.patch"

Use of the time_after_eq() macro, defined at linux/jiffies.h, which deal
with wrapping correctly and are nicer to read.

Signed-off-by: Marcelo Feitoza Parisi <marcelo@feitoza.com.br>

--- linux/drivers/net/ns83820.c	2005-07-07 19:13:15.000000000 -0300
+++ linux-kj/drivers/net/ns83820.c	2005-07-11 16:11:23.420291272 -0300
@@ -116,6 +116,7 @@
 #include <linux/ethtool.h>
 #include <linux/timer.h>
 #include <linux/if_vlan.h>
+#include <linux/jiffies.h>
 
 #include <asm/io.h>
 #include <asm/uaccess.h>
@@ -1610,7 +1611,7 @@
 {
 	struct ns83820 *dev = PRIV(ndev);
 	int timed_out = 0;
-	long start;
+	unsigned long start;
 	u32 status;
 	int loops = 0;
 
@@ -1628,7 +1629,7 @@
 			break;
 		if (status & fail)
 			break;
-		if ((jiffies - start) >= HZ) {
+		if (time_after_eq(jiffies, start + HZ)) {
 			timed_out = 1;
 			break;
 		}

--------------010909030500010608000808
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--------------010909030500010608000808--
