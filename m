From: Marcelo Feitoza Parisi <marcelo@feitoza.com.br>
Date: Mon, 11 Jul 2005 19:27:29 +0000
Subject: [KJ] [PATCH] drivers/net/wan/sdla_x25.c : use of time_after macro
Message-Id: <42D2C821.1000303@feitoza.com.br>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="------------080400080200020601040603"
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

This is a multi-part message in MIME format.
--------------080400080200020601040603
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit



--------------080400080200020601040603
Content-Type: text/x-patch;
 name="sdla_x25.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="sdla_x25.patch"

Use of the time_after_eq() macro, defined at linux/jiffies.h, which deal
with wrapping correctly and are nicer to read.

Signed-off-by: Marcelo Feitoza Parisi <marcelo@feitoza.com.br>

--- linux/drivers/net/wan/sdla_x25.c	2005-06-17 16:48:29.000000000 -0300
+++ linux-kj/drivers/net/wan/sdla_x25.c	2005-07-07 22:48:13.295833192 -0300
@@ -91,6 +91,7 @@
 #include <linux/wanrouter.h>	/* WAN router definitions */
 #include <linux/wanpipe.h>	/* WANPIPE common user API definitions */
 #include <linux/workqueue.h>
+#include <linux/jiffies.h>	/* time_after() macro */
 #include <asm/byteorder.h>	/* htons(), etc. */
 #include <asm/atomic.h>
 #include <linux/delay.h>	/* Experimental delay */
@@ -867,7 +868,7 @@
 		if (!(card->u.x.timer_int_enabled & TMR_INT_ENABLED_UPDATE)){	
 			break;
 		}
-		if ((jiffies-timeout) > 1*HZ){
+		if (time_after(jiffies, timeout + 1*HZ)){
 			card->u.x.timer_int_enabled &= ~TMR_INT_ENABLED_UPDATE;
 			return -EAGAIN;
 		}

--------------080400080200020601040603
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--------------080400080200020601040603--
