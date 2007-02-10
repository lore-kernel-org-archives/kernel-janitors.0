From: Thomas Hisch <t.hisch@gmail.com>
Date: Sat, 10 Feb 2007 11:13:35 +0000
Subject: Re: [KJ] [PATCH] format specifier for the cpu number -> %u
Message-Id: <20070210111335.GA3247@unknown-00-0d-60-79-ca-00.lan>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20070209221521.GA3026@unknown-00-0d-60-79-ca-00.lan>
In-Reply-To: <20070209221521.GA3026@unknown-00-0d-60-79-ca-00.lan>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

changed format specifier for the cpu number in printk to %u
in arch/i386/kernel/cpu/mcheck/*

Signed-off-by: Thomas Hisch <t.hisch@gmail.com>
---
 arch/i386/kernel/cpu/mcheck/k7.c          |    4 ++--
 arch/i386/kernel/cpu/mcheck/mce.c         |    2 +-
 arch/i386/kernel/cpu/mcheck/non-fatal.c   |    2 +-
 arch/i386/kernel/cpu/mcheck/p4.c          |   16 ++++++++--------
 arch/i386/kernel/cpu/mcheck/p5.c          |    6 +++---
 arch/i386/kernel/cpu/mcheck/p6.c          |    4 ++--
 arch/i386/kernel/cpu/mcheck/therm_throt.c |    4 ++--
 arch/i386/kernel/cpu/mcheck/winchip.c     |    2 +-
 8 files changed, 20 insertions(+), 20 deletions(-)

diff --git a/arch/i386/kernel/cpu/mcheck/k7.c b/arch/i386/kernel/cpu/mcheck/k7.c
index b0862af..b1580a2 100644
--- a/arch/i386/kernel/cpu/mcheck/k7.c
+++ b/arch/i386/kernel/cpu/mcheck/k7.c
@@ -27,7 +27,7 @@ static fastcall void k7_machine_check(struct pt_regs * regs, long error_code)
 	if (mcgstl & (1<<0))	/* Recoverable ? */
 		recover=0;
 
