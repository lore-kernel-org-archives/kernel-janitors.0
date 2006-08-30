From: James Nelson <james4765@gmail.com>
Date: Wed, 30 Aug 2006 21:49:24 +0000
Subject: [KJ] [PATCH] 35/37 alpha: add printk() KERN_ constants to
Message-Id: <20060830214924.15055.96905.sendpatchset@david.homenet>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Signed-off-by: James Nelson <james4765@gmail.com>
---
diff --git a/arch/alpha/kernel/sys_wildfire.c b/arch/alpha/kernel/sys_wildfire.c
index 22c5798..af5dc17 100644
--- a/arch/alpha/kernel/sys_wildfire.c
+++ b/arch/alpha/kernel/sys_wildfire.c
@@ -151,7 +151,7 @@ wildfire_end_irq(unsigned int irq)
 { 
 #if 0
 	if (!irq_desc[irq].action)
-		printk("got irq %d\n", irq);
+		pr_info("got irq %d\n", irq);
 #endif
 	if (!(irq_desc[irq].status & (IRQ_DISABLED|IRQ_INPROGRESS)))
 		wildfire_enable_irq(irq);
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
