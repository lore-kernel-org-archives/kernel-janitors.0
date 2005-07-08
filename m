From: Marcelo Feitoza Parisi <marcelo@feitoza.com.br>
Date: Fri, 08 Jul 2005 18:47:59 +0000
Subject: [KJ] [PATCH] drivers/net/hamradio/mkiss.c : Use of time_before macro
Message-Id: <42CECA5F.5050604@feitoza.com.br>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Use of time_before() macro, defined at linux/jiffies.h, which deal with
wrapping correctly and are nicer to read.

Signed-off-by: Marcelo Feitoza Parisi <marcelo@feitoza.com.br>

--- linux/drivers/net/hamradio/mkiss.c  2005-07-07 19:11:51.000000000 -0300
+++ linux-kj/drivers/net/hamradio/mkiss.c       2005-07-07
22:56:21.650591984 -0300
@@ -46,6 +46,7 @@
 #include <linux/etherdevice.h>
 #include <linux/skbuff.h>
 #include <linux/if_arp.h>
+#include <linux/jiffies.h>

 #include <net/ax25.h>

@@ -429,7 +430,7 @@
                 * May be we must check transmitter timeout here ?
                 *      14 Oct 1994 Dmitry Gorodchanin.
                 */
-               if (jiffies - dev->trans_start  < 20 * HZ) {
+               if (time_before(jiffies, dev->trans_start + 20 * HZ)) {
                        /* 20 sec timeout not reached */
                        return 1;
                }
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
