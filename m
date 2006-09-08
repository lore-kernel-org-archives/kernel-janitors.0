From: James Nelson <james4765@gmail.com>
Date: Fri, 08 Sep 2006 01:59:12 +0000
Subject: [KJ] [PATCH 25/72] arm: add KERN_ constants to
Message-Id: <20060908015912.10114.97753.sendpatchset@david.homenet>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Signed-off-by: James Nelson <james4765@gmail.com>
---
diff --git a/arch/arm/mach-omap1/serial.c b/arch/arm/mach-omap1/serial.c
index 976edfb..a4966df 100644
--- a/arch/arm/mach-omap1/serial.c
+++ b/arch/arm/mach-omap1/serial.c
@@ -144,7 +144,7 @@ void __init omap_serial_init(void)
 		case 0:
 			uart1_ck = clk_get(NULL, "uart1_ck");
 			if (IS_ERR(uart1_ck))
-				printk("Could not get uart1_ck\n");
+				pr_info("Could not get uart1_ck\n");
 			else {
 				clk_enable(uart1_ck);
 				if (cpu_is_omap1510())
@@ -164,7 +164,7 @@ void __init omap_serial_init(void)
 		case 1:
 			uart2_ck = clk_get(NULL, "uart2_ck");
 			if (IS_ERR(uart2_ck))
-				printk("Could not get uart2_ck\n");
+				pr_info("Could not get uart2_ck\n");
 			else {
 				clk_enable(uart2_ck);
 				if (cpu_is_omap1510())
@@ -186,7 +186,7 @@ void __init omap_serial_init(void)
 		case 2:
 			uart3_ck = clk_get(NULL, "uart3_ck");
 			if (IS_ERR(uart3_ck))
-				printk("Could not get uart3_ck\n");
+				pr_info("Could not get uart3_ck\n");
 			else {
 				clk_enable(uart3_ck);
 				if (cpu_is_omap1510())
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
