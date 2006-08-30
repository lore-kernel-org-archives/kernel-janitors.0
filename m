From: James Nelson <james4765@gmail.com>
Date: Wed, 30 Aug 2006 21:47:56 +0000
Subject: [KJ] [PATCH] 22/37 alpha: add printk() KERN_ constants to
Message-Id: <20060830214756.15055.89077.sendpatchset@david.homenet>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Signed-off-by: James Nelson <james4765@gmail.com>
---
diff --git a/arch/alpha/kernel/setup.c b/arch/alpha/kernel/setup.c
index fd4a8fa..adc2d8f 100644
--- a/arch/alpha/kernel/setup.c
+++ b/arch/alpha/kernel/setup.c
@@ -283,7 +283,7 @@ move_initrd(unsigned long mem_limit)
 	memmove(start, (void *)initrd_start, size);
 	initrd_start = (unsigned long)start;
 	initrd_end = initrd_start + size;
-	printk("initrd moved to %p\n", start);
+	pr_info("initrd moved to %p\n", start);
 	return start;
 }
 #endif
@@ -304,7 +304,7 @@ setup_memory(void *kernel_end)
 	  (hwrpb->mddt_offset + (unsigned long) hwrpb);
 
 	for_each_mem_cluster(memdesc, cluster, i) {
-		printk("memcluster %lu, usage %01lx, start %8lu, end %8lu\n",
+		pr_info("memcluster %lu, usage %01lx, start %8lu, end %8lu\n",
 		       i, cluster->usage, cluster->start_pfn,
 		       cluster->start_pfn + cluster->numpages);
 
@@ -339,7 +339,7 @@ setup_memory(void *kernel_end)
 
 	if (mem_size_limit && max_low_pfn >= mem_size_limit)
 	{
-		printk("setup: forcing memory size to %ldK (from %ldK).\n",
+		pr_info("setup: forcing memory size to %ldK (from %ldK)\n",
 		       mem_size_limit << (PAGE_SHIFT - 10),
 		       max_low_pfn    << (PAGE_SHIFT - 10));
 		max_low_pfn = mem_size_limit;
@@ -408,7 +408,7 @@ setup_memory(void *kernel_end)
 				free_bootmem(PFN_PHYS(start),
 					     (PFN_PHYS(start_kernel_pfn)
 					      - PFN_PHYS(start)));
-				printk("freeing pages %ld:%ld\n",
+				pr_info("freeing pages %ld:%ld\n",
 				       start, start_kernel_pfn);
 				start = end_kernel_pfn;
 			} else if (end > start_kernel_pfn)
@@ -419,26 +419,26 @@ setup_memory(void *kernel_end)
 			continue;
 
 		free_bootmem(PFN_PHYS(start), PFN_PHYS(end) - PFN_PHYS(start));
-		printk("freeing pages %ld:%ld\n", start, end);
+		pr_info("freeing pages %ld:%ld\n", start, end);
 	}
 
 	/* Reserve the bootmap memory.  */
 	reserve_bootmem(PFN_PHYS(bootmap_start), bootmap_size);
-	printk("reserving pages %ld:%ld\n", bootmap_start, bootmap_start+PFN_UP(bootmap_size));
+	pr_info("reserving pages %ld:%ld\n", bootmap_start, bootmap_start+PFN_UP(bootmap_size));
 
 #ifdef CONFIG_BLK_DEV_INITRD
 	initrd_start = INITRD_START;
 	if (initrd_start) {
 		initrd_end = initrd_start+INITRD_SIZE;
-		printk("Initial ramdisk at: 0x%p (%lu bytes)\n",
+		pr_info("Initial ramdisk at: 0x%p (%lu bytes)\n",
 		       (void *) initrd_start, INITRD_SIZE);
 
 		if ((void *)initrd_end > phys_to_virt(PFN_PHYS(max_low_pfn))) {
 			if (!move_initrd(PFN_PHYS(max_low_pfn)))
-				printk("initrd extends beyond end of memory "
-				       "(0x%08lx > 0x%p)\ndisabling initrd\n",
-				       initrd_end,
+				printk(KERN_WARNING "initrd extends beyond end of memory "
+				       "(0x%08lx > 0x%p)\n", initrd_end,
 				       phys_to_virt(PFN_PHYS(max_low_pfn)));
+				printk(KERN_WARNING "disabling initrd\n");
 		} else {
 			reserve_bootmem(virt_to_phys((void *)initrd_start),
 					INITRD_SIZE);
@@ -631,7 +631,7 @@ #endif
 		alpha_mv = *vec;
 	}
 	
-	printk("Booting "
+	pr_info ("Booting "
 #ifdef CONFIG_ALPHA_GENERIC
 	       "GENERIC "
 #endif
@@ -640,7 +640,7 @@ #endif
 	       var_name, alpha_mv.vector_name,
 	       (alpha_using_srm ? "SRM" : "MILO"));
 
-	printk("Major Options: "
+	pr_info("Major Options: "
 #ifdef CONFIG_SMP
 	       "SMP "
 #endif
@@ -672,7 +672,7 @@ #ifdef CONFIG_MAGIC_SYSRQ
 #endif
 	       "\n");
 
-	printk("Command line: %s\n", command_line);
+	pr_info("Command line: %s\n", command_line);
 
 	/* 
 	 * Sync up the HAE.
@@ -726,7 +726,7 @@ #endif
  	 */
 
  	if (hwrpb->max_asn != MAX_ASN) {
-		printk("Max ASN from HWRPB is bad (0x%lx)\n", hwrpb->max_asn);
+		printk(KERN_WARNING "Max ASN from HWRPB is bad (0x%lx)\n", hwrpb->max_asn);
  	}
 
 	/*
@@ -1317,7 +1317,7 @@ external_cache_probe(int minsize, int wi
 		cycles = read_mem_block(__va(0), stride, size);
 		if (cycles > prev_cycles * 2) {
 			/* Fine, we exceed the cache. */
-			printk("%ldK Bcache detected; load hit latency %d "
+			pr_info("%ldK Bcache detected; load hit latency %d "
 			       "cycles, load miss latency %d cycles\n",
 			       size >> 11, prev_cycles, cycles);
 			return CSHAPE(size >> 1, width, 1);
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
