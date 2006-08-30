From: James Nelson <james4765@gmail.com>
Date: Wed, 30 Aug 2006 21:49:05 +0000
Subject: [KJ] [PATCH] 32/37 alpha: add printk() KERN_ constants to
Message-Id: <20060830214905.15055.56506.sendpatchset@david.homenet>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Signed-off-by: James Nelson <james4765@gmail.com>
---
diff --git a/arch/alpha/kernel/sys_sable.c b/arch/alpha/kernel/sys_sable.c
index a7a1464..1e0339c 100644
--- a/arch/alpha/kernel/sys_sable.c
+++ b/arch/alpha/kernel/sys_sable.c
@@ -453,7 +453,7 @@ sable_lynx_enable_irq(unsigned int irq)
 	sable_lynx_irq_swizzle->update_irq_hw(bit, mask);
 	spin_unlock(&sable_lynx_irq_lock);
 #if 0
-	printk("%s: mask 0x%lx bit 0x%x irq 0x%x\n",
+	printk(KERN_DEBUG "%s: mask 0x%lx bit 0x%x irq 0x%x\n",
 	       __FUNCTION__, mask, bit, irq);
 #endif
 }
@@ -469,7 +469,7 @@ sable_lynx_disable_irq(unsigned int irq)
 	sable_lynx_irq_swizzle->update_irq_hw(bit, mask);
 	spin_unlock(&sable_lynx_irq_lock);
 #if 0
-	printk("%s: mask 0x%lx bit 0x%x irq 0x%x\n",
+	printk(KERN_DEBUG "%s: mask 0x%lx bit 0x%x irq 0x%x\n",
 	       __FUNCTION__, mask, bit, irq);
 #endif
 }
@@ -523,7 +523,7 @@ sable_lynx_srm_device_interrupt(unsigned
 	bit = (vector - 0x800) >> 4;
 	irq = sable_lynx_irq_swizzle->mask_to_irq[bit];
 #if 0
-	printk("%s: vector 0x%lx bit 0x%x irq 0x%x\n",
+	printk(KERN_DEBUG "%s: vector 0x%lx bit 0x%x irq 0x%x\n",
 	       __FUNCTION__, vector, bit, irq);
 #endif
 	handle_irq(irq, regs);
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
