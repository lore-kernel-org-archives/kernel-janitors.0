From: Marcelo Feitoza Parisi <marcelo@feitoza.com.br>
Date: Sat, 16 Jul 2005 07:01:59 +0000
Subject: [KJ] [PATCH] drivers/net/3c59x.c : Use of the time_after() macro
Message-Id: <42D8B0E7.2040605@feitoza.com.br>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="------------080400000508030208050005"
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

This is a multi-part message in MIME format.
--------------080400000508030208050005
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit



--------------080400000508030208050005
Content-Type: text/x-patch;
 name="3c59x.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="3c59x.patch"

Use of the time_after() macro, defined at linux/jiffies.h, which deal
with wrapping correctly and are nicer to read.

Signed-off-by: Marcelo Feitoza Parisi <marcelo@feitoza.com.br>

--- linux/drivers/net/3c59x.c	2005-07-13 17:53:27.000000000 -0300
+++ linux-kj/drivers/net/3c59x.c	2005-07-14 15:14:20.762224920 -0300
@@ -258,6 +258,7 @@
 #include <linux/highmem.h>
 #include <linux/eisa.h>
 #include <linux/bitops.h>
+#include <linux/jiffies.h>
 #include <asm/irq.h>			/* For NR_IRQS only. */
 #include <asm/io.h>
 #include <asm/uaccess.h>
@@ -2668,7 +2669,7 @@
 			skb = dev_alloc_skb(PKT_BUF_SZ);
 			if (skb == NULL) {
 				static unsigned long last_jif;
-				if ((jiffies - last_jif) > 10 * HZ) {
+				if (time_after(jiffies, last_jif + 10 * HZ)) {
 					printk(KERN_WARNING "%s: memory shortage\n", dev->name);
 					last_jif = jiffies;
 				}

--------------080400000508030208050005
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--------------080400000508030208050005--
