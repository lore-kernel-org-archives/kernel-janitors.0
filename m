From: Christophe Lucas <clucas@rotomalug.org>
Date: Thu, 26 Jan 2006 11:47:51 +0000
Subject: [KJ] [PATCH] printk : arch/arm/kernel/traps.c
Message-Id: <20060126114751.GH8401@rotomalug.org>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============87597196475061212=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============87597196475061212==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Description:
printk should include appropriate KERN_* constant (of course
only at beginning of lines).

Signed-off-by: Christophe Lucas <clucas@rotomalug.org>


Index: linux-2.6.15/arch/arm/kernel/traps.c
===================================================================
--- linux-2.6.15.orig/arch/arm/kernel/traps.c	2006-01-03 04:21:10.000000000 +0100
+++ linux-2.6.15/arch/arm/kernel/traps.c	2006-01-26 12:37:07.000000000 +0100
@@ -55,12 +55,12 @@
 void dump_backtrace_entry(unsigned long where, unsigned long from)
 {
 #ifdef CONFIG_KALLSYMS
-	printk("[<%08lx>] ", where);
+	printk(KERN_DEBUG "[<%08lx>] ", where);
 	print_symbol("(%s) ", where);
 	printk("from [<%08lx>] ", from);
 	print_symbol("(%s)\n", from);
 #else
-	printk("Function entered at [<%08lx>] from [<%08lx>]\n", where, from);
+	printk(KERN_DEBUG "Function entered at [<%08lx>] from [<%08lx>]\n", where, from);
 #endif
 }
 
@@ -94,10 +94,10 @@
 	fs = get_fs();
 	set_fs(KERNEL_DS);
 
-	printk("%s(0x%08lx to 0x%08lx)\n", str, bottom, top);
+	printk(KERN_DEBUG "%s(0x%08lx to 0x%08lx)\n", str, bottom, top);
 
 	for (p = bottom & ~31; p < top;) {
-		printk("%04lx: ", p & 0xffff);
+		printk(KERN_DEBUG "%04lx: ", p & 0xffff);
 
 		for (i = 0; i < 8; i++, p += 4) {
 			unsigned int val;
@@ -131,7 +131,7 @@
 	fs = get_fs();
 	set_fs(KERNEL_DS);
 
-	printk("Code: ");
+	printk(KERN_DEBUG "Code: ");
 	for (i = -4; i < 1; i++) {
 		unsigned int val, bad;
 
@@ -157,7 +157,7 @@
 	unsigned int fp;
 	int ok = 1;
 
-	printk("Backtrace: ");
+	printk(KERN_DEBUG "Backtrace: ");
 	fp = regs->ARM_fp;
 	if (!fp) {
 		printk("no frame pointer");
@@ -203,10 +203,10 @@
 	struct task_struct *tsk = thread->task;
 	static int die_counter;
 
-	printk("Internal error: %s: %x [#%d]\n", str, err, ++die_counter);
+	printk(KERN_CRIT "Internal error: %s: %x [#%d]\n", str, err, ++die_counter);
 	print_modules();
 	__show_regs(regs);
-	printk("Process %s (pid: %d, stack limit = 0x%p)\n",
+	printk(KERN_CRIT "Process %s (pid: %d, stack limit = 0x%p)\n",
 		tsk->comm, tsk->pid, thread + 1);
 
 	if (!user_mode(regs) || in_interrupt()) {
@@ -322,8 +322,8 @@
 asmlinkage void do_unexp_fiq (struct pt_regs *regs)
 {
 #ifndef CONFIG_IGNORE_FIQ
-	printk("Hmm.  Unexpected FIQ received, but trying to continue\n");
-	printk("You may have a hardware problem...\n");
+	printk(KERN_INFO "Hmm.  Unexpected FIQ received, but trying to continue\n");
+	printk(KERN_INFO "You may have a hardware problem...\n");
 #endif
 }
 
@@ -536,7 +536,7 @@
 	 * something catastrophic has happened
 	 */
 	if (user_debug & UDBG_SYSCALL) {
-		printk("[%d] %s: arm syscall %d\n",
+		printk(KERN_DEBUG "[%d] %s: arm syscall %d\n",
 		       current->pid, current->comm, no);
 		dump_instr(regs);
 		if (user_mode(regs)) {
@@ -595,7 +595,7 @@
 
 void __bad_xchg(volatile void *ptr, int size)
 {
-	printk("xchg: bad data size: pc 0x%p, ptr 0x%p, size %d\n",
+	printk(KERN_ERR "xchg: bad data size: pc 0x%p, ptr 0x%p, size %d\n",
 		__builtin_return_address(0), ptr, size);
 	BUG();
 }
@@ -643,29 +643,29 @@
 
 void __readwrite_bug(const char *fn)
 {
-	printk("%s called, but not implemented\n", fn);
+	printk(KERN_ERR "%s called, but not implemented\n", fn);
 	BUG();
 }
 EXPORT_SYMBOL(__readwrite_bug);
 
 void __pte_error(const char *file, int line, unsigned long val)
 {
-	printk("%s:%d: bad pte %08lx.\n", file, line, val);
+	printk(KERN_ERR "%s:%d: bad pte %08lx.\n", file, line, val);
 }
 
 void __pmd_error(const char *file, int line, unsigned long val)
 {
-	printk("%s:%d: bad pmd %08lx.\n", file, line, val);
+	printk(KERN_ERR "%s:%d: bad pmd %08lx.\n", file, line, val);
 }
 
 void __pgd_error(const char *file, int line, unsigned long val)
 {
-	printk("%s:%d: bad pgd %08lx.\n", file, line, val);
+	printk(KERN_ERR "%s:%d: bad pgd %08lx.\n", file, line, val);
 }
 
 asmlinkage void __div0(void)
 {
-	printk("Division by zero in kernel.\n");
+	printk(KERN_ERR "Division by zero in kernel.\n");
 	dump_stack();
 }
 EXPORT_SYMBOL(__div0);

--===============87597196475061212==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============87597196475061212==--
