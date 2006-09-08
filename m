From: James Nelson <james4765@gmail.com>
Date: Fri, 08 Sep 2006 02:04:23 +0000
Subject: [KJ] [PATCH 71/72] arm: add KERN_ constants to
Message-Id: <20060908020423.10114.8503.sendpatchset@david.homenet>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Signed-off-by: James Nelson <james4765@gmail.com>
---
diff --git a/arch/arm/plat-omap/pm.c b/arch/arm/plat-omap/pm.c
index 04b4102..7a72d51 100644
--- a/arch/arm/plat-omap/pm.c
+++ b/arch/arm/plat-omap/pm.c
@@ -167,7 +167,7 @@ void omap_pm_suspend(void)
 {
 	unsigned long arg0 = 0, arg1 = 0;
 
-	printk("PM: OMAP%x is trying to enter deep sleep...\n", system_rev);
+	pr_info("PM: OMAP%x is trying to enter deep sleep...\n", system_rev);
 
 	omap_serial_wake_trigger(1);
 
@@ -340,7 +340,7 @@ void omap_pm_suspend(void)
 
 	omap_serial_wake_trigger(0);
 
-	printk("PM: OMAP%x is re-starting from deep sleep...\n", system_rev);
+	pr_info("PM: OMAP%x is re-starting from deep sleep...\n", system_rev);
 
 	if (machine_is_omap_osk()) {
 		/* Let LED1 (D9) blink again */
@@ -595,7 +595,7 @@ static struct pm_ops omap_pm_ops ={
 
 static int __init omap_pm_init(void)
 {
-	printk("Power Management for TI OMAP.\n");
+	pr_info("Power Management for TI OMAP\n");
 	/*
 	 * We copy the assembler sleep/wakeup routines to SRAM.
 	 * These routines need to be in SRAM as that's the only
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