-	printk (KERN_EMERG "CPU %d: Machine Check Exception: %08x%08x\n",
+	printk (KERN_EMERG "CPU#%u: Machine Check Exception: %08x%08x\n",
 		smp_processor_id(), mcgsth, mcgstl);
 
 	for (i=1; i<nr_mce_banks; i++) {
@@ -90,6 +90,6 @@ void amd_mcheck_init(struct cpuinfo_x86 *c)
 	}
 
 	set_in_cr4 (X86_CR4_MCE);
-	printk (KERN_INFO "Intel machine check reporting enabled on CPU#%d.\n",
+	printk (KERN_INFO "Intel machine check reporting enabled on CPU#%u.\n",
 		smp_processor_id());
 }
diff --git a/arch/i386/kernel/cpu/mcheck/mce.c b/arch/i386/kernel/cpu/mcheck/mce.c
index d555bec..bce47b9 100644
--- a/arch/i386/kernel/cpu/mcheck/mce.c
+++ b/arch/i386/kernel/cpu/mcheck/mce.c
@@ -23,7 +23,7 @@ EXPORT_SYMBOL_GPL(nr_mce_banks);	/* non-fatal.o */
 /* Handle unconfigured int18 (should never happen) */
 static fastcall void unexpected_machine_check(struct pt_regs * regs, long error_code)
 {	
-	printk(KERN_ERR "CPU#%d: Unexpected int18 (Machine Check).\n", smp_processor_id());
+	printk(KERN_ERR "CPU#%u: Unexpected int18 (Machine Check).\n", smp_processor_id());
 }
 
 /* Call the installed machine check handler for this CPU setup. */
diff --git a/arch/i386/kernel/cpu/mcheck/non-fatal.c b/arch/i386/kernel/cpu/mcheck/non-fatal.c
index 6b5d351..34bca94 100644
--- a/arch/i386/kernel/cpu/mcheck/non-fatal.c
+++ b/arch/i386/kernel/cpu/mcheck/non-fatal.c
@@ -37,7 +37,7 @@ static void mce_checkregs (void *info)
 		if (high & (1<<31)) {
 			printk(KERN_INFO "MCE: The hardware reports a non "
 				"fatal, correctable incident occurred on "
-				"CPU %d.\n",
+				"CPU#%u.\n",
 				smp_processor_id());
 			printk (KERN_INFO "Bank %d: %08x%08x\n", i, high, low);
 
diff --git a/arch/i386/kernel/cpu/mcheck/p4.c b/arch/i386/kernel/cpu/mcheck/p4.c
index 504434a..14343ff 100644
--- a/arch/i386/kernel/cpu/mcheck/p4.c
+++ b/arch/i386/kernel/cpu/mcheck/p4.c
@@ -38,7 +38,7 @@ static int mce_num_extended_msrs = 0;
 #ifdef CONFIG_X86_MCE_P4THERMAL
 static void unexpected_thermal_interrupt(struct pt_regs *regs)
 {	
-	printk(KERN_ERR "CPU%d: Unexpected LVT TMR interrupt!\n",
+	printk(KERN_ERR "CPU#%u: Unexpected LVT TMR interrupt!\n",
 			smp_processor_id());
 	add_taint(TAINT_MACHINE_CHECK);
 }
@@ -85,14 +85,14 @@ static void intel_init_thermal(struct cpuinfo_x86 *c)
 	rdmsr (MSR_IA32_MISC_ENABLE, l, h);
 	h = apic_read(APIC_LVTTHMR);
 	if ((l & (1<<3)) && (h & APIC_DM_SMI)) {
-		printk(KERN_DEBUG "CPU%d: Thermal monitoring handled by SMI\n",
+		printk(KERN_DEBUG "CPU#%u: Thermal monitoring handled by SMI\n",
 				cpu);
 		return; /* -EBUSY */
 	}
 
 	/* check whether a vector already exists, temporarily masked? */	
 	if (h & APIC_VECTOR_MASK) {
-		printk(KERN_DEBUG "CPU%d: Thermal LVT vector (%#x) already "
+		printk(KERN_DEBUG "CPU#%u: Thermal LVT vector (%#x) already "
 				"installed\n",
 			cpu, (h & APIC_VECTOR_MASK));
 		return; /* -EBUSY */
@@ -114,7 +114,7 @@ static void intel_init_thermal(struct cpuinfo_x86 *c)
 
 	l = apic_read (APIC_LVTTHMR);
 	apic_write_around (APIC_LVTTHMR, l & ~APIC_LVT_MASKED);
-	printk (KERN_INFO "CPU%d: Thermal monitoring enabled\n", cpu);
+	printk (KERN_INFO "CPU#%u: Thermal monitoring enabled\n", cpu);
 
 	/* enable thermal throttle processing */
 	atomic_set(&therm_throt_en, 1);
@@ -161,11 +161,11 @@ static fastcall void intel_machine_check(struct pt_regs * regs, long error_code)
 	if (mcgstl & (1<<0))	/* Recoverable ? */
 		recover=0;
 
-	printk (KERN_EMERG "CPU %d: Machine Check Exception: %08x%08x\n",
+	printk (KERN_EMERG "CPU#%u: Machine Check Exception: %08x%08x\n",
 		smp_processor_id(), mcgsth, mcgstl);
 
 	if (intel_get_extended_msrs(&dbg)) {
-		printk (KERN_DEBUG "CPU %d: EIP: %08x EFLAGS: %08x\n",
+		printk (KERN_DEBUG "CPU#%u: EIP: %08x EFLAGS: %08x\n",
 			smp_processor_id(), dbg.eip, dbg.eflags);
 		printk (KERN_DEBUG "\teax: %08x ebx: %08x ecx: %08x edx: %08x\n",
 			dbg.eax, dbg.ebx, dbg.ecx, dbg.edx);
@@ -242,14 +242,14 @@ void intel_p4_mcheck_init(struct cpuinfo_x86 *c)
 	}
 
 	set_in_cr4 (X86_CR4_MCE);
-	printk (KERN_INFO "Intel machine check reporting enabled on CPU#%d.\n",
+	printk (KERN_INFO "Intel machine check reporting enabled on CPU#%u.\n",
 		smp_processor_id());
 
 	/* Check for P4/Xeon extended MCE MSRs */
 	rdmsr (MSR_IA32_MCG_CAP, l, h);
 	if (l & (1<<9))	{/* MCG_EXT_P */
 		mce_num_extended_msrs = (l >> 16) & 0xff;
-		printk (KERN_INFO "CPU%d: Intel P4/Xeon Extended MCE MSRs (%d)"
+		printk (KERN_INFO "CPU#%u: Intel P4/Xeon Extended MCE MSRs (%d)"
 				" available\n",
 			smp_processor_id(), mce_num_extended_msrs);
 
diff --git a/arch/i386/kernel/cpu/mcheck/p5.c b/arch/i386/kernel/cpu/mcheck/p5.c
index 94bc43d..a8d1d32 100644
--- a/arch/i386/kernel/cpu/mcheck/p5.c
+++ b/arch/i386/kernel/cpu/mcheck/p5.c
@@ -21,9 +21,9 @@ static fastcall void pentium_machine_check(struct pt_regs * regs, long error_cod
 	u32 loaddr, hi, lotype;
 	rdmsr(MSR_IA32_P5_MC_ADDR, loaddr, hi);
 	rdmsr(MSR_IA32_P5_MC_TYPE, lotype, hi);
-	printk(KERN_EMERG "CPU#%d: Machine Check Exception:  0x%8X (type 0x%8X).\n", smp_processor_id(), loaddr, lotype);
+	printk(KERN_EMERG "CPU#%u: Machine Check Exception:  0x%8X (type 0x%8X).\n", smp_processor_id(), loaddr, lotype);
 	if(lotype&(1<<5))
-		printk(KERN_EMERG "CPU#%d: Possible thermal failure (CPU on fire ?).\n", smp_processor_id());
+		printk(KERN_EMERG "CPU#%u: Possible thermal failure (CPU on fire ?).\n", smp_processor_id());
 	add_taint(TAINT_MACHINE_CHECK);
 }
 
@@ -49,5 +49,5 @@ void intel_p5_mcheck_init(struct cpuinfo_x86 *c)
 
  	/* Enable MCE */
 	set_in_cr4(X86_CR4_MCE);
-	printk(KERN_INFO "Intel old style machine check reporting enabled on CPU#%d.\n", smp_processor_id());
+	printk(KERN_INFO "Intel old style machine check reporting enabled on CPU#%u.\n", smp_processor_id());
 }
diff --git a/arch/i386/kernel/cpu/mcheck/p6.c b/arch/i386/kernel/cpu/mcheck/p6.c
index deeae42..fab59b4 100644
--- a/arch/i386/kernel/cpu/mcheck/p6.c
+++ b/arch/i386/kernel/cpu/mcheck/p6.c
@@ -27,7 +27,7 @@ static fastcall void intel_machine_check(struct pt_regs * regs, long error_code)
 	if (mcgstl & (1<<0))	/* Recoverable ? */
 		recover=0;
 
-	printk (KERN_EMERG "CPU %d: Machine Check Exception: %08x%08x\n",
+	printk (KERN_EMERG "CPU#%u: Machine Check Exception: %08x%08x\n",
 		smp_processor_id(), mcgsth, mcgstl);
 
 	for (i=0; i<nr_mce_banks; i++) {
@@ -114,6 +114,6 @@ void intel_p6_mcheck_init(struct cpuinfo_x86 *c)
 		wrmsr (MSR_IA32_MC0_STATUS+4*i, 0x0, 0x0);
 
 	set_in_cr4 (X86_CR4_MCE);
-	printk (KERN_INFO "Intel machine check reporting enabled on CPU#%d.\n",
+	printk (KERN_INFO "Intel machine check reporting enabled on CPU#%u.\n",
 		smp_processor_id());
 }
diff --git a/arch/i386/kernel/cpu/mcheck/therm_throt.c b/arch/i386/kernel/cpu/mcheck/therm_throt.c
index 065005c..c7fd45a 100644
--- a/arch/i386/kernel/cpu/mcheck/therm_throt.c
+++ b/arch/i386/kernel/cpu/mcheck/therm_throt.c
@@ -97,13 +97,13 @@ int therm_throt_process(int curr)
 
 	/* if we just entered the thermal event */
 	if (curr) {
-		printk(KERN_CRIT "CPU%d: Temperature above threshold, "
+		printk(KERN_CRIT "CPU#%u: Temperature above threshold, "
 		       "cpu clock throttled (total events = %lu)\n", cpu,
 		       __get_cpu_var(thermal_throttle_count));
 
 		add_taint(TAINT_MACHINE_CHECK);
 	} else {
-		printk(KERN_CRIT "CPU%d: Temperature/speed normal\n", cpu);
+		printk(KERN_CRIT "CPU#%u: Temperature/speed normal\n", cpu);
 	}
 
 	return 1;
diff --git a/arch/i386/kernel/cpu/mcheck/winchip.c b/arch/i386/kernel/cpu/mcheck/winchip.c
index 9e424b6..074def7 100644
--- a/arch/i386/kernel/cpu/mcheck/winchip.c
+++ b/arch/i386/kernel/cpu/mcheck/winchip.c
@@ -17,7 +17,7 @@
 /* Machine check handler for WinChip C6 */
 static fastcall void winchip_machine_check(struct pt_regs * regs, long error_code)
 {
-	printk(KERN_EMERG "CPU0: Machine Check Exception.\n");
+	printk(KERN_EMERG "CPU#0: Machine Check Exception.\n");
 	add_taint(TAINT_MACHINE_CHECK);
 }
 
-- 
1.5.0.rc3.22.g5057
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
