From: "slackfan@users.sourceforge.net" <slackfan@users.sourceforge.net>
Date: Fri, 21 Oct 2005 18:58:23 +0000
Subject: [KJ] [PATCH] arch/i386/kernel/process.c
Message-Id: <4359539D.2060608@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

printk() calls should include appropriate KERN_* constant

Signed-off-by: Anton Brondz <anton.slack@tele2.no>

*--- linux-2.6.14-rc4.orig/arch/i386/kernel/process.c	2005-10-11 01:19:19.000000000 +0000*
*+++ linux-2.6.14-rc4/arch/i386/kernel/process.c	2005-10-20 22:42:41.000000000 +0000*
@@ -259,13 +259,13 @@ static void mwait_idle(void)
 void __devinit select_idle_routine(const struct cpuinfo_x86 *c)
 {
 	if (cpu_has(c, X86_FEATURE_MWAIT)) {
-		printk("monitor/mwait feature present.\n");
+		printk(KERN_INFO "monitor/mwait feature present.\n");
 		/*
 		 * Skip, if setup has overridden idle.
 		 * One CPU supports mwait => All CPUs supports mwait
 		 */
 		if (!pm_idle) {
-			printk("using mwait in idle threads.\n");
+			printk(KERN_INFO "using mwait in idle threads.\n");
 			pm_idle = mwait_idle;
 		}
 	}
@@ -274,14 +274,14 @@ void __devinit select_idle_routine(const
 static int __init idle_setup (char *str)
 {
 	if (!strncmp(str, "poll", 4)) {
-		printk("using polling idle threads.\n");
+		printk(KERN_DEBUG "using polling idle threads.\n");
 		pm_idle = poll_idle;
 #ifdef CONFIG_X86_SMP
 		if (smp_num_siblings > 1)
-			printk("WARNING: polling idle and HT enabled, performance may degrade.\n");
+			printk(KERN_NOTICE "WARNING: polling idle and HT enabled, performance may degrade.\n");
 #endif
 	} else if (!strncmp(str, "halt", 4)) {
-		printk("using halt in idle threads.\n");
+		printk(KERN_INFO "using halt in idle threads.\n");
 		pm_idle = default_idle;
 	}
 
@@ -296,19 +296,19 @@ void show_regs(struct pt_regs * regs)
 	unsigned long cr0 = 0L, cr2 = 0L, cr3 = 0L, cr4 = 0L;
 
 	printk("\n");
-	printk("Pid: %d, comm: %20s\n", current->pid, current->comm);
-	printk("EIP: %04x:[<%08lx>] CPU: %d\n",0xffff & regs->xcs,regs->eip, smp_processor_id());
-	print_symbol("EIP is at %s\n", regs->eip);
+	printk(KERN_DEBUG "Pid: %d, comm: %20s\n", current->pid, current->comm);
+	printk(KERN_DEBUG "EIP: %04x:[<%08lx>] CPU: %d\n",0xffff & regs->xcs,regs->eip, smp_processor_id());
+	print_symbol(KERN_DEBUG "EIP is at %s\n", regs->eip);
 
 	if (user_mode(regs))
-		printk(" ESP: %04x:%08lx",0xffff & regs->xss,regs->esp);
-	printk(" EFLAGS: %08lx    %s  (%s)\n",
+		printk(KERN_DEBUG " ESP: %04x:%08lx",0xffff & regs->xss,regs->esp);
+	printk(KERN_DEBUG " EFLAGS: %08lx    %s  (%s)\n",
 	       regs->eflags, print_tainted(), system_utsname.release);
-	printk("EAX: %08lx EBX: %08lx ECX: %08lx EDX: %08lx\n",
+	printk(KERN_DEBUG "EAX: %08lx EBX: %08lx ECX: %08lx EDX: %08lx\n",
 		regs->eax,regs->ebx,regs->ecx,regs->edx);
-	printk("ESI: %08lx EDI: %08lx EBP: %08lx",
+	printk(KERN_DEBUG "ESI: %08lx EDI: %08lx EBP: %08lx",
 		regs->esi, regs->edi, regs->ebp);
-	printk(" DS: %04x ES: %04x\n",
+	printk(KERN_DEBUG " DS: %04x ES: %04x\n",
 		0xffff & regs->xds,0xffff & regs->xes);
 
 	cr0 = read_cr0();
@@ -317,7 +317,7 @@ void show_regs(struct pt_regs * regs)
 	if (current_cpu_data.x86 > 4) {
 		cr4 = read_cr4();
 	}
-	printk("CR0: %08lx CR2: %08lx CR3: %08lx CR4: %08lx\n", cr0, cr2, cr3, cr4);
+	printk(KERN_DEBUG "CR0: %08lx CR2: %08lx CR3: %08lx CR4: %08lx\n", cr0, cr2, cr3, cr4);
 	show_trace(NULL, &regs->esp);
 }
 
@@ -420,7 +420,7 @@ void release_thread(struct task_struct *
 	if (dead_task->mm) {
 		// temporary debugging check
 		if (dead_task->mm->context.size) {
-			printk("WARNING: dead process %8s still has LDT? <%p/%d>\n",
+			printk(KERN_WARNING "WARNING: dead process %8s still has LDT? <%p/%d>\n",
 					dead_task->comm,
 					dead_task->mm->context.ldt,
 					dead_task->mm->context.size);


_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
