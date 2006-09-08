From: James Nelson <james4765@gmail.com>
Date: Fri, 08 Sep 2006 01:58:11 +0000
Subject: [KJ] [PATCH 16/72] arm: add KERN_ constants to
Message-Id: <20060908015811.10114.24713.sendpatchset@david.homenet>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Signed-off-by: James Nelson <james4765@gmail.com>
---
diff --git a/arch/arm/mach-omap1/board-h2.c b/arch/arm/mach-omap1/board-h2.c
index cd3a06d..fe1f2a3 100644
--- a/arch/arm/mach-omap1/board-h2.c
+++ b/arch/arm/mach-omap1/board-h2.c
@@ -276,7 +276,7 @@ static struct platform_device *h2_device
 static void __init h2_init_smc91x(void)
 {
 	if ((omap_request_gpio(0)) < 0) {
-		printk("Error requesting gpio 0 for smc91x irq\n");
+		printk(KERN_ERR "Error requesting gpio 0 for smc91x irq\n");
 		return;
 	}
 }
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
