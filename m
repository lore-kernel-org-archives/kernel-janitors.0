From: James Nelson <james4765@gmail.com>
Date: Fri, 08 Sep 2006 02:01:20 +0000
Subject: [KJ] [PATCH 44/72] arm: add KERN_ constants to
Message-Id: <20060908020120.10114.87022.sendpatchset@david.homenet>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Signed-off-by: James Nelson <james4765@gmail.com>
---
diff --git a/arch/arm/mach-s3c2410/s3c2440-irq.c b/arch/arm/mach-s3c2410/s3c2440-irq.c
index acfe387..b5a4570 100644
--- a/arch/arm/mach-s3c2410/s3c2440-irq.c
+++ b/arch/arm/mach-s3c2410/s3c2440-irq.c
@@ -104,7 +104,7 @@ static int s3c2440_irq_add(struct sys_de
 {
 	unsigned int irqno;
 
-	printk("S3C2440: IRQ Support\n");
+	pr_info("S3C2440: IRQ Support\n");
 
 	/* add new chained handler for wdt, ac7 */
 
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
