From: James Nelson <james4765@gmail.com>
Date: Thu, 07 Sep 2006 23:26:11 +0000
Subject: [KJ] [PATCH 2/6] arm: add KERN_ constants to arch/arm/kernel/ecard.c
Message-Id: <20060907232611.9720.69575.sendpatchset@david.homenet>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Signed-off-by: James Nelson <james4765@gmail.com>
---
diff --git a/arch/arm/kernel/ecard.c b/arch/arm/kernel/ecard.c
index eca248d..b277321 100644
--- a/arch/arm/kernel/ecard.c
+++ b/arch/arm/kernel/ecard.c
@@ -510,13 +510,13 @@ static void ecard_dump_irq_state(void)
 {
 	ecard_t *ec;
 
-	printk("Expansion card IRQ state:\n");
+	pr_info("Expansion card IRQ state:\n");
 
 	for (ec = cards; ec; ec = ec->next) {
 		if (ec->slot_no = 8)
 			continue;
 
-		printk("  %d: %sclaimed, ",
+		pr_info("  %d: %sclaimed, ",
 		       ec->slot_no, ec->claimed ? "" : "not ");
 
 		if (ec->ops && ec->ops->irqpending &&
@@ -546,7 +546,7 @@ static void ecard_check_lockup(struct ir
 	if (last = jiffies) {
 		lockup += 1;
 		if (lockup > 1000000) {
-			printk(KERN_ERR "\nInterrupt lockup detected - "
+			printk(KERN_ERR "Interrupt lockup detected - "
 			       "disabling all expansion card interrupts\n");
 
 			desc->chip->mask(IRQ_EXPANSIONCARD);
@@ -1067,7 +1067,7 @@ static int __init ecard_init(void)
 		return ret;
 	}
 
-	printk("Probing expansion cards\n");
+	pr_info("Probing expansion cards\n");
 
 	for (slot = 0; slot < 8; slot ++) {
 		if (ecard_probe(slot, ECARD_EASI) = -ENODEV)
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
