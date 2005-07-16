From: Marcelo Feitoza Parisi <marcelo@feitoza.com.br>
Date: Sat, 16 Jul 2005 07:20:09 +0000
Subject: [KJ] [PATCH] drivers/net/ppp_async.c : Use of the time_after_eq()
Message-Id: <42D8B529.3060400@feitoza.com.br>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="------------020107090102060108010505"
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

This is a multi-part message in MIME format.
--------------020107090102060108010505
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit


--------------020107090102060108010505
Content-Type: text/x-patch;
 name="ppp_async.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="ppp_async.patch"

Use of the time_after_eq() macro, defined at linux/jiffies.h, which deal
with wrapping correctly and are nicer to read.

Signed-off-by: Marcelo Feitoza Parisi <marcelo@feitoza.com.br>

--- linux/drivers/net/ppp_async.c	2005-07-13 17:52:19.000000000 -0300
+++ linux-kj/drivers/net/ppp_async.c	2005-07-16 01:15:56.774000552 -0300
@@ -30,6 +30,7 @@
 #include <linux/ppp_channel.h>
 #include <linux/spinlock.h>
 #include <linux/init.h>
+#include <linux/jiffies.h>
 #include <asm/uaccess.h>
 
 #define PPP_VERSION	"2.4.2"
@@ -576,7 +577,7 @@
 		 * character if necessary.
 		 */
 		if (islcp || flag_time == 0
-		    || jiffies - ap->last_xmit >= flag_time)
+		    || time_after_eq(jiffies, ap->last_xmit + flag_time))
 			*buf++ = PPP_FLAG;
 		ap->last_xmit = jiffies;
 		fcs = PPP_INITFCS;

--------------020107090102060108010505
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--------------020107090102060108010505--
