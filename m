From: Richard Knutsson <ricknu-0@student.ltu.se>
Date: Sun, 22 Apr 2007 00:11:51 +0000
Subject: [KJ] [PATCH] i386: Convert to generic boolean
Message-Id: <20070422000921.9411.69783.sendpatchset@thinktank.campus.ltu.se>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Convert to generic boolean.

Remove comment for no-existing argument <do_safe>.

Signed-off-by: Richard Knutsson <ricknu-0@student.ltu.se>
---
Compile-tested with "allyes" & "allmod" on i386

 amd.c     |    2 --
 generic.c |   22 ++++++++++------------
 mtrr.h    |    5 -----
 3 files changed, 10 insertions(+), 19 deletions(-)


diff --git a/arch/i386/kernel/cpu/mtrr/amd.c b/arch/i386/kernel/cpu/mtrr/amd.c
index 0949cdb..ee2331b 100644
--- a/arch/i386/kernel/cpu/mtrr/amd.c
+++ b/arch/i386/kernel/cpu/mtrr/amd.c
@@ -53,8 +53,6 @@ static void amd_set_mtrr(unsigned int reg, unsigned long base,
     <base> The base address of the region.
     <size> The size of the region. If this is 0 the region is disabled.
     <type> The type of the region.
-    <do_safe> If TRUE, do the change safely. If FALSE, safety measures should
-    be done externally.
     [RETURNS] Nothing.
 */
 {
diff --git a/arch/i386/kernel/cpu/mtrr/generic.c b/arch/i386/kernel/cpu/mtrr/generic.c
index f77fc53..6180c71 100644
--- a/arch/i386/kernel/cpu/mtrr/generic.c
+++ b/arch/i386/kernel/cpu/mtrr/generic.c
@@ -196,17 +196,17 @@ static void generic_get_mtrr(unsigned int reg, unsigned long *base,
 	*type = base_lo & 0xff;
 }
 
-static int set_fixed_ranges(mtrr_type * frs)
+static bool set_fixed_ranges(mtrr_type * frs)
 {
 	unsigned int *p = (unsigned int *) frs;
-	int changed = FALSE;
+	bool changed = false;
 	int i;
 	unsigned int lo, hi;
 
 	rdmsr(MTRRfix64K_00000_MSR, lo, hi);
 	if (p[0] != lo || p[1] != hi) {
 		mtrr_wrmsr(MTRRfix64K_00000_MSR, p[0], p[1]);
-		changed = TRUE;
+		changed = true;
 	}
 
 	for (i = 0; i < 2; i++) {
@@ -214,7 +214,7 @@ static int set_fixed_ranges(mtrr_type * frs)
 		if (p[2 + i * 2] != lo || p[3 + i * 2] != hi) {
 			mtrr_wrmsr(MTRRfix16K_80000_MSR + i, p[2 + i * 2],
 			      p[3 + i * 2]);
-			changed = TRUE;
+			changed = true;
 		}
 	}
 
@@ -223,25 +223,25 @@ static int set_fixed_ranges(mtrr_type * frs)
 		if (p[6 + i * 2] != lo || p[7 + i * 2] != hi) {
 			mtrr_wrmsr(MTRRfix4K_C0000_MSR + i, p[6 + i * 2],
 			      p[7 + i * 2]);
-			changed = TRUE;
+			changed = true;
 		}
 	}
 	return changed;
 }
 
-/*  Set the MSR pair relating to a var range. Returns TRUE if
+/*  Set the MSR pair relating to a var range. Returns 'true' if
     changes are made  */
-static int set_mtrr_var_ranges(unsigned int index, struct mtrr_var_range *vr)
+static bool set_mtrr_var_ranges(unsigned int index, struct mtrr_var_range *vr)
 {
 	unsigned int lo, hi;
-	int changed = FALSE;
+	bool changed = false;
 
 	rdmsr(MTRRphysBase_MSR(index), lo, hi);
 	if ((vr->base_lo & 0xfffff0ffUL) != (lo & 0xfffff0ffUL)
 	    || (vr->base_hi & (size_and_mask >> (32 - PAGE_SHIFT))) ! 		(hi & (size_and_mask >> (32 - PAGE_SHIFT)))) {
 		mtrr_wrmsr(MTRRphysBase_MSR(index), vr->base_lo, vr->base_hi);
-		changed = TRUE;
+		changed = true;
 	}
 
 	rdmsr(MTRRphysMask_MSR(index), lo, hi);
@@ -250,7 +250,7 @@ static int set_mtrr_var_ranges(unsigned int index, struct mtrr_var_range *vr)
 	    || (vr->mask_hi & (size_and_mask >> (32 - PAGE_SHIFT))) ! 		(hi & (size_and_mask >> (32 - PAGE_SHIFT)))) {
 		mtrr_wrmsr(MTRRphysMask_MSR(index), vr->mask_lo, vr->mask_hi);
-		changed = TRUE;
+		changed = true;
 	}
 	return changed;
 }
@@ -375,8 +375,6 @@ static void generic_set_mtrr(unsigned int reg, unsigned long base,
     <base> The base address of the region.
     <size> The size of the region. If this is 0 the region is disabled.
     <type> The type of the region.
-    <do_safe> If TRUE, do the change safely. If FALSE, safety measures should
-    be done externally.
     [RETURNS] Nothing.
 */
 {
diff --git a/arch/i386/kernel/cpu/mtrr/mtrr.h b/arch/i386/kernel/cpu/mtrr/mtrr.h
index 289dfe6..3aea07c 100644
--- a/arch/i386/kernel/cpu/mtrr/mtrr.h
+++ b/arch/i386/kernel/cpu/mtrr/mtrr.h
@@ -2,11 +2,6 @@
  * local mtrr defines.
  */
 
-#ifndef TRUE
-#define TRUE  1
-#define FALSE 0
-#endif
-
 #define MTRRcap_MSR     0x0fe
 #define MTRRdefType_MSR 0x2ff
 
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.linux-foundation.org
https://lists.linux-foundation.org/mailman/listinfo/kernel-janitors
