From: Marcelo Feitoza Parisi <marcelo@feitoza.com.br>
Date: Mon, 11 Jul 2005 19:24:05 +0000
Subject: [KJ] [PATCH] drivers/net/wan/sdla_ft1.c : Use of time_after macro
Message-Id: <42D2C755.6040601@feitoza.com.br>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="------------090902020603080205030704"
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

This is a multi-part message in MIME format.
--------------090902020603080205030704
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit


--------------090902020603080205030704
Content-Type: text/x-patch;
 name="sdla_ft1.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="sdla_ft1.patch"

Use of the time_after_eq() macro, defined at linux/jiffies.h, which deal
with wrapping correctly and are nicer to read.

Signed-off-by: Marcelo Feitoza Parisi <marcelo@feitoza.com.br>

--- linux/drivers/net/wan/sdla_ft1.c	2005-06-17 16:48:29.000000000 -0300
+++ linux-kj/drivers/net/wan/sdla_ft1.c	2005-07-07 22:45:26.394206096 -0300
@@ -29,6 +29,7 @@
 #include <linux/wanrouter.h>	/* WAN router definitions */
 #include <linux/wanpipe.h>	/* WANPIPE common user API definitions */
 #include <linux/if_arp.h>	/* ARPHRD_* defines */
+#include <linux/jiffies.h>	/* time_after() macro */
 
 #include <linux/inetdevice.h>
 #include <asm/uaccess.h>
@@ -164,7 +165,7 @@
 
 		timeout = jiffies;
 		while (mb->return_code != 'I')	/* Wait 1s for board to initialize */
-			if ((jiffies - timeout) > 1*HZ) break;
+			if (time_after(jiffies, timeout + 1*HZ)) break;
 
 		if (mb->return_code != 'I') {
 			printk(KERN_INFO

--------------090902020603080205030704
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--------------090902020603080205030704--
