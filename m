From: James Nelson <james4765@gmail.com>
Date: Fri, 08 Sep 2006 02:01:40 +0000
Subject: [KJ] [PATCH 47/72] arm: add KERN_ constants to
Message-Id: <20060908020140.10114.61723.sendpatchset@david.homenet>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Signed-off-by: James Nelson <james4765@gmail.com>
---
diff --git a/arch/arm/mach-s3c2410/s3c244x.c b/arch/arm/mach-s3c2410/s3c244x.c
index 9a22582..cce778f 100644
--- a/arch/arm/mach-s3c2410/s3c244x.c
+++ b/arch/arm/mach-s3c2410/s3c244x.c
@@ -112,7 +112,7 @@ void __init s3c244x_init_clocks(int xtal
 
 	/* print brief summary of clocks, etc */
 
-	printk("S3C244X: core %ld.%03ld MHz, memory %ld.%03ld MHz, peripheral %ld.%03ld MHz\n",
+	pr_info("S3C244X: core %ld.%03ld MHz, memory %ld.%03ld MHz, peripheral %ld.%03ld MHz\n",
 	       print_mhz(fclk), print_mhz(hclk), print_mhz(pclk));
 
 	/* initialise the clocks here, to allow other things like the
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
