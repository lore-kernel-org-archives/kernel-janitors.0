From: Marcelo Feitoza Parisi <marcelo@feitoza.com.br>
Date: Fri, 08 Jul 2005 18:41:48 +0000
Subject: [KJ] [PATCH] drivers/net/hp100.c : Use of time_before macro
Message-Id: <42CEC8EC.2060209@feitoza.com.br>
List-Id: <kernel-janitors.vger.kernel.org>
References: <425A922C.6080100@feitoza.com.br>
In-Reply-To: <425A922C.6080100@feitoza.com.br>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Use of time_before() macro, defined at linux/jiffies.h, which deal with
wrapping correctly and are nicer to read.

Signed-off-by: Marcelo Feitoza Parisi <marcelo@feitoza.com.br>

--- linux/drivers/net/hp100.c   2005-07-07 19:13:15.000000000 -0300
+++ linux-kj/drivers/net/hp100.c        2005-07-07 20:43:38.393191120 -0300
@@ -116,6 +116,7 @@
 #include <linux/delay.h>
 #include <linux/init.h>
 #include <linux/bitops.h>
+#include <linux/jiffies.h>

 #include <asm/io.h>

@@ -1500,7 +1501,7 @@
                printk(KERN_DEBUG "hp100: %s: start_xmit_bm: No TX PDL
available.\n", dev->name);
 #endif
                /* not waited long enough since last tx? */
-               if (jiffies - dev->trans_start < HZ)
+               if (time_before(jiffies, dev->trans_start + HZ))
                        return -EAGAIN;

                if (hp100_check_lan(dev))
@@ -1653,7 +1654,7 @@
                printk(KERN_DEBUG "hp100: %s: start_xmit: tx free mem 0x%x\n", dev->name, i);
 #endif
                /* not waited long enough since last failed tx try? */
-               if (jiffies - dev->trans_start < HZ) {
+               if (time_before(jiffies, dev->trans_start + HZ)) {
 #ifdef HP100_DEBUG
                        printk(KERN_DEBUG "hp100: %s: trans_start timing
problem\n",
                               dev->name);

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
