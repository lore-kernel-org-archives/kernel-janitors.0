From: Fengguang Wu <fengguang.wu@intel.com>
Date: Sun, 30 Sep 2012 05:54:08 +0000
Subject: arch/mn10300/kernel/process.c:231:43: error: expected ')' before ';' token
Message-Id: <20120930055408.GA32054@localhost>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org


Hi Al,

FYI, kernel build failed on

commit: cc615ab mn10300: convert to generic kernel_thread()
config: mn10300-asb2364_defconfig

All error/warnings:

arch/mn10300/kernel/process.c: In function 'copy_thread':
arch/mn10300/kernel/process.c:231:43: error: expected ')' before ';' token
arch/mn10300/kernel/process.c:238:2: error: expected ';' before '}' token

vim +231 arch/mn10300/kernel/process.c

cc615abc (Al Viro       2012-09-22  230) 	if (unlikely(!kregs)) {
cc615abc (Al Viro       2012-09-22 @231) 		memset(c_regs, 0, sizeof(struct pt_regs);
cc615abc (Al Viro       2012-09-22  232) 		c_regs->a0 = c_usp; /* function */
cc615abc (Al Viro       2012-09-22  233) 		c_regs->d0 = ustk_size; /* argument */
cc615abc (Al Viro       2012-09-22  234) 		local_save_flags(c_regs->epsw);
cc615abc (Al Viro       2012-09-22  235) 		c_regs->epsw |= EPSW_IE | EPSW_IM_7;
cc615abc (Al Viro       2012-09-22  236) 		p->thread.pc	= (unsigned long) ret_from_kernel_thread;
cc615abc (Al Viro       2012-09-22  237) 		return 0;
cc615abc (Al Viro       2012-09-22  238) 	}
db6d428d (Al Viro       2012-09-19  239) 	*c_regs = *kregs;

---
0-DAY kernel build testing backend         Open Source Technology Centre
Fengguang Wu, Yuanhan Liu                              Intel Corporation
