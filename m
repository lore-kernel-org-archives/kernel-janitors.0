From: James Nelson <james4765@gmail.com>
Date: Fri, 08 Sep 2006 01:58:39 +0000
Subject: [KJ] [PATCH 20/72] arm: add KERN_ constants to
Message-Id: <20060908015839.10114.12493.sendpatchset@david.homenet>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Signed-off-by: James Nelson <james4765@gmail.com>
---
diff --git a/arch/arm/mach-omap1/board-osk.c b/arch/arm/mach-omap1/board-osk.c
index b742261..06358e3 100644
--- a/arch/arm/mach-omap1/board-osk.c
+++ b/arch/arm/mach-omap1/board-osk.c
@@ -181,7 +181,7 @@ static struct platform_device *osk5912_d
 static void __init osk_init_smc91x(void)
 {
 	if ((omap_request_gpio(0)) < 0) {
-		printk("Error requesting gpio 0 for smc91x irq\n");
+		printk(KERN_ERR "Error requesting gpio 0 for smc91x irq\n");
 		return;
 	}
 
@@ -193,7 +193,7 @@ static void __init osk_init_cf(void)
 {
 	omap_cfg_reg(M7_1610_GPIO62);
 	if ((omap_request_gpio(62)) < 0) {
-		printk("Error requesting gpio 62 for CF irq\n");
+		printk(KERN_ERR "Error requesting gpio 62 for CF irq\n");
 		return;
 	}
 	/* the CF I/O IRQ is really active-low */
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
