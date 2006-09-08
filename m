From: James Nelson <james4765@gmail.com>
Date: Fri, 08 Sep 2006 02:04:32 +0000
Subject: [KJ] [PATCH 72/72] arm: add KERN_ constants to
Message-Id: <20060908020432.10114.851.sendpatchset@david.homenet>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Signed-off-by: James Nelson <james4765@gmail.com>
---
diff --git a/arch/arm/plat-omap/usb.c b/arch/arm/plat-omap/usb.c
index 9b81532..87cf76c 100644
--- a/arch/arm/plat-omap/usb.c
+++ b/arch/arm/plat-omap/usb.c
@@ -430,7 +430,7 @@ #endif
 	pr_debug("OTG_SYSCON_2_REG = %08x\n", syscon);
 	OTG_SYSCON_2_REG = syscon;
 
-	printk("USB: hmc %d", config->hmc_mode);
+	pr_info("USB: hmc %d", config->hmc_mode);
 	if (alt_pingroup)
 		printk(", usb2 alt %d wires", config->pins[2]);
 	else if (config->pins[0])
@@ -520,7 +520,7 @@ static void __init omap_1510_usb_init(st
 	val |= (config->hmc_mode << 1);
 	omap_writel(val, MOD_CONF_CTRL_0);
 
-	printk("USB: hmc %d", config->hmc_mode);
+	pr_info("USB: hmc %d", config->hmc_mode);
 	if (config->pins[0])
 		printk(", usb0 %d wires%s", config->pins[0],
 			is_usb0_device(config) ? " (dev)" : "");
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
