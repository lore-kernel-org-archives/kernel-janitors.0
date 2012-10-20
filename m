From: Fengguang Wu <fengguang.wu@intel.com>
Date: Sat, 20 Oct 2012 11:02:36 +0000
Subject: [pinctrl:nomadik-multiplatform 16/16] include/linux/mfd/dbx500-prcmu.h:459:19: error: redefinition o
Message-Id: <20121020110236.GA5714@localhost>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hi Linus,

FYI, kernel build failed on

tree:   git://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git nomadik-multiplatform
head:   2e88a0fdda1be5962b7e548ab487686daa5d9754
commit: 2e88a0fdda1be5962b7e548ab487686daa5d9754 [16/16] ARM: ux500: convert to multiplatorm
config: arm-at91_dt_defconfig # make ARCH=arm 

All error/warnings:

In file included from drivers/pinctrl/pinctrl-nomadik.c:33:0:
include/linux/mfd/dbx500-prcmu.h:459:19: error: redefinition of 'prcmu_abb_read'
include/linux/mfd/db8500-prcmu.h:673:19: note: previous definition of 'prcmu_abb_read' was here
include/linux/mfd/dbx500-prcmu.h:464:19: error: redefinition of 'prcmu_abb_write'
include/linux/mfd/db8500-prcmu.h:678:19: note: previous definition of 'prcmu_abb_write' was here
include/linux/mfd/dbx500-prcmu.h:475:19: error: redefinition of 'prcmu_config_clkout'
include/linux/mfd/db8500-prcmu.h:643:19: note: previous definition of 'prcmu_config_clkout' was here
include/linux/mfd/dbx500-prcmu.h:537:19: error: redefinition of 'prcmu_ac_wake_req'
include/linux/mfd/db8500-prcmu.h:683:19: note: previous definition of 'prcmu_ac_wake_req' was here
include/linux/mfd/dbx500-prcmu.h:542:20: error: redefinition of 'prcmu_ac_sleep_req'
include/linux/mfd/db8500-prcmu.h:688:20: note: previous definition of 'prcmu_ac_sleep_req' was here
drivers/pinctrl/pinctrl-nomadik.c:36:23: fatal error: mach/irqs.h: No such file or directory
compilation terminated.

vim +459 include/linux/mfd/dbx500-prcmu.h

fea799e3 Mattias Nilsson 2011-08-12  443  
fea799e3 Mattias Nilsson 2011-08-12  444  static inline int prcmu_set_power_state(u8 state, bool keep_ulp_clk,
fea799e3 Mattias Nilsson 2011-08-12  445  	bool keep_ap_pll)
fea799e3 Mattias Nilsson 2011-08-12  446  {
fea799e3 Mattias Nilsson 2011-08-12  447  	return 0;
fea799e3 Mattias Nilsson 2011-08-12  448  }
fea799e3 Mattias Nilsson 2011-08-12  449  
fea799e3 Mattias Nilsson 2011-08-12  450  static inline int prcmu_set_epod(u16 epod_id, u8 epod_state)
fea799e3 Mattias Nilsson 2011-08-12  451  {
fea799e3 Mattias Nilsson 2011-08-12  452  	return 0;
fea799e3 Mattias Nilsson 2011-08-12  453  }
fea799e3 Mattias Nilsson 2011-08-12  454  
fea799e3 Mattias Nilsson 2011-08-12  455  static inline void prcmu_enable_wakeups(u32 wakeups) {}
fea799e3 Mattias Nilsson 2011-08-12  456  
fea799e3 Mattias Nilsson 2011-08-12  457  static inline void prcmu_disable_wakeups(void) {}
fea799e3 Mattias Nilsson 2011-08-12  458  
fea799e3 Mattias Nilsson 2011-08-12 @459  static inline int prcmu_abb_read(u8 slave, u8 reg, u8 *value, u8 size)
fea799e3 Mattias Nilsson 2011-08-12  460  {
fea799e3 Mattias Nilsson 2011-08-12  461  	return -ENOSYS;
fea799e3 Mattias Nilsson 2011-08-12  462  }
fea799e3 Mattias Nilsson 2011-08-12  463  
fea799e3 Mattias Nilsson 2011-08-12  464  static inline int prcmu_abb_write(u8 slave, u8 reg, u8 *value, u8 size)
fea799e3 Mattias Nilsson 2011-08-12  465  {
fea799e3 Mattias Nilsson 2011-08-12  466  	return -ENOSYS;
fea799e3 Mattias Nilsson 2011-08-12  467  }

The code at line 459 was first introduced by commit:
fea799e mfd: Create a common interface for dbx500 PRCMU drivers


---
0-DAY kernel build testing backend         Open Source Technology Center
Fengguang Wu, Yuanhan Liu                              Intel Corporation
