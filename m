From: Eric Sesterhenn <snakebyte@gmx.de>
Date: Wed, 06 Sep 2006 21:48:39 +0000
Subject: [KJ] [Patch] BUG_ON cleanups in arch/i386
Message-Id: <1157579319.19913.1.camel@alice>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

hi,

this changes a couple of if() BUG(); constructs to
BUG_ON(); so it can be safely optimized away.

Signed-off-by: Eric Sesterhenn <snakebyte@gmx.de>

--- linux-2.6.18-rc6/arch/i386/kernel/cpu/common.c.orig	2006-09-06 23:39:43.000000000 +0200
+++ linux-2.6.18-rc6/arch/i386/kernel/cpu/common.c	2006-09-06 23:39:59.000000000 +0200
@@ -660,8 +660,7 @@ old_gdt:
 	 */
 	atomic_inc(&init_mm.mm_count);
 	current->active_mm = &init_mm;
-	if (current->mm)
-		BUG();
+	BUG_ON(current->mm);
 	enter_lazy_tlb(&init_mm, current);
 
 	load_esp0(t, thread);
--- linux-2.6.18-rc6/./arch/i386/kernel/efi.c.orig	2006-09-06 23:40:22.000000000 +0200
+++ linux-2.6.18-rc6/./arch/i386/kernel/efi.c	2006-09-06 23:40:30.000000000 +0200
@@ -498,8 +498,7 @@ void __init efi_enter_virtual_mode(void)
 		check_range_for_systab(md);
 	}
 
-	if (!efi.systab)
-		BUG();
+	BUG_ON(!efi.systab);
 
 	status = phys_efi_set_virtual_address_map(
 			memmap.desc_size * memmap.nr_map,
--- linux-2.6.18-rc6/arch/i386/mm/discontig.c.orig	2006-09-06 23:42:04.000000000 +0200
+++ linux-2.6.18-rc6/arch/i386/mm/discontig.c	2006-09-06 23:42:21.000000000 +0200
@@ -152,8 +152,7 @@ static void __init find_max_pfn_node(int
 	 */
 	if (node_start_pfn[nid] > max_pfn)
 		node_start_pfn[nid] = max_pfn;
-	if (node_start_pfn[nid] > node_end_pfn[nid])
-		BUG();
+	BUG_ON(node_start_pfn[nid] > node_end_pfn[nid]);
 }
 
 /* Find the owning node for a pfn. */
--- linux-2.6.18-rc6/arch/i386/mm/init.c.orig	2006-09-06 23:44:02.000000000 +0200
+++ linux-2.6.18-rc6/arch/i386/mm/init.c	2006-09-06 23:44:09.000000000 +0200
@@ -574,8 +574,7 @@ void __init mem_init(void)
 	int bad_ppro;
 
 #ifdef CONFIG_FLATMEM
-	if (!mem_map)
-		BUG();
+	BUG_ON(!mem_map);
 #endif
 	
 	bad_ppro = ppro_with_ram_bug();


_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
