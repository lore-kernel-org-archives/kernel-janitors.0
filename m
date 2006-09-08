From: James Nelson <james4765@gmail.com>
Date: Fri, 08 Sep 2006 02:00:27 +0000
Subject: [KJ] [PATCH 36/72] arm: add KERN_ constants to
Message-Id: <20060908020027.10114.45704.sendpatchset@david.homenet>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Signed-off-by: James Nelson <james4765@gmail.com>
---
diff --git a/arch/arm/mach-s3c2410/irq.c b/arch/arm/mach-s3c2410/irq.c
index 6822dc7..771c2d6 100644
--- a/arch/arm/mach-s3c2410/irq.c
+++ b/arch/arm/mach-s3c2410/irq.c
@@ -610,7 +610,7 @@ void __init s3c24xx_init_irq(void)
 			break;
 
 		__raw_writel(pend, S3C24XX_EINTPEND);
-		printk("irq: clearing pending ext status %08x\n", (int)pend);
+		pr_info("irq: clearing pending ext status %08x\n", (int)pend);
 		last = pend;
 	}
 
@@ -623,7 +623,7 @@ void __init s3c24xx_init_irq(void)
 
 		__raw_writel(pend, S3C2410_SRCPND);
 		__raw_writel(pend, S3C2410_INTPND);
-		printk("irq: clearing pending status %08x\n", (int)pend);
+		pr_info("irq: clearing pending status %08x\n", (int)pend);
 		last = pend;
 	}
 
@@ -634,7 +634,7 @@ void __init s3c24xx_init_irq(void)
 		if (pend = 0 || pend = last)
 			break;
 
-		printk("irq: clearing subpending status %08x\n", (int)pend);
+		pr_info("irq: clearing subpending status %08x\n", (int)pend);
 		__raw_writel(pend, S3C2410_SUBSRCPND);
 		last = pend;
 	}
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
