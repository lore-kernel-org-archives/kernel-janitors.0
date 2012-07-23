From: David Howells <dhowells@redhat.com>
Date: Mon, 23 Jul 2012 12:26:59 +0000
Subject: Re: [uapi:uapi-split 25/74] arch/ia64/include/asm/bitops.h:47:1: error: macro "__paravirt_getreg" pa
Message-Id: <29976.1343046419@warthog.procyon.org.uk>
List-Id: <kernel-janitors.vger.kernel.org>
References: <23199.1342949300@warthog.procyon.org.uk>
In-Reply-To: <23199.1342949300@warthog.procyon.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Fengguang Wu <fengguang.wu@intel.com> wrote:

> /c/kernel-tests/src/next/arch/ia64/include/asm/bitops.h:47:1: error: macro "__paravirt_getreg" passed 1 arguments, but takes just 0

These don't seem to be anything to do with my patches.  I tried fixing it up
as best I could (attached is the patch and it's applied on top of Tony's), but
it looks like IA64 is not ready for paravirt upstream.  I stopped trying to
fix it up when I hit this:

kernel/sched/core.c: In function 'steal_account_process_tick':
kernel/sched/core.c:2982:3: error: implicit declaration of function 'paravirt_steal_clock' [-Werror=implicit-function-declaration]

This is only available in the x86 arch.

arch/x86/include/asm/paravirt.h:static inline u64 paravirt_steal_clock(int cpu)
kernel/sched/core.c:            steal = paravirt_steal_clock(cpu_of(rq));
kernel/sched/core.c:            steal = paravirt_steal_clock(smp_processor_id());

My guess is that IA-64 paravirtualisation has been broken since:

	commit 3c404b578fab699c4708279938078d9404b255a4
	Author: Glauber Costa <glommer@redhat.com>
	Date:   Mon Jul 11 15:28:15 2011 -0400

David
---
IA-64: Partial attempt to fill in the missing paravirtualisation bits

Attempt to fill in the missing paravirtualisation bits in the IA-64 arch.

There are lots of undefined symbols for which I've put bridging #defines in
asm/paravirt_privop.h and added some #includes.

However, the compilation now fails at the non-existence of
paravirt_steal_clock() in the IA-64 arch.

Signed-off-by: David Howells <dhowells@redhat.com>
---
diff --git a/arch/ia64/include/asm/paravirt_privop.h b/arch/ia64/include/asm/paravirt_privop.h
index 8f6cb11..0b177f8 100644
--- a/arch/ia64/include/asm/paravirt_privop.h
+++ b/arch/ia64/include/asm/paravirt_privop.h
@@ -61,9 +61,21 @@ extern unsigned long ia64_native_getreg_func(int regnum);
 /************************************************/
 
 #ifndef ASM_SUPPORTED
+#define paravirt_fc(a)		pv_cpu_ops.fc((a))
+#define paravirt_thash(a)	pv_cpu_ops.thash((a))
+#define paravirt_get_cpuid(i)	pv_cpu_ops.get_cpuid((i))
+#define paravirt_get_pmd(i)	pv_cpu_ops.get_pmd((i))
+#define __paravirt_getreg(r)	pv_cpu_ops.getreg((r))
+#define paravirt_setreg(r, v)	pv_cpu_ops.setreg((r), (v))
+#define paravirt_ptcga(a, s)	pv_cpu_ops.ptcga((a), (s))
+#define paravirt_get_rr(i)	pv_cpu_ops.get_rr((i))
+#define paravirt_set_rr(i, v)	pv_cpu_ops.set_rr((i), (v))
+#define paravirt_set_rr0_to_rr4(v0, v1, v2, v3, v4) \
+	pv_cpu_ops.set_rr0_to_rr4((v0), (v1), (v2), (v3), (v4))
 #define paravirt_ssm_i()	pv_cpu_ops.ssm_i()
 #define paravirt_rsm_i()	pv_cpu_ops.rsm_i()
-#define __paravirt_getreg()	pv_cpu_ops.getreg()
+#define paravirt_get_psr_i()	pv_cpu_ops.get_psr_i()
+#define paravirt_intrin_local_irq_restore(f) pv_cpu_ops.intrin_local_irq_restore((f))
 #endif
 
 /* mask for ia64_native_ssm/rsm() must be constant.("i" constraing).
diff --git a/arch/ia64/kernel/module.c b/arch/ia64/kernel/module.c
index 24603be..2579e33 100644
--- a/arch/ia64/kernel/module.c
+++ b/arch/ia64/kernel/module.c
@@ -34,6 +34,7 @@
 #include <linux/vmalloc.h>
 
 #include <asm/patch.h>
+#include <asm/paravirt_patch.h>
 #include <asm/unaligned.h>
 
 #define ARCH_MODULE_DEBUG 0
diff --git a/arch/ia64/kernel/paravirt.c b/arch/ia64/kernel/paravirt.c
index 1b22f6d..ac1f625 100644
--- a/arch/ia64/kernel/paravirt.c
+++ b/arch/ia64/kernel/paravirt.c
@@ -31,6 +31,7 @@
 
 #include <asm/iosapic.h>
 #include <asm/paravirt.h>
+#include <asm/paravirt_patch.h>
 
 /***************************************************************************
  * general info
diff --git a/arch/ia64/mm/tlb.c b/arch/ia64/mm/tlb.c
index 7b3cdc6..200ae85 100644
--- a/arch/ia64/mm/tlb.c
+++ b/arch/ia64/mm/tlb.c
@@ -33,6 +33,7 @@
 #include <asm/processor.h>
 #include <asm/sal.h>
 #include <asm/tlb.h>
+#include <uapi/asm/intrinsics.h>
 
 static struct {
 	u64 mask;		/* mask of supported purge page-sizes */
