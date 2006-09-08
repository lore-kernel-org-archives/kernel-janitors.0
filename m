From: James Nelson <james4765@gmail.com>
Date: Fri, 08 Sep 2006 02:00:47 +0000
Subject: [KJ] [PATCH 39/41] arm: add KERN_ constants to
Message-Id: <20060908020047.10114.97492.sendpatchset@david.homenet>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Signed-off-by: James Nelson <james4765@gmail.com>
---
diff --git a/arch/arm/mach-s3c2410/s3c2410-clock.c b/arch/arm/mach-s3c2410/s3c2410-clock.c
index 9971866..69a5271 100644
--- a/arch/arm/mach-s3c2410/s3c2410-clock.c
+++ b/arch/arm/mach-s3c2410/s3c2410-clock.c
@@ -260,7 +260,7 @@ int __init s3c2410_baseclk_add(void)
 
 	xtal = clk_get(NULL, "xtal");
 
-	printk("CLOCK: Slow mode (%ld.%ld MHz), %s, MPLL %s, UPLL %s\n",
+	pr_info("CLOCK: Slow mode (%ld.%ld MHz), %s, MPLL %s, UPLL %s\n",
 	       print_mhz(clk_get_rate(xtal) /
 			 ( 2 * S3C2410_CLKSLOW_GET_SLOWVAL(clkslow))),
 	       (clkslow & S3C2410_CLKSLOW_SLOW) ? "slow" : "fast",
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
