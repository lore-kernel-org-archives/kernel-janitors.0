From: Christophe Lucas <clucas@rotomalug.org>
Date: Fri, 23 Sep 2005 09:04:44 +0000
Subject: [KJ] [PATCH] printk : arch/alpha/kernel/setup.c
Message-Id: <20050923090444.GG10553@rhum.iomeda.fr>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============47785236788271401=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <20050908070849.GB26072@rhum.iomeda.fr>
In-Reply-To: <20050908070849.GB26072@rhum.iomeda.fr>
To: kernel-janitors@vger.kernel.org

--===============47785236788271401==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Description:
printk() calls should include appropriate KERN_* constant.

Signed-off-by: Christophe Lucas <clucas@rotomalug.org>


Index: linux-2.6.14-rc2/arch/alpha/kernel/setup.c
===================================================================
--- linux-2.6.14-rc2.orig/arch/alpha/kernel/setup.c
+++ linux-2.6.14-rc2/arch/alpha/kernel/setup.c
@@ -285,7 +285,7 @@ move_initrd(unsigned long mem_limit)
 	memmove(start, (void *)initrd_start, size);
 	initrd_start = (unsigned long)start;
 	initrd_end = initrd_start + size;
-	printk("initrd moved to %p\n", start);
+	printk(KERN_INFO "initrd moved to %p\n", start);
 	return start;
 }
 #endif
@@ -306,7 +306,7 @@ setup_memory(void *kernel_end)
 	  (hwrpb->mddt_offset + (unsigned long) hwrpb);
 
 	for_each_mem_cluster(memdesc, cluster, i) {
-		printk("memcluster %lu, usage %01lx, start %8lu, end %8lu\n",
+		printk(KERN_INFO "memcluster %lu, usage %01lx, start %8lu, end %8lu\n",
 		       i, cluster->usage, cluster->start_pfn,
 		       cluster->start_pfn + cluster->numpages);
 
@@ -341,7 +341,7 @@ setup_memory(void *kernel_end)
 
 	if (mem_size_limit && max_low_pfn >= mem_size_limit)
 	{
-		printk("setup: forcing memory size to %ldK (from %ldK).\n",
+		printk(KERN_INFO "setup: forcing memory size to %ldK (from %ldK).\n",
 		       mem_size_limit << (PAGE_SHIFT - 10),
 		       max_low_pfn    << (PAGE_SHIFT - 10));
 		max_low_pfn = mem_size_limit;
@@ -410,7 +410,7 @@ setup_memory(void *kernel_end)
 				free_bootmem(PFN_PHYS(start),
 					     (PFN_PHYS(start_kernel_pfn)
 					      - PFN_PHYS(start)));
-				printk("freeing pages %ld:%ld\n",
+				printk(KERN_INFO "freeing pages %ld:%ld\n",
 				       start, start_kernel_pfn);
 				start = end_kernel_pfn;
 			} else if (end > start_kernel_pfn)
@@ -421,23 +421,23 @@ setup_memory(void *kernel_end)
 			continue;
 
 		free_bootmem(PFN_PHYS(start), PFN_PHYS(end) - PFN_PHYS(start));
-		printk("freeing pages %ld:%ld\n", start, end);
+		printk(KERN_INFO "freeing pages %ld:%ld\n", start, end);
 	}
 
 	/* Reserve the bootmap memory.  */
 	reserve_bootmem(PFN_PHYS(bootmap_start), bootmap_size);
-	printk("reserving pages %ld:%ld\n", bootmap_start, bootmap_start+PFN_UP(bootmap_size));
+	printk(KERN_INFO "reserving pages %ld:%ld\n", bootmap_start, bootmap_start+PFN_UP(bootmap_size));
 
 #ifdef CONFIG_BLK_DEV_INITRD
 	initrd_start = INITRD_START;
 	if (initrd_start) {
 		initrd_end = initrd_start+INITRD_SIZE;
-		printk("Initial ramdisk at: 0x%p (%lu bytes)\n",
+		printk(KERN_INFO "Initial ramdisk at: 0x%p (%lu bytes)\n",
 		       (void *) initrd_start, INITRD_SIZE);
 
 		if ((void *)initrd_end > phys_to_virt(PFN_PHYS(max_low_pfn))) {
 			if (!move_initrd(PFN_PHYS(max_low_pfn)))
-				printk("initrd extends beyond end of memory "
+				printk(KERN_INFO "initrd extends beyond end of memory "
 				       "(0x%08lx > 0x%p)\ndisabling initrd\n",
 				       initrd_end,
 				       phys_to_virt(PFN_PHYS(max_low_pfn)));
@@ -662,7 +662,7 @@ setup_arch(char **cmdline_p)
 #endif
 	       "\n");
 
-	printk("Command line: %s\n", command_line);
+	printk(KERN_INFO "Command line: %s\n", command_line);
 
 	/* 
 	 * Sync up the HAE.
@@ -716,7 +716,7 @@ setup_arch(char **cmdline_p)
  	 */
 
  	if (hwrpb->max_asn != MAX_ASN) {
-		printk("Max ASN from HWRPB is bad (0x%lx)\n", hwrpb->max_asn);
+		printk(KERN_INFO "Max ASN from HWRPB is bad (0x%lx)\n", hwrpb->max_asn);
  	}
 
 	/*
@@ -1307,7 +1307,7 @@ external_cache_probe(int minsize, int wi
 		cycles = read_mem_block(__va(0), stride, size);
 		if (cycles > prev_cycles * 2) {
 			/* Fine, we exceed the cache. */
-			printk("%ldK Bcache detected; load hit latency %d "
+			printk(KERN_INFO "%ldK Bcache detected; load hit latency %d "
 			       "cycles, load miss latency %d cycles\n",
 			       size >> 11, prev_cycles, cycles);
 			return CSHAPE(size >> 1, width, 1);


--===============47785236788271401==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============47785236788271401==--
