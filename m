From: Marcelo Feitoza Parisi <marcelo@feitoza.com.br>
Date: Sat, 16 Jul 2005 07:10:57 +0000
Subject: [KJ] [PATCH] drivers/net/es3210.c : Use of the time_after() macro
Message-Id: <42D8B301.3090100@feitoza.com.br>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="------------080301000201040206040103"
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

This is a multi-part message in MIME format.
--------------080301000201040206040103
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit



--------------080301000201040206040103
Content-Type: text/x-patch;
 name="es3210.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="es3210.patch"

Use of the time_after() macro, defined at linux/jiffies.h, which deal
with wrapping correctly and are nicer to read.

Signed-off-by: Marcelo Feitoza Parisi <marcelo@feitoza.com.br>

--- linux/drivers/net/es3210.c	2005-07-13 17:52:19.000000000 -0300
+++ linux-kj/drivers/net/es3210.c	2005-07-15 23:58:12.537072344 -0300
@@ -56,6 +56,7 @@
 #include <linux/init.h>
 #include <linux/netdevice.h>
 #include <linux/etherdevice.h>
+#include <linux/jiffies.h>
 
 #include <asm/io.h>
 #include <asm/system.h>
@@ -331,7 +332,7 @@
 	if (ei_debug > 1) printk("%s: resetting the ES3210...", dev->name);
 
 	end = jiffies + 2*HZ/100;
-        while ((signed)(end - jiffies) > 0) continue;
+        while (time_after(end, jiffies)) continue;
 
 	ei_status.txing = 0;
 	outb(0x01, ioaddr + ES_RESET_PORT);

--------------080301000201040206040103
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--------------080301000201040206040103--
