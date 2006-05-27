From: Anne Thrax <foobarfoobarfoobar@gmail.com>
Date: Sat, 27 May 2006 18:08:11 +0000
Subject: [KJ] Memory Leak Detection
Message-Id: <4478958B.4000209@gmail.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="------------010205080407040406050701"
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

This is a multi-part message in MIME format.
--------------010205080407040406050701
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

I'm sure that you would all have an interest in memory leak detection, 
because of the nature of the work that's done on this list. A series of 
patches were sent out on LKML to add support for memory leak detection. 
I patched my tree and then did a diff -uprN (and removed all the extra 
things I have added myself), and attatched to this email is that patch.

--------------010205080407040406050701
Content-Type: text/plain;
 name="patch_collective_kmemleak.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="patch_collective_kmemleak.patch"

diff -uprN linux-2.6.17-rc5-git2/Documentation/kmemleak.txt linux-devel/Documentation/kmemleak.txt
--- linux-2.6.17-rc5-git2/Documentation/kmemleak.txt	1969-12-31 19:00:00.000000000 -0500
+++ linux-devel/Documentation/kmemleak.txt	2006-05-27 13:38:39.000000000 -0400
@@ -0,0 +1,92 @@
+Kernel Memory Leak Detector
+===========================
+
+
+Introduction
+------------
+
+Kmemleak provides a way of detecting possible kernel memory leaks in a
+way similar to a tracing garbage collector
+(http://en.wikipedia.org/wiki/Garbage_collection_%28computer_science%29#Tracing_garbage_collectors),
+with the difference that the orphan pointers are not freed but only
+reported via /sys/kernel/debug/memleak. A similar method is used by
+the Valgrind tool (memcheck --leak-check) to detect the memory leaks
+in user-space applications.
+
+
+Basic Algorithm
+---------------
+
+The memory allocations via kmalloc, vmalloc, kmem_cache_alloc and
+friends are tracked and the pointers, together with additional
+information like size and stack trace, are stored in a radix tree. The
+corresponding freeing function calls are tracked and the pointers
+removed from the radix tree.
+
+An allocated block of memory is considered orphan if a pointer to its
+start address or to an alias (pointer aliases are explained later)
+cannot be found by scanning the memory (including saved
+registers). This means that there might be no way for the kernel to
+pass the address of the allocated block to a freeing function and
+therefore the block is considered a leak.
+
+The scanning algorithm steps:
+
+  1. mark all pointers as white (remaining white pointers will later
+     be considered orphan)
+  2. scan the memory starting with the data section and stacks,
+     checking the values against the addresses stored in the radix
+     tree. If a white pointer is found, it is added to the grey list
+  3. scan the grey pointers for matching addresses (some white
+     pointers can become grey and added at the end of the grey list)
+     until the grey set is finished
+  4. the remaining white pointers are considered orphan and reported
+     via /sys/kernel/debug/memleak
+
+
+Improvements
+------------
+
+Because the Linux kernel calculates many pointers at run-time via the
+container_of macro (see the lists implementation), a lot of false
+positives would be reported. This tool re-writes the container_of
+macro so that the offset and size information is stored in the
+.init.memleak_offsets section. The memleak_init() function creates a
+radix tree with corresponding offsets for every encountered block
+size. The memory allocations hook stores the pointer address together
+with its aliases based on the size of the allocated block.
+
+While one level of offsets should be enough for most cases, two levels
+are considered, i.e. container_of(container_of(...)) (one false
+positive is the "struct socket_alloc" allocation in the
+sock_alloc_inode() function).
+
+Some allocated memory blocks have pointers stored in the kernel's
+internal data structures and they cannot be detected as orphans. To
+avoid this, kmemleak can also store the number of values equal to the
+pointer (or aliases) that need to be found so that the block is not
+considered a leak. One example is __vmalloc().
+
+
+Limitations and Drawbacks
+-------------------------
+
+The biggest drawback is the reduced performance of memory allocation
+and freeing. To avoid other penalties, the memory scanning is only
+performed when the /sys/kernel/debug/memleak file is read. Anyway,
+this tool is intended for debugging purposes where the performance
+might not be the most important requirement.
+
+The tool can report false positives. These are cases where an
+allocated block doesn't need to be freed (some cases in the init_call
+functions), the pointer is calculated by other methods than the
+container_of macro or the pointer is stored in a location not scanned
+by kmemleak. If the "member" argument in the offsetof(type, member)
+call is not constant, kmemleak considers the offset as zero since it
+cannot be determined at compilation time (as a side node, it seems
+that gcc-4.0 doesn't compile these offsetof constructs either).
+
+Page allocations and ioremap are not tracked. NUMA architectures are
+not supported yet.
+
+Only the ARM and i386 architectures are currently supported.
diff -uprN linux-2.6.17-rc5-git2/arch/arm/kernel/vmlinux.lds.S linux-devel/arch/arm/kernel/vmlinux.lds.S
--- linux-2.6.17-rc5-git2/arch/arm/kernel/vmlinux.lds.S	2006-05-26 18:59:46.000000000 -0400
+++ linux-devel/arch/arm/kernel/vmlinux.lds.S	2006-05-27 13:39:43.000000000 -0400
@@ -68,6 +68,11 @@ SECTIONS
 		__per_cpu_start = .;
 			*(.data.percpu)
 		__per_cpu_end = .;
+#ifdef CONFIG_DEBUG_MEMLEAK
+		__memleak_offsets_start = .;
+			*(.init.memleak_offsets)
+		__memleak_offsets_end = .;
+#endif
 #ifndef CONFIG_XIP_KERNEL
 		__init_begin = _stext;
 		*(.init.data)
@@ -110,6 +115,7 @@ SECTIONS
 
 	.data : AT(__data_loc) {
 		__data_start = .;	/* address in memory */
+		_sdata = .;
 
 		/*
 		 * first, the init task union, aligned
@@ -158,6 +164,7 @@ SECTIONS
 		__bss_start = .;	/* BSS				*/
 		*(.bss)
 		*(COMMON)
+		__bss_stop = .;
 		_end = .;
 	}
 					/* Stabs debugging sections.	*/
diff -uprN linux-2.6.17-rc5-git2/arch/i386/kernel/vmlinux.lds.S linux-devel/arch/i386/kernel/vmlinux.lds.S
--- linux-2.6.17-rc5-git2/arch/i386/kernel/vmlinux.lds.S	2006-05-26 18:59:47.000000000 -0400
+++ linux-devel/arch/i386/kernel/vmlinux.lds.S	2006-05-27 13:39:25.000000000 -0400
@@ -38,6 +38,7 @@ SECTIONS
   RODATA
 
   /* writeable */
+  _sdata = .;			/* Start of data section */
   .data : AT(ADDR(.data) - LOAD_OFFSET) {	/* Data */
 	*(.data)
 	CONSTRUCTORS
@@ -140,6 +141,9 @@ SECTIONS
   __per_cpu_start = .;
   .data.percpu  : AT(ADDR(.data.percpu) - LOAD_OFFSET) { *(.data.percpu) }
   __per_cpu_end = .;
+  __memleak_offsets_start = .;
+  .init.memleak_offsets : AT(ADDR(.init.memleak_offsets) - LOAD_OFFSET) { *(.init.memleak_offsets) }
+  __memleak_offsets_end = .;
   . = ALIGN(4096);
   __init_end = .;
   /* freed after init ends here */
diff -uprN linux-2.6.17-rc5-git2/drivers/base/platform.c linux-devel/drivers/base/platform.c
--- linux-2.6.17-rc5-git2/drivers/base/platform.c	2006-05-26 19:00:35.000000000 -0400
+++ linux-devel/drivers/base/platform.c	2006-05-27 13:38:56.000000000 -0400
@@ -166,6 +166,7 @@ struct platform_device *platform_device_
 	struct platform_object *pa;
 
 	pa = kzalloc(sizeof(struct platform_object) + strlen(name), GFP_KERNEL);
+	memleak_debug_resize(pa, sizeof(struct platform_object));
 	if (pa) {
 		strcpy(pa->name, name);
 		pa->pdev.name = pa->name;
diff -uprN linux-2.6.17-rc5-git2/include/asm-arm/processor.h linux-devel/include/asm-arm/processor.h
--- linux-2.6.17-rc5-git2/include/asm-arm/processor.h	2006-05-26 19:01:39.000000000 -0400
+++ linux-devel/include/asm-arm/processor.h	2006-05-27 13:39:43.000000000 -0400
@@ -121,6 +121,18 @@ extern int kernel_thread(int (*fn)(void 
 
 #endif
 
+#ifdef CONFIG_FRAME_POINTER
+static inline unsigned long arch_call_address(void *frame)
+{
+	return *(unsigned long *) (frame - 4) - 4;
+}
+
+static inline void *arch_prev_frame(void *frame)
+{
+	return *(void **) (frame - 12);
+}
+#endif
+
 #endif
 
 #endif /* __ASM_ARM_PROCESSOR_H */
diff -uprN linux-2.6.17-rc5-git2/include/asm-i386/processor.h linux-devel/include/asm-i386/processor.h
--- linux-2.6.17-rc5-git2/include/asm-i386/processor.h	2006-05-26 19:01:33.000000000 -0400
+++ linux-devel/include/asm-i386/processor.h	2006-05-27 13:39:25.000000000 -0400
@@ -743,4 +743,16 @@ extern void mcheck_init(struct cpuinfo_x
 #define mcheck_init(c) do {} while(0)
 #endif
 
+#ifdef CONFIG_FRAME_POINTER
+static inline unsigned long arch_call_address(void *frame)
+{
+	return *(unsigned long *) (frame + 4);
+}
+
+static inline void *arch_prev_frame(void *frame)
+{
+	return *(void **) frame;
+}
+#endif
+
 #endif /* __ASM_I386_PROCESSOR_H */
diff -uprN linux-2.6.17-rc5-git2/include/linux/kernel.h linux-devel/include/linux/kernel.h
--- linux-2.6.17-rc5-git2/include/linux/kernel.h	2006-05-26 19:01:27.000000000 -0400
+++ linux-devel/include/linux/kernel.h	2006-05-27 13:38:03.000000000 -0400
@@ -13,6 +13,7 @@
 #include <linux/types.h>
 #include <linux/compiler.h>
 #include <linux/bitops.h>
+#include <linux/memleak.h>
 #include <asm/byteorder.h>
 #include <asm/bug.h>
 
@@ -284,9 +285,13 @@ extern void dump_stack(void);
  * @member:	the name of the member within the struct.
  *
  */
-#define container_of(ptr, type, member) ({			\
+#define __container_of(ptr, type, member) ({			\
         const typeof( ((type *)0)->member ) *__mptr = (ptr);	\
         (type *)( (char *)__mptr - offsetof(type,member) );})
+#define container_of(ptr, type, member) ({			\
+	DECLARE_MEMLEAK_OFFSET(container_of, type, member);	\
+	__container_of(ptr, type, member);			\
+})
 
 /*
  * Check at compile time that something is of a particular type.
diff -uprN linux-2.6.17-rc5-git2/include/linux/memleak.h linux-devel/include/linux/memleak.h
--- linux-2.6.17-rc5-git2/include/linux/memleak.h	1969-12-31 19:00:00.000000000 -0500
+++ linux-devel/include/linux/memleak.h	2006-05-27 13:38:03.000000000 -0400
@@ -0,0 +1,72 @@
+/*
+ * include/linux/memleak.h
+ *
+ * Copyright (C) 2006 ARM Limited
+ * Written by Catalin Marinas <catalin.marinas@gmail.com>
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License version 2 as
+ * published by the Free Software Foundation.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ * GNU General Public License for more details.
+ *
+ * You should have received a copy of the GNU General Public License
+ * along with this program; if not, write to the Free Software
+ * Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA 02111-1307 USA
+ */
+
+#ifndef __MEMLEAK_H
+#define __MEMLEAK_H
+
+#include <linux/stddef.h>
+
+#ifdef CONFIG_DEBUG_MEMLEAK
+
+struct memleak_offset {
+	unsigned long offset;
+	unsigned long size;
+	unsigned long member_size;
+};
+
+/* if offsetof(type, member) is not a constant known at compile time,
+ * just use 0 instead since we cannot add it to the
+ * .init.memleak_offsets section
+ */
+#define memleak_offsetof(type, member)				\
+	(__builtin_constant_p(offsetof(type, member)) ?		\
+	 offsetof(type, member) : 0)
+
+#define DECLARE_MEMLEAK_OFFSET(name, type, member)		\
+	static const struct memleak_offset			\
+	__attribute__ ((__section__ (".init.memleak_offsets")))	\
+	__attribute_used__ __memleak_offset__##name = {		\
+		memleak_offsetof(type, member),			\
+		sizeof(type),					\
+		sizeof(((type *)0)->member)			\
+	}
+
+extern void memleak_debug_init(void);
+extern void memleak_debug_alloc(const void *ptr, size_t size, int ref_count);
+extern void memleak_debug_free(const void *ptr);
+extern void memleak_debug_resize(const void *ptr, size_t size);
+extern void memleak_debug_false_alarm(const void *ptr);
+
+#define memleak_debug_erase(ptr)	do { (ptr) = NULL; } while (0)
+
+#else
+
+#define DECLARE_MEMLEAK_OFFSET(name, type, member)
+
+#define memleak_debug_init()
+#define memleak_debug_alloc(ptr, size, ref_count)
+#define memleak_debug_free(ptr)
+#define memleak_debug_resize(ptr, size)
+#define memleak_debug_false_alarm(ptr)
+#define memleak_debug_erase(ptr)
+
+#endif	/* CONFIG_DEBUG_MEMLEAK */
+
+#endif	/* __MEMLEAK_H */
diff -uprN linux-2.6.17-rc5-git2/include/linux/slab.h linux-devel/include/linux/slab.h
--- linux-2.6.17-rc5-git2/include/linux/slab.h	2006-05-26 19:01:26.000000000 -0400
+++ linux-devel/include/linux/slab.h	2006-05-27 13:38:56.000000000 -0400
@@ -89,6 +89,7 @@ extern void *__kmalloc_track_caller(size
 
 static inline void *kmalloc(size_t size, gfp_t flags)
 {
+#ifndef CONFIG_DEBUG_MEMLEAK
 	if (__builtin_constant_p(size)) {
 		int i = 0;
 #define CACHE(x) \
@@ -107,6 +108,7 @@ found:
 			malloc_sizes[i].cs_dmacachep :
 			malloc_sizes[i].cs_cachep, flags);
 	}
+#endif
 	return __kmalloc(size, flags);
 }
 
@@ -114,6 +116,7 @@ extern void *__kzalloc(size_t, gfp_t);
 
 static inline void *kzalloc(size_t size, gfp_t flags)
 {
+#ifndef CONFIG_DEBUG_MEMLEAK
 	if (__builtin_constant_p(size)) {
 		int i = 0;
 #define CACHE(x) \
@@ -132,6 +135,7 @@ found:
 			malloc_sizes[i].cs_dmacachep :
 			malloc_sizes[i].cs_cachep, flags);
 	}
+#endif
 	return __kzalloc(size, flags);
 }
 
