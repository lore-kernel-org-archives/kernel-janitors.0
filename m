From: Marcelo Feitoza Parisi <marcelo@feitoza.com.br>
Date: Mon, 11 Apr 2005 15:05:16 +0000
Subject: [KJ] [PATCH] drivers/net/hp100.c : Use of time_after() macro
Message-Id: <425A922C.6080100@feitoza.com.br>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Use of time_after() macro, defined at linux/jiffies.h, which deal with
wrapping correctly and are nicer to read.

-- 
Marcelo Feitoza Parisi            
marcelo at feitoza.com.br
http://marcelo.feitoza.com.br/


Marcelo Feitoza Parisi <marcelo@feitoza.com.br>

--- linux/drivers/net/hp100.c	2005-03-02 04:38:04.000000000 -0300
+++ development/drivers/net/hp100.c	2005-04-09 18:42:14.000000000 -0300
@@ -115,6 +115,7 @@
 #include <linux/delay.h>
 #include <linux/init.h>
 #include <linux/bitops.h>
+#include <linux/jiffies.h>
 
 #include <asm/io.h>
 
@@ -1493,7 +1494,7 @@ static int hp100_start_xmit_bm(struct sk
 		printk("hp100: %s: start_xmit_bm: No TX PDL available.\n", dev->name);
 #endif
 		/* not waited long enough since last tx? */
-		if (jiffies - dev->trans_start < HZ)
+		if (time_after(jiffies, dev->trans_start - HZ))
 			return -EAGAIN;
 
 		if (hp100_check_lan(dev))
@@ -1646,7 +1647,7 @@ static int hp100_start_xmit(struct sk_bu
 		printk("hp100: %s: start_xmit: tx free mem = 0x%x\n", dev->name, i);
 #endif
 		/* not waited long enough since last failed tx try? */
-		if (jiffies - dev->trans_start < HZ) {
+		if (time_after(jiffies, dev->trans_start - HZ)) {
 #ifdef HP100_DEBUG
 			printk("hp100: %s: trans_start timing problem\n",
 			       dev->name);

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors
