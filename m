From: Colin King <colin.king@canonical.com>
Date: Tue, 28 Nov 2017 19:55:39 +0000
Subject: [PATCH] x86/vector: make function x86_vector_debug_show static
Message-Id: <20171128195539.26389-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, "H . Peter Anvin" <hpa@zytor.com>, x86@kernel.org, Juergen Gross <jgross@suse.com>
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Function x86_vector_debug_show is local to the source and does not need
to be in global scope, so make it static.

Cleans up sparse warning:

arch/x86/kernel/apic/vector.c:545:6: warning: symbol
'x86_vector_debug_show' was not declared. Should it be static?

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 arch/x86/kernel/apic/vector.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

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
-- 
2.14.1

