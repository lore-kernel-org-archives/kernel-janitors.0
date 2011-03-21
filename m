From: Shuxian Cai <caisx25@gmail.com>
Date: Mon, 21 Mar 2011 11:36:14 +0000
Subject: [PATCH] be2net: change explicit jiffies comparison
Message-Id: <1300707374.2324.8.camel@diviner-dev>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

From: Shuxian Cai <caisx25@gmail.com>

Use time_after()/time_before() instead of explicit compare
Signed-off-by: Shuxian Cai <caisx25@gmail.com>
---
diff -uprN -X linux-2.6.38/Documentation/dontdiff linux-2.6.38/drivers/net/benet/be_main.c linux-2.6.38.new/drivers/net/benet/be_main.c
--- linux-2.6.38/drivers/net/benet/be_main.c	2011-03-18 23:22:48.000000000 +0800
+++ linux-2.6.38.new/drivers/net/benet/be_main.c	2011-03-20 20:04:30.000000000 +0800
@@ -18,6 +18,7 @@
 #include "be.h"
 #include "be_cmds.h"
 #include <asm/div64.h>
+#include <linux/jiffies.h>
 
 MODULE_VERSION(DRV_VER);
 MODULE_DEVICE_TABLE(pci, be_dev_ids);
@@ -340,7 +341,7 @@ static void be_rx_eqd_update(struct be_a
 	}
 
 	/* Update once a second */
-	if ((now - stats->rx_fps_jiffies) < HZ)
+	if (time_before(now, stats->rx_fps_jiffies + HZ))
 		return;
 
 	stats->rx_fps = (stats->rx_frags - stats->prev_rx_frags) /
@@ -385,7 +386,7 @@ static void be_tx_rate_update(struct be_
 	}
 
 	/* Update tx rate once in two seconds */
-	if ((now - stats->be_tx_jiffies) > 2 * HZ) {
+	if (time_after(now, stats->be_tx_jiffies + 2*HZ)) {
 		stats->be_tx_rate = be_calc_rate(stats->be_tx_bytes
 						  - stats->be_tx_bytes_prev,
 						 now - stats->be_tx_jiffies);
@@ -842,7 +843,7 @@ static void be_rx_rate_update(struct be_
 	}
 
 	/* Update the rate once in two seconds */
-	if ((now - stats->rx_jiffies) < 2 * HZ)
+	if (time_before(now, stats->rx_jiffies + 2 * HZ))
 		return;
 
 	stats->rx_rate = be_calc_rate(stats->rx_bytes - stats->rx_bytes_prev,


