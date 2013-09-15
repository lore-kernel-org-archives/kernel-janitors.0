From: Fengguang Wu <fengguang.wu@intel.com>
Date: Sun, 15 Sep 2013 01:20:39 +0000
Subject: build regressions 2013-09-14
Message-Id: <52350b67.BZycmUnbyHIv771C%fengguang.wu@intel.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

[errors]
(.text+0x446b43): undefined reference to `led_classdev_unregister'
(.text+0x446e35): undefined reference to `led_classdev_register'
ERROR: "nouveau_switcheroo_optimus_dsm" undefined!
mm/mempolicy.c:2329:35: error: 'LAST__PID_MASK' undeclared (first use in this function)
drivers/regulator/core.c:1521:2: error: too few arguments to function '_regulator_get'
include/linux/rcupdate.h:354:2: error: implicit declaration of function 'rcu_is_watching' [-Werror=implicit-function-declaration]

[warnings]
drivers/regulator/da9063-regulator.c:847: warning: 'da9063_reg_matches' is used uninitialized in this function
drivers/pinctrl/pinconf.c:628:2: warning: initialization from incompatible pointer type [enabled by default]
drivers/pinctrl/pinconf.c:628:2: warning: (near initialization for 'pinconf_dbg_pinconfig_fops.write') [enabled by default]

[sparse]
drivers/regulator/core.c:1521:35: sparse: not enough arguments for function _regulator_get
drivers/pinctrl/pinconf.c:628:18: sparse: incorrect type in initializer (different type sizes) @@    expected long ( *write )( ... ) @@    got int ( static [toplong ( *write )( ... ) @@

[coccinelle]
drivers/staging/lustre/lustre/ptlrpc/sec_bulk.c:217:2-3: Unneeded semicolon

---
0-DAY kernel build testing backend              Open Source Technology Center
http://lists.01.org/mailman/listinfo/kbuild                 Intel Corporation
