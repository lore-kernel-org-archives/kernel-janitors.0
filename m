From: Marcelo Feitoza Parisi <marcelo@feitoza.com.br>
Date: Sat, 16 Jul 2005 07:02:44 +0000
Subject: [KJ] [PATCH] drivers/net/arcnet/arcnet.c : Use of the time_after()
Message-Id: <42D8B114.9070704@feitoza.com.br>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="------------070101040800010006070801"
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

This is a multi-part message in MIME format.
--------------070101040800010006070801
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit



--------------070101040800010006070801
Content-Type: text/x-patch;
 name="arcnet.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="arcnet.patch"

Use of the time_after() macro, defined at linux/jiffies.h, which deal
with wrapping correctly and are nicer to read.

Signed-off-by: Marcelo Feitoza Parisi <marcelo@feitoza.com.br>

--- linux/drivers/net/arcnet/arcnet.c	2005-06-17 16:48:29.000000000 -0300
+++ linux-kj/drivers/net/arcnet/arcnet.c	2005-07-15 22:09:57.043537456 -0300
@@ -52,6 +52,7 @@
 #include <net/arp.h>
 #include <linux/init.h>
 #include <linux/arcdevice.h>
+#include <linux/jiffies.h>
 
 /* "do nothing" functions for protocol drivers */
 static void null_rx(struct net_device *dev, int bufnum,
@@ -727,7 +728,7 @@
 	
 	spin_unlock_irqrestore(&lp->lock, flags);
 
-	if (jiffies - lp->last_timeout > 10*HZ) {
+	if (time_after(jiffies, lp->last_timeout + 10*HZ)) {
 		BUGMSG(D_EXTRA, "tx timed out%s (status=%Xh, intmask=%Xh, dest=%02Xh)\n",
 		       msg, status, lp->intmask, lp->lasttrans_dest);
 		lp->last_timeout = jiffies;

--------------070101040800010006070801
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--------------070101040800010006070801--
