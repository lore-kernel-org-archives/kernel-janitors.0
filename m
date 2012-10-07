From: Fengguang Wu <fengguang.wu@intel.com>
Date: Sun, 07 Oct 2012 00:23:16 +0000
Subject: [calxeda:defconfig 1/3] drivers/staging/dgrp/dgrp_mon_ops.c:304:3: error: implicit declaration of fu
Message-Id: <20121007002316.GB5678@localhost>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hi Rob,

FYI, kernel build failed on

tree:   git://sources.calxeda.com/kernel/linux.git defconfig
head:   0ac7be35d2bc4e5e3a72ac55ff242e1adb08fd87
commit: ba183cdf34f104c591094df0cbafdbb735b8113e [1/3] ARM: mvebu: fix build breaks from multi-platform conversion
config: m68k-allmodconfig


All error/warnings:

drivers/staging/dgrp/dgrp_mon_ops.c: In function 'dgrp_mon_read':
drivers/staging/dgrp/dgrp_mon_ops.c:304:3: error: implicit declaration of function 'copy_to_user' [-Werror=implicit-function-declaration]
cc1: some warnings being treated as errors
--
drivers/staging/dgrp/dgrp_specproc.c: In function 'config_proc_write':
drivers/staging/dgrp/dgrp_specproc.c:470:2: error: implicit declaration of function 'copy_from_user' [-Werror=implicit-function-declaration]
cc1: some warnings being treated as errors
--
drivers/staging/dgrp/dgrp_tty.c: In function 'drp_wmove':
drivers/staging/dgrp/dgrp_tty.c:1284:4: error: implicit declaration of function 'copy_from_user' [-Werror=implicit-function-declaration]
drivers/staging/dgrp/dgrp_tty.c: In function 'get_modem_info':
drivers/staging/dgrp/dgrp_tty.c:2267:2: error: implicit declaration of function 'put_user' [-Werror=implicit-function-declaration]
drivers/staging/dgrp/dgrp_tty.c: In function 'set_modem_info':
drivers/staging/dgrp/dgrp_tty.c:2283:2: error: implicit declaration of function 'access_ok' [-Werror=implicit-function-declaration]
drivers/staging/dgrp/dgrp_tty.c:2283:20: error: 'VERIFY_READ' undeclared (first use in this function)
drivers/staging/dgrp/dgrp_tty.c:2283:20: note: each undeclared identifier is reported only once for each function it appears in
drivers/staging/dgrp/dgrp_tty.c:2287:2: error: implicit declaration of function 'get_user' [-Werror=implicit-function-declaration]
drivers/staging/dgrp/dgrp_tty.c: In function 'dgrp_tty_digigetedelay':
drivers/staging/dgrp/dgrp_tty.c:2474:2: error: implicit declaration of function 'copy_to_user' [-Werror=implicit-function-declaration]
drivers/staging/dgrp/dgrp_tty.c: In function 'dgrp_tty_ioctl':
drivers/staging/dgrp/dgrp_tty.c:2618:18: error: 'VERIFY_WRITE' undeclared (first use in this function)
cc1: some warnings being treated as errors

vim +304 drivers/staging/dgrp/dgrp_mon_ops.c

0b52b749 (Bill Pemberton 2012-09-20  288) 		if (rtn)
0b52b749 (Bill Pemberton 2012-09-20  289) 			return rtn;
0b52b749 (Bill Pemberton 2012-09-20  290) 
0b52b749 (Bill Pemberton 2012-09-20  291) 		down(&nd->nd_mon_semaphore);
0b52b749 (Bill Pemberton 2012-09-20  292) 	}
0b52b749 (Bill Pemberton 2012-09-20  293) 
0b52b749 (Bill Pemberton 2012-09-20  294) 	/*
0b52b749 (Bill Pemberton 2012-09-20  295) 	 *  Read whatever is there.
0b52b749 (Bill Pemberton 2012-09-20  296) 	 */
0b52b749 (Bill Pemberton 2012-09-20  297) 
0b52b749 (Bill Pemberton 2012-09-20  298) 	if (res > count)
0b52b749 (Bill Pemberton 2012-09-20  299) 		res = count;
0b52b749 (Bill Pemberton 2012-09-20  300) 
0b52b749 (Bill Pemberton 2012-09-20  301) 	r = MON_MAX - nd->nd_mon_out;
0b52b749 (Bill Pemberton 2012-09-20  302) 
0b52b749 (Bill Pemberton 2012-09-20  303) 	if (r <= res) {
0b52b749 (Bill Pemberton 2012-09-20 @304) 		rtn = copy_to_user((void __user *)buf,
0b52b749 (Bill Pemberton 2012-09-20  305) 				   nd->nd_mon_buf + nd->nd_mon_out, r);
0b52b749 (Bill Pemberton 2012-09-20  306) 		if (rtn) {
0b52b749 (Bill Pemberton 2012-09-20  307) 			up(&nd->nd_mon_semaphore);
0b52b749 (Bill Pemberton 2012-09-20  308) 			return -EFAULT;
0b52b749 (Bill Pemberton 2012-09-20  309) 		}
0b52b749 (Bill Pemberton 2012-09-20  310) 
0b52b749 (Bill Pemberton 2012-09-20  311) 		nd->nd_mon_out = 0;
0b52b749 (Bill Pemberton 2012-09-20  312) 		res -= r;

The code at line 304 was first introduced by commit:
0b52b74 staging: Add dgrp driver for Digi Realport devices

---
0-DAY kernel build testing backend         Open Source Technology Center
Fengguang Wu, Yuanhan Liu                              Intel Corporation
