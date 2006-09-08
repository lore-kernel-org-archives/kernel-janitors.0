From: James Nelson <james4765@gmail.com>
Date: Fri, 08 Sep 2006 02:01:13 +0000
Subject: [KJ] [PATCH 43/72] arm: add KERN_ constants to
Message-Id: <20060908020113.10114.89873.sendpatchset@david.homenet>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Signed-off-by: James Nelson <james4765@gmail.com>
---
diff --git a/arch/arm/mach-s3c2410/s3c2440-clock.c b/arch/arm/mach-s3c2410/s3c2440-clock.c
index 1579686..6c66916 100644
--- a/arch/arm/mach-s3c2410/s3c2440-clock.c
+++ b/arch/arm/mach-s3c2410/s3c2440-clock.c
@@ -117,7 +117,7 @@ static int s3c2440_clk_add(struct sys_de
 	struct clk *clk_p;
 	struct clk *clk_upll;
 
-	printk("S3C2440: Clock Support, DVS %s\n",
+	pr_info("S3C2440: Clock Support, DVS %s\n",
 	       (camdivn & S3C2440_CAMDIVN_DVSEN) ? "on" : "off");
 
 	clk_p = clk_get(NULL, "pclk");
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
