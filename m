From: James Nelson <james4765@gmail.com>
Date: Fri, 08 Sep 2006 02:00:33 +0000
Subject: [KJ] [PATCH 37/72] arm: add KERN_ constants to
Message-Id: <20060908020033.10114.60376.sendpatchset@david.homenet>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Signed-off-by: James Nelson <james4765@gmail.com>
---
diff --git a/arch/arm/mach-s3c2410/pm.c b/arch/arm/mach-s3c2410/pm.c
index a589fe7..f227c71 100644
--- a/arch/arm/mach-s3c2410/pm.c
+++ b/arch/arm/mach-s3c2410/pm.c
@@ -670,7 +670,7 @@ static struct pm_ops s3c2410_pm_ops = {
 
 int __init s3c2410_pm_init(void)
 {
-	printk("S3C2410 Power Management, (c) 2004 Simtec Electronics\n");
+	pr_info("S3C2410 Power Management, (c) 2004 Simtec Electronics\n");
 
 	pm_set_ops(&s3c2410_pm_ops);
 	return 0;
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
