From: Andi Drebes <lists-receive@programmierforen.de>
Date: Mon, 04 Jun 2007 19:01:11 +0000
Subject: [KJ] [PATCH] drivers/char/drm: Array size calculations using sizeof
Message-Id: <200706042101.12078.lists-receive@programmierforen.de>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

This patch replaces various array size calculations in drivers/char/drm
that were done using sizeof with the ARRAY_SIZE macro.

Tested by compilation on an i386 box using "allyesconfig".
Diffed against Linus' git-tree.

Signed-off-by: Andi Drebes <lists-receive@programmierforen.de>
---
diff --git a/drivers/char/drm/via_irq.c b/drivers/char/drm/via_irq.c
index 1ac5941..845a48c 100644
--- a/drivers/char/drm/via_irq.c
+++ b/drivers/char/drm/via_irq.c
@@ -76,8 +76,7 @@ static maskarray_t via_pro_group_a_irqs[] = {
 	{VIA_IRQ_DMA1_TD_ENABLE, VIA_IRQ_DMA1_TD_PENDING, VIA_PCI_DMA_CSR1,
 	 VIA_DMA_CSR_TA | VIA_DMA_CSR_TD, 0x00000008},
 };
-static int via_num_pro_group_a -    sizeof(via_pro_group_a_irqs) / sizeof(maskarray_t);
+static int via_num_pro_group_a = ARRAY_SIZE(via_pro_group_a_irqs);
 static int via_irqmap_pro_group_a[] = {0, 1, -1, 2, -1, 3};
 
 static maskarray_t via_unichrome_irqs[] = {
@@ -86,7 +85,7 @@ static maskarray_t via_unichrome_irqs[] = {
 	{VIA_IRQ_DMA1_TD_ENABLE, VIA_IRQ_DMA1_TD_PENDING, VIA_PCI_DMA_CSR1,
 	 VIA_DMA_CSR_TA | VIA_DMA_CSR_TD, 0x00000008}
 };
-static int via_num_unichrome = sizeof(via_unichrome_irqs) / sizeof(maskarray_t);
+static int via_num_unichrome = ARRAY_SIZE(via_unichrome_irqs);
 static int via_irqmap_unichrome[] = {-1, -1, -1, 0, -1, 1};
 
 static unsigned time_diff(struct timeval *now, struct timeval *then)
diff --git a/drivers/char/drm/via_verifier.c b/drivers/char/drm/via_verifier.c
index 2e7e080..fc47cf6 100644
--- a/drivers/char/drm/via_verifier.c
+++ b/drivers/char/drm/via_verifier.c
@@ -1110,9 +1110,9 @@ setup_hazard_table(hz_init_t init_table[], hazard_t table[], int size)
 void via_init_command_verifier(void)
 {
 	setup_hazard_table(init_table1, table1,
-			   sizeof(init_table1) / sizeof(hz_init_t));
+			   ARRAY_SIZE(init_table1));
 	setup_hazard_table(init_table2, table2,
-			   sizeof(init_table2) / sizeof(hz_init_t));
+			   ARRAY_SIZE(init_table2));
 	setup_hazard_table(init_table3, table3,
-			   sizeof(init_table3) / sizeof(hz_init_t));
+			   ARRAY_SIZE(init_table3));
 }
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.linux-foundation.org
https://lists.linux-foundation.org/mailman/listinfo/kernel-janitors
