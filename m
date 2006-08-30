From: James Nelson <james4765@gmail.com>
Date: Wed, 30 Aug 2006 21:49:18 +0000
Subject: [KJ] [PATCH] 34/37 alpha: add printk() KERN_ constants to
Message-Id: <20060830214918.15055.44637.sendpatchset@david.homenet>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Signed-off-by: James Nelson <james4765@gmail.com>
---
diff --git a/arch/alpha/kernel/sys_titan.c b/arch/alpha/kernel/sys_titan.c
index 302aab3..670b33d 100644
--- a/arch/alpha/kernel/sys_titan.c
+++ b/arch/alpha/kernel/sys_titan.c
@@ -169,7 +169,7 @@ titan_set_irq_affinity(unsigned int irq,
 static void
 titan_device_interrupt(unsigned long vector, struct pt_regs * regs)
 {
-	printk("titan_device_interrupt: NOT IMPLEMENTED YET!! \n");
+	printk(KERN_DEBUG "titan_device_interrupt: NOT IMPLEMENTED YET!! \n");
 }
 
 static void 
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
