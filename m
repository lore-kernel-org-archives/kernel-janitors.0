From: James Nelson <james4765@gmail.com>
Date: Thu, 07 Sep 2006 23:26:25 +0000
Subject: [KJ] [PATCH 4/6] arm: add KERN_ constants to arch/arm/kernel/setup.c
Message-Id: <20060907232625.9720.31284.sendpatchset@david.homenet>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Signed-off-by: James Nelson <james4765@gmail.com>
---
diff --git a/arch/arm/kernel/setup.c b/arch/arm/kernel/setup.c
index 0a722e7..a3e3160 100644
--- a/arch/arm/kernel/setup.c
+++ b/arch/arm/kernel/setup.c
@@ -258,7 +258,7 @@ static inline void dump_cache(const char
 {
 	unsigned int mult = 2 + (CACHE_M(cache) ? 1 : 0);
 
-	printk("CPU%u: %s: %d bytes, associativity %d, %d byte lines, %d sets\n",
+	pr_info("CPU%u: %s: %d bytes, associativity %d, %d byte lines, %d sets\n",
 		cpu, prefix,
 		mult << (8 + CACHE_SIZE(cache)),
 		(mult << CACHE_ASSOC(cache)) >> 1,
@@ -272,7 +272,7 @@ static void __init dump_cpu_info(int cpu
 	unsigned int info = read_cpuid(CPUID_CACHETYPE);
 
 	if (info != processor_id) {
-		printk("CPU%u: D %s %s cache\n", cpu, cache_is_vivt() ? "VIVT" : "VIPT",
+		pr_info("CPU%u: D %s %s cache\n", cpu, cache_is_vivt() ? "VIVT" : "VIPT",
 		       cache_types[CACHE_TYPE(info)]);
 		if (CACHE_S(info)) {
 			dump_cache("I cache", cpu, CACHE_ISIZE(info));
@@ -283,7 +283,7 @@ static void __init dump_cpu_info(int cpu
 	}
 
 	if (arch_is_coherent())
-		printk("Cache coherency enabled\n");
+		pr_info("Cache coherency enabled\n");
 }
 
 int cpu_architecture(void)
@@ -324,8 +324,8 @@ static void __init setup_processor(void)
 	 */
 	list = lookup_processor_type(processor_id);
 	if (!list) {
-		printk("CPU configuration botched (ID %08x), unable "
-		       "to continue.\n", processor_id);
+		printk(KERN_CRIT "CPU configuration botched (ID %08x), unable "
+		       "to continue\n", processor_id);
 		while (1);
 	}
 
@@ -344,7 +344,7 @@ #ifdef MULTI_CACHE
 	cpu_cache = *list->cache;
 #endif
 
-	printk("CPU: %s [%08x] revision %d (ARMv%s), cr=%08lx\n",
+	pr_info("CPU: %s [%08x] revision %d (ARMv%s), cr=%08lx\n",
 	       cpu_name, processor_id, (int)processor_id & 15,
 	       proc_arch[cpu_architecture()], cr_alignment);
 
@@ -412,12 +412,12 @@ static struct machine_desc * __init setu
 	 */
 	list = lookup_machine_type(nr);
 	if (!list) {
-		printk("Machine configuration botched (nr %d), unable "
-		       "to continue.\n", nr);
+		printk(KERN_CRIT "Machine configuration botched (nr %d), unable "
+		       "to continue\n", nr);
 		while (1);
 	}
 
-	printk("Machine: %s\n", list->name);
+	pr_info("Machine: %s\n", list->name);
 
 	return list;
 }
@@ -661,8 +661,8 @@ __tagtable(ATAG_RAMDISK, parse_tag_ramdi
 
 static int __init parse_tag_initrd(const struct tag *tag)
 {
-	printk(KERN_WARNING "ATAG_INITRD is deprecated; "
-		"please update your bootloader.\n");
+	printk(KERN_WARNING "ATAG_INITRD is deprecated - "
+		"please update your bootloader\n");
 	phys_initrd_start = __virt_to_phys(tag->u.initrd.start);
 	phys_initrd_size = tag->u.initrd.size;
 	return 0;
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
