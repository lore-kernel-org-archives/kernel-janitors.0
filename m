From: James Nelson <james4765@gmail.com>
Date: Thu, 07 Sep 2006 23:26:18 +0000
Subject: [KJ] [PATCH 3/6] arm: add KERN_ constants to
Message-Id: <20060907232618.9720.80865.sendpatchset@david.homenet>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Signed-off-by: James Nelson <james4765@gmail.com>
---
diff --git a/arch/arm/kernel/process.c b/arch/arm/kernel/process.c
index 3079535..56868bc 100644
--- a/arch/arm/kernel/process.c
+++ b/arch/arm/kernel/process.c
@@ -96,7 +96,7 @@ void arm_machine_restart(char mode)
 	 * Tell the user!
 	 */
 	mdelay(1000);
-	printk("Reboot failed -- System halted\n");
+	printk(KERN_CRIT "Reboot failed -- System halted\n");
 	while (1);
 }
 
@@ -193,24 +193,24 @@ void __show_regs(struct pt_regs *regs)
 {
 	unsigned long flags = condition_codes(regs);
 
-	printk("CPU: %d\n", smp_processor_id());
+	pr_info("CPU: %d\n", smp_processor_id());
 	print_symbol("PC is at %s\n", instruction_pointer(regs));
 	print_symbol("LR is at %s\n", regs->ARM_lr);
-	printk("pc : [<%08lx>]    lr : [<%08lx>]    %s\n"
-	       "sp : %08lx  ip : %08lx  fp : %08lx\n",
+	pr_info("pc : [<%08lx>]    lr : [<%08lx>]    %s\n",
 		instruction_pointer(regs),
-		regs->ARM_lr, print_tainted(), regs->ARM_sp,
-		regs->ARM_ip, regs->ARM_fp);
-	printk("r10: %08lx  r9 : %08lx  r8 : %08lx\n",
+		regs->ARM_lr, print_tainted());
+	pr_info("sp : %08lx  ip : %08lx  fp : %08lx\n",
+		regs->ARM_sp, regs->ARM_ip, regs->ARM_fp);
+	pr_info("r10: %08lx  r9 : %08lx  r8 : %08lx\n",
 		regs->ARM_r10, regs->ARM_r9,
 		regs->ARM_r8);
-	printk("r7 : %08lx  r6 : %08lx  r5 : %08lx  r4 : %08lx\n",
+	pr_info("r7 : %08lx  r6 : %08lx  r5 : %08lx  r4 : %08lx\n",
 		regs->ARM_r7, regs->ARM_r6,
 		regs->ARM_r5, regs->ARM_r4);
-	printk("r3 : %08lx  r2 : %08lx  r1 : %08lx  r0 : %08lx\n",
+	pr_info("r3 : %08lx  r2 : %08lx  r1 : %08lx  r0 : %08lx\n",
 		regs->ARM_r3, regs->ARM_r2,
 		regs->ARM_r1, regs->ARM_r0);
-	printk("Flags: %c%c%c%c",
+	pr_info("Flags: %c%c%c%c",
 		flags & PSR_N_BIT ? 'N' : 'n',
 		flags & PSR_Z_BIT ? 'Z' : 'z',
 		flags & PSR_C_BIT ? 'C' : 'c',
@@ -228,15 +228,14 @@ void __show_regs(struct pt_regs *regs)
 		"	mrc p15, 0, %1, c2, c0\n"
 		"	mrc p15, 0, %2, c3, c0\n"
 		: "=r" (ctrl), "=r" (transbase), "=r" (dac));
-		printk("Control: %04X  Table: %08X  DAC: %08X\n",
+		pr_info("Control: %04X  Table: %08X  DAC: %08X\n",
 		  	ctrl, transbase, dac);
 	}
 }
 
 void show_regs(struct pt_regs * regs)
 {
-	printk("\n");
-	printk("Pid: %d, comm: %20s\n", current->pid, current->comm);
+	pr_info("Pid: %d, comm: %20s\n", current->pid, current->comm);
 	__show_regs(regs);
 	__backtrace();
 }
@@ -260,12 +259,12 @@ void show_fpregs(struct user_fp *regs)
 		if (regs->init_flag)
 			type = '?';
 
-		printk("  f%d(%c): %08lx %08lx %08lx%c",
+		pr_info("  f%d(%c): %08lx %08lx %08lx%c",
 			i, type, p[0], p[1], p[2], i & 1 ? '\n' : ' ');
 	}
 			
 
-	printk("FPSR: %08lx FPCR: %08lx\n",
+	pr_info("FPSR: %08lx FPCR: %08lx\n",
 		(unsigned long)regs->fpsr,
 		(unsigned long)regs->fpcr);
 }
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
