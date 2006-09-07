From: James Nelson <james4765@gmail.com>
Date: Thu, 07 Sep 2006 22:25:23 +0000
Subject: [KJ] [PATCH 2/3] alpha: add KERN_ constants to arch/alpha/mm/numa.c
Message-Id: <20060907222523.9459.69848.sendpatchset@david.homenet>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Signed-off-by: James Nelson <james4765@gmail.com>
---
diff --git a/arch/alpha/mm/numa.c b/arch/alpha/mm/numa.c
index b826f58..2f58275 100644
--- a/arch/alpha/mm/numa.c
+++ b/arch/alpha/mm/numa.c
@@ -41,9 +41,9 @@ static void __init show_mem_layout(void)
 	memdesc = (struct memdesc_struct *)
 	  (hwrpb->mddt_offset + (unsigned long) hwrpb);
 
-	printk("Raw memory layout:\n");
+	pr_info("Raw memory layout:\n");
 	for_each_mem_cluster(memdesc, cluster, i) {
-		printk(" memcluster %2d, usage %1lx, start %8lu, end %8lu\n",
+		pr_info(" memcluster %2d, usage %1lx, start %8lu, end %8lu\n",
 		       i, cluster->usage, cluster->start_pfn,
 		       cluster->start_pfn + cluster->numpages);
 	}
@@ -90,9 +90,9 @@ setup_memory_node(int nid, void *kernel_
 
 		if (!show_init) {
 			show_init = 1;
-			printk("Initializing bootmem allocator on Node ID %d\n", nid);
+			pr_info("Initializing bootmem allocator on Node ID %d\n", nid);
 		}
-		printk(" memcluster %2d, usage %1lx, start %8lu, end %8lu\n",
+		pr_info(" memcluster %2d, usage %1lx, start %8lu, end %8lu\n",
 		       i, cluster->usage, cluster->start_pfn,
 		       cluster->start_pfn + cluster->numpages);
 
@@ -111,7 +111,7 @@ setup_memory_node(int nid, void *kernel_
 		static int msg_shown = 0;
 		if (!msg_shown) {
 			msg_shown = 1;
-			printk("setup: forcing memory size to %ldK (from %ldK).\n",
+			pr_info("setup: forcing memory size to %ldK (from %ldK)\n",
 			       mem_size_limit << (PAGE_SHIFT - 10),
 			       node_max_pfn    << (PAGE_SHIFT - 10));
 		}
@@ -136,12 +136,12 @@ #endif
 	/* Quasi-mark the pg_data_t as in-use */
 	node_min_pfn += node_datasz;
 	if (node_min_pfn >= node_max_pfn) {
-		printk(" not enough mem to reserve NODE_DATA");
+		printk(KERN_ERR " not enough mem to reserve NODE_DATA");
 		return;
 	}
 	NODE_DATA(nid)->bdata = &node_bdata[nid];
 
-	printk(" Detected node memory:   start %8lu, end %8lu\n",
+	pr_info(" Detected node memory:   start %8lu, end %8lu\n",
 	       node_min_pfn, node_max_pfn);
 
 	DBGDCONT(" DISCONTIG: node_data[%d]   is at 0x%p\n", nid, NODE_DATA(nid));
@@ -225,7 +225,7 @@ #endif
 				free_bootmem_node(NODE_DATA(nid), PFN_PHYS(start),
 					     (PFN_PHYS(start_kernel_pfn)
 					      - PFN_PHYS(start)));
-				printk(" freeing pages %ld:%ld\n",
+				pr_info(" freeing pages %ld:%ld\n",
 				       start, start_kernel_pfn);
 				start = end_kernel_pfn;
 			} else if (end > start_kernel_pfn)
@@ -236,12 +236,12 @@ #endif
 			continue;
 
 		free_bootmem_node(NODE_DATA(nid), PFN_PHYS(start), PFN_PHYS(end) - PFN_PHYS(start));
-		printk(" freeing pages %ld:%ld\n", start, end);
+		pr_info(" freeing pages %ld:%ld\n", start, end);
 	}
 
 	/* Reserve the bootmap memory.  */
 	reserve_bootmem_node(NODE_DATA(nid), PFN_PHYS(bootmap_start), bootmap_size);
-	printk(" reserving pages %ld:%ld\n", bootmap_start, bootmap_start+PFN_UP(bootmap_size));
+	pr_info(" reserving pages %ld:%ld\n", bootmap_start, bootmap_start+PFN_UP(bootmap_size));
 
 	node_set_online(nid);
 }
@@ -266,15 +266,16 @@ #ifdef CONFIG_BLK_DEV_INITRD
 		extern void *move_initrd(unsigned long);
 
 		initrd_end = initrd_start+INITRD_SIZE;
-		printk("Initial ramdisk at: 0x%p (%lu bytes)\n",
+		pr_info("Initial ramdisk at: 0x%p (%lu bytes)\n",
 		       (void *) initrd_start, INITRD_SIZE);
 
 		if ((void *)initrd_end > phys_to_virt(PFN_PHYS(max_low_pfn))) {
 			if (!move_initrd(PFN_PHYS(max_low_pfn)))
-				printk("initrd extends beyond end of memory "
-				       "(0x%08lx > 0x%p)\ndisabling initrd\n",
+				printk(KERN_ERR "initrd extends beyond end of memory "
+				       "(0x%08lx > 0x%p)\n",
 				       initrd_end,
 				       phys_to_virt(PFN_PHYS(max_low_pfn)));
+				printk(KERN_ERR "disabling initrd\n");
 		} else {
 			nid = kvaddr_to_nid(initrd_start);
 			reserve_bootmem_node(NODE_DATA(nid),
@@ -344,7 +345,7 @@ void __init mem_init(void)
 	datasize =  (unsigned long) &_edata - (unsigned long) &_data;
 	initsize =  (unsigned long) &__init_end - (unsigned long) &__init_begin;
 
-	printk("Memory: %luk/%luk available (%luk kernel code, %luk reserved, "
+	pr_info("Memory: %luk/%luk available (%luk kernel code, %luk reserved, "
 	       "%luk data, %luk init)\n",
 	       (unsigned long)nr_free_pages() << (PAGE_SHIFT-10),
 	       num_physpages << (PAGE_SHIFT-10),
@@ -364,9 +365,9 @@ show_mem(void)
 	long shared = 0, cached = 0;
 	int nid;
 
-	printk("\nMem-info:\n");
+	pr_info("Mem-info:\n");
 	show_free_areas();
-	printk("Free swap:       %6ldkB\n", nr_swap_pages<<(PAGE_SHIFT-10));
+	pr_info("Free swap:       %6ldkB\n", nr_swap_pages<<(PAGE_SHIFT-10));
 	for_each_online_node(nid) {
 		unsigned long flags;
 		pgdat_resize_lock(NODE_DATA(nid), &flags);
@@ -385,9 +386,9 @@ show_mem(void)
 		}
 		pgdat_resize_unlock(NODE_DATA(nid), &flags);
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
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
