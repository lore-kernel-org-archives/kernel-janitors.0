From: James Nelson <james4765@gmail.com>
Date: Thu, 07 Sep 2006 22:09:14 +0000
Subject: [KJ] [PATCH] alpha: add KERN_ constants to
Message-Id: <20060907220914.9420.86438.sendpatchset@david.homenet>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Signed-off-by: James Nelson <james4765@gmail.com>
---
diff --git a/arch/alpha/lib/stacktrace.c b/arch/alpha/lib/stacktrace.c
index 6d432e4..1932151 100644
--- a/arch/alpha/lib/stacktrace.c
+++ b/arch/alpha/lib/stacktrace.c
@@ -52,7 +52,7 @@ display_stored_regs(instr * pro_pc, unsi
 	int reg;
 	unsigned long value;
 
-	printk("Prologue [<%p>], Frame %p:\n", pro_pc, sp);
+	pr_info("Prologue [<%p>], Frame %p:\n", pro_pc, sp);
 	while (!BB_END(*pro_pc))
 		if (STK_PUSH_MATCH(*pro_pc)) {
 			reg = (*pro_pc & MEM_REG) >> 21;
@@ -94,7 +94,7 @@ stacktrace(void)
 	instr * prologue = (instr *)stacktrace;
 	register unsigned char * sp __asm__ ("$30");
 
-	printk("\tstack trace:\n");
+	pr_info("\tstack trace:\n");
 	do {
 		ret_pc = display_stored_regs(prologue, sp);
 		sp += stack_increment(prologue);
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
