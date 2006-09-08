From: James Nelson <james4765@gmail.com>
Date: Fri, 08 Sep 2006 02:00:13 +0000
Subject: [KJ] [PATCH 34/72] arm: add KERN_ constants to
Message-Id: <20060908020013.10114.25251.sendpatchset@david.homenet>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Signed-off-by: James Nelson <james4765@gmail.com>
---
diff --git a/arch/arm/mach-s3c2410/cpu.c b/arch/arm/mach-s3c2410/cpu.c
index 1c3c6ad..a236fa3 100644
--- a/arch/arm/mach-s3c2410/cpu.c
+++ b/arch/arm/mach-s3c2410/cpu.c
@@ -220,7 +220,7 @@ void __init s3c24xx_init_io(struct map_d
 		panic("Unknown S3C24XX CPU");
 	}
 
-	printk("CPU %s (id 0x%08lx)\n", cpu->name, idcode);
+	pr_info("CPU %s (id 0x%08lx)\n", cpu->name, idcode);
 
 	if (cpu->map_io = NULL || cpu->init = NULL) {
 		printk(KERN_ERR "CPU %s support not enabled\n", cpu->name);
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
