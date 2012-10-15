From: Fengguang Wu <fengguang.wu@intel.com>
Date: Mon, 15 Oct 2012 02:26:04 +0000
Subject: [signal:arch-cris 1/2] arch/cris/arch-v10/kernel/process.c:147:2: error: implicit declaration of fun
Message-Id: <20121015022604.GG7203@localhost>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hi Al,

FYI, kernel build failed on

tree:   git://git.kernel.org/pub/scm/linux/kernel/git/viro/signal.git arch-cris
head:   b390891871081c499675f874eb08485c82959f00
commit: 40be7b4e5cfa2eec0a7f44f6edfdcf6802111bb1 [1/2] cris: switch to generic kernel_thread()
config: cris-etrax-100lx_v2_defconfig # make ARCH=cris etrax-100lx_v2_defconfig

All error/warnings:

arch/cris/arch-v10/kernel/process.c: In function 'sys_fork':
arch/cris/arch-v10/kernel/process.c:147:2: error: implicit declaration of function 'current_pt_regs' [-Werror=implicit-function-declaration]
arch/cris/arch-v10/kernel/process.c:147:2: warning: passing argument 3 of 'do_fork' makes pointer from integer without a cast [enabled by default]
In file included from arch/cris/arch-v10/kernel/process.c:13:0:
include/linux/sched.h:2293:13: note: expected 'struct pt_regs *' but argument is of type 'int'
arch/cris/arch-v10/kernel/process.c: In function 'sys_clone':
arch/cris/arch-v10/kernel/process.c:157:2: warning: passing argument 3 of 'do_fork' makes pointer from integer without a cast [enabled by default]
In file included from arch/cris/arch-v10/kernel/process.c:13:0:
include/linux/sched.h:2293:13: note: expected 'struct pt_regs *' but argument is of type 'int'
arch/cris/arch-v10/kernel/process.c: In function 'sys_vfork':
arch/cris/arch-v10/kernel/process.c:166:9: warning: passing argument 3 of 'do_fork' makes pointer from integer without a cast [enabled by default]
In file included from arch/cris/arch-v10/kernel/process.c:13:0:
include/linux/sched.h:2293:13: note: expected 'struct pt_regs *' but argument is of type 'int'
cc1: some warnings being treated as errors

vim +147 arch/cris/arch-v10/kernel/process.c

40be7b4e Al Viro        2012-10-03  145  asmlinkage int sys_fork(void)
^1da177e Linus Torvalds 2005-04-16  146  {
40be7b4e Al Viro        2012-10-03 @147  	return do_fork(SIGCHLD, rdusp(), current_pt_regs(), 0, NULL, NULL);
^1da177e Linus Torvalds 2005-04-16  148  }

---
0-DAY kernel build testing backend         Open Source Technology Center
Fengguang Wu, Yuanhan Liu                              Intel Corporation
