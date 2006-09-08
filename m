From: James Nelson <james4765@gmail.com>
Date: Fri, 08 Sep 2006 01:59:26 +0000
Subject: [KJ] [PATCH 27/72] arm: add KERN_ constants to
Message-Id: <20060908015926.10114.87883.sendpatchset@david.homenet>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Signed-off-by: James Nelson <james4765@gmail.com>
---
diff --git a/arch/arm/mach-omap2/serial.c b/arch/arm/mach-omap2/serial.c
index 0884bc7..b8e5cbc 100644
--- a/arch/arm/mach-omap2/serial.c
+++ b/arch/arm/mach-omap2/serial.c
@@ -117,14 +117,14 @@ void __init omap_serial_init()
 		case 0:
 			uart1_ick = clk_get(NULL, "uart1_ick");
 			if (IS_ERR(uart1_ick))
-				printk("Could not get uart1_ick\n");
+				pr_info("Could not get uart1_ick\n");
 			else {
 				clk_enable(uart1_ick);
 			}
 
 			uart1_fck = clk_get(NULL, "uart1_fck");
 			if (IS_ERR(uart1_fck))
-				printk("Could not get uart1_fck\n");
+				pr_info("Could not get uart1_fck\n");
 			else {
 				clk_enable(uart1_fck);
 			}
@@ -132,14 +132,14 @@ void __init omap_serial_init()
 		case 1:
 			uart2_ick = clk_get(NULL, "uart2_ick");
 			if (IS_ERR(uart2_ick))
-				printk("Could not get uart2_ick\n");
+				pr_info("Could not get uart2_ick\n");
 			else {
 				clk_enable(uart2_ick);
 			}
 
 			uart2_fck = clk_get(NULL, "uart2_fck");
 			if (IS_ERR(uart2_fck))
-				printk("Could not get uart2_fck\n");
+				pr_info("Could not get uart2_fck\n");
 			else {
 				clk_enable(uart2_fck);
 			}
@@ -147,14 +147,14 @@ void __init omap_serial_init()
 		case 2:
 			uart3_ick = clk_get(NULL, "uart3_ick");
 			if (IS_ERR(uart3_ick))
-				printk("Could not get uart3_ick\n");
+				pr_info("Could not get uart3_ick\n");
 			else {
 				clk_enable(uart3_ick);
 			}
 
 			uart3_fck = clk_get(NULL, "uart3_fck");
 			if (IS_ERR(uart3_fck))
-				printk("Could not get uart3_fck\n");
+				pr_info("Could not get uart3_fck\n");
 			else {
 				clk_enable(uart3_fck);
 			}
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
