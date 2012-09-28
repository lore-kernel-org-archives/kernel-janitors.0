From: Fengguang Wu <fengguang.wu@intel.com>
Date: Fri, 28 Sep 2012 16:32:16 +0000
Subject: drivers/pnp/isapnp/core.c:1107:1: warning: no return statement in function returning non-void
Message-Id: <20120928163216.GA5171@localhost>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hi Andy,

FYI, there are new compile warnings show up in

commit: 9b5d971a9c08ba957d9f1e30a58885985736263d  UBUNTU: SAUCE: isapnp_init: make isa PNP scans occur async
config: alpha-defconfig

All warnings:

drivers/pnp/isapnp/core.c: In function 'isapnp_init':
drivers/pnp/isapnp/core.c:1107:1: warning: no return statement in function returning non-void [-Wreturn-type]

vim +1107 drivers/pnp/isapnp/core.c

9b5d971a (Andy Whitcroft 2009-12-02  1099) static void __init async_isapnp_init(void *unused, async_cookie_t cookie)
9b5d971a (Andy Whitcroft 2009-12-02  1100) {
9b5d971a (Andy Whitcroft 2009-12-02  1101) 	(void)real_isapnp_init();
9b5d971a (Andy Whitcroft 2009-12-02  1102) }
9b5d971a (Andy Whitcroft 2009-12-02  1103) 
9b5d971a (Andy Whitcroft 2009-12-02  1104) static int __init isapnp_init(void)
9b5d971a (Andy Whitcroft 2009-12-02  1105) {
9b5d971a (Andy Whitcroft 2009-12-02  1106)        async_schedule(async_isapnp_init, NULL);
9b5d971a (Andy Whitcroft 2009-12-02 @1107) }
^1da177e (Linus Torvalds 2005-04-16  1108) device_initcall(isapnp_init);
^1da177e (Linus Torvalds 2005-04-16  1109) 
^1da177e (Linus Torvalds 2005-04-16  1110) /* format is: noisapnp */
^1da177e (Linus Torvalds 2005-04-16  1111) 
^1da177e (Linus Torvalds 2005-04-16  1112) static int __init isapnp_setup_disable(char *str)
^1da177e (Linus Torvalds 2005-04-16  1113) {
^1da177e (Linus Torvalds 2005-04-16  1114) 	isapnp_disable = 1;
^1da177e (Linus Torvalds 2005-04-16  1115) 	return 1;

---
0-DAY kernel build testing backend         Open Source Technology Centre
Fengguang Wu, Yuanhan Liu                              Intel Corporation
