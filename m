From: Fengguang Wu <fengguang.wu@intel.com>
Date: Tue, 16 Oct 2012 17:21:00 +0000
Subject: [signal:arch-m32r 1/2] arch/m32r/kernel/process.c:205:35: error: 'ret_from_kernel_thread' undeclared
Message-Id: <20121016172100.GA11813@localhost>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hi Al,

FYI, kernel build failed on

tree:   git://git.kernel.org/pub/scm/linux/kernel/git/viro/signal.git arch-m32r
head:   ad256c8748f5a072a58c8e2f5cc8220ed01a2701
commit: 1e510c2fc8dd36525e49d6081aca3bbc33cd8f9c [1/2] m32r: switch to generic kernel_thread()/kernel_execve()
config: m32r-m32104ut_defconfig # make ARCH=m32r m32104ut_defconfig

All error/warnings:

arch/m32r/kernel/process.c: In function 'copy_thread':
arch/m32r/kernel/process.c:205:35: error: 'ret_from_kernel_thread' undeclared (first use in this function)
arch/m32r/kernel/process.c:205:35: note: each undeclared identifier is reported only once for each function it appears in

vim +205 arch/m32r/kernel/process.c

^1da177e Linus Torvalds 2005-04-16  199  
1e510c2f Al Viro        2012-10-15  200  	if (unlikely(!regs)) {
1e510c2f Al Viro        2012-10-15  201  		memset(childregs, 0, sizeof(struct pt_regs));
1e510c2f Al Viro        2012-10-15  202  		childregs->psw = M32R_PSW_BIE;
1e510c2f Al Viro        2012-10-15  203  		childregs->r1 = spu;	/* fn */
1e510c2f Al Viro        2012-10-15  204  		childregs->r0 = arg;
1e510c2f Al Viro        2012-10-15 @205  		tsk->thread.lr = (unsigned long)ret_from_kernel_thread;
1e510c2f Al Viro        2012-10-15  206  	} else {
1e510c2f Al Viro        2012-10-15  207  		/* Copy registers */
1e510c2f Al Viro        2012-10-15  208  		*childregs = *regs;

---
0-DAY kernel build testing backend         Open Source Technology Center
Fengguang Wu, Yuanhan Liu                              Intel Corporation
