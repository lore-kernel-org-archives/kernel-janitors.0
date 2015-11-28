From: Julia Lawall <Julia.Lawall@lip6.fr>
Date: Sat, 28 Nov 2015 15:58:15 +0000
Subject: [PATCH] x86, calgary: constify cal_chipset_ops structures
Message-Id: <1448726295-10959-1-git-send-email-Julia.Lawall@lip6.fr>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Muli Ben-Yehuda <muli@il.ibm.com>
Cc: kernel-janitors@vger.kernel.org, "Jon D. Mason" <jdmason@kudzu.us>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, "H. Peter Anvin" <hpa@zytor.com>, x86@kernel.org, discuss@x86-64.org, linux-kernel@vger.kernel.org

The cal_chipset_ops structures are never modified, so declare them
as const.

Done with the help of Coccinelle.

Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>

---
 arch/x86/include/asm/calgary.h   |    2 +-
 arch/x86/kernel/pci-calgary_64.c |    4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/x86/include/asm/calgary.h b/arch/x86/include/asm/calgary.h
index 0d467b3..a8303eb 100644
--- a/arch/x86/include/asm/calgary.h
+++ b/arch/x86/include/asm/calgary.h
@@ -31,7 +31,7 @@
 #include <asm/types.h>
 
 struct iommu_table {
-	struct cal_chipset_ops *chip_ops; /* chipset specific funcs */
+	const struct cal_chipset_ops *chip_ops; /* chipset specific funcs */
 	unsigned long  it_base;      /* mapped address of tce table */
 	unsigned long  it_hint;      /* Hint for next alloc */
 	unsigned long *it_map;       /* A simple allocation bitmap for now */
diff --git a/arch/x86/kernel/pci-calgary_64.c b/arch/x86/kernel/pci-calgary_64.c
index 0497f71..833b1d3 100644
--- a/arch/x86/kernel/pci-calgary_64.c
+++ b/arch/x86/kernel/pci-calgary_64.c
@@ -180,13 +180,13 @@ static void calioc2_dump_error_regs(struct iommu_table *tbl);
 static void calgary_init_bitmap_from_tce_table(struct iommu_table *tbl);
 static void get_tce_space_from_tar(void);
 
-static struct cal_chipset_ops calgary_chip_ops = {
+static const struct cal_chipset_ops calgary_chip_ops = {
 	.handle_quirks = calgary_handle_quirks,
 	.tce_cache_blast = calgary_tce_cache_blast,
 	.dump_error_regs = calgary_dump_error_regs
 };
 
-static struct cal_chipset_ops calioc2_chip_ops = {
+static const struct cal_chipset_ops calioc2_chip_ops = {
 	.handle_quirks = calioc2_handle_quirks,
 	.tce_cache_blast = calioc2_tce_cache_blast,
 	.dump_error_regs = calioc2_dump_error_regs

