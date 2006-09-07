From: James Nelson <james4765@gmail.com>
Date: Thu, 07 Sep 2006 22:25:16 +0000
Subject: [KJ] [PATCH 1/3] alpha: add KERN_ constants to arch/alpha/mm/init.c
Message-Id: <20060907222516.9459.25574.sendpatchset@david.homenet>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Signed-off-by: James Nelson <james4765@gmail.com>
---
diff --git a/arch/alpha/mm/init.c b/arch/alpha/mm/init.c
index 917dad1..fbf9f98 100644
--- a/arch/alpha/mm/init.c
+++ b/arch/alpha/mm/init.c
@@ -101,9 +101,9 @@ show_mem(void)
 	long i,free = 0,total = 0,reserved = 0;
 	long shared = 0, cached = 0;
 
-	printk("\nMem-info:\n");
+	pr_info("\nMem-info:\n");
 	show_free_areas();
-	printk("Free swap:       %6ldkB\n", nr_swap_pages<<(PAGE_SHIFT-10));
+	pr_info("Free swap:       %6ldkB\n", nr_swap_pages<<(PAGE_SHIFT-10));
 	i = max_mapnr;
 	while (i-- > 0) {
 		total++;
@@ -116,11 +116,11 @@ show_mem(void)
 		else
 			shared += page_count(mem_map + i) - 1;
 	}
-	printk("%ld pages of RAM\n",total);
-	printk("%ld free pages\n",free);
-	printk("%ld reserved pages\n",reserved);
-	printk("%ld pages shared\n",shared);
-	printk("%ld pages swap cached\n",cached);
+	pr_info("%ld pages of RAM\n",total);
+	pr_info("%ld free pages\n",free);
+	pr_info("%ld reserved pages\n",reserved);
+	pr_info("%ld pages shared\n",shared);
+	pr_info("%ld pages swap cached\n",cached);
 }
 #endif
 
@@ -330,7 +330,7 @@ printk_memory_info(void)
 	datasize =  (unsigned long) &_edata - (unsigned long) &_data;
 	initsize =  (unsigned long) &__init_end - (unsigned long) &__init_begin;
 
-	printk("Memory: %luk/%luk available (%luk kernel code, %luk reserved, %luk data, %luk init)\n",
+	pr_info("Memory: %luk/%luk available (%luk kernel code, %luk reserved, %luk data, %luk init)\n",
 	       (unsigned long) nr_free_pages() << (PAGE_SHIFT-10),
 	       max_mapnr << (PAGE_SHIFT-10),
 	       codesize >> 10,
@@ -368,7 +368,7 @@ free_initmem(void)
 	extern char __init_begin, __init_end;
 
 	free_reserved_mem(&__init_begin, &__init_end);
-	printk ("Freeing unused kernel memory: %ldk freed\n",
+	pr_info ("Freeing unused kernel memory: %ldk freed\n",
 		(&__init_end - &__init_begin) >> 10);
 }
 
@@ -377,6 +377,6 @@ void
 free_initrd_mem(unsigned long start, unsigned long end)
 {
 	free_reserved_mem((void *)start, (void *)end);
-	printk ("Freeing initrd memory: %ldk freed\n", (end - start) >> 10);
+	pr_info ("Freeing initrd memory: %ldk freed\n", (end - start) >> 10);
 }
 #endif
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
