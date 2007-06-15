From: "Robert P. J. Day" <rpjday@mindspring.com>
Date: Fri, 15 Jun 2007 18:50:15 +0000
Subject: [KJ] why does ARM arch treat early boot-time parms differently?
Message-Id: <Pine.LNX.4.64.0706151443370.14037@localhost.localdomain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org


  (i'm posting this here since it's going to lead in to another
possible cleanup project.)

  from include/linux/init.h, i can see how both regular and "early"
boot-time kernel parameters are defined:

=======================...
#define __setup_param(str, unique_id, fn, early)                \
        static char __setup_str_##unique_id[] __initdata = str; \
        static struct obs_kernel_param __setup_##unique_id      \
                __attribute_used__                              \
                __attribute__((__section__(".init.setup")))     \
                __attribute__((aligned((sizeof(long)))))        \
                = { __setup_str_##unique_id, fn, early }

#define __setup_null_param(str, unique_id)                      \
        __setup_param(str, unique_id, NULL, 0)

#define __setup(str, fn)                                        \
        __setup_param(str, fn, fn, 0)

#define __obsolete_setup(str)                                   \
        __setup_null_param(str, __LINE__)

/* NOTE: fn is as per module_param, not __setup!  Emits warning if fn
 * returns non-zero. */
#define early_param(str, fn)                                    \
        __setup_param(str, fn, fn, 1)
...
=======================

further, note how all of those boot-time parms are placed in the
section called ".init.setup".  so far, no problem.

  however, the ARM architectures take a slightly different approach:

$ grep -rw __early_param *
arch/arm/mm/mmu.c:__early_param("cachepolicy=", early_cachepolicy);
arch/arm/mm/mmu.c:__early_param("nocache", early_nocache);
arch/arm/mm/mmu.c:__early_param("nowb", early_nowrite);
arch/arm/mm/mmu.c:__early_param("ecc=", early_ecc);
arch/arm/kernel/setup.c:__early_param("initrd=", early_initrd);
arch/arm/kernel/setup.c:__early_param("mem=", early_mem);
arch/arm26/kernel/vmlinux-arm26-xip.lds.in:                     *(__early_param)
arch/arm26/kernel/vmlinux-arm26.lds.in:                 *(__early_param)
include/asm-arm/setup.h:#define __early_param(name,fn)                         \

  what's with this "__early_param" as opposed to just regular
"early_param"?  and here's what you find in include/asm-arm/setup.h:

#define __early_param(name,fn)                                  \
static struct early_params __early_##fn __used                  \
__attribute__((__section__(".early_param.init"))) = { name, fn }

  so, in the ARM arch, the early parameter stuff is placed in a
differently-named section.

  is there a reason that ARM treats the early kernel parm stuff
differently from all other arches?  just curious.

rday
-- 
====================================
Robert P. J. Day
Linux Consulting, Training and Annoying Kernel Pedantry
Waterloo, Ontario, CANADA

http://fsdev.net/wiki/index.php?title=Main_Page
====================================
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.linux-foundation.org
https://lists.linux-foundation.org/mailman/listinfo/kernel-janitors
