From: Alexey Dobriyan <adobriyan@gmail.com>
Date: Wed, 14 Dec 2005 15:59:09 +0000
Subject: Re: [KJ] [Patch] Fix warnings in intel_cacheinfo.c
Message-Id: <20051214160658.GA17378@mipter.zuzino.mipt.ru>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============59341818222102827=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <1134005274.19980.3.camel@alice>
In-Reply-To: <1134005274.19980.3.camel@alice>
To: kernel-janitors@vger.kernel.org

--===============59341818222102827==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Dec 08, 2005 at 02:27:53AM +0100, Eric Sesterhenn / snakebyte wrote:
> This patch fixes two compiler warnings in intel_cacheinfo.c when sysfs is not defined.

I think I have a cleaner fix.

Signed-off-by: Alexey Dobriyan <adobriyan@gmail.com>
---

 arch/i386/kernel/cpu/intel_cacheinfo.c |   10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

--- a/arch/i386/kernel/cpu/intel_cacheinfo.c
+++ b/arch/i386/kernel/cpu/intel_cacheinfo.c
@@ -286,6 +286,11 @@ unsigned int __cpuinit init_intel_cachei
 	return l2;
 }
 
+#ifdef CONFIG_SYSFS
+
+#include <linux/kobject.h>
+#include <linux/sysfs.h>
+
 /* pointer to _cpuid4_info array (for each cache leaf) */
 static struct _cpuid4_info *cpuid4_info[NR_CPUS];
 #define CPUID4_INFO_IDX(x,y)    (&((cpuid4_info[x])[y]))
@@ -379,11 +384,6 @@ out:
 	return retval;
 }
 
-#ifdef CONFIG_SYSFS
-
-#include <linux/kobject.h>
-#include <linux/sysfs.h>
-
 extern struct sysdev_class cpu_sysdev_class; /* from drivers/base/cpu.c */
 
 /* pointer to kobject for cpuX/cache */

> --- linux-2.6.15-rc5/arch/i386/kernel/cpu/intel_cacheinfo.c.orig
> +++ linux-2.6.15-rc5/arch/i386/kernel/cpu/intel_cacheinfo.c
> @@ -287,10 +287,13 @@ unsigned int __cpuinit init_intel_cachei
>  }
>
>  /* pointer to _cpuid4_info array (for each cache leaf) */
> +#ifdef CONFIG_SYSFS
>  static struct _cpuid4_info *cpuid4_info[NR_CPUS];
>  #define CPUID4_INFO_IDX(x,y)    (&((cpuid4_info[x])[y]))
> +#endif
>
>  #ifdef CONFIG_SMP
> +#ifdef CONFIG_SYSFS
>  static void __cpuinit cache_shared_cpu_map_setup(unsigned int cpu, int index)
>  {
>  	struct _cpuid4_info	*this_leaf, *sibling_leaf;
> @@ -329,11 +332,13 @@ static void __devinit cache_remove_share
>  		cpu_clear(cpu, sibling_leaf->shared_cpu_map);
>  	}
>  }
> +#endif
>  #else
>  static void __init cache_shared_cpu_map_setup(unsigned int cpu, int index) {}
>  static void __init cache_remove_shared_cpu_map(unsigned int cpu, int index) {}
>  #endif
>
> +#ifdef CONFIG_SYSFS
>  static void free_cache_attributes(unsigned int cpu)
>  {
>  	kfree(cpuid4_info[cpu]);
> @@ -378,6 +383,7 @@ out:
>  		free_cache_attributes(cpu);
>  	return retval;
>  }
> +#endif
>
>  #ifdef CONFIG_SYSFS


--===============59341818222102827==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============59341818222102827==--
