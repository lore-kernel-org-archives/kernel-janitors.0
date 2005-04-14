From: Marcelo Feitoza Parisi <marcelo@feitoza.com.br>
Date: Thu, 14 Apr 2005 21:42:42 +0000
Subject: [KJ] [PATCH] drivers/net/hp100.c : Use of time_before() macro,
Message-Id: <425EE3D2.5010801@feitoza.com.br>
List-Id: <kernel-janitors.vger.kernel.org>
References: <425A922C.6080100@feitoza.com.br>
In-Reply-To: <425A922C.6080100@feitoza.com.br>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Again, following Nish's catch, now the patch is using time_before() 
macro, instead of time_after() macro,
that was the way I did before. Both macros are defined at 
linux/jiffies.h. Any problem, please contact-me.

Signed-off-by: Marcelo Feitoza Parisi <marcelo@feitoza.com.br>

--- linux/drivers/net/hp100.c   2005-03-02 04:38:04.000000000 -0300
+++ development/drivers/net/hp100.c     2005-04-14 18:39:13.000000000 -0300
@@ -115,6 +115,7 @@
 #include <linux/delay.h>
 #include <linux/init.h>
 #include <linux/bitops.h>
+#include <linux/jiffies.h>

 #include <asm/io.h>

@@ -1493,7 +1494,7 @@
                printk("hp100: %s: start_xmit_bm: No TX PDL 
available.\n", dev->name);
 #endif
                /* not waited long enough since last tx? */
-               if (jiffies - dev->trans_start < HZ)
+               if (time_before(jiffies, dev->trans_start + HZ))
                        return -EAGAIN;

                if (hp100_check_lan(dev))
@@ -1646,7 +1647,7 @@
                printk("hp100: %s: start_xmit: tx free mem = 0x%x\n", 
dev->name, i);
 #endif
                /* not waited long enough since last failed tx try? */
-               if (jiffies - dev->trans_start < HZ) {
+               if (time_before(jiffies, dev->trans_start + HZ)) {
 #ifdef HP100_DEBUG
                        printk("hp100: %s: trans_start timing problem\n",
                               dev->name);

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors
