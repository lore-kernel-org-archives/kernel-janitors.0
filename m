From: James Nelson <james4765@gmail.com>
Date: Wed, 30 Aug 2006 21:49:38 +0000
Subject: [KJ] [PATCH] 37/37 alpha: add printk() KERN_ constants to
Message-Id: <20060830214938.15055.91428.sendpatchset@david.homenet>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Signed-off-by: James Nelson <james4765@gmail.com>
---
diff --git a/arch/alpha/kernel/traps.c b/arch/alpha/kernel/traps.c
index d6e665d..7a468d3 100644
--- a/arch/alpha/kernel/traps.c
+++ b/arch/alpha/kernel/traps.c
@@ -56,40 +56,40 @@ opDEC_check(void)
 	: "$0", "$1", "$16", "$17", "$22", "$23", "$24", "$25");
 
 	if (opDEC_fix)
-		printk("opDEC fixup enabled.\n");
+		pr_info("opDEC fixup enabled\n");
 }
 
 void
 dik_show_regs(struct pt_regs *regs, unsigned long *r9_15)
 {
-	printk("pc = [<%016lx>]  ra = [<%016lx>]  ps = %04lx    %s\n",
+	pr_info("pc = [<%016lx>]  ra = [<%016lx>]  ps = %04lx    %s\n",
 	       regs->pc, regs->r26, regs->ps, print_tainted());
 	print_symbol("pc is at %s\n", regs->pc);
 	print_symbol("ra is at %s\n", regs->r26 );
-	printk("v0 = %016lx  t0 = %016lx  t1 = %016lx\n",
+	pr_info("v0 = %016lx  t0 = %016lx  t1 = %016lx\n",
 	       regs->r0, regs->r1, regs->r2);
-	printk("t2 = %016lx  t3 = %016lx  t4 = %016lx\n",
+	pr_info("t2 = %016lx  t3 = %016lx  t4 = %016lx\n",
  	       regs->r3, regs->r4, regs->r5);
-	printk("t5 = %016lx  t6 = %016lx  t7 = %016lx\n",
+	pr_info("t5 = %016lx  t6 = %016lx  t7 = %016lx\n",
 	       regs->r6, regs->r7, regs->r8);
 
 	if (r9_15) {
-		printk("s0 = %016lx  s1 = %016lx  s2 = %016lx\n",
+		pr_info("s0 = %016lx  s1 = %016lx  s2 = %016lx\n",
 		       r9_15[9], r9_15[10], r9_15[11]);
-		printk("s3 = %016lx  s4 = %016lx  s5 = %016lx\n",
+		pr_info("s3 = %016lx  s4 = %016lx  s5 = %016lx\n",
 		       r9_15[12], r9_15[13], r9_15[14]);
-		printk("s6 = %016lx\n", r9_15[15]);
+		pr_info("s6 = %016lx\n", r9_15[15]);
 	}
 
-	printk("a0 = %016lx  a1 = %016lx  a2 = %016lx\n",
+	pr_info("a0 = %016lx  a1 = %016lx  a2 = %016lx\n",
 	       regs->r16, regs->r17, regs->r18);
-	printk("a3 = %016lx  a4 = %016lx  a5 = %016lx\n",
+	pr_info("a3 = %016lx  a4 = %016lx  a5 = %016lx\n",
  	       regs->r19, regs->r20, regs->r21);
- 	printk("t8 = %016lx  t9 = %016lx  t10= %016lx\n",
+ 	pr_info("t8 = %016lx  t9 = %016lx  t10= %016lx\n",
 	       regs->r22, regs->r23, regs->r24);
-	printk("t11= %016lx  pv = %016lx  at = %016lx\n",
+	pr_info("t11= %016lx  pv = %016lx  at = %016lx\n",
 	       regs->r25, regs->r27, regs->r28);
-	printk("gp = %016lx  sp = %p\n", regs->gp, regs+1);
+	pr_info("gp = %016lx  sp = %p\n", regs->gp, regs+1);
 #if 0
 __halt();
 #endif
@@ -107,7 +107,7 @@ dik_show_code(unsigned int *pc)
 {
 	long i;
 
-	printk("Code:");
+	pr_info("Code:");
 	for (i = -6; i < 2; i++) {
 		unsigned int insn;
 		if (__get_user(insn, (unsigned int __user *)pc + i))
@@ -121,7 +121,7 @@ static void
 dik_show_trace(unsigned long *sp)
 {
 	long i = 0;
-	printk("Trace:\n");
+	pr_info("Trace:\n");
 	while (0x1ff8 & (unsigned long) sp) {
 		extern char _stext[], _etext[];
 		unsigned long tmp = *sp;
@@ -130,7 +130,7 @@ dik_show_trace(unsigned long *sp)
 			continue;
 		if (tmp >= (unsigned long) &_etext)
 			continue;
-		printk("[<%lx>]", tmp);
+		pr_info("[<%lx>]", tmp);
 		print_symbol(" %s", tmp);
 		printk("\n");
 		if (i > 40) {
@@ -138,7 +138,6 @@ dik_show_trace(unsigned long *sp)
 			break;
 		}
 	}
-	printk("\n");
 }
 
 static int kstack_depth_to_print = 24;
@@ -180,15 +179,15 @@ die_if_kernel(char * str, struct pt_regs
 	if (regs->ps & 8)
 		return;
 #ifdef CONFIG_SMP
-	printk("CPU %d ", hard_smp_processor_id());
+	pr_info("CPU %d ", hard_smp_processor_id());
 #endif
-	printk("%s(%d): %s %ld\n", current->comm, current->pid, str, err);
+	pr_info("%s(%d): %s %ld\n", current->comm, current->pid, str, err);
 	dik_show_regs(regs, r9_15);
 	dik_show_trace((unsigned long *)(regs+1));
 	dik_show_code((unsigned int *)regs->pc);
 
 	if (test_and_set_thread_flag (TIF_DIE_IF_KERNEL)) {
-		printk("die_if_kernel recursion detected.\n");
+		printk(KERN_CRIT "die_if_kernel recursion detected.\n");
 		local_irq_enable();
 		while (1);
 	}
@@ -243,7 +242,7 @@ do_entIF(unsigned long type, struct pt_r
 		if (type = 1) {
 			const unsigned int *data
 			  = (const unsigned int *) regs->pc;
-			printk("Kernel bug at %s:%d\n",
+			printk(KERN_CRIT "Kernel bug at %s:%d\n",
 			       (const char *)(data[1] | (long)data[2] << 32), 
 			       data[0]);
 		}
@@ -620,7 +619,7 @@ do_entUna(void * va, unsigned long opcod
 	}
 
 	lock_kernel();
-	printk("Bad unaligned kernel access at %016lx: %p %lx %ld\n",
+	printk(KERN_CRIT "Bad unaligned kernel access at %016lx: %p %lx %ld\n",
 		pc, va, opcode, reg);
 	do_exit(SIGSEGV);
 
@@ -631,7 +630,7 @@ got_exception:
 		unsigned long newpc;
 		newpc = fixup_exception(una_reg, fixup, pc);
 
-		printk("Forwarding unaligned exception at %lx (%lx)\n",
+		pr_info("Forwarding unaligned exception at %lx (%lx)\n",
 		       pc, newpc);
 
 		regs->pc = newpc;
@@ -644,37 +643,37 @@ got_exception:
  	 */
 	lock_kernel();
 
-	printk("%s(%d): unhandled unaligned exception\n",
+	printk(KERN_CRIT "%s(%d): unhandled unaligned exception\n",
 	       current->comm, current->pid);
 
-	printk("pc = [<%016lx>]  ra = [<%016lx>]  ps = %04lx\n",
+	printk(KERN_CRIT "pc = [<%016lx>]  ra = [<%016lx>]  ps = %04lx\n",
 	       pc, una_reg(26), regs->ps);
-	printk("r0 = %016lx  r1 = %016lx  r2 = %016lx\n",
+	printk(KERN_CRIT "r0 = %016lx  r1 = %016lx  r2 = %016lx\n",
 	       una_reg(0), una_reg(1), una_reg(2));
-	printk("r3 = %016lx  r4 = %016lx  r5 = %016lx\n",
+	printk(KERN_CRIT "r3 = %016lx  r4 = %016lx  r5 = %016lx\n",
  	       una_reg(3), una_reg(4), una_reg(5));
-	printk("r6 = %016lx  r7 = %016lx  r8 = %016lx\n",
+	printk(KERN_CRIT "r6 = %016lx  r7 = %016lx  r8 = %016lx\n",
 	       una_reg(6), una_reg(7), una_reg(8));
-	printk("r9 = %016lx  r10= %016lx  r11= %016lx\n",
+	printk(KERN_CRIT "r9 = %016lx  r10= %016lx  r11= %016lx\n",
 	       una_reg(9), una_reg(10), una_reg(11));
-	printk("r12= %016lx  r13= %016lx  r14= %016lx\n",
+	printk(KERN_CRIT "r12= %016lx  r13= %016lx  r14= %016lx\n",
 	       una_reg(12), una_reg(13), una_reg(14));
-	printk("r15= %016lx\n", una_reg(15));
-	printk("r16= %016lx  r17= %016lx  r18= %016lx\n",
+	printk(KERN_CRIT "r15= %016lx\n", una_reg(15));
+	printk(KERN_CRIT "r16= %016lx  r17= %016lx  r18= %016lx\n",
 	       una_reg(16), una_reg(17), una_reg(18));
-	printk("r19= %016lx  r20= %016lx  r21= %016lx\n",
+	printk(KERN_CRIT "r19= %016lx  r20= %016lx  r21= %016lx\n",
  	       una_reg(19), una_reg(20), una_reg(21));
- 	printk("r22= %016lx  r23= %016lx  r24= %016lx\n",
+ 	printk(KERN_CRIT "r22= %016lx  r23= %016lx  r24= %016lx\n",
 	       una_reg(22), una_reg(23), una_reg(24));
-	printk("r25= %016lx  r27= %016lx  r28= %016lx\n",
+	printk(KERN_CRIT "r25= %016lx  r27= %016lx  r28= %016lx\n",
 	       una_reg(25), una_reg(27), una_reg(28));
-	printk("gp = %016lx  sp = %p\n", regs->gp, regs+1);
+	printk(KERN_CRIT "gp = %016lx  sp = %p\n", regs->gp, regs+1);
 
 	dik_show_code((unsigned int *)pc);
 	dik_show_trace((unsigned long *)(regs+1));
 
 	if (test_and_set_thread_flag (TIF_DIE_IF_KERNEL)) {
-		printk("die_if_kernel recursion detected.\n");
+		printk(KERN_CRIT "die_if_kernel recursion detected.\n");
 		local_irq_enable();
 		while (1);
 	}
@@ -784,7 +783,7 @@ do_entUnaUser(void __user * va, unsigned
 			cnt = 0;
 		}
 		if (++cnt < 5) {
-			printk("%s(%d): unaligned trap at %016lx: %p %lx %ld\n",
+			pr_info("%s(%d): unaligned trap at %016lx: %p %lx %ld\n",
 			       current->comm, current->pid,
 			       regs->pc - 4, va, opcode, reg);
 		}
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
