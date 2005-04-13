From: Marcelo Feitoza Parisi <marcelo@feitoza.com.br>
Date: Wed, 13 Apr 2005 15:52:40 +0000
Subject: [KJ] [PATCH] drivers/net/wireless/strip.c : Use of time_after()
Message-Id: <425D4048.7050205@feitoza.com.br>
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



Signed-off-by: Marcelo Feitoza Parisi <marcelo@feitoza.com.br>

--- linux/drivers/net/wireless/strip.c	2005-04-07 22:25:57.000000000 -0300
+++ development/drivers/net/wireless/strip.c	2005-04-09 22:17:52.000000000 -0300
@@ -112,7 +112,7 @@ static const char StripVersion[] = "1.3A
 #include <linux/ip.h>
 #include <linux/tcp.h>
 #include <linux/time.h>
-
+#include <linux/jiffies.h>
 
 /************************************************************************/
 /* Useful structures and definitions					*/
@@ -1576,7 +1576,7 @@ static int strip_xmit(struct sk_buff *sk
 	del_timer(&strip_info->idle_timer);
 
 
-	if (jiffies - strip_info->pps_timer > HZ) {
+	if (time_after(jiffies, strip_info->pps_timer + HZ)) {
 		unsigned long t = jiffies - strip_info->pps_timer;
 		unsigned long rx_pps_count = (strip_info->rx_pps_count * HZ * 8 + t / 2) / t;
 		unsigned long tx_pps_count = (strip_info->tx_pps_count * HZ * 8 + t / 2) / t;

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors
