From: Colin King <colin.king@canonical.com>
Date: Wed, 06 Dec 2017 17:33:58 +0000
Subject: [PATCH][REDO] arch: x86: trivial changes to make various functions static
Message-Id: <20171206173358.24388-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, "H . Peter Anvin" <hpa@zytor.com>, x86@kernel.org, Jiri Kosina <trivial@kernel.org>, Juergen Gross <jgross@suse.com>, Andy Lutomirski <luto@kernel.org>, Mike Travis <mike.travis@hpe.com>, Russ Anderson <russ.anderson@hpe.com>, "travis @ sgi . com" <travis@sgi.com>
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Functions x86_vector_debug_show, clear_non_loaded_ctxs, uv_handle_nmi
and uv_nmi_setup_common are local to the source and do not need to be
in global scope, so make them static. Fixes up various sparse warnings.

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---

I've combined 3 earlier patches into 1. Apologies for the noise.

v1: sent as separate patches
v2: send as one combined patch as requested by Ingo

 arch/x86/kernel/apic/vector.c | 4 ++--
 arch/x86/mm/tlb.c             | 2 +-
 arch/x86/platform/uv/uv_nmi.c | 4 ++--
 3 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/arch/x86/kernel/apic/vector.c b/arch/x86/kernel/apic/vector.c
index 6a823a25eaff..750449152b04 100644
--- a/arch/x86/kernel/apic/vector.c
+++ b/arch/x86/kernel/apic/vector.c
@@ -542,8 +542,8 @@ static int x86_vector_alloc_irqs(struct irq_domain *domain, unsigned int virq,
 }
 
 #ifdef CONFIG_GENERIC_IRQ_DEBUGFS
-void x86_vector_debug_show(struct seq_file *m, struct irq_domain *d,
-			   struct irq_data *irqd, int ind)
+static void x86_vector_debug_show(struct seq_file *m, struct irq_domain *d,
+				  struct irq_data *irqd, int ind)
 {
 	unsigned int cpu, vector, prev_cpu, prev_vector;
 	struct apic_chip_data *apicd;
diff --git a/arch/x86/mm/tlb.c b/arch/x86/mm/tlb.c
index f75b6eb47a6d..6ecbd8fc292e 100644
--- a/arch/x86/mm/tlb.c
+++ b/arch/x86/mm/tlb.c
@@ -34,7 +34,7 @@
  * necessary invalidation by clearing out the 'ctx_id' which
  * forces a TLB flush when the context is loaded.
  */
-void clear_non_loaded_ctxs(void)
+static void clear_non_loaded_ctxs(void)
 {
 	u16 asid;
 
diff --git a/arch/x86/platform/uv/uv_nmi.c b/arch/x86/platform/uv/uv_nmi.c
index c34bd8233f7c..5f64f30873e2 100644
--- a/arch/x86/platform/uv/uv_nmi.c
+++ b/arch/x86/platform/uv/uv_nmi.c
@@ -905,7 +905,7 @@ static inline void uv_call_kgdb_kdb(int cpu, struct pt_regs *regs, int master)
 /*
  * UV NMI handler
  */
-int uv_handle_nmi(unsigned int reason, struct pt_regs *regs)
+static int uv_handle_nmi(unsigned int reason, struct pt_regs *regs)
 {
 	struct uv_hub_nmi_s *hub_nmi = uv_hub_nmi;
 	int cpu = smp_processor_id();
@@ -1013,7 +1013,7 @@ void uv_nmi_init(void)
 }
 
 /* Setup HUB NMI info */
-void __init uv_nmi_setup_common(bool hubbed)
+static void __init uv_nmi_setup_common(bool hubbed)
 {
 	int size = sizeof(void *) * (1 << NODES_SHIFT);
 	int cpu;
-- 
2.14.1

