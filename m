From: Marcelo Feitoza Parisi <marcelo@feitoza.com.br>
Date: Mon, 11 Jul 2005 19:05:29 +0000
Subject: [KJ] [PATCH] drivers/net/pcmcia/smc91c92_cs.c : Use of time_after
Message-Id: <42D2C2F9.30407@feitoza.com.br>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="------------070604040004090701080709"
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

This is a multi-part message in MIME format.
--------------070604040004090701080709
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Use of the time_after() macro, defined at linux/jiffies.h, which deal
with wrapping correctly and are nicer to read.

--------------070604040004090701080709
Content-Type: text/x-patch;
 name="smc91c92_cs.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="smc91c92_cs.patch"

Use of the time_after() macro, defined at linux/jiffies.h, which deal
with wrapping correctly and are nicer to read.

Signed-off-by: Marcelo Feitoza Parisi <marcelo@feitoza.com.br>

--- linux/drivers/net/pcmcia/smc91c92_cs.c	2005-07-07 19:11:51.000000000 -0300
+++ linux-kj/drivers/net/pcmcia/smc91c92_cs.c	2005-07-07 23:01:03.239783920 -0300
@@ -41,6 +41,7 @@
 #include <linux/ioport.h>
 #include <linux/ethtool.h>
 #include <linux/mii.h>
+#include <linux/jiffies.h>
 
 #include <pcmcia/version.h>
 #include <pcmcia/cs_types.h>
@@ -2097,7 +2098,7 @@
     }
 
     /* Ignore collisions unless we've had no rx's recently */
-    if (jiffies - dev->last_rx > HZ) {
+    if (time_after(jiffies, dev->last_rx + HZ)) {
 	if (smc->tx_err || (smc->media_status & EPH_16COL))
 	    media |= EPH_16COL;
     }

--------------070604040004090701080709
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--------------070604040004090701080709--
