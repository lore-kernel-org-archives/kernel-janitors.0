From: James Nelson <james4765@gmail.com>
Date: Fri, 08 Sep 2006 02:02:47 +0000
Subject: [KJ] [PATCH 57/72] arm: add KERN_ constants to arm/mm/alignment.c
Message-Id: <20060908020247.10114.37841.sendpatchset@david.homenet>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Signed-off-by: James Nelson <james4765@gmail.com>
---
diff --git a/arch/arm/mm/alignment.c b/arch/arm/mm/alignment.c
index e0d21bb..56532fe 100644
--- a/arch/arm/mm/alignment.c
+++ b/arch/arm/mm/alignment.c
@@ -756,7 +756,7 @@ do_alignment(unsigned long addr, unsigne
 	ai_user += 1;
 
 	if (ai_usermode & 1)
-		printk("Alignment trap: %s (%d) PC=0x%08lx Instr=0x%0*lx "
+		pr_info("Alignment trap: %s (%d) PC=0x%08lx Instr=0x%0*lx "
 		       "Address=0x%08lx FSR 0x%03x\n", current->comm,
 			current->pid, instrptr,
 		        thumb_mode(regs) ? 4 : 8,
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
