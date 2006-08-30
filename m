From: James Nelson <james4765@gmail.com>
Date: Wed, 30 Aug 2006 21:48:58 +0000
Subject: [KJ] [PATCH] 31/37 alpha: add printk() KERN_ constants to
Message-Id: <20060830214858.15055.7455.sendpatchset@david.homenet>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Signed-off-by: James Nelson <james4765@gmail.com>
---
diff --git a/arch/alpha/kernel/sys_nautilus.c b/arch/alpha/kernel/sys_nautilus.c
index c0d696e..6b95cac 100644
--- a/arch/alpha/kernel/sys_nautilus.c
+++ b/arch/alpha/kernel/sys_nautilus.c
@@ -116,7 +116,7 @@ static void
 naut_sys_machine_check(unsigned long vector, unsigned long la_ptr,
 		       struct pt_regs *regs)
 {
-	printk("PC %lx RA %lx\n", regs->pc, regs->r26);
+	printk(KERN_CRIT "PC %lx RA %lx\n", regs->pc, regs->r26);
 	irongate_pci_clr_err();
 }
 
@@ -230,7 +230,7 @@ nautilus_init_pci(void)
 	if (memtop > alpha_mv.min_mem_address) {
 		free_reserved_mem(__va(alpha_mv.min_mem_address),
 				  __va(memtop));
-		printk("nautilus_init_pci: %ldk freed\n",
+		pr_info("nautilus_init_pci: %ldk freed\n",
 			(memtop - alpha_mv.min_mem_address) >> 10);
 	}
 
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
