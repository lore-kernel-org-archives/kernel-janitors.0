From: James Nelson <james4765@gmail.com>
Date: Fri, 08 Sep 2006 01:59:19 +0000
Subject: [KJ] [PATCH 26/72] arm: add KERN_ constants to
Message-Id: <20060908015919.10114.10458.sendpatchset@david.homenet>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Signed-off-by: James Nelson <james4765@gmail.com>
---
diff --git a/arch/arm/mach-omap2/pm.c b/arch/arm/mach-omap2/pm.c
index d7eee99..1436e34 100644
--- a/arch/arm/mach-omap2/pm.c
+++ b/arch/arm/mach-omap2/pm.c
@@ -105,11 +105,11 @@ #define INT2_WAKE_MASK	(OMAP_IRQ_BIT(INT
 			OMAP_IRQ_BIT(INT_24XX_UART2_IRQ) |	\
 			OMAP_IRQ_BIT(INT_24XX_UART3_IRQ))
 
-#define preg(reg)	printk("%s\t(0x%p):\t0x%08x\n", #reg, &reg, reg);
+#define preg(reg)	pr_info("%s\t(0x%p):\t0x%08x\n", #reg, &reg, reg);
 
 static void omap2_pm_debug(char * desc)
 {
-	printk("%s:\n", desc);
+	pr_info("%s:\n", desc);
 
 	preg(CM_CLKSTCTRL_MPU);
 	preg(CM_CLKSTCTRL_CORE);
@@ -378,7 +378,7 @@ static struct pm_ops omap_pm_ops = {
 
 int __init omap2_pm_init(void)
 {
-	printk("Power Management for TI OMAP.\n");
+	pr_info("Power Management for TI OMAP.\n");
 
 	vclk = clk_get(NULL, "virt_prcm_set");
 	if (IS_ERR(vclk)) {
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
