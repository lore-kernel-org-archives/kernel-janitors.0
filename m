From: vignesh babu <vignesh.babu@wipro.com>
Date: Mon, 13 Aug 2007 13:04:34 +0000
Subject: [kj] is_power_of_2 in net/pcmcia/pcnet_cs.c
Message-Id: <1187009554.7273.3.camel@merlin.linuxcoe.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: dahinds@users.sourceforge.net, p_gortmaker@yahoo.com
Cc: netdev@vger.kernel.org, Kernel Janitors List <kernel-janitors@lists.osdl.org>

Replacing n & (n - 1) for power of 2 check by is_power_of_2(n)

Signed-off-by: vignesh babu <vignesh.babu@wipro.com>
---
diff --git a/drivers/net/pcmcia/pcnet_cs.c b/drivers/net/pcmcia/pcnet_cs.c
index 63de89e..d23bf6e 100644
--- a/drivers/net/pcmcia/pcnet_cs.c
+++ b/drivers/net/pcmcia/pcnet_cs.c
@@ -36,6 +36,7 @@
 #include <linux/string.h>
 #include <linux/timer.h>
 #include <linux/delay.h>
+#include <linux/log2.h>
 #include <linux/ethtool.h>
 #include <linux/netdevice.h>
 #include <../drivers/net/8390.h>
@@ -1486,7 +1487,7 @@ static int setup_shmem_window(struct pcmcia_device *link, int start_pg,
 	window_size = 32 * 1024;
 
     /* Make sure it's a power of two.  */
-    while ((window_size & (window_size - 1)) != 0)
+    while (!is_power_of_2(window_size))
 	window_size += window_size & ~(window_size - 1);
 
     /* Allocate a memory window */

-- 
Vignesh Babu BM 
_____________________________________________________________ 
"Why is it that every time I'm with you, makes me believe in magic?"

_______________________________________________
REMINDER: this mailing list moved to vger.kernel.org and current one will be discontinued soon.
To resubscribe, send email to majordomo@vger.kernel.org with
&quot;subscribe kernel-janitors&quot; in message body and follow instructions.

Kernel-janitors mailing list
Kernel-janitors@lists.linux-foundation.org
https://lists.linux-foundation.org/mailman/listinfo/kernel-janitors
