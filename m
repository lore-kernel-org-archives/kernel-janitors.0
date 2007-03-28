From: Shani <shani.moideen@wipro.com>
Date: Wed, 28 Mar 2007 05:26:31 +0000
Subject: [KJ] Patch:replace with time_after in drivers/net/eexpress.c
Message-Id: <1175058871.11584.33.camel@shani-win>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: philb@gnu.org
Cc: alan@redhat.com, netdev@vger.kernel.org, kernel-janitors@osdl.org

Hi,

Replacing with time_after in drivers/net/eexpress.c
Applies and compiles clean on latest tree.Not tested.

thanks.

Signed-off-by: Shani Moideen <shani.moideen@wipro.com>
----

diff --git a/drivers/net/eexpress.c b/drivers/net/eexpress.c
index 3868b80..7825f78 100644
--- a/drivers/net/eexpress.c
+++ b/drivers/net/eexpress.c
@@ -115,6 +115,7 @@
 #include <linux/mca-legacy.h>
 #include <linux/spinlock.h>
 #include <linux/bitops.h>
+#include <linux/jiffies.h>
 
 #include <asm/system.h>
 #include <asm/io.h>
@@ -556,7 +557,7 @@ static void unstick_cu(struct net_device *dev)
 
 	if (lp->started)
 	{
-		if ((jiffies - dev->trans_start)>50)
+		if (time_after(jiffies, dev->trans_start + 50))
 		{
 			if (lp->tx_link=lp->last_tx_restart)
 			{
@@ -612,7 +613,7 @@ static void unstick_cu(struct net_device *dev)
 	}
 	else
 	{
-		if ((jiffies-lp->init_time)>10)
+		if (time_after(jiffies,lp->init_time + 10))
 		{
 			unsigned short status = scb_status(dev);
 			printk(KERN_WARNING "%s: i82586 startup timed out, status %04x, resetting...\n",
@@ -1650,7 +1651,7 @@ eexp_set_multicast(struct net_device *dev)
 #endif
                 oj = jiffies;
                 while ((SCB_CUstat(scb_status(dev)) = 2) &&
-                       ((jiffies-oj) < 2000));
+                       (time_after(jiffies, oj + 2000)));
 		if (SCB_CUstat(scb_status(dev)) = 2)
 			printk("%s: warning, CU didn't stop\n", dev->name);
                 lp->started &= ~(STARTED_CU);

-- 
Shani Moideen
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.linux-foundation.org
https://lists.linux-foundation.org/mailman/listinfo/kernel-janitors
