From: James Nelson <james4765@gmail.com>
Date: Thu, 07 Sep 2006 23:46:31 +0000
Subject: [KJ] [PATCH 2/2] arm: add KERN_ constants to
Message-Id: <20060907234630.9789.3590.sendpatchset@david.homenet>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Signed-off-by: James Nelson <james4765@gmail.com>
---
diff --git a/arch/arm/mach-at91rm9200/pm.c b/arch/arm/mach-at91rm9200/pm.c
index 47e5480..c92d9ea 100644
--- a/arch/arm/mach-at91rm9200/pm.c
+++ b/arch/arm/mach-at91rm9200/pm.c
@@ -205,7 +205,7 @@ static struct pm_ops at91_pm_ops ={
 
 static int __init at91_pm_init(void)
 {
-	printk("AT91: Power Management\n");
+	pr_info("AT91: Power Management\n");
 
 #ifdef CONFIG_AT91_PM_SLOW_CLOCK
 	/* REVISIT allocations of SRAM should be dynamically managed.
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
