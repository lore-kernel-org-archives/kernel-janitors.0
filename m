From: James Nelson <james4765@gmail.com>
Date: Fri, 08 Sep 2006 02:01:07 +0000
Subject: [KJ] [PATCH 42/72] arm: add KERN_ constants to
Message-Id: <20060908020106.10114.50113.sendpatchset@david.homenet>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Signed-off-by: James Nelson <james4765@gmail.com>
---
diff --git a/arch/arm/mach-s3c2410/s3c2440.c b/arch/arm/mach-s3c2410/s3c2440.c
index 0ab50f4..039b99c 100644
--- a/arch/arm/mach-s3c2410/s3c2440.c
+++ b/arch/arm/mach-s3c2410/s3c2440.c
@@ -46,7 +46,7 @@ static struct sys_device s3c2440_sysdev 
 
 int __init s3c2440_init(void)
 {
-	printk("S3C2440: Initialising architecture\n");
+	pr_info("S3C2440: Initialising architecture\n");
 
 	/* change irq for watchdog */
 
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
