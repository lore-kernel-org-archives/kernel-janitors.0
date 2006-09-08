From: James Nelson <james4765@gmail.com>
Date: Fri, 08 Sep 2006 02:03:57 +0000
Subject: [KJ] [PATCH 67/72] arm: add KERN_ constants to
Message-Id: <20060908020357.10114.34309.sendpatchset@david.homenet>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Signed-off-by: James Nelson <james4765@gmail.com>
---
diff --git a/arch/arm/plat-omap/gpio.c b/arch/arm/plat-omap/gpio.c
index cd7f973..0ba055a 100644
--- a/arch/arm/plat-omap/gpio.c
+++ b/arch/arm/plat-omap/gpio.c
@@ -974,19 +974,19 @@ static int __init _omap_gpio_init(void)
 	if (cpu_is_omap15xx()) {
 		gpio_ick = clk_get(NULL, "arm_gpio_ck");
 		if (IS_ERR(gpio_ick))
-			printk("Could not get arm_gpio_ck\n");
+			pr_info("Could not get arm_gpio_ck\n");
 		else
 			clk_enable(gpio_ick);
 	}
 	if (cpu_is_omap24xx()) {
 		gpio_ick = clk_get(NULL, "gpios_ick");
 		if (IS_ERR(gpio_ick))
-			printk("Could not get gpios_ick\n");
+			pr_info("Could not get gpios_ick\n");
 		else
 			clk_enable(gpio_ick);
 		gpio_fck = clk_get(NULL, "gpios_fck");
 		if (IS_ERR(gpio_ick))
-			printk("Could not get gpios_fck\n");
+			pr_info("Could not get gpios_fck\n");
 		else
 			clk_enable(gpio_fck);
 	}
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
