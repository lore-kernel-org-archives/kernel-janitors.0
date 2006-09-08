From: James Nelson <james4765@gmail.com>
Date: Fri, 08 Sep 2006 02:04:17 +0000
Subject: [KJ] [PATCH 70/72] arm: add KERN_ constants to
Message-Id: <20060908020417.10114.32469.sendpatchset@david.homenet>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Signed-off-by: James Nelson <james4765@gmail.com>
---
diff --git a/arch/arm/plat-omap/ocpi.c b/arch/arm/plat-omap/ocpi.c
index b5d3070..3968b5b 100644
--- a/arch/arm/plat-omap/ocpi.c
+++ b/arch/arm/plat-omap/ocpi.c
@@ -86,7 +86,7 @@ static int __init omap_ocpi_init(void)
 
 	clk_enable(ocpi_ck);
 	ocpi_enable();
-	printk("OMAP OCPI interconnect driver loaded\n");
+	pr_info("OMAP OCPI interconnect driver loaded\n");
 
 	return 0;
 }
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
