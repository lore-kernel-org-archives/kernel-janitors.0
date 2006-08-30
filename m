From: James Nelson <james4765@gmail.com>
Date: Wed, 30 Aug 2006 21:49:31 +0000
Subject: [KJ] [PATCH] 36/37 alpha: add printk() KERN_ constants to
Message-Id: <20060830214931.15055.41598.sendpatchset@david.homenet>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Signed-off-by: James Nelson <james4765@gmail.com>
---
diff --git a/arch/alpha/kernel/time.c b/arch/alpha/kernel/time.c
index b191cc7..152dae2 100644
--- a/arch/alpha/kernel/time.c
+++ b/arch/alpha/kernel/time.c
@@ -173,7 +173,7 @@ common_init_rtc(void)
 	/* Turn on periodic interrupts.  */
 	x = CMOS_READ(RTC_CONTROL);
 	if (!(x & RTC_PIE)) {
-		printk("Turning on RTC interrupts.\n");
+		pr_info("turning on RTC interrupts\n");
 		x |= RTC_PIE;
 		x &= ~(RTC_AIE | RTC_UIE);
 		CMOS_WRITE(x, RTC_CONTROL);
@@ -333,7 +333,7 @@ time_init(void)
 			diff = -diff;
 		if ((unsigned long)diff > tolerance) {
 			cycle_freq = est_cycle_freq;
-			printk("HWRPB cycle frequency bogus.  "
+			pr_info("HWRPB cycle frequency bogus.  "
 			       "Estimated %lu Hz\n", cycle_freq);
 		} else {
 			est_cycle_freq = 0;
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
