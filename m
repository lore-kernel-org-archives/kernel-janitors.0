From: Marcelo Feitoza Parisi <marcelo@feitoza.com.br>
Date: Fri, 08 Jul 2005 18:39:14 +0000
Subject: [KJ] [PATCH] drivers/net/pcmcia/3c589_cs.c : Use of time_befor macro
Message-Id: <42CEC852.7020804@feitoza.com.br>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Use of time_before() macro, defined at linux/jiffies.h, which deal with
wrapping correctly and are nicer to read.

Signed-off-by: Marcelo Feitoza Parisi <marcelo@feitoza.com.br>

--- linux/drivers/net/pcmcia/3c589_cs.c 2005-07-07 19:11:51.000000000 -0300
+++ linux-kj/drivers/net/pcmcia/3c589_cs.c      2005-07-07
22:59:40.020435184 -0300
@@ -39,6 +39,7 @@
 #include <linux/if_arp.h>
 #include <linux/ioport.h>
 #include <linux/bitops.h>
+#include <linux/jiffies.h>

 #include <pcmcia/version.h>
 #include <pcmcia/cs_types.h>
@@ -850,7 +851,7 @@
     media = inw(ioaddr+WN4_MEDIA) & 0xc810;

     /* Ignore collisions unless we've had no irq's recently */
-    if (jiffies - lp->last_irq < HZ) {
+    if (time_before(jiffies, lp->last_irq + HZ)) {
        media &= ~0x0010;
     } else {
        /* Try harder to detect carrier errors */

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
