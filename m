From: Christophe Lucas <clucas@rotomalug.org>
Date: Tue, 10 Jan 2006 11:45:00 +0000
Subject: [KJ] [PATCH] printk : arch/arm/kernel/setup.c
Message-Id: <20060110114500.GG8401@rotomalug.org>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============46138905841272004=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============46138905841272004==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Description:
printk should include appropriate KERN_* constant (of course
only at beginning of lines).

Signed-off-by: Christophe Lucas <clucas@rotomalug.org>

Index: linux-2.6.15/arch/arm/kernel/setup.c
===================================================================
--- linux-2.6.15.orig/arch/arm/kernel/setup.c	2006-01-03 04:21:10.000000000 +0100
+++ linux-2.6.15/arch/arm/kernel/setup.c	2006-01-10 11:42:55.000000000 +0100
@@ -231,7 +231,8 @@
 {
 	unsigned int mult = 2 + (CACHE_M(cache) ? 1 : 0);
 
-	printk("CPU%u: %s: %d bytes, associativity %d, %d byte lines, %d sets\n",
+	printk(KERN_DEBUG 
+		"CPU%u: %s: %d bytes, associativity %d, %d byte lines, %d sets\n",
 		cpu, prefix,
 		mult << (8 + CACHE_SIZE(cache)),
 		(mult << CACHE_ASSOC(cache)) >> 1,
@@ -245,7 +246,8 @@
 	unsigned int info = read_cpuid(CPUID_CACHETYPE);
 
 	if (info != processor_id) {
-		printk("CPU%u: D %s %s cache\n", cpu, cache_is_vivt() ? "VIVT" : "VIPT",
+		printk(KERN_DEBUG 
+			"CPU%u: D %s %s cache\n", cpu, cache_is_vivt() ? "VIVT" : "VIPT",
 		       cache_types[CACHE_TYPE(info)]);
 		if (CACHE_S(info)) {
 			dump_cache("I cache", cpu, CACHE_ISIZE(info));
@@ -291,7 +293,7 @@
 	 */
 	list = lookup_processor_type();
 	if (!list) {
-		printk("CPU configuration botched (ID %08x), unable "
+		printk(KERN_CRIT "CPU configuration botched (ID %08x), unable "
 		       "to continue.\n", processor_id);
 		while (1);
 	}
@@ -311,7 +313,7 @@
 	cpu_cache = *list->cache;
 #endif
 
-	printk("CPU: %s [%08x] revision %d (ARMv%s)\n",
+	printk(KERN_INFO "CPU: %s [%08x] revision %d (ARMv%s)\n",
 	       cpu_name, processor_id, (int)processor_id & 15,
 	       proc_arch[cpu_architecture()]);
 
@@ -373,12 +375,12 @@
 	 */
 	list = lookup_machine_type(nr);
 	if (!list) {
-		printk("Machine configuration botched (nr %d), unable "
+		printk(KERN_CRIT "Machine configuration botched (nr %d), unable "
 		       "to continue.\n", nr);
 		while (1);
 	}
 
-	printk("Machine: %s\n", list->name);
+	printk(KERN_INFO "Machine: %s\n", list->name);
 
 	return list;
 }

--===============46138905841272004==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============46138905841272004==--
