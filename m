From: Fengguang Wu <fengguang.wu@intel.com>
Date: Mon, 15 Oct 2012 07:54:35 +0000
Subject: [signal:arch-avr32 1/2] arch/avr32/kernel/process.c:312: error: 'chilregs' undeclared
Message-Id: <20121015075435.GB31880@localhost>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hi Al,

FYI, kernel build failed on

tree:   git://git.kernel.org/pub/scm/linux/kernel/git/viro/signal.git arch-avr32
head:   5c6f3d0025bfb03370912475c01d090c41c785d6
commit: cd8962829fa4942151a26dc51fd5d5863fecbb3e [1/2] avr32: switch to generic kernel_thread()/kernel_execve()
config: avr32-atngw100_defconfig # make ARCH=avr32 atngw100_defconfig

All error/warnings:

In file included from include/linux/sched.h:11,
                 from arch/avr32/kernel/process.c:8:
arch/avr32/include/asm/param.h:6:1: warning: "HZ" redefined
In file included from arch/avr32/include/asm/param.h:4,
                 from include/linux/sched.h:11,
                 from arch/avr32/kernel/process.c:8:
arch/avr32/include/uapi/asm/param.h:6:1: warning: this is the location of the previous definition
arch/avr32/kernel/process.c: In function 'copy_thread':
arch/avr32/kernel/process.c:310: warning: assignment makes integer from pointer without a cast
arch/avr32/kernel/process.c:312: error: 'chilregs' undeclared (first use in this function)
arch/avr32/kernel/process.c:312: error: (Each undeclared identifier is reported only once
arch/avr32/kernel/process.c:312: error: for each function it appears in.)

vim +312 arch/avr32/kernel/process.c

cd896282 Al Viro            2012-10-15  306  	if (unlikely(!regs)) {
cd896282 Al Viro            2012-10-15  307  		memset(childregs, 0, sizeof(struct pt_regs));
cd896282 Al Viro            2012-10-15  308  		p->thread.cpu_context.r0 = arg;
cd896282 Al Viro            2012-10-15  309  		p->thread.cpu_context.r1 = usp; /* fn */
cd896282 Al Viro            2012-10-15  310  		p->thread.cpu_context.r2 = syscall_return;
cd896282 Al Viro            2012-10-15  311  		p->thread.cpu_context.pc = (unsigned long)ret_from_kernel_thread;
cd896282 Al Viro            2012-10-15 @312  		chilregs->sr = MODE_SUPERVISOR;
cd896282 Al Viro            2012-10-15  313  	} else {
cd896282 Al Viro            2012-10-15  314  		*childregs = *regs;
5f97f7f9 Haavard Skinnemoen 2006-09-25  315  		childregs->sp = usp;

---
0-DAY kernel build testing backend         Open Source Technology Center
Fengguang Wu, Yuanhan Liu                              Intel Corporation
