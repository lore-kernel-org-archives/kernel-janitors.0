From: James Nelson <james4765@gmail.com>
Date: Fri, 08 Sep 2006 01:59:05 +0000
Subject: [KJ] [PATCH 24/72] arm: add KERN_ constants to
Message-Id: <20060908015905.10114.85500.sendpatchset@david.homenet>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Signed-off-by: James Nelson <james4765@gmail.com>
---
diff --git a/arch/arm/mach-omap1/pm.c b/arch/arm/mach-omap1/pm.c
index cd76185..1adbf4b 100644
--- a/arch/arm/mach-omap1/pm.c
+++ b/arch/arm/mach-omap1/pm.c
@@ -247,7 +247,7 @@ void omap_pm_suspend(void)
 {
 	unsigned long arg0 = 0, arg1 = 0;
 
-	printk("PM: OMAP%x is trying to enter deep sleep...\n", system_rev);
+	pr_info("PM: OMAP%x is trying to enter deep sleep...\n", system_rev);
 
 	omap_serial_wake_trigger(1);
 
@@ -445,7 +445,7 @@ void omap_pm_suspend(void)
 
 	omap_serial_wake_trigger(0);
 
-	printk("PM: OMAP%x is re-starting from deep sleep...\n", system_rev);
+	pr_info("PM: OMAP%x is re-starting from deep sleep...\n", system_rev);
 
 	if (machine_is_omap_osk()) {
 		/* Let LED1 (D9) blink again */
@@ -705,7 +705,7 @@ static struct pm_ops omap_pm_ops ={
 
 static int __init omap_pm_init(void)
 {
-	printk("Power Management for TI OMAP.\n");
+	pr_info("Power Management for TI OMAP\n");
 
 	/*
 	 * We copy the assembler sleep/wakeup routines to SRAM.
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
