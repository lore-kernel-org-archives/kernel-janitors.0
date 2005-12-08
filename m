From: Eric Sesterhenn / snakebyte <snakebyte@gmx.de>
Date: Thu, 08 Dec 2005 01:27:53 +0000
Subject: [KJ] [Patch] Fix warnings in intel_cacheinfo.c
Message-Id: <1134005274.19980.3.camel@alice>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============38823024908408144=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============38823024908408144==
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

This patch fixes two compiler warnings in intel_cacheinfo.c when sysfs is not defined.

Signed-off-by: Eric Sesterhenn <snakebyte@gmx.de>
---

I hope the patch arrives unmangled and the format and the patch itself are ok.
Thanks for reviewing/forwarding. 
Eric

--- linux-2.6.15-rc5/arch/i386/kernel/cpu/intel_cacheinfo.c.orig	2005-12-08 01:21:58.000000000 +0100
+++ linux-2.6.15-rc5/arch/i386/kernel/cpu/intel_cacheinfo.c	2005-12-08 01:20:33.000000000 +0100
@@ -287,10 +287,13 @@ unsigned int __cpuinit init_intel_cachei
 }
 
 /* pointer to _cpuid4_info array (for each cache leaf) */
+#ifdef CONFIG_SYSFS
 static struct _cpuid4_info *cpuid4_info[NR_CPUS];
 #define CPUID4_INFO_IDX(x,y)    (&((cpuid4_info[x])[y]))
+#endif
 
 #ifdef CONFIG_SMP
+#ifdef CONFIG_SYSFS
 static void __cpuinit cache_shared_cpu_map_setup(unsigned int cpu, int index)
 {
 	struct _cpuid4_info	*this_leaf, *sibling_leaf;
@@ -329,11 +332,13 @@ static void __devinit cache_remove_share
 		cpu_clear(cpu, sibling_leaf->shared_cpu_map);
 	}
 }
+#endif
 #else
 static void __init cache_shared_cpu_map_setup(unsigned int cpu, int index) {}
 static void __init cache_remove_shared_cpu_map(unsigned int cpu, int index) {}
 #endif
 
+#ifdef CONFIG_SYSFS
 static void free_cache_attributes(unsigned int cpu)
 {
 	kfree(cpuid4_info[cpu]);
@@ -378,6 +383,7 @@ out:
 		free_cache_attributes(cpu);
 	return retval;
 }
+#endif
 
 #ifdef CONFIG_SYSFS
 



--===============38823024908408144==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============38823024908408144==--
