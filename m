From: Fengguang Wu <fengguang.wu@intel.com>
Date: Fri, 12 Oct 2012 16:40:20 +0000
Subject: [signal:for-next 79/81] init/main.c:794:2: error: implicit declaration of function 'current_pt_regs'
Message-Id: <20121012164020.GC19120@localhost>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hi Al,

FYI, kernel build failed on

tree:   git://git.kernel.org/pub/scm/linux/kernel/git/viro/signal.git for-next
head:   4fa20776ca79059c34f4660c8bdb0d7c1603e872
commit: f45a47e7f1d9668458ecd1e88b285c6348c5aa3e [79/81] x86, um: convert to saner kernel_execve() semantics
config: um-defconfig # make ARCH=um defconfig

All error/warnings:

init/main.c: In function 'run_init_process':
init/main.c:794:2: error: implicit declaration of function 'current_pt_regs' [-Werror=implicit-function-declaration]
init/main.c:794:2: warning: passing argument 4 of 'do_execve' makes pointer from integer without a cast [enabled by default]
In file included from include/linux/pid_namespace.h:4:0,
                 from include/linux/perf_event.h:604,
                 from include/linux/ftrace_event.h:8,
                 from include/trace/syscall.h:6,
                 from include/linux/syscalls.h:78,
                 from init/main.c:16:
include/linux/sched.h:2323:12: note: expected 'struct pt_regs *' but argument is of type 'int'
cc1: some warnings being treated as errors
--
kernel/kmod.c: In function '____call_usermodehelper':
kernel/kmod.c:221:2: error: implicit declaration of function 'current_pt_regs' [-Werror=implicit-function-declaration]
kernel/kmod.c:221:2: warning: passing argument 4 of 'do_execve' makes pointer from integer without a cast [enabled by default]
In file included from kernel/kmod.c:22:0:
include/linux/sched.h:2323:12: note: expected 'struct pt_regs *' but argument is of type 'int'
cc1: some warnings being treated as errors

vim +794 init/main.c

b99b87f7 Peter Oberparleiter       2009-06-17  778  	do_ctors();
d5767c53 Linus Torvalds            2011-09-28  779  	usermodehelper_enable();
b0f84374 wangyanqing               2011-09-29  780  	do_initcalls();
^1da177e Linus Torvalds            2005-04-16  781  }
^1da177e Linus Torvalds            2005-04-16  782  
7babe8db Eduard - Gabriel Munteanu 2008-07-25  783  static void __init do_pre_smp_initcalls(void)
c2147a50 Eduard - Gabriel Munteanu 2008-07-25  784  {
196a15b4 H Hartley Sweeten         2009-12-14  785  	initcall_t *fn;
c2147a50 Eduard - Gabriel Munteanu 2008-07-25  786  
026cee00 Pawel Moll                2012-03-26  787  	for (fn = __initcall_start; fn < __initcall0_start; fn++)
196a15b4 H Hartley Sweeten         2009-12-14  788  		do_one_initcall(*fn);
c2147a50 Eduard - Gabriel Munteanu 2008-07-25  789  }
c2147a50 Eduard - Gabriel Munteanu 2008-07-25  790  
7c2b93d4 Al Viro                   2012-10-10  791  static int run_init_process(const char *init_filename)
^1da177e Linus Torvalds            2005-04-16  792  {
^1da177e Linus Torvalds            2005-04-16  793  	argv_init[0] = init_filename;
7c2b93d4 Al Viro                   2012-10-10 @794  	return kernel_execve(init_filename, argv_init, envp_init);
^1da177e Linus Torvalds            2005-04-16  795  }
^1da177e Linus Torvalds            2005-04-16  796  
d6b21238 Al Viro                   2012-10-10  797  static void __init kernel_init_freeable(void);
d6b21238 Al Viro                   2012-10-10  798  
d6b21238 Al Viro                   2012-10-10  799  static int __ref kernel_init(void *unused)
ee5bfa64 Vivek Goyal               2007-02-13  800  {
d6b21238 Al Viro                   2012-10-10  801  	kernel_init_freeable();
22a9d645 Arjan van de Ven          2009-01-07  802  	/* need to finish all async __init code before freeing the memory */

The code at line 794 was first introduced by commit:
7c2b93d infrastructure for saner ret_from_kernel_thread semantics


---
0-DAY kernel build testing backend         Open Source Technology Center
Fengguang Wu, Yuanhan Liu                              Intel Corporation
