From: James Nelson <james4765@gmail.com>
Date: Wed, 30 Aug 2006 21:48:30 +0000
Subject: [KJ] [PATCH] 27/37 alpha: add printk() KERN_ constants to
Message-Id: <20060830214830.15055.84770.sendpatchset@david.homenet>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Signed-off-by: James Nelson <james4765@gmail.com>
---
diff --git a/arch/alpha/kernel/sys_dp264.c b/arch/alpha/kernel/sys_dp264.c
index dd6103b..7b826ca 100644
--- a/arch/alpha/kernel/sys_dp264.c
+++ b/arch/alpha/kernel/sys_dp264.c
@@ -220,7 +220,7 @@ static void
 dp264_device_interrupt(unsigned long vector, struct pt_regs * regs)
 {
 #if 1
-	printk("dp264_device_interrupt: NOT IMPLEMENTED YET!! \n");
+	printk(KERN_WARNING "dp264_device_interrupt: NOT IMPLEMENTED YET!! \n");
 #else
 	unsigned long pld;
 	unsigned int i;
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
