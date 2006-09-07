From: James Nelson <james4765@gmail.com>
Date: Thu, 07 Sep 2006 23:26:38 +0000
Subject: [KJ] [PATCH 6/6] arm: add KERN_ constants to arch/arm/kernel/traps.c
Message-Id: <20060907232638.9720.12757.sendpatchset@david.homenet>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Signed-off-by: James Nelson <james4765@gmail.com>
---
diff --git a/arch/arm/kernel/traps.c b/arch/arm/kernel/traps.c
index aeeed80..6f4b45b 100644
--- a/arch/arm/kernel/traps.c
+++ b/arch/arm/kernel/traps.c
@@ -54,12 +54,12 @@ #endif
 void dump_backtrace_entry(unsigned long where, unsigned long from)
 {
 #ifdef CONFIG_KALLSYMS
-	printk("[<%08lx>] ", where);
+	pr_info("[<%08lx>] ", where);
 	print_symbol("(%s) ", where);
 	printk("from [<%08lx>] ", from);
 	print_symbol("(%s)\n", from);
 #else
-	printk("Function entered at [<%08lx>] from [<%08lx>]\n", where, from);
+	pr_info("Function entered at [<%08lx>] from [<%08lx>]\n", where, from);
 #endif
 }
 
@@ -93,10 +93,10 @@ static void dump_mem(const char *str, un
 	fs = get_fs();
 	set_fs(KERNEL_DS);
 
-	printk("%s(0x%08lx to 0x%08lx)\n", str, bottom, top);
+	pr_info("%s(0x%08lx to 0x%08lx)\n", str, bottom, top);
 
 	for (p = bottom & ~31; p < top;) {
-		printk("%04lx: ", p & 0xffff);
+		pr_info("%04lx: ", p & 0xffff);
 
 		for (i = 0; i < 8; i++, p += 4) {
 			unsigned int val;
@@ -130,7 +130,7 @@ static void dump_instr(struct pt_regs *r
 	fs = get_fs();
 	set_fs(KERNEL_DS);
 
-	printk("Code: ");
+	pr_info("Code: ");
 	for (i = -4; i < 1; i++) {
 		unsigned int val, bad;
 
@@ -156,7 +156,7 @@ static void dump_backtrace(struct pt_reg
 	unsigned int fp;
 	int ok = 1;
 
-	printk("Backtrace: ");
+	pr_info("Backtrace: ");
 	fp = regs->ARM_fp;
 	if (!fp) {
 		printk("no frame pointer");
@@ -202,10 +202,10 @@ static void __die(const char *str, int e
 	struct task_struct *tsk = thread->task;
 	static int die_counter;
 
-	printk("Internal error: %s: %x [#%d]\n", str, err, ++die_counter);
+	printk(KERN_ERR "Internal error: %s: %x [#%d]\n", str, err, ++die_counter);
 	print_modules();
 	__show_regs(regs);
-	printk("Process %s (pid: %d, stack limit = 0x%p)\n",
+	printk(KERN_ERR "Process %s (pid: %d, stack limit = 0x%p)\n",
 		tsk->comm, tsk->pid, thread + 1);
 
 	if (!user_mode(regs) || in_interrupt()) {
@@ -325,8 +325,8 @@ #endif
 asmlinkage void do_unexp_fiq (struct pt_regs *regs)
 {
 #ifndef CONFIG_IGNORE_FIQ
-	printk("Hmm.  Unexpected FIQ received, but trying to continue\n");
-	printk("You may have a hardware problem...\n");
+	printk(KERN_WARNING "Hmm.  Unexpected FIQ received, but trying to continue\n");
+	printk(KERN_WARNING "You may have a hardware problem...\n");
 #endif
 }
 
@@ -598,7 +598,7 @@ #endif
 
 void __bad_xchg(volatile void *ptr, int size)
 {
-	printk("xchg: bad data size: pc 0x%p, ptr 0x%p, size %d\n",
+	printk(KERN_ERR "xchg: bad data size: pc 0x%p, ptr 0x%p, size %d\n",
 		__builtin_return_address(0), ptr, size);
 	BUG();
 }
@@ -633,7 +633,7 @@ #endif
 
 void __attribute__((noreturn)) __bug(const char *file, int line, void *data)
 {
-	printk(KERN_CRIT"kernel BUG at %s:%d!", file, line);
+	printk(KERN_CRIT "kernel BUG at %s:%d!", file, line);
 	if (data)
 		printk(" - extra data = %p", data);
 	printk("\n");
@@ -646,29 +646,29 @@ EXPORT_SYMBOL(__bug);
 
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
+	printk(KERN_ERR "%s:%d: bad pte %08lx\n", file, line, val);
 }
 
 void __pmd_error(const char *file, int line, unsigned long val)
 {
-	printk("%s:%d: bad pmd %08lx.\n", file, line, val);
+	printk(KERN_ERR "%s:%d: bad pmd %08lx\n", file, line, val);
 }
 
 void __pgd_error(const char *file, int line, unsigned long val)
 {
-	printk("%s:%d: bad pgd %08lx.\n", file, line, val);
+	printk(KERN_ERR "%s:%d: bad pgd %08lx\n", file, line, val);
 }
 
 asmlinkage void __div0(void)
 {
-	printk("Division by zero in kernel.\n");
+	printk(KERN_ERR "Division by zero in kernel\n");
 	dump_stack();
 }
 EXPORT_SYMBOL(__div0);
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
