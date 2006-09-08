From: James Nelson <james4765@gmail.com>
Date: Fri, 08 Sep 2006 02:00:40 +0000
Subject: [KJ] [PATCH 38/72] arm: add KERN_ constants to
Message-Id: <20060908020040.10114.55567.sendpatchset@david.homenet>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Signed-off-by: James Nelson <james4765@gmail.com>
---
diff --git a/arch/arm/mach-s3c2410/s3c2410.c b/arch/arm/mach-s3c2410/s3c2410.c
index a110cff..6b51214 100644
--- a/arch/arm/mach-s3c2410/s3c2410.c
+++ b/arch/arm/mach-s3c2410/s3c2410.c
@@ -101,7 +101,7 @@ void __init s3c2410_init_clocks(int xtal
 
 	/* print brieft summary of clocks, etc */
 
-	printk("S3C2410: core %ld.%03ld MHz, memory %ld.%03ld MHz, peripheral %ld.%03ld MHz\n",
+	pr_info("S3C2410: core %ld.%03ld MHz, memory %ld.%03ld MHz, peripheral %ld.%03ld MHz\n",
 	       print_mhz(fclk), print_mhz(hclk), print_mhz(pclk));
 
 	/* initialise the clocks here, to allow other things like the
@@ -135,7 +135,7 @@ core_initcall(s3c2410_core_init);
 
 int __init s3c2410_init(void)
 {
-	printk("S3C2410: Initialising architecture\n");
+	pr_info("S3C2410: Initialising architecture\n");
 
 	return sysdev_register(&s3c2410_sysdev);
 }
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
