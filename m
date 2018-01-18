From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Thu, 18 Jan 2018 16:26:48 +0000
Subject: [PATCH 4/5] irqchip/irq-gic-v3-its: Delete an error message for a failed memory allocation in two fu
Message-Id: <9a0b32f0-e498-cb5e-8786-87b13161147b@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <cd9daaf3-677e-9845-0d36-b6826b3457b5@users.sourceforge.net>
In-Reply-To: <cd9daaf3-677e-9845-0d36-b6826b3457b5@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org, Jason Cooper <jason@lakedaemon.net>, Marc Zyngier <marc.zyngier@arm.com>, Thomas Gleixner <tglx@linutronix.de>
Cc: LKML <linux-kernel@vger.kernel.org>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Thu, 18 Jan 2018 16:54:16 +0100

Omit an extra message for a memory allocation failure in these functions.

This issue was detected by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/irqchip/irq-gic-v3-its.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/drivers/irqchip/irq-gic-v3-its.c b/drivers/irqchip/irq-gic-v3-its.c
index 06f025fd5726..100c3125f20e 100644
--- a/drivers/irqchip/irq-gic-v3-its.c
+++ b/drivers/irqchip/irq-gic-v3-its.c
@@ -3084,10 +3084,8 @@ static int its_init_vpe_domain(void)
 	entries = roundup_pow_of_two(nr_cpu_ids);
 	vpe_proxy.vpes = kzalloc(sizeof(*vpe_proxy.vpes) * entries,
 				 GFP_KERNEL);
-	if (!vpe_proxy.vpes) {
-		pr_err("ITS: Can't allocate GICv4 proxy device array\n");
+	if (!vpe_proxy.vpes)
 		return -ENOMEM;
-	}
 
 	/* Use the last possible DevID */
 	devid = GENMASK(its->device_ids - 1, 0);
@@ -3407,10 +3405,8 @@ static void __init acpi_table_parse_srat_its(void)
 
 	its_srat_maps = kmalloc(count * sizeof(struct its_srat_map),
 				GFP_KERNEL);
-	if (!its_srat_maps) {
-		pr_warn("SRAT: Failed to allocate memory for its_srat_maps!\n");
+	if (!its_srat_maps)
 		return;
-	}
 
 	acpi_table_parse_entries(ACPI_SIG_SRAT,
 			sizeof(struct acpi_table_srat),
-- 
2.15.1

