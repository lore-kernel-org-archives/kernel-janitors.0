From: Fengguang Wu <fengguang.wu@intel.com>
Date: Wed, 12 Sep 2012 22:14:01 +0000
Subject: [xen:linux-next 4/27] arch/x86/kernel/x86_init.c:29:13: sparse: symbol 'x86_init_pgd_start_noop' was
Message-Id: <20120912221401.GA13568@localhost>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="C7zPtVaVf+AK4Oqc"
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org


--C7zPtVaVf+AK4Oqc
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Attilio,

FYI, there are new sparse warnings show up in

tree:   git://git.kernel.org/pub/scm/linux/kernel/git/konrad/xen.git linux-next
head:   3153e9a8aa96bd1f11988c7c70d9372f00b615a1
commit: 73090f8993a40a2f67fed1ab866a928c68cd3765 [4/27] x86: Remove base argument from x86_init.paging.pagetable_setup_start

All sparse warnings:

+ arch/x86/kernel/x86_init.c:29:13: sparse: symbol 'x86_init_pgd_start_noop' was not declared. Should it be static?
+ arch/x86/kernel/x86_init.c:30:13: sparse: symbol 'x86_init_pgd_done_noop' was not declared. Should it be static?
  arch/x86/kernel/x86_init.c:31:12: sparse: symbol 'iommu_init_noop' was not declared. Should it be static?
  arch/x86/kernel/x86_init.c:32:6: sparse: symbol 'iommu_shutdown_noop' was not declared. Should it be static?

vim +29 arch/x86/kernel/x86_init.c
    19	#include <asm/time.h>
    20	#include <asm/irq.h>
    21	#include <asm/io_apic.h>
    22	#include <asm/pat.h>
    23	#include <asm/tsc.h>
    24	#include <asm/iommu.h>
    25	#include <asm/mach_traps.h>
    26	
    27	void __cpuinit x86_init_noop(void) { }
    28	void __init x86_init_uint_noop(unsigned int unused) { }
  > 29	void __init x86_init_pgd_start_noop(void) { }
    30	void __init x86_init_pgd_done_noop(pgd_t *unused) { }
    31	int __init iommu_init_noop(void) { return 0; }
    32	void iommu_shutdown_noop(void) { }
    33	
    34	/*
    35	 * The platform setup functions are preset with the default functions
    36	 * for standard PC hardware.
    37	 */
    38	struct x86_init_ops x86_init __initdata = {
    39	

Please consider folding the attached diff :-)

---
0-DAY kernel build testing backend         Open Source Technology Centre
Fengguang Wu <wfg@linux.intel.com>                     Intel Corporation

--C7zPtVaVf+AK4Oqc
Content-Type: text/x-diff; charset=us-ascii
Content-Disposition: attachment; filename="make-it-static-73090f8.diff"

diff --git a/arch/x86/kernel/x86_init.c b/arch/x86/kernel/x86_init.c
index 3b88493..6375747 100644
--- a/arch/x86/kernel/x86_init.c
+++ b/arch/x86/kernel/x86_init.c
@@ -26,10 +26,10 @@
 
 void __cpuinit x86_init_noop(void) { }
 void __init x86_init_uint_noop(unsigned int unused) { }
-void __init x86_init_pgd_start_noop(void) { }
-void __init x86_init_pgd_done_noop(pgd_t *unused) { }
-int __init iommu_init_noop(void) { return 0; }
-void iommu_shutdown_noop(void) { }
+static void __init x86_init_pgd_start_noop(void) { }
+static void __init x86_init_pgd_done_noop(pgd_t *unused) { }
+static int __init iommu_init_noop(void) { return 0; }
+static void iommu_shutdown_noop(void) { }
 
 /*
  * The platform setup functions are preset with the default functions
diff --git a/arch/x86/mm/init_32.c b/arch/x86/mm/init_32.c
index c4aa1b2..79082e1 100644
--- a/arch/x86/mm/init_32.c
+++ b/arch/x86/mm/init_32.c
@@ -553,7 +553,7 @@ early_param("highmem", parse_highmem);
  * artificially via the highmem=x boot parameter then create
  * it:
  */
-void __init lowmem_pfn_init(void)
+static void __init lowmem_pfn_init(void)
 {
 	/* max_low_pfn is 0, we already have early_res support */
 	max_low_pfn = max_pfn;
@@ -589,7 +589,7 @@ void __init lowmem_pfn_init(void)
  * We have more RAM than fits into lowmem - we try to put it into
  * highmem, also taking the highmem=x boot parameter into account:
  */
-void __init highmem_pfn_init(void)
+static void __init highmem_pfn_init(void)
 {
 	max_low_pfn = MAXMEM_PFN;
 

--C7zPtVaVf+AK4Oqc--
