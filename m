From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Sat, 18 May 2013 18:34:52 +0000
Subject: [patch] perf/x86: prevent some shift wrapping bugs in intel uncore
Message-Id: <20130518183452.GA14587@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

We're trying to use 64 bit masks but the shifts wrap so we can't use the
high 32 bits.  I've fixed this by changing several types to unsigned
long long.

This is a static checker fix.  The one change which is clearly needed is
"mask = 0xff << (idx * 8);" where the author obviously intended to use
all 64 bits.  The other changes are mostly to silence my static checker.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/arch/x86/kernel/cpu/perf_event_intel_uncore.h b/arch/x86/kernel/cpu/perf_event_intel_uncore.h
index f952891..47b3d00c 100644
--- a/arch/x86/kernel/cpu/perf_event_intel_uncore.h
+++ b/arch/x86/kernel/cpu/perf_event_intel_uncore.h
@@ -337,10 +337,10 @@
 		 NHMEX_M_PMON_CTL_SET_FLAG_SEL_MASK)
 
 #define NHMEX_M_PMON_ZDP_CTL_FVC_MASK		(((1 << 11) - 1) | (1 << 23))
-#define NHMEX_M_PMON_ZDP_CTL_FVC_EVENT_MASK(n)	(0x7 << (11 + 3 * (n)))
+#define NHMEX_M_PMON_ZDP_CTL_FVC_EVENT_MASK(n)	(0x7ULL << (11 + 3 * (n)))
 
 #define WSMEX_M_PMON_ZDP_CTL_FVC_MASK		(((1 << 12) - 1) | (1 << 24))
-#define WSMEX_M_PMON_ZDP_CTL_FVC_EVENT_MASK(n)	(0x7 << (12 + 3 * (n)))
+#define WSMEX_M_PMON_ZDP_CTL_FVC_EVENT_MASK(n)	(0x7ULL << (12 + 3 * (n)))
 
 /*
  * use the 9~13 bits to select event If the 7th bit is not set,
diff --git a/arch/x86/kernel/cpu/perf_event_intel_uncore.c b/arch/x86/kernel/cpu/perf_event_intel_uncore.c
index 52441a2..c0e356d 100644
--- a/arch/x86/kernel/cpu/perf_event_intel_uncore.c
+++ b/arch/x86/kernel/cpu/perf_event_intel_uncore.c
@@ -644,7 +644,7 @@ snbep_pcu_get_constraint(struct intel_uncore_box *box, struct perf_event *event)
 	    (!uncore_box_is_fake(box) && reg1->alloc))
 		return NULL;
 again:
-	mask = 0xff << (idx * 8);
+	mask = 0xffULL << (idx * 8);
 	raw_spin_lock_irqsave(&er->lock, flags);
 	if (!__BITS_VALUE(atomic_read(&er->ref), idx, 8) ||
 	    !((config1 ^ er->config) & mask)) {
@@ -1923,7 +1923,7 @@ static u64 nhmex_mbox_alter_er(struct perf_event *event, int new_idx, bool modif
 {
 	struct hw_perf_event *hwc = &event->hw;
 	struct hw_perf_event_extra *reg1 = &hwc->extra_reg;
-	int idx, orig_idx = __BITS_VALUE(reg1->idx, 0, 8);
+	u64 idx, orig_idx = __BITS_VALUE(reg1->idx, 0, 8);
 	u64 config = reg1->config;
 
 	/* get the non-shared control bits and shift them */
