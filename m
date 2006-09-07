From: James Nelson <james4765@gmail.com>
Date: Thu, 07 Sep 2006 23:26:32 +0000
Subject: [KJ] [PATCH 5/6] arm: add KERN_ constants to arch/arm/kernel/smp.c
Message-Id: <20060907232631.9720.35354.sendpatchset@david.homenet>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Signed-off-by: James Nelson <james4765@gmail.com>
---
diff --git a/arch/arm/kernel/smp.c b/arch/arm/kernel/smp.c
index 68e9634..daa6739 100644
--- a/arch/arm/kernel/smp.c
+++ b/arch/arm/kernel/smp.c
@@ -212,7 +212,7 @@ int __cpuexit __cpu_disable(void)
 void __cpuexit __cpu_die(unsigned int cpu)
 {
 	if (!platform_cpu_kill(cpu))
-		printk("CPU%u: unable to kill\n", cpu);
+		printk(KERN_ERR "CPU%u: unable to kill\n", cpu);
 }
 
 /*
@@ -257,7 +257,7 @@ asmlinkage void __cpuinit secondary_star
 	struct mm_struct *mm = &init_mm;
 	unsigned int cpu = smp_processor_id();
 
-	printk("CPU%u: Booted secondary processor\n", cpu);
+	pr_info("CPU%u: Booted secondary processor\n", cpu);
 
 	/*
 	 * All kernel threads share the same mm context; grab a
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
