From: James Nelson <james4765@gmail.com>
Date: Tue, 12 Sep 2006 03:20:56 +0000
Subject: [KJ] [PATCH 2/7][RESEND] arm: add KERN_* constants to printk()'s in
Message-Id: <20060912032056.5999.58964.sendpatchset@david.homenet>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Diffstat:

 bios32.c  |    8 ++++----
 ecard.c   |    8 ++++----
 process.c |   29 ++++++++++++++---------------
 setup.c   |   22 +++++++++++-----------
 smp.c     |    4 ++--
 traps.c   |   34 +++++++++++++++++-----------------
 6 files changed, 52 insertions(+), 53 deletions(-)

Signed-off-by: James Nelson <james4765@gmail.com>

---
diff --git a/arch/arm/kernel/bios32.c b/arch/arm/kernel/bios32.c
index 240c448..c5afff3 100644
--- a/arch/arm/kernel/bios32.c
+++ b/arch/arm/kernel/bios32.c
@@ -282,7 +282,7 @@ DECLARE_PCI_FIXUP_HEADER(PCI_VENDOR_ID_C
 void __devinit pcibios_update_irq(struct pci_dev *dev, int irq)
 {
 	if (debug_pci)
-		printk("PCI: Assigning IRQ %02d to %s\n", irq, pci_name(dev));
+		pr_info("PCI: Assigning IRQ %02d to %s\n", irq, pci_name(dev));
 	pci_write_config_byte(dev, PCI_INTERRUPT_LINE, irq);
 }
 
@@ -497,7 +497,7 @@ static u8 __devinit pcibios_swizzle(stru
 		slot = sys->swizzle(dev, pin);
 
 	if (debug_pci)
-		printk("PCI: %s swizzling pin %d => pin %d slot %d\n",
+		pr_info("PCI: %s swizzling pin %d => pin %d slot %d\n",
 			pci_name(dev), oldpin, *pin, slot);
 
 	return slot;
@@ -515,7 +515,7 @@ static int pcibios_map_irq(struct pci_de
 		irq = sys->map_irq(dev, slot, pin);
 
 	if (debug_pci)
-		printk("PCI: %s mapping slot %d pin %d => irq %d\n",
+		pr_info("PCI: %s mapping slot %d pin %d => irq %d\n",
 			pci_name(dev), slot, pin, irq);
 
 	return irq;
@@ -668,7 +668,7 @@ int pcibios_enable_device(struct pci_dev
 		cmd |= PCI_COMMAND_IO | PCI_COMMAND_MEMORY;
 
 	if (cmd != old_cmd) {
-		printk("PCI: enabling device %s (%04x -> %04x)\n",
+		pr_info("PCI: enabling device %s (%04x -> %04x)\n",
 		       pci_name(dev), old_cmd, cmd);
 		pci_write_config_word(dev, PCI_COMMAND, cmd);
 	}
diff --git a/arch/arm/kernel/ecard.c b/arch/arm/kernel/ecard.c
index eca248d..b277321 100644
--- a/arch/arm/kernel/ecard.c
+++ b/arch/arm/kernel/ecard.c
@@ -510,13 +510,13 @@ static void ecard_dump_irq_state(void)
 {
 	ecard_t *ec;
 
-	printk("Expansion card IRQ state:\n");
+	pr_info("Expansion card IRQ state:\n");
 
 	for (ec = cards; ec; ec = ec->next) {
 		if (ec->slot_no = 8)
 			continue;
 
-		printk("  %d: %sclaimed, ",
+		pr_info("  %d: %sclaimed, ",
 		       ec->slot_no, ec->claimed ? "" : "not ");
 
 		if (ec->ops && ec->ops->irqpending &&
@@ -546,7 +546,7 @@ static void ecard_check_lockup(struct ir
 	if (last = jiffies) {
 		lockup += 1;
 		if (lockup > 1000000) {
-			printk(KERN_ERR "\nInterrupt lockup detected - "
+			printk(KERN_ERR "Interrupt lockup detected - "
 			       "disabling all expansion card interrupts\n");
 
 			desc->chip->mask(IRQ_EXPANSIONCARD);
@@ -1067,7 +1067,7 @@ static int __init ecard_init(void)
 		return ret;
 	}
 
-	printk("Probing expansion cards\n");
+	pr_info("Probing expansion cards\n");
 
 	for (slot = 0; slot < 8; slot ++) {
 		if (ecard_probe(slot, ECARD_EASI) = -ENODEV)
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
diff --git a/arch/arm/kernel/setup.c b/arch/arm/kernel/setup.c
index 0a722e7..a3e3160 100644
--- a/arch/arm/kernel/setup.c
+++ b/arch/arm/kernel/setup.c
@@ -258,7 +258,7 @@ static inline void dump_cache(const char
 {
 	unsigned int mult = 2 + (CACHE_M(cache) ? 1 : 0);
 
-	printk("CPU%u: %s: %d bytes, associativity %d, %d byte lines, %d sets\n",
+	pr_info("CPU%u: %s: %d bytes, associativity %d, %d byte lines, %d sets\n",
 		cpu, prefix,
 		mult << (8 + CACHE_SIZE(cache)),
 		(mult << CACHE_ASSOC(cache)) >> 1,
@@ -272,7 +272,7 @@ static void __init dump_cpu_info(int cpu
 	unsigned int info = read_cpuid(CPUID_CACHETYPE);
 
 	if (info != processor_id) {
-		printk("CPU%u: D %s %s cache\n", cpu, cache_is_vivt() ? "VIVT" : "VIPT",
+		pr_info("CPU%u: D %s %s cache\n", cpu, cache_is_vivt() ? "VIVT" : "VIPT",
 		       cache_types[CACHE_TYPE(info)]);
 		if (CACHE_S(info)) {
 			dump_cache("I cache", cpu, CACHE_ISIZE(info));
@@ -283,7 +283,7 @@ static void __init dump_cpu_info(int cpu
 	}
 
 	if (arch_is_coherent())
-		printk("Cache coherency enabled\n");
+		pr_info("Cache coherency enabled\n");
 }
 
 int cpu_architecture(void)
@@ -324,8 +324,8 @@ static void __init setup_processor(void)
 	 */
 	list = lookup_processor_type(processor_id);
 	if (!list) {
-		printk("CPU configuration botched (ID %08x), unable "
-		       "to continue.\n", processor_id);
+		printk(KERN_CRIT "CPU configuration botched (ID %08x), unable "
+		       "to continue\n", processor_id);
 		while (1);
 	}
 
@@ -344,7 +344,7 @@ #ifdef MULTI_CACHE
 	cpu_cache = *list->cache;
 #endif
 
-	printk("CPU: %s [%08x] revision %d (ARMv%s), cr=%08lx\n",
+	pr_info("CPU: %s [%08x] revision %d (ARMv%s), cr=%08lx\n",
 	       cpu_name, processor_id, (int)processor_id & 15,
 	       proc_arch[cpu_architecture()], cr_alignment);
 
@@ -412,12 +412,12 @@ static struct machine_desc * __init setu
 	 */
 	list = lookup_machine_type(nr);
 	if (!list) {
-		printk("Machine configuration botched (nr %d), unable "
-		       "to continue.\n", nr);
+		printk(KERN_CRIT "Machine configuration botched (nr %d), unable "
+		       "to continue\n", nr);
 		while (1);
 	}
 
-	printk("Machine: %s\n", list->name);
+	pr_info("Machine: %s\n", list->name);
 
 	return list;
 }
@@ -661,8 +661,8 @@ __tagtable(ATAG_RAMDISK, parse_tag_ramdi
 
 static int __init parse_tag_initrd(const struct tag *tag)
 {
-	printk(KERN_WARNING "ATAG_INITRD is deprecated; "
-		"please update your bootloader.\n");
+	printk(KERN_WARNING "ATAG_INITRD is deprecated - "
+		"please update your bootloader\n");
 	phys_initrd_start = __virt_to_phys(tag->u.initrd.start);
 	phys_initrd_size = tag->u.initrd.size;
 	return 0;
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
