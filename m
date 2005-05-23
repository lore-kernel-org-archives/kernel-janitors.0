From: Christophe Lucas <clucas@rotomalug.org>
Date: Mon, 23 May 2005 10:54:46 +0000
Subject: [KJ] [PATCH] printk : arch/i386/mm/pgtable.c
Message-Id: <20050523105446.GH13768@rhum.iomeda.fr>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="zCKi3GIZzVBPywwA"
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org


--zCKi3GIZzVBPywwA
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Description:
printk() calls should include appropriate KERN_* constant.

Signed-off-by: Christophe Lucas <clucas@rotomalug.org>


--zCKi3GIZzVBPywwA
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment;
	filename="linux-2.6.12-rc4_arch_i386_mm_pgtable.c.patch"

diff -urpNX dontdiff a/arch/i386/mm/pgtable.c b/arch/i386/mm/pgtable.c
--- a/arch/i386/mm/pgtable.c	2005-05-07 07:20:31.000000000 +0200
+++ b/arch/i386/mm/pgtable.c	2005-05-23 12:43:27.772740776 +0200
@@ -31,9 +31,9 @@ void show_mem(void)
 	pg_data_t *pgdat;
 	unsigned long i;
 
-	printk("Mem-info:\n");
+	printk(KERN_INFO "Mem-info:\n");
 	show_free_areas();
-	printk("Free swap:       %6ldkB\n", nr_swap_pages<<(PAGE_SHIFT-10));
+	printk(KERN_INFO "Free swap:       %6ldkB\n", nr_swap_pages<<(PAGE_SHIFT-10));
 	for_each_pgdat(pgdat) {
 		for (i = 0; i < pgdat->node_spanned_pages; ++i) {
 			page = pgdat->node_mem_map + i;
@@ -48,11 +48,11 @@ void show_mem(void)
 				shared += page_count(page) - 1;
 		}
 	}
-	printk("%d pages of RAM\n", total);
-	printk("%d pages of HIGHMEM\n",highmem);
-	printk("%d reserved pages\n",reserved);
-	printk("%d pages shared\n",shared);
-	printk("%d pages swap cached\n",cached);
+	printk(KERN_INFO "%d pages of RAM\n", total);
+	printk(KERN_INFO "%d pages of HIGHMEM\n",highmem);
+	printk(KERN_INFO "%d reserved pages\n",reserved);
+	printk(KERN_INFO "%d pages shared\n",shared);
+	printk(KERN_INFO "%d pages swap cached\n",cached);
 }
 
 /*
@@ -105,16 +105,16 @@ void set_pmd_pfn(unsigned long vaddr, un
 	pmd_t *pmd;
 
 	if (vaddr & (PMD_SIZE-1)) {		/* vaddr is misaligned */
-		printk ("set_pmd_pfn: vaddr misaligned\n");
+		printk(KERN_WARNING "set_pmd_pfn: vaddr misaligned\n");
 		return; /* BUG(); */
 	}
 	if (pfn & (PTRS_PER_PTE-1)) {		/* pfn is misaligned */
-		printk ("set_pmd_pfn: pfn misaligned\n");
+		printk(KERN_WARNING "set_pmd_pfn: pfn misaligned\n");
 		return; /* BUG(); */
 	}
 	pgd = swapper_pg_dir + pgd_index(vaddr);
 	if (pgd_none(*pgd)) {
-		printk ("set_pmd_pfn: pgd_none\n");
+		printk(KERN_WARNING "set_pmd_pfn: pgd_none\n");
 		return; /* BUG(); */
 	}
 	pud = pud_offset(pgd, vaddr);

--zCKi3GIZzVBPywwA
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--zCKi3GIZzVBPywwA--
