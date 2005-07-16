From: Marcelo Feitoza Parisi <marcelo@feitoza.com.br>
Date: Sat, 16 Jul 2005 07:18:37 +0000
Subject: [KJ] [PATCH] drivers/net/oaknet.c : Use of the time_after() macro
Message-Id: <42D8B4CD.2070900@feitoza.com.br>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="------------000802040708020407060502"
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

This is a multi-part message in MIME format.
--------------000802040708020407060502
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit


--------------000802040708020407060502
Content-Type: text/x-patch;
 name="oaknet.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="oaknet.patch"

Use of the time_after() macro, defined at linux/jiffies.h, which deal
with wrapping correctly and are nicer to read.

Signed-off-by: Marcelo Feitoza Parisi <marcelo@feitoza.com.br>

--- linux/drivers/net/oaknet.c	2005-06-17 16:48:29.000000000 -0300
+++ linux-kj/drivers/net/oaknet.c	2005-07-15 21:31:59.838725208 -0300
@@ -20,6 +20,7 @@
 #include <linux/netdevice.h>
 #include <linux/etherdevice.h>
 #include <linux/init.h>
+#include <linux/jiffies.h>
 
 #include <asm/board.h>
 #include <asm/io.h>
@@ -606,7 +607,7 @@
 #endif
 
 	while ((ei_ibp(base + EN0_ISR) & ENISR_RDC) == 0) {
-		if (jiffies - start > OAKNET_WAIT) {
+		if (time_after(jiffies, start + OAKNET_WAIT)) {
 			printk("%s: timeout waiting for Tx RDC.\n", dev->name);
 			oaknet_reset_8390(dev);
 			NS8390_init(dev, TRUE);

--------------000802040708020407060502
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--------------000802040708020407060502--
