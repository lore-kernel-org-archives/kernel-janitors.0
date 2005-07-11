From: Marcelo Feitoza Parisi <marcelo@feitoza.com.br>
Date: Mon, 11 Jul 2005 19:37:53 +0000
Subject: [KJ] [PATCH] drivers/net/tokenring/olympic.c : Use of time_after
Message-Id: <42D2CA91.4010307@feitoza.com.br>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="------------050208050404060003010206"
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

This is a multi-part message in MIME format.
--------------050208050404060003010206
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit



--------------050208050404060003010206
Content-Type: text/x-patch;
 name="olympic.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="olympic.patch"

Use of the time_after_eq() macro, defined at linux/jiffies.h, which deal
with wrapping correctly and are nicer to read.

Signed-off-by: Marcelo Feitoza Parisi <marcelo@feitoza.com.br>

--- linux/drivers/net/tokenring/olympic.c	2005-07-07 19:13:16.000000000 -0300
+++ linux-kj/drivers/net/tokenring/olympic.c	2005-07-07 23:04:01.113742968 -0300
@@ -100,6 +100,7 @@
 #include <linux/pci.h>
 #include <linux/spinlock.h>
 #include <linux/bitops.h>
+#include <linux/jiffies.h>
 
 #include <net/checksum.h>
 
@@ -312,7 +313,7 @@
 	t=jiffies;
 	while((readl(olympic_mmio+BCTL)) & BCTL_SOFTRESET) {
 		schedule();		
-		if(jiffies-t > 40*HZ) {
+		if(time_after(jiffies, t + 40*HZ)) {
 			printk(KERN_ERR "IBM PCI tokenring card not responding.\n");
 			return -ENODEV;
 		}

--------------050208050404060003010206
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--------------050208050404060003010206--
