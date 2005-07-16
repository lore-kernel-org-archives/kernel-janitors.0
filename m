From: Marcelo Feitoza Parisi <marcelo@feitoza.com.br>
Date: Sat, 16 Jul 2005 07:16:10 +0000
Subject: [KJ] [PATCH] drivers/char/lp.c : Use of the time_after() macro
Message-Id: <42D8B43A.8020501@feitoza.com.br>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="------------070601030608060900040409"
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

This is a multi-part message in MIME format.
--------------070601030608060900040409
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit


--------------070601030608060900040409
Content-Type: text/x-patch;
 name="lp.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="lp.patch"

Use of the time_after() macro, defined at linux/jiffies.h, which deal
with wrapping correctly and are nicer to read.

Signed-off-by: Marcelo Feitoza Parisi <marcelo@feitoza.com.br>

--- linux/drivers/char/lp.c	2005-07-13 17:52:02.000000000 -0300
+++ linux-kj/drivers/char/lp.c	2005-07-15 15:45:36.687244480 -0300
@@ -128,6 +128,7 @@
 #include <linux/console.h>
 #include <linux/device.h>
 #include <linux/wait.h>
+#include <linux/jiffies.h>
 
 #include <linux/parport.h>
 #undef LP_STATS
@@ -307,7 +308,7 @@
 			(LP_F(minor) & LP_ABORT));
 
 #ifdef LP_STATS
-	if (jiffies-lp_table[minor].lastcall > LP_TIME(minor))
+	if (time_after(jiffies, lp_table[minor].lastcall + LP_TIME(minor)))
 		lp_table[minor].runchars = 0;
 
 	lp_table[minor].lastcall = jiffies;

--------------070601030608060900040409
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--------------070601030608060900040409--
