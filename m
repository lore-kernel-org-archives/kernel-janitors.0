From: Jaswinder Singh <jaswinder@infradead.org>
Date: Tue, 15 Jul 2008 10:56:42 +0000
Subject: [PATCH] x86: traps and do_traps under one hood
Message-Id: <1216119158.21749.5.camel@jaswinder.satnam>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: LKML <linux-kernel@vger.kernel.org>, Linus Torvalds <torvalds@linux-foundation.org>, Alan Cox <alan@lxorguk.ukuu.org.uk>, kernelnewbies <kernelnewbies@nl.linux.org>, kernel-janitors <kernel-janitors@vger.kernel.org>, David Woodhouse <dwmw2@infradead.org>, andi@firstfloor.org


Declaring x86 traps under one hood.
Declaring x86 do_traps before defining them.

Signed-off-by: Jaswinder Singh <jaswinder@infradead.org>
---
 arch/x86/kernel/traps_32.c                |   20 ---------
 arch/x86/kernel/traps_64.c                |   21 ----------
 include/asm-x86/mach-default/mach_traps.h |   62 +++++++++++++++++++++++++++++
 3 files changed, 62 insertions(+), 41 deletions(-)

diff --git a/arch/x86/kernel/traps_32.c b/arch/x86/kernel/traps_32.c
index 8a76897..9107ef7 100644
--- a/arch/x86/kernel/traps_32.c
+++ b/arch/x86/kernel/traps_32.c
@@ -77,26 +77,6 @@ char ignore_fpu_irq;
 gate_desc idt_table[256]
 	__attribute__((__section__(".data.idt"))) = { { { { 0, 0 } } }, };
 
-asmlinkage void divide_error(void);
-asmlinkage void debug(void);
-asmlinkage void nmi(void);
-asmlinkage void int3(void);
-asmlinkage void overflow(void);
-asmlinkage void bounds(void);
-asmlinkage void invalid_op(void);
-asmlinkage void device_not_available(void);
-asmlinkage void coprocessor_segment_overrun(void);
-asmlinkage void invalid_TSS(void);
-asmlinkage void segment_not_present(void);
-asmlinkage void stack_segment(void);
-asmlinkage void general_protection(void);
-asmlinkage void page_fault(void);
-asmlinkage void coprocessor_error(void);
-asmlinkage void simd_coprocessor_error(void);
-asmlinkage void alignment_check(void);
-asmlinkage void spurious_interrupt_bug(void);
-asmlinkage void machine_check(void);
-
 int panic_on_unrecovered_nmi;
 int kstack_depth_to_print = 24;
 static unsigned int code_bytes = 64;
diff --git a/arch/x86/kernel/traps_64.c b/arch/x86/kernel/traps_64.c
index 2696a68..56c413c 100644
--- a/arch/x86/kernel/traps_64.c
+++ b/arch/x86/kernel/traps_64.c
@@ -54,27 +54,6 @@
 
 #include <mach_traps.h>
 
-asmlinkage void divide_error(void);
-asmlinkage void debug(void);
-asmlinkage void nmi(void);
-asmlinkage void int3(void);
-asmlinkage void overflow(void);
-asmlinkage void bounds(void);
-asmlinkage void invalid_op(void);
-asmlinkage void device_not_available(void);
-asmlinkage void double_fault(void);
-asmlinkage void coprocessor_segment_overrun(void);
-asmlinkage void invalid_TSS(void);
-asmlinkage void segment_not_present(void);
-asmlinkage void stack_segment(void);
-asmlinkage void general_protection(void);
-asmlinkage void page_fault(void);
-asmlinkage void coprocessor_error(void);
-asmlinkage void simd_coprocessor_error(void);
-asmlinkage void alignment_check(void);
-asmlinkage void spurious_interrupt_bug(void);
-asmlinkage void machine_check(void);
-
 int panic_on_unrecovered_nmi;
 int kstack_depth_to_print = 12;
 static unsigned int code_bytes = 64;
diff --git a/include/asm-x86/mach-default/mach_traps.h b/include/asm-x86/mach-default/mach_traps.h
index 2fe7705..e803b1d 100644
--- a/include/asm-x86/mach-default/mach_traps.h
+++ b/include/asm-x86/mach-default/mach_traps.h
@@ -36,4 +36,66 @@ static inline void reassert_nmi(void)
 		unlock_cmos();
 }
 
+/* traps */
+
+/* Common in X86_32 and X86_64 */
+asmlinkage void divide_error(void);
+asmlinkage void debug(void);
+asmlinkage void nmi(void);
+asmlinkage void int3(void);
+asmlinkage void overflow(void);
+asmlinkage void bounds(void);
+asmlinkage void invalid_op(void);
+asmlinkage void device_not_available(void);
+asmlinkage void coprocessor_segment_overrun(void);
+asmlinkage void invalid_TSS(void);
+asmlinkage void segment_not_present(void);
+asmlinkage void stack_segment(void);
+asmlinkage void general_protection(void);
+asmlinkage void page_fault(void);
+asmlinkage void coprocessor_error(void);
+asmlinkage void simd_coprocessor_error(void);
+asmlinkage void alignment_check(void);
+asmlinkage void spurious_interrupt_bug(void);
+asmlinkage void machine_check(void);
+
+void do_divide_error(struct pt_regs *, long);
+void do_overflow(struct pt_regs *, long);
+void do_bounds(struct pt_regs *, long);
+void do_coprocessor_segment_overrun(struct pt_regs *, long);
+void do_invalid_TSS(struct pt_regs *, long);
+void do_segment_not_present(struct pt_regs *, long);
+void do_stack_segment(struct pt_regs *, long);
+void do_alignment_check(struct pt_regs *, long);
+void do_invalid_op(struct pt_regs *, long);
+void do_general_protection(struct pt_regs *, long);
+void do_nmi(struct pt_regs *, long);
+
+extern int panic_on_unrecovered_nmi;
+extern int kstack_depth_to_print;
+
+#ifdef CONFIG_X86_32
+
+void do_iret_error(struct pt_regs *, long);
+void do_int3(struct pt_regs *, long);
+void do_debug(struct pt_regs *, long);
+void math_error(void __user *);
+void do_coprocessor_error(struct pt_regs *, long);
+void do_simd_coprocessor_error(struct pt_regs *, long);
+void do_spurious_interrupt_bug(struct pt_regs *, long);
+unsigned long patch_espfix_desc(unsigned long, unsigned long);
+asmlinkage void math_emulate(long);
+
+#else /* CONFIG_X86_32 */
+
+asmlinkage void double_fault(void);
+
+asmlinkage void do_int3(struct pt_regs *, long);
+asmlinkage void do_stack_segment(struct pt_regs *, long);
+asmlinkage void do_debug(struct pt_regs *, unsigned long);
+asmlinkage void do_coprocessor_error(struct pt_regs *);
+asmlinkage void do_simd_coprocessor_error(struct pt_regs *);
+asmlinkage void do_spurious_interrupt_bug(struct pt_regs *);
+
+#endif /* CONFIG_X86_32 */
 #endif /* !_MACH_TRAPS_H */
-- 
1.5.5.1



