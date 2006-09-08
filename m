From: James Nelson <james4765@gmail.com>
Date: Fri, 08 Sep 2006 01:58:18 +0000
Subject: [KJ] [PATCH 17/72] arm: add KERN_ constants to
Message-Id: <20060908015818.10114.20593.sendpatchset@david.homenet>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Signed-off-by: James Nelson <james4765@gmail.com>
---
diff --git a/arch/arm/mach-omap1/board-h3.c b/arch/arm/mach-omap1/board-h3.c
index 7b20611..e4b8187 100644
--- a/arch/arm/mach-omap1/board-h3.c
+++ b/arch/arm/mach-omap1/board-h3.c
@@ -446,7 +446,7 @@ static void __init h3_init_smc91x(void)
 {
 	omap_cfg_reg(W15_1710_GPIO40);
 	if (omap_request_gpio(40) < 0) {
-		printk("Error requesting gpio 40 for smc91x irq\n");
+		printk(KERN_ERR "Error requesting gpio 40 for smc91x irq\n");
 		return;
 	}
 }
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
