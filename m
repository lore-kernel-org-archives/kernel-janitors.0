From: James Nelson <james4765@gmail.com>
Date: Fri, 08 Sep 2006 01:58:25 +0000
Subject: [KJ] [PATCH 18/72] arm: add KERN_ constants to
Message-Id: <20060908015825.10114.46308.sendpatchset@david.homenet>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Signed-off-by: James Nelson <james4765@gmail.com>
---
diff --git a/arch/arm/mach-omap1/board-innovator.c b/arch/arm/mach-omap1/board-innovator.c
index 4cbc62d..69dd1ba 100644
--- a/arch/arm/mach-omap1/board-innovator.c
+++ b/arch/arm/mach-omap1/board-innovator.c
@@ -300,7 +300,7 @@ static void __init innovator_init_smc91x
 		udelay(750);
 	} else {
 		if ((omap_request_gpio(0)) < 0) {
-			printk("Error requesting gpio 0 for smc91x irq\n");
+			printk(KERN_ERR "Error requesting gpio 0 for smc91x irq\n");
 			return;
 		}
 	}
@@ -421,7 +421,7 @@ #ifdef CONFIG_ARCH_OMAP15XX
 		udelay(10);	/* Delay needed for FPGA */
 
 		/* Dump the Innovator FPGA rev early - useful info for support. */
-		printk("Innovator FPGA Rev %d.%d Board Rev %d\n",
+		pr_info("Innovator FPGA Rev %d.%d Board Rev %d\n",
 		       fpga_read(OMAP1510_FPGA_REV_HIGH),
 		       fpga_read(OMAP1510_FPGA_REV_LOW),
 		       fpga_read(OMAP1510_FPGA_BOARD_REV));
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
