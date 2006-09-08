From: James Nelson <james4765@gmail.com>
Date: Fri, 08 Sep 2006 02:00:00 +0000
Subject: [KJ] [PATCH 32/72] arm: add KERN_ constants to
Message-Id: <20060908020000.10114.12829.sendpatchset@david.homenet>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Signed-off-by: James Nelson <james4765@gmail.com>
---
diff --git a/arch/arm/mach-realview/localtimer.c b/arch/arm/mach-realview/localtimer.c
index caf6b8b..4921cd8 100644
--- a/arch/arm/mach-realview/localtimer.c
+++ b/arch/arm/mach-realview/localtimer.c
@@ -57,7 +57,7 @@ void __cpuinit local_timer_setup(unsigne
 	 * the timer ticks
 	 */
 	if (mpcore_timer_rate = 0) {
-		printk("Calibrating local timer... ");
+		pr_info("Calibrating local timer... ");
 
 		/* Wait for a tick to start */
 		waitjiffies = get_jiffies_64() + 1;
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
