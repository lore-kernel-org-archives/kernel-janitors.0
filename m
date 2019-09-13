From: Colin King <colin.king@canonical.com>
Date: Fri, 13 Sep 2019 08:08:49 +0000
Subject: [PATCH] genirq/debugfs: fix spelling mistake "effectiv" -> "effective"
Message-Id: <20190913080849.29050-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Thomas Gleixner <tglx@linutronix.de>
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

There is a spelling mistake in the debugfs output, fix it.

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 kernel/irq/debugfs.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/kernel/irq/debugfs.c b/kernel/irq/debugfs.c
index c1eccd4f6520..55b1b7ce667e 100644
--- a/kernel/irq/debugfs.c
+++ b/kernel/irq/debugfs.c
@@ -36,7 +36,7 @@ static void irq_debug_show_masks(struct seq_file *m, struct irq_desc *desc)
 	seq_printf(m, "affinity: %*pbl\n", cpumask_pr_args(msk));
 #ifdef CONFIG_GENERIC_IRQ_EFFECTIVE_AFF_MASK
 	msk = irq_data_get_effective_affinity_mask(data);
-	seq_printf(m, "effectiv: %*pbl\n", cpumask_pr_args(msk));
+	seq_printf(m, "effective: %*pbl\n", cpumask_pr_args(msk));
 #endif
 #ifdef CONFIG_GENERIC_PENDING_IRQ
 	msk = desc->pending_mask;
-- 
2.20.1
