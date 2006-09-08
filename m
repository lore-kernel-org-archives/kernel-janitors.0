From: James Nelson <james4765@gmail.com>
Date: Fri, 08 Sep 2006 02:03:51 +0000
Subject: [KJ] [PATCH 66/72] arm: add KERN_ constants to
Message-Id: <20060908020351.10114.54220.sendpatchset@david.homenet>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Signed-off-by: James Nelson <james4765@gmail.com>
---
diff --git a/arch/arm/plat-omap/dmtimer.c b/arch/arm/plat-omap/dmtimer.c
index 5052443..e55f66b 100644
--- a/arch/arm/plat-omap/dmtimer.c
+++ b/arch/arm/plat-omap/dmtimer.c
@@ -206,7 +206,7 @@ struct omap_dm_timer *omap_dm_timer_requ
 	spin_lock_irqsave(&dm_timer_lock, flags);
 	if (id <= 0 || id > dm_timer_count || dm_timers[id-1].reserved) {
 		spin_unlock_irqrestore(&dm_timer_lock, flags);
-		printk("BUG: warning at %s:%d/%s(): unable to get timer %d\n",
+		printk(KERN_ERR "BUG: warning at %s:%d/%s(): unable to get timer %d\n",
 		       __FILE__, __LINE__, __FUNCTION__, id);
 		dump_stack();
 		return NULL;
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
