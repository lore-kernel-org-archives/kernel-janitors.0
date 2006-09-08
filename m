From: James Nelson <james4765@gmail.com>
Date: Fri, 08 Sep 2006 02:02:28 +0000
Subject: [KJ] [PATCH 54/72] arm: add KERN_ constants to
Message-Id: <20060908020228.10114.22574.sendpatchset@david.homenet>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Signed-off-by: James Nelson <james4765@gmail.com>
---
diff --git a/arch/arm/mach-shark/irq.c b/arch/arm/mach-shark/irq.c
index b227052..d42cbb3 100644
--- a/arch/arm/mach-shark/irq.c
+++ b/arch/arm/mach-shark/irq.c
@@ -63,7 +63,7 @@ static void shark_ack_8259A_irq(unsigned
 
 static irqreturn_t bogus_int(int irq, void *dev_id, struct pt_regs *regs)
 {
-	printk("Got interrupt %i!\n",irq);
+	printk(KERN_WARNING "bogus interrupt %i!\n",irq);
 	return IRQ_NONE;
 }
 
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
