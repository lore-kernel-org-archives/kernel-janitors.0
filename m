From: James Nelson <james4765@gmail.com>
Date: Tue, 12 Sep 2006 03:21:10 +0000
Subject: [KJ] [PATCH 4/7][RESEND] arm: add KERN_* constants to printk()'s in
Message-Id: <20060912032110.5999.51249.sendpatchset@david.homenet>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Diffstat:

 alignment.c |    2 +-
 fault.c     |    2 +-
 init.c      |   16 ++++++++--------
 ioremap.c   |    2 +-
 mm-armv.c   |    2 +-
 5 files changed, 12 insertions(+), 12 deletions(-)

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
diff --git a/arch/arm/mm/fault.c b/arch/arm/mm/fault.c
index c5e0622..3907bc5 100644
--- a/arch/arm/mm/fault.c
+++ b/arch/arm/mm/fault.c
@@ -266,7 +266,7 @@ do_page_fault(unsigned long addr, unsign
 		 * happened to us that made us unable to handle
 		 * the page fault gracefully.
 		 */
-		printk("VM: killing process %s\n", tsk->comm);
+		printk(KERN_WARNING "VM: killing process %s\n", tsk->comm);
 		do_exit(SIGKILL);
 		return 0;
 
diff --git a/arch/arm/mm/init.c b/arch/arm/mm/init.c
index fe3f7f6..b17a60a 100644
--- a/arch/arm/mm/init.c
+++ b/arch/arm/mm/init.c
@@ -49,9 +49,9 @@ void show_mem(void)
 	int free = 0, total = 0, reserved = 0;
 	int shared = 0, cached = 0, slab = 0, node;
 
-	printk("Mem-info:\n");
+	pr_info("Mem-info:\n");
 	show_free_areas();
-	printk("Free swap:       %6ldkB\n", nr_swap_pages<<(PAGE_SHIFT-10));
+	pr_info("Free swap:       %6ldkB\n", nr_swap_pages<<(PAGE_SHIFT-10));
 
 	for_each_online_node(node) {
 		struct page *page, *end;
@@ -75,12 +75,12 @@ void show_mem(void)
 		} while (page < end);
 	}
 
-	printk("%d pages of RAM\n", total);
-	printk("%d free pages\n", free);
-	printk("%d reserved pages\n", reserved);
-	printk("%d slab pages\n", slab);
-	printk("%d pages shared\n", shared);
-	printk("%d pages swap cached\n", cached);
+	pr_info("%d pages of RAM\n", total);
+	pr_info("%d free pages\n", free);
+	pr_info("%d reserved pages\n", reserved);
+	pr_info("%d slab pages\n", slab);
+	pr_info("%d pages shared\n", shared);
+	pr_info("%d pages swap cached\n", cached);
 }
 
 static inline pmd_t *pmd_off(pgd_t *pgd, unsigned long virt)
diff --git a/arch/arm/mm/ioremap.c b/arch/arm/mm/ioremap.c
index 88a999d..7b3d951 100644
--- a/arch/arm/mm/ioremap.c
+++ b/arch/arm/mm/ioremap.c
@@ -61,7 +61,7 @@ remap_area_pte(pte_t * pte, unsigned lon
 	return;
 
  bad:
-	printk("remap_area_pte: page already exists\n");
+	printk(KERN_CRIT "remap_area_pte: page already exists\n");
 	BUG();
 }
 
diff --git a/arch/arm/mm/mm-armv.c b/arch/arm/mm/mm-armv.c
index 38769f5..12d20e5 100644
--- a/arch/arm/mm/mm-armv.c
+++ b/arch/arm/mm/mm-armv.c
@@ -485,7 +485,7 @@ #endif
 		mem_types[MT_CACHECLEAN].prot_sect |= PMD_SECT_WB;
 		break;
 	}
-	printk("Memory policy: ECC %sabled, Data cache %s\n",
+	pr_info("Memory policy: ECC %sabled, Data cache %s\n",
 		ecc_mask ? "en" : "dis", cp->policy);
 }
 
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