diff -uprN linux-2.6.17-rc5-git2/init/main.c linux-devel/init/main.c
--- linux-2.6.17-rc5-git2/init/main.c	2006-05-26 19:00:07.000000000 -0400
+++ linux-devel/init/main.c	2006-05-27 13:38:03.000000000 -0400
@@ -513,6 +513,8 @@ asmlinkage void __init start_kernel(void
 	cpuset_init_early();
 	mem_init();
 	kmem_cache_init();
+	radix_tree_init();
+	memleak_debug_init();
 	setup_per_cpu_pageset();
 	numa_policy_init();
 	if (late_time_init)
@@ -533,7 +535,6 @@ asmlinkage void __init start_kernel(void
 	key_init();
 	security_init();
 	vfs_caches_init(num_physpages);
-	radix_tree_init();
 	signals_init();
 	/* rootfs populating might need page-writeback */
 	page_writeback_init();
diff -uprN linux-2.6.17-rc5-git2/ipc/util.c linux-devel/ipc/util.c
--- linux-2.6.17-rc5-git2/ipc/util.c	2006-05-26 18:59:41.000000000 -0400
+++ linux-devel/ipc/util.c	2006-05-27 13:39:58.000000000 -0400
@@ -389,6 +389,7 @@ void* ipc_rcu_alloc(int size)
 	 */
 	if (rcu_use_vmalloc(size)) {
 		out = vmalloc(HDRLEN_VMALLOC + size);
+		memleak_debug_false_alarm(out);
 		if (out) {
 			out += HDRLEN_VMALLOC;
 			container_of(out, struct ipc_rcu_hdr, data)->is_vmalloc = 1;
@@ -396,6 +397,7 @@ void* ipc_rcu_alloc(int size)
 		}
 	} else {
 		out = kmalloc(HDRLEN_KMALLOC + size, GFP_KERNEL);
+		memleak_debug_false_alarm(out);
 		if (out) {
 			out += HDRLEN_KMALLOC;
 			container_of(out, struct ipc_rcu_hdr, data)->is_vmalloc = 0;
diff -uprN linux-2.6.17-rc5-git2/kernel/params.c linux-devel/kernel/params.c
--- linux-2.6.17-rc5-git2/kernel/params.c	2006-05-26 19:01:07.000000000 -0400
+++ linux-devel/kernel/params.c	2006-05-27 13:39:58.000000000 -0400
@@ -548,6 +548,7 @@ static void __init kernel_param_sysfs_se
 					    unsigned int name_skip)
 {
 	struct module_kobject *mk;
+	struct module_param_attrs *mp;
 
 	mk = kzalloc(sizeof(struct module_kobject), GFP_KERNEL);
 	BUG_ON(!mk);
@@ -557,11 +558,13 @@ static void __init kernel_param_sysfs_se
 	kobject_set_name(&mk->kobj, name);
 	kobject_register(&mk->kobj);
 
+	mp = param_sysfs_setup(mk, kparam, num_params, name_skip);
 	/* no need to keep the kobject if no parameter is exported */
-	if (!param_sysfs_setup(mk, kparam, num_params, name_skip)) {
+	if (!mp) {
 		kobject_unregister(&mk->kobj);
 		kfree(mk);
-	}
+	} else
+		memleak_debug_false_alarm(mp);
 }
 
 /*
diff -uprN linux-2.6.17-rc5-git2/lib/Kconfig.debug linux-devel/lib/Kconfig.debug
--- linux-2.6.17-rc5-git2/lib/Kconfig.debug	2006-05-26 18:59:41.000000000 -0400
+++ linux-devel/lib/Kconfig.debug	2006-05-27 13:40:18.000000000 -0400
@@ -89,6 +89,27 @@ config DEBUG_SLAB_LEAK
 	bool "Memory leak debugging"
 	depends on DEBUG_SLAB
 
+config DEBUG_MEMLEAK
+	bool "Kernel memory leak detector"
+	default n
+	depends on EXPERIMENTAL && DEBUG_KERNEL && SLAB
+	depends on !NUMA
+	help
+	  Say Y here if you want to enable the memory leak
+	  detector. The memory allocation/freeing is traced in a way
+	  similar to the Boehm's conservative garbage collector, the
+	  difference being that the orphan pointers are not freed but
+	  only shown in /sys/kernel/debug/memleak. Enabling this
+	  feature will introduce an overhead to memory allocations.
+
+config DEBUG_MEMLEAK_TEST
+	tristate "Test the kernel memory leak detector"
+	default n
+	depends on DEBUG_MEMLEAK
+	help
+	  Say Y here to build the test harness for the kernel memory
+	  leak detector.
+
 config DEBUG_PREEMPT
 	bool "Debug preemptible kernel"
 	depends on DEBUG_KERNEL && PREEMPT
diff -uprN linux-2.6.17-rc5-git2/mm/Makefile linux-devel/mm/Makefile
--- linux-2.6.17-rc5-git2/mm/Makefile	2006-05-26 18:59:41.000000000 -0400
+++ linux-devel/mm/Makefile	2006-05-27 13:40:18.000000000 -0400
@@ -23,4 +23,5 @@ obj-$(CONFIG_SLAB) += slab.o
 obj-$(CONFIG_MEMORY_HOTPLUG) += memory_hotplug.o
 obj-$(CONFIG_FS_XIP) += filemap_xip.o
 obj-$(CONFIG_MIGRATION) += migrate.o
-
+obj-$(CONFIG_DEBUG_MEMLEAK) += memleak.o
+obj-$(CONFIG_DEBUG_MEMLEAK_TEST) += memleak-test.o
diff -uprN linux-2.6.17-rc5-git2/mm/memleak-test.c linux-devel/mm/memleak-test.c
--- linux-2.6.17-rc5-git2/mm/memleak-test.c	1969-12-31 19:00:00.000000000 -0500
+++ linux-devel/mm/memleak-test.c	2006-05-27 13:40:18.000000000 -0400
@@ -0,0 +1,54 @@
+/*
+ * mm/memleak-test.c
+ *
+ * Copyright (C) 2006 ARM Limited
+ * Written by Catalin Marinas <catalin.marinas@arm.com>
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License version 2 as
+ * published by the Free Software Foundation.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ * GNU General Public License for more details.
+ *
+ * You should have received a copy of the GNU General Public License
+ * along with this program; if not, write to the Free Software
+ * Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA 02111-1307 USA
+ */
+
+#include <linux/init.h>
+#include <linux/kernel.h>
+#include <linux/module.h>
+#include <linux/slab.h>
+#include <linux/vmalloc.h>
+
+#include <linux/memleak.h>
+
+/* Some very simple testing. This function needs to be extended for
+ * proper testing */
+static int __init memleak_test_init(void)
+{
+	printk(KERN_INFO "KMemLeak testing\n");
+
+	/* make some orphan pointers */
+	kmalloc(32, GFP_KERNEL);
+	kmalloc(32, GFP_KERNEL);
+#ifndef CONFIG_MODULES
+	kmem_cache_alloc(files_cachep, GFP_KERNEL);
+	kmem_cache_alloc(files_cachep, GFP_KERNEL);
+#endif
+	vmalloc(64);
+	vmalloc(64);
+
+	return 0;
+}
+module_init(memleak_test_init);
+
+static void __exit memleak_test_exit(void)
+{
+}
+module_exit(memleak_test_exit);
+
+MODULE_LICENSE("GPL");
diff -uprN linux-2.6.17-rc5-git2/mm/memleak.c linux-devel/mm/memleak.c
--- linux-2.6.17-rc5-git2/mm/memleak.c	1969-12-31 19:00:00.000000000 -0500
+++ linux-devel/mm/memleak.c	2006-05-27 13:38:03.000000000 -0400
@@ -0,0 +1,813 @@
+/*
+ * mm/memleak.c
+ *
+ * Copyright (C) 2006 ARM Limited
+ * Written by Catalin Marinas <catalin.marinas@gmail.com>
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License version 2 as
+ * published by the Free Software Foundation.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ * GNU General Public License for more details.
+ *
+ * You should have received a copy of the GNU General Public License
+ * along with this program; if not, write to the Free Software
+ * Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA 02111-1307 USA
+ */
+
+/* #define DEBUG */
+
+#include <linux/init.h>
+#include <linux/kernel.h>
+#include <linux/list.h>
+#include <linux/radix-tree.h>
+#include <linux/gfp.h>
+#include <linux/errno.h>
+#include <linux/slab.h>
+#include <linux/module.h>
+#include <linux/sched.h>
+#include <linux/kallsyms.h>
+#include <linux/mman.h>
+#include <linux/nodemask.h>
+#include <linux/debugfs.h>
+#include <linux/seq_file.h>
+#include <linux/vmalloc.h>
+#include <linux/mutex.h>
+#include <linux/cpumask.h>
+
+#include <asm/bitops.h>
+#include <asm/sections.h>
+#include <asm/percpu.h>
+#include <asm/processor.h>
+#include <asm/thread_info.h>
+
+#include <linux/memleak.h>
+
+#ifdef CONFIG_FRAME_POINTER
+#define MAX_TRACE	4
+#else
+#define MAX_TRACE	1
+#endif
+
+#define PREINIT_POINTERS	1024
+#define BYTES_PER_WORD		sizeof(void *)
+
+/* define this if you want the task stacks to be scanned (with an
+ * increased chance of false negatives) */
+/* #define TASK_STACK_SCAN */
+
+extern struct memleak_offset __memleak_offsets_start[];
+extern struct memleak_offset __memleak_offsets_end[];
+
+struct memleak_alias {
+	struct hlist_node node;
+	unsigned long offset;
+};
+
+struct memleak_pointer {
+	struct list_head pointer_list;
+	struct list_head grey_list;
+	unsigned long pointer;
+	size_t size;
+	int ref_count;			/* the minimum encounters of the value */
+	int count;			/* the ecounters of the value */
+	struct hlist_head *alias_list;
+	unsigned long trace[MAX_TRACE];
+};
+
+typedef enum {
+	MEMLEAK_ALLOC,
+	MEMLEAK_FREE,
+	MEMLEAK_RESIZE,
+	MEMLEAK_FALSE_ALARM
+} memleak_action_t;
+
+struct memleak_preinit_pointer {
+	memleak_action_t type;
+	const void *pointer;
+	size_t size;
+	int ref_count;
+};
+
+#define COLOR_WHITE(pointer)	((pointer)->count != -1 && (pointer)->count < (pointer)->ref_count)
+#define COLOR_GREY(pointer)	((pointer)->count >= (pointer)->ref_count)
+
+/* Tree storing the pointer aliases indexed by size */
+static RADIX_TREE(alias_tree, GFP_KERNEL);
+/* Tree storing all the possible pointers, indexed by the pointer value */
+static RADIX_TREE(pointer_tree, GFP_ATOMIC);
+/* The list of all allocated pointers */
+static LIST_HEAD(pointer_list);
+/* The list of the grey pointers */
+static LIST_HEAD(grey_list);
+
+static kmem_cache_t *pointer_cache;
+/* Used to avoid recursive call via the kmalloc/kfree functions */
+static spinlock_t memleak_lock = SPIN_LOCK_UNLOCKED;
+static cpumask_t memleak_cpu_mask = CPU_MASK_NONE;
+static DEFINE_MUTEX(memleak_mutex);
+static int memleak_initialized = 0;
+static int __initdata preinit_pos = 0;
+static struct memleak_preinit_pointer __initdata preinit_pointers[PREINIT_POINTERS];
+
+static void dump_pointer_info(struct memleak_pointer *pointer)
+{
+#ifdef CONFIG_KALLSYMS
+	char namebuf[KSYM_NAME_LEN + 1] = "";
+	char *modname;
+	unsigned long symsize;
+	unsigned long offset = 0;
+#endif
+#ifdef DEBUG
+	struct memleak_alias *alias;
+	struct hlist_node *elem;
+#endif
+	int i;
+
+	printk(KERN_NOTICE "kmemleak: pointer 0x%08lx:\n", pointer->pointer);
+#ifdef DEBUG
+	printk(KERN_NOTICE "  size = %d\n", pointer->size);
+	printk(KERN_NOTICE "  ref_count = %d\n", pointer->ref_count);
+	printk(KERN_NOTICE "  count = %d\n", pointer->count);
+	printk(KERN_NOTICE "  aliases:\n");
+	if (pointer->alias_list)
+		hlist_for_each_entry(alias, elem, pointer->alias_list, node)
+			printk(KERN_NOTICE "    0x%lx\n", alias->offset);
+	printk(KERN_NOTICE "  trace:\n");
+#endif
+	for (i = 0; i < MAX_TRACE; i++) {
+		unsigned long trace = pointer->trace[i];
+
+		if (!trace)
+			break;
+#ifdef CONFIG_KALLSYMS
+		kallsyms_lookup(trace, &symsize, &offset, &modname, namebuf);
+		printk(KERN_NOTICE "    %lx: <%s>\n", trace, namebuf);
+#else
+		printk(KERN_NOTICE "    %lx\n", trace);
+#endif
+	}
+}
+
+/* Insert an element into the aliases radix tree.
+ * Return 0 on success.
+ */
+static int __init insert_alias(unsigned long size, unsigned long offset)
+{
+	int ret = 0;
+	struct hlist_head *alias_list;
+	struct memleak_alias *alias;
+
+	/* Note that offset == size is not a bug (see
+	 * container_of usage in ipc/utils.c) but we ignore it
+	 * because the alias can overlap with valid pointers
+	 */
+	if (offset > size)
+		BUG();
+	else if (offset == 0 || offset == size) {
+		ret = -EINVAL;
+		goto out;
+	}
+
+	offset &= ~(BYTES_PER_WORD - 1);
+
+	alias_list = radix_tree_lookup(&alias_tree, size);
+	if (alias_list) {
+		struct hlist_node *elem;
+
+		hlist_for_each_entry(alias, elem, alias_list, node) {
+			if (alias->offset == offset) {
+				ret = -EEXIST;
+				goto out;
+			}
+		}
+	} else {
+		alias_list = kmalloc(sizeof(struct hlist_head), GFP_KERNEL);
+		if (!alias_list)
+			panic("kmemleak: cannot allocate initial memory\n");
+		INIT_HLIST_HEAD(alias_list);
+
+		ret = radix_tree_insert(&alias_tree, size, alias_list);
+		if (ret)
+			panic("kmemleak: cannot insert into the aliases radix tree: %d\n", ret);
+	}
+
+	alias = kmalloc(sizeof(struct memleak_alias), GFP_KERNEL);
+	if (!alias)
+		panic("kmemleak: cannot allocate initial memory\n");
+	INIT_HLIST_NODE(&alias->node);
+	alias->offset = offset;
+
+	hlist_add_head(&alias->node, alias_list);
+
+ out:
+	return ret;
+}
+
+/* Insert a pointer and its aliases into the pointer radix tree */
+static inline void insert_pointer(unsigned long ptr, size_t size, int ref_count)
+{
+	struct memleak_alias *alias;
+	struct hlist_node *elem;
+	struct memleak_pointer *pointer;
+	int err, i;
+#ifdef CONFIG_FRAME_POINTER
+	void *frame;
+#endif
+
+	pointer = kmem_cache_alloc(pointer_cache, SLAB_ATOMIC);
+	if (!pointer)
+		panic("kmemleak: cannot allocate a memleak_pointer structure\n");
+
+	INIT_LIST_HEAD(&pointer->pointer_list);
+	INIT_LIST_HEAD(&pointer->grey_list);
+	pointer->pointer = ptr;
+	pointer->size = size;
+	pointer->ref_count = ref_count;
+	pointer->count = -1;
+	pointer->alias_list = radix_tree_lookup(&alias_tree, size);
+
+#ifdef CONFIG_FRAME_POINTER
+	frame = __builtin_frame_address(0);
+	for (i = 0; i < MAX_TRACE; i++) {
+		void *stack = task_stack_page(current);
+
+		if (frame < stack || frame > stack + THREAD_SIZE - BYTES_PER_WORD) {
+			pointer->trace[i] = 0;
+			continue;
+		}
+
+		pointer->trace[i] = arch_call_address(frame);
+		frame = arch_prev_frame(frame);
+		/* we don't need the return to do_exit() */
+		if (kstack_end(frame))
+			pointer->trace[i] = 0;
+	}
+#else
+	pointer->trace[0] = (unsigned long)__builtin_return_address(0);
+#endif
+
+	err = radix_tree_insert(&pointer_tree, ptr, pointer);
+	if (err) {
+		dump_stack();
+		panic("kmemleak: cannot insert into the pointer radix tree: %d\n", err);
+	}
+
+	if (pointer->alias_list) {
+		hlist_for_each_entry(alias, elem, pointer->alias_list, node) {
+			if (alias->offset >= size)
+				BUG();
+
+			err = radix_tree_insert(&pointer_tree, ptr + alias->offset, pointer);
+			if (err) {
+				dump_stack();
+				panic("kmemleak: cannot insert alias into the pointer radix tree: %d\n", err);
+			}
+		}
+	}
+
+	list_add_tail_rcu(&pointer->pointer_list, &pointer_list);
+}
+
+/* Remove a pointer and its aliases from the pointer radix tree */
+static inline void delete_pointer(unsigned long ptr)
+{
+	struct memleak_alias *alias;
+	struct hlist_node *elem;
+	struct memleak_pointer *pointer;
+
+	pointer = radix_tree_delete(&pointer_tree, ptr);
+	if (!pointer) {
+		dump_stack();
+		printk(KERN_WARNING "kmemleak: freeing unknown pointer value 0x%08lx\n", ptr);
+		return;
+	}
+	if (pointer->pointer != ptr) {
+		dump_stack();
+		dump_pointer_info(pointer);
+		panic("kmemleak: freeing pointer by alias 0x%08lx\n", ptr);
+	}
+	if (COLOR_WHITE(pointer)) {
+		dump_stack();
+		dump_pointer_info(pointer);
+		printk(KERN_WARNING "kmemleak: freeing orphan pointer 0x%08lx\n", ptr);
+	}
+
+	if (pointer->alias_list) {
+		hlist_for_each_entry(alias, elem, pointer->alias_list, node) {
+			if (!radix_tree_delete(&pointer_tree, ptr + alias->offset)) {
+				dump_stack();
+				dump_pointer_info(pointer);
+				panic("kmemleak: cannot find pointer alias 0x%08lx, 0x%lx\n",
+				      ptr, alias->offset);
+			}
+		}
+	}
+
+	list_del_rcu(&pointer->pointer_list);
+
+	kmem_cache_free(pointer_cache, pointer);
+}
+
+/* Re-create the pointer aliases according to the new size information */
+static inline void resize_pointer(unsigned long ptr, size_t size)
+{
+	struct memleak_alias *alias;
+	struct hlist_node *elem;
+	struct memleak_pointer *pointer;
+	int err;
+
+	pointer = radix_tree_lookup(&pointer_tree, ptr);
+	if (!pointer) {
+		dump_stack();
+		panic("kmemleak: resizing unknown pointer value 0x%08lx\n", ptr);
+	}
+	if (pointer->pointer != ptr) {
+		dump_stack();
+		dump_pointer_info(pointer);
+		panic("kmemleak: resizing pointer by alias 0x%08lx\n", ptr);
+	}
+
+	/* remove old aliases */
+	if (pointer->alias_list) {
+		hlist_for_each_entry(alias, elem, pointer->alias_list, node) {
+			if (!radix_tree_delete(&pointer_tree, ptr + alias->offset)) {
+				dump_stack();
+				dump_pointer_info(pointer);
+				panic("kmemleak: cannot find pointer alias 0x%08lx, 0x%lx\n",
+				      ptr, alias->offset);
+			}
+		}
+	}
+
+	/* add the new aliases. We don't update the pointer->size
+	 * because the real block size should be scanned */
+	pointer->alias_list = radix_tree_lookup(&alias_tree, size);
+	if (pointer->alias_list) {
+		hlist_for_each_entry(alias, elem, pointer->alias_list, node) {
+			if (alias->offset >= size)
+				BUG();
+
+			err = radix_tree_insert(&pointer_tree, ptr + alias->offset, pointer);
+			if (err) {
+				dump_stack();
+				dump_pointer_info(pointer);
+				panic("kmemleak: cannot insert alias into the pointer radix tree: %d\n", err);
+			}
+		}
+	}
+}
+
+/* Make a pointer permanently grey (false positive) */
+static inline void make_grey_pointer(unsigned long ptr)
+{
+	struct memleak_pointer *pointer;
+
+	pointer = radix_tree_lookup(&pointer_tree, ptr);
+	if (!pointer) {
+		dump_stack();
+		panic("kmemleak: greying unknown pointer value 0x%08lx\n", ptr);
+	}
+	if (pointer->pointer != ptr) {
+		dump_stack();
+		dump_pointer_info(pointer);
+		panic("kmemleak: greying pointer by alias 0x%08lx\n", ptr);
+	}
+
+	pointer->ref_count = 0;
+}
+
+/* Allocation function hook */
+void memleak_debug_alloc(const void *ptr, size_t size, int ref_count)
+{
+	unsigned long flags;
+	unsigned int cpu_id = smp_processor_id();
+
+	if (!ptr)
+		return;
+
+	local_irq_save(flags);
+
+	if (!memleak_initialized) {
+		/* no need for SMP locking since this block is
+		 * executed before the other CPUs are started */
+		struct memleak_preinit_pointer *pointer;
+
+		BUG_ON(cpu_id != 0);
+
+		if (preinit_pos >= PREINIT_POINTERS)
+			panic("kmemleak: preinit pointers buffer overflow\n");
+		pointer = &preinit_pointers[preinit_pos++];
+
+		pointer->type = MEMLEAK_ALLOC;
+		pointer->pointer = ptr;
+		pointer->size = size;
+		pointer->ref_count = ref_count;
+
+		goto out;
+	}
+
+	/* avoid recursive calls. After disabling the interrupts, the
+	 * only calls to this function on the same CPU should be from
+	 * kmemleak itself and we ignore them. Calls from other CPU's
+	 * would wait on the spin_lock.
+	 */
+	if (!cpu_test_and_set(cpu_id, memleak_cpu_mask)) {
+		pr_debug("%s(0x%p, %d, %d)\n", __FUNCTION__, ptr, size, ref_count);
+
+		spin_lock(&memleak_lock);
+		insert_pointer((unsigned long)ptr, size, ref_count);
+		spin_unlock(&memleak_lock);
+
+		cpu_clear(cpu_id, memleak_cpu_mask);
+	}
+
+ out:
+	local_irq_restore(flags);
+}
+EXPORT_SYMBOL_GPL(memleak_debug_alloc);
+
+/* Freeing function hook */
+void memleak_debug_free(const void *ptr)
+{
+	unsigned long flags;
+	unsigned int cpu_id = smp_processor_id();
+
+	if (!ptr)
+		return;
+
+	local_irq_save(flags);
+
+	if (!memleak_initialized) {
+		struct memleak_preinit_pointer *pointer;
+
+		BUG_ON(cpu_id != 0);
+
+		if (preinit_pos >= PREINIT_POINTERS)
+			panic("kmemleak: preinit pointers buffer overflow\n");
+		pointer = &preinit_pointers[preinit_pos++];
+
+		pointer->type = MEMLEAK_FREE;
+		pointer->pointer = ptr;
+
+		goto out;
+	}
+
+	/* avoid recursive calls. See memleak_debug_alloc() for an explanation */
+	if (!cpu_test_and_set(cpu_id, memleak_cpu_mask)) {
+		pr_debug("%s(0x%p)\n", __FUNCTION__, ptr);
+
+		spin_lock(&memleak_lock);
+		delete_pointer((unsigned long)ptr);
+		spin_unlock(&memleak_lock);
+
+		cpu_clear(cpu_id, memleak_cpu_mask);
+	}
+
+ out:
+	local_irq_restore(flags);
+}
+EXPORT_SYMBOL_GPL(memleak_debug_free);
+
+/* Change the size information of an allocated memory block */
+void memleak_debug_resize(const void *ptr, size_t size)
+{
+	unsigned long flags;
+	unsigned int cpu_id = smp_processor_id();
+
+	if (!ptr)
+		return;
+
+	local_irq_save(flags);
+
+	if (!memleak_initialized) {
+		struct memleak_preinit_pointer *pointer;
+
+		BUG_ON(cpu_id != 0);
+
+		if (preinit_pos >= PREINIT_POINTERS)
+			panic("kmemleak: preinit pointers buffer overflow\n");
+		pointer = &preinit_pointers[preinit_pos++];
+
+		pointer->type = MEMLEAK_RESIZE;
+		pointer->pointer = ptr;
+		pointer->size = size;
+
+		goto out;
+	}
+
+	/* avoid recursive calls. See memleak_debug_alloc() for an explanation */
+	if (!cpu_test_and_set(cpu_id, memleak_cpu_mask)) {
+		pr_debug("%s(0x%p, %d)\n", __FUNCTION__, ptr, size);
+
+		spin_lock(&memleak_lock);
+		resize_pointer((unsigned long)ptr, size);
+		spin_unlock(&memleak_lock);
+
+		cpu_clear(cpu_id, memleak_cpu_mask);
+	}
+
+ out:
+	local_irq_restore(flags);
+}
+EXPORT_SYMBOL(memleak_debug_resize);
+
+/* Mark a pointer as a false positive */
+void memleak_debug_false_alarm(const void *ptr)
+{
+	unsigned long flags;
+	unsigned int cpu_id = smp_processor_id();
+
+	if (!ptr)
+		return;
+
+	local_irq_save(flags);
+
+	if (!memleak_initialized) {
+		struct memleak_preinit_pointer *pointer;
+
+		BUG_ON(cpu_id != 0);
+
+		if (preinit_pos >= PREINIT_POINTERS)
+			panic("kmemleak: preinit pointers buffer overflow\n");
+		pointer = &preinit_pointers[preinit_pos++];
+
+		pointer->type = MEMLEAK_FALSE_ALARM;
+		pointer->pointer = ptr;
+
+		goto out;
+	}
+
+	/* avoid recursive calls. See memleak_debug_alloc() for an explanation */
+	if (!cpu_test_and_set(cpu_id, memleak_cpu_mask)) {
+		pr_debug("%s(0x%p)\n", __FUNCTION__, ptr);
+
+		spin_lock(&memleak_lock);
+		make_grey_pointer((unsigned long)ptr);
+		spin_unlock(&memleak_lock);
+
+		cpu_clear(cpu_id, memleak_cpu_mask);
+	}
+
+ out:
+	local_irq_restore(flags);
+}
+EXPORT_SYMBOL(memleak_debug_false_alarm);
+
+/* Scan a block of memory (exclusive range) for pointers and move
+ * those found to the grey list
+ */
+static void memleak_scan_block(void *_start, void *_end)
+{
+	unsigned long *ptr;
+	unsigned long *start = _start;
+	unsigned long *end = _end;
+
+	for (ptr = start; ptr < end; ptr++) {
+		struct memleak_pointer *pointer =
+			radix_tree_lookup(&pointer_tree,
+					  (*ptr) & ~(BYTES_PER_WORD - 1));
+		if (!pointer)
+			continue;
+		if (!COLOR_WHITE(pointer))
+			continue;
+
+		pointer->count++;
+		if (COLOR_GREY(pointer))
+			list_add_tail_rcu(&pointer->grey_list, &grey_list);
+	}
+}
+
+/* Scan the memory and print the orphan pointers */
+static void memleak_scan(void)
+{
+	unsigned long flags;
+	struct memleak_pointer *pointer;
+#ifdef TASK_STACK_SCAN
+	struct task_struct *task;
+#endif
+	int i;
+
+	spin_lock_irqsave(&memleak_lock, flags);
+
+	list_for_each_entry_rcu(pointer, &pointer_list, pointer_list) {
+		pointer->count = 0;
+		if (COLOR_GREY(pointer))
+			list_add_tail_rcu(&pointer->grey_list, &grey_list);
+	}
+
+	/* data/bss scanning */
+	memleak_scan_block(_sdata, _edata);
+	memleak_scan_block(__bss_start, __bss_stop);
+
+#ifdef CONFIG_SMP
+	/* per-cpu scanning */
+	for (i = 0; i < NR_CPUS; i++)
+		memleak_scan_block(__per_cpu_offset[i] + __per_cpu_start,
+				   __per_cpu_offset[i] + __per_cpu_end);
+#endif
+
+	/* mem_map scanning */
+	for_each_online_node(i) {
+		struct page *page, *end;
+
+		page = NODE_MEM_MAP(i);
+		end  = page + NODE_DATA(i)->node_spanned_pages;
+
+		memleak_scan_block(page, end);
+	}
+
+#ifdef TASK_STACK_SCAN
+	for_each_process(task)
+		memleak_scan_block(task_stack_page(task),
+				   task_stack_page(task) + THREAD_SIZE);
+#endif
+
+	/* grey_list scanning */
+	list_for_each_entry_rcu(pointer, &grey_list, grey_list) {
+		memleak_scan_block((void *)pointer->pointer,
+				   (void *)(pointer->pointer + pointer->size));
+		list_del_rcu(&pointer->grey_list);
+	}
+
+	spin_unlock_irqrestore(&memleak_lock, flags);
+}
+
+#ifdef CONFIG_DEBUG_FS
+static void *memleak_seq_start(struct seq_file *seq, loff_t *pos)
+{
+	struct memleak_pointer *pointer;
+	loff_t n = *pos;
+
+	mutex_lock(&memleak_mutex);
+
+	if (!n)
+		memleak_scan();
+
+	list_for_each_entry_rcu(pointer, &pointer_list, pointer_list) {
+		if (!n--)
+			return pointer;
+	}
+
+	return NULL;
+}
+
+static void *memleak_seq_next(struct seq_file *seq, void *v, loff_t *pos)
+{
+	struct list_head *n = ((struct memleak_pointer *)v)->pointer_list.next;
+
+	++(*pos);
+
+	if (n != &pointer_list)
+		return list_entry(n, struct memleak_pointer, pointer_list);
+	return NULL;
+}
+
+static void memleak_seq_stop(struct seq_file *seq, void *v)
+{
+	mutex_unlock(&memleak_mutex);
+}
+
+static int memleak_seq_show(struct seq_file *seq, void *v)
+{
+	const struct memleak_pointer *pointer = v;
+#ifdef CONFIG_KALLSYMS
+	char namebuf[KSYM_NAME_LEN + 1] = "";
+	char *modname;
+	unsigned long symsize;
+	unsigned long offset = 0;
+#endif
+	int i;
+
+	if (!COLOR_WHITE(pointer))
+		return 0;
+
+	seq_printf(seq, "orphan pointer 0x%08lx (size %d):\n",
+		   pointer->pointer, pointer->size);
+
+	for (i = 0; i < MAX_TRACE; i++) {
+		unsigned long trace = pointer->trace[i];
+		if (!trace)
+			break;
+
+#ifdef CONFIG_KALLSYMS
+		kallsyms_lookup(trace, &symsize, &offset, &modname, namebuf);
+		seq_printf(seq, "  %lx: <%s>\n", trace, namebuf);
+#else
+		seq_printf(seq, "  %lx\n", trace);
+#endif
+	}
+
+	return 0;
+}
+
+static struct seq_operations memleak_seq_ops = {
+	.start = memleak_seq_start,
+	.next  = memleak_seq_next,
+	.stop  = memleak_seq_stop,
+	.show  = memleak_seq_show,
+};
+
+static int memleak_seq_open(struct inode *inode, struct file *file)
+{
+	return seq_open(file, &memleak_seq_ops);
+}
+
+static struct file_operations memleak_fops = {
+	.owner	 = THIS_MODULE,
+	.open    = memleak_seq_open,
+	.read    = seq_read,
+	.llseek  = seq_lseek,
+	.release = seq_release,
+};
+#endif					/* CONFIG_DEBUG_FS */
+
+/* KMemLeak initialization. Set up the radix tree for the pointer aliases */
+void __init memleak_debug_init(void)
+{
+	struct memleak_offset *ml_off;
+	int i = 0;
+	unsigned long flags;
+
+	pointer_cache = kmem_cache_create("pointer_cache", sizeof(struct memleak_pointer),
+					  0, SLAB_PANIC, NULL, NULL);
+	if (!pointer_cache)
+		panic("kmemleak: cannot create the pointer cache\n");
+
+	/* no need to hold the spinlock as SMP is not initialized yet
+	 * and memleak_initialized is 0 */
+
+	/* primary aliases - container_of(member) */
+	for (ml_off = __memleak_offsets_start; ml_off < __memleak_offsets_end; ml_off++)
+		if (!insert_alias(ml_off->size, ml_off->offset))
+			i++;
+	pr_debug("kmemleak: found %d primary aliases\n", i);
+
+	/* secondary aliases - container_of(container_of(member)) */
+	for (ml_off = __memleak_offsets_start; ml_off < __memleak_offsets_end; ml_off++) {
+		struct hlist_head *alias_list;
+		struct memleak_alias *alias;
+		struct hlist_node *elem;
+
+		alias_list = radix_tree_lookup(&alias_tree, ml_off->member_size);
+		if (!alias_list)
+			continue;
+
+		hlist_for_each_entry(alias, elem, alias_list, node)
+			if (!insert_alias(ml_off->size, ml_off->offset + alias->offset))
+				i++;
+	}
+	pr_debug("kmemleak: found %d aliases\n", i);
+	pr_debug("kmemleak: %d preinit actions\n", preinit_pos);
+
+	local_irq_save(flags);
+
+	memleak_initialized = 1;
+
+	/* execute the buffered memleak actions */
+	for (i = 0; i < preinit_pos; i++) {
+		struct memleak_preinit_pointer *pointer = &preinit_pointers[i];
+
+		switch (pointer->type) {
+		case MEMLEAK_ALLOC:
+			memleak_debug_alloc(pointer->pointer, pointer->size,
+					    pointer->ref_count);
+			break;
+		case MEMLEAK_FREE:
+			memleak_debug_free(pointer->pointer);
+			break;
+		case MEMLEAK_RESIZE:
+			memleak_debug_resize(pointer->pointer, pointer->size);
+			break;
+		case MEMLEAK_FALSE_ALARM:
+			memleak_debug_false_alarm(pointer->pointer);
+			break;
+		default:
+			BUG();
+		}
+	}
+
+	local_irq_restore(flags);
+
+	printk(KERN_INFO "Kernel memory leak detector initialized\n");
+}
+
+/* Late initialization function */
+int __init memleak_late_init(void)
+{
+#ifdef CONFIG_DEBUG_FS
+	struct dentry *dentry;
+
+	dentry = debugfs_create_file("memleak", S_IRUGO, NULL, NULL,
+				     &memleak_fops);
+	if (!dentry)
+		return -ENOMEM;
+#endif
+	pr_debug("kmemleak: late initialization completed\n");
+
+	return 0;
+}
+late_initcall(memleak_late_init);
diff -uprN linux-2.6.17-rc5-git2/mm/page_alloc.c linux-devel/mm/page_alloc.c
--- linux-2.6.17-rc5-git2/mm/page_alloc.c	2006-05-26 18:59:41.000000000 -0400
+++ linux-devel/mm/page_alloc.c	2006-05-27 13:38:56.000000000 -0400
@@ -2800,6 +2800,8 @@ void *__init alloc_large_system_hash(con
 	if (_hash_mask)
 		*_hash_mask = (1 << log2qty) - 1;
 
+	memleak_debug_alloc(table, size, 1);
+
 	return table;
 }
 
diff -uprN linux-2.6.17-rc5-git2/mm/slab.c linux-devel/mm/slab.c
--- linux-2.6.17-rc5-git2/mm/slab.c	2006-05-26 18:59:41.000000000 -0400
+++ linux-devel/mm/slab.c	2006-05-27 13:38:56.000000000 -0400
@@ -434,6 +434,8 @@ struct kmem_cache {
 	 * variables contain the offset to the user object and its size.
 	 */
 	int obj_offset;
+#endif
+#if DEBUG || defined(CONFIG_DEBUG_MEMLEAK)
 	int obj_size;
 #endif
 };
@@ -672,7 +674,7 @@ static struct kmem_cache cache_cache = {
 	.shared = 1,
 	.buffer_size = sizeof(struct kmem_cache),
 	.name = "kmem_cache",
-#if DEBUG
+#if DEBUG || defined(CONFIG_DEBUG_MEMLEAK)
 	.obj_size = sizeof(struct kmem_cache),
 #endif
 };
@@ -2042,9 +2044,11 @@ kmem_cache_create (const char *name, siz
 	if (!cachep)
 		goto oops;
 
-#if DEBUG
+#if DEBUG || defined(CONFIG_DEBUG_MEMLEAK)
 	cachep->obj_size = size;
+#endif
 
+#if DEBUG
 	if (flags & SLAB_RED_ZONE) {
 		/* redzoning only works with word aligned caches */
 		align = BYTES_PER_WORD;
@@ -2879,6 +2883,7 @@ static inline void *____cache_alloc(stru
 		STATS_INC_ALLOCMISS(cachep);
 		objp = cache_alloc_refill(cachep, flags);
 	}
+	memleak_debug_erase(ac->entry[ac->avail]);
 	return objp;
 }
 
@@ -3144,7 +3149,11 @@ static inline void __cache_free(struct k
  */
 void *kmem_cache_alloc(struct kmem_cache *cachep, gfp_t flags)
 {
-	return __cache_alloc(cachep, flags, __builtin_return_address(0));
+	void *ptr = __cache_alloc(cachep, flags, __builtin_return_address(0));
+
+	memleak_debug_alloc(ptr, cachep->obj_size, 1);
+
+	return ptr;
 }
 EXPORT_SYMBOL(kmem_cache_alloc);
 
@@ -3159,6 +3168,9 @@ EXPORT_SYMBOL(kmem_cache_alloc);
 void *kmem_cache_zalloc(struct kmem_cache *cache, gfp_t flags)
 {
 	void *ret = __cache_alloc(cache, flags, __builtin_return_address(0));
+
+	memleak_debug_alloc(ret, cache->obj_size, 1);
+
 	if (ret)
 		memset(ret, 0, obj_size(cache));
 	return ret;
@@ -3280,6 +3292,7 @@ static __always_inline void *__do_kmallo
 					  void *caller)
 {
 	struct kmem_cache *cachep;
+	void *ptr;
 
 	/* If you want to save a few bytes .text space: replace
 	 * __ with kmem_.
@@ -3289,7 +3302,11 @@ static __always_inline void *__do_kmallo
 	cachep = __find_general_cachep(size, flags);
 	if (unlikely(cachep == NULL))
 		return NULL;
-	return __cache_alloc(cachep, flags, caller);
+	ptr = __cache_alloc(cachep, flags, caller);
+
+	memleak_debug_alloc(ptr, size, 1);
+
+	return ptr;
 }
 
 
@@ -3345,6 +3362,7 @@ void *__alloc_percpu(size_t size)
 		memset(pdata->ptrs[i], 0, size);
 	}
 
+	memleak_debug_false_alarm(pdata);
 	/* Catch derefs w/o wrappers */
 	return (void *)(~(unsigned long)pdata);
 
@@ -3373,6 +3391,9 @@ void kmem_cache_free(struct kmem_cache *
 	unsigned long flags;
 
 	local_irq_save(flags);
+
+	memleak_debug_free(objp);
+
 	__cache_free(cachep, objp);
 	local_irq_restore(flags);
 }
@@ -3396,6 +3417,8 @@ void kfree(const void *objp)
 		return;
 	local_irq_save(flags);
 	kfree_debugcheck(objp);
+	memleak_debug_free(objp);
+
 	c = virt_to_cache(objp);
 	mutex_debug_check_no_locks_freed(objp, obj_size(c));
 	__cache_free(c, (void *)objp);
diff -uprN linux-2.6.17-rc5-git2/mm/vmalloc.c linux-devel/mm/vmalloc.c
--- linux-2.6.17-rc5-git2/mm/vmalloc.c	2006-05-26 18:59:41.000000000 -0400
+++ linux-devel/mm/vmalloc.c	2006-05-27 13:38:56.000000000 -0400
@@ -349,6 +349,9 @@ void __vunmap(void *addr, int deallocate
 void vfree(void *addr)
 {
 	BUG_ON(in_interrupt());
+
+	memleak_debug_free(addr);
+
 	__vunmap(addr, 1);
 }
 EXPORT_SYMBOL(vfree);
@@ -447,7 +450,14 @@ fail:
 
 void *__vmalloc_area(struct vm_struct *area, gfp_t gfp_mask, pgprot_t prot)
 {
-	return __vmalloc_area_node(area, gfp_mask, prot, -1);
+	void *addr = __vmalloc_area_node(area, gfp_mask, prot, -1);
+
+	/* this needs ref_count = 2 since vm_struct also contains a
+	   pointer to this address. The guard page is also subtracted
+	   from the size */
+	memleak_debug_alloc(addr, area->size - PAGE_SIZE, 2);
+
+	return addr;
 }
 
 /**
@@ -466,6 +476,7 @@ void *__vmalloc_node(unsigned long size,
 			int node)
 {
 	struct vm_struct *area;
+	void *addr;
 
 	size = PAGE_ALIGN(size);
 	if (!size || (size >> PAGE_SHIFT) > num_physpages)
@@ -475,7 +486,13 @@ void *__vmalloc_node(unsigned long size,
 	if (!area)
 		return NULL;
 
-	return __vmalloc_area_node(area, gfp_mask, prot, node);
+	addr = __vmalloc_area_node(area, gfp_mask, prot, node);
+
+	/* this needs ref_count = 2 since the vm_struct also contains
+	   a pointer to this address */
+	memleak_debug_alloc(addr, size, 2);
+
+	return addr;
 }
 EXPORT_SYMBOL(__vmalloc_node);
 

--------------010205080407040406050701
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--------------010205080407040406050701--
