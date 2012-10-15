From: Fengguang Wu <fengguang.wu@intel.com>
Date: Mon, 15 Oct 2012 13:11:49 +0000
Subject: [arm-perf:cacheflush 3/4] arch/arm/kernel/entry-common.S:105: Error: non-constant expression in ".if
Message-Id: <20121015131149.GA23400@localhost>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hi Will,

FYI, kernel build failed on

tree:   git://git.kernel.org/pub/scm/linux/kernel/git/will/linux.git cacheflush
head:   e0c396a5e4a3abbe8ac6bc19670f39f8e7b7b399
commit: 9e0ec2d6f8bc8b274b5471d194a03b7dd10e8832 [3/4] ARM: cacheflush: add new iovec-based cache flushing system call
config: arm-at91_dt_defconfig # make ARCH=arm at91_dt_defconfig

All error/warnings:

arch/arm/kernel/entry-common.S: Assembler messages:
arch/arm/kernel/entry-common.S:105: Error: non-constant expression in ".if" statement

vim +105 arch/arm/kernel/entry-common.S

9fff2fa0 Al Viro         2012-10-10   89  	cmp	r5, #0
9fff2fa0 Al Viro         2012-10-10   90  	movne	r0, r4
9fff2fa0 Al Viro         2012-10-10   91  	movne	lr, pc
9fff2fa0 Al Viro         2012-10-10   92  	movne	pc, r5
^1da177e Linus Torvalds  2005-04-16   93  	get_thread_info tsk
^1da177e Linus Torvalds  2005-04-16   94  	b	ret_slow_syscall
93ed3970 Catalin Marinas 2008-08-28   95  ENDPROC(ret_from_fork)
^1da177e Linus Torvalds  2005-04-16   96  
fa1b4f91 Al Viro         2006-01-19   97  	.equ NR_syscalls,0
fa1b4f91 Al Viro         2006-01-19   98  #define CALL(x) .equ NR_syscalls,NR_syscalls+1
^1da177e Linus Torvalds  2005-04-16   99  #include "calls.S"
1f66e06f Wade Farnsworth 2012-09-07  100  
1f66e06f Wade Farnsworth 2012-09-07  101  /*
1f66e06f Wade Farnsworth 2012-09-07  102   * Ensure that the system call table is equal to __NR_syscalls,
1f66e06f Wade Farnsworth 2012-09-07  103   * which is the value the rest of the system sees
1f66e06f Wade Farnsworth 2012-09-07  104   */
1f66e06f Wade Farnsworth 2012-09-07 @105  .ifne NR_syscalls - __NR_syscalls
1f66e06f Wade Farnsworth 2012-09-07  106  .error "__NR_syscalls is not equal to the size of the syscall table"
1f66e06f Wade Farnsworth 2012-09-07  107  .endif
1f66e06f Wade Farnsworth 2012-09-07  108  
fa1b4f91 Al Viro         2006-01-19  109  #undef CALL
fa1b4f91 Al Viro         2006-01-19  110  #define CALL(x) .long x
^1da177e Linus Torvalds  2005-04-16  111  
606576ce Steven Rostedt  2008-10-06  112  #ifdef CONFIG_FUNCTION_TRACER
686ff228 Rabin Vincent   2010-08-03  113  /*

The code at line 105 was first introduced by commit:
1f66e06 ARM: 7524/1: support syscall tracing


---
0-DAY kernel build testing backend         Open Source Technology Center
Fengguang Wu, Yuanhan Liu                              Intel Corporation
