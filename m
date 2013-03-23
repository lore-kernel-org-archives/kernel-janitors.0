From: Fengguang Wu <fengguang.wu@intel.com>
Date: Sat, 23 Mar 2013 19:34:28 +0000
Subject: build regressions 2013-03-23
Message-Id: <514e03c4.hOzi7/K0LuRxFFuY%fengguang.wu@intel.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

[errors]
ERROR: "lc_get_cumulative" undefined!
/c/kernel-tests/src/linux/include/linux/list_bl.h:65:2: error: implicit declaration of function '_xtest' [-Werror=implicit-function-declaration]
ERROR: "delete_partition" [drivers/block/loop.ko] undefined!
arch/x86/mm/init_64.c:1327:45: error: 'next' undeclared (first use in this function)
x86_64-linux-gcc: error: arch/x86/lib/memmove_64.c: No such file or directory
x86_64-linux-gcc: fatal error: no input files
dn_route.c:(.text+0x2ba356): undefined reference to `rtm_dn_policy'
sound/built-in.o:(.rodata+0x16af30): undefined reference to `arizona_rate_text'
sound/built-in.o:(.rodata+0x16af38): undefined reference to `arizona_rate_val'
sound/built-in.o:(.rodata+0x16af50): undefined reference to `arizona_rate_text'
sound/built-in.o:(.rodata+0x16af58): undefined reference to `arizona_rate_val'
sound/built-in.o:(.rodata+0x16af70): undefined reference to `arizona_rate_text'
sound/built-in.o:(.rodata+0x16af78): undefined reference to `arizona_rate_val'
sound/built-in.o:(.rodata+0x16af90): undefined reference to `arizona_rate_text'
sound/built-in.o:(.rodata+0x16af98): undefined reference to `arizona_rate_val'
kernel/time/timekeeping.c:1671:6: error: void value not ignored as it ought to be

[warnings]
drivers/md/dm-cache-target.c:670:17: warning: assignment from incompatible pointer type [enabled by default]
fs/btrfs/raid56.c:1258:18: warning: assignment from incompatible pointer type [enabled by default]
fs/btrfs/raid56.c:1514:18: warning: assignment from incompatible pointer type [enabled by default]
fs/btrfs/raid56.c:2013:18: warning: assignment from incompatible pointer type [enabled by default]
drivers/infiniband/ulp/isert/isert_verbs.c:144:6: warning: 'ret' may be used uninitialized in this function [-Wmaybe-uninitialized]
drivers/block/rsxx/dma.c:1028:1: warning: 'rsxx_eeh_save_issued_dmas' uses dynamic stack allocation [enabled by default]
drivers/watchdog/winbond_wdt.c:58:16: warning: unused variable 'val' [-Wunused-variable]
kernel/time/timekeeping.c:1676:2: warning: 'return' with a value, in function returning void [enabled by default]
kernel/time/ntp.c:877:16: warning: unused variable 'flags' [-Wunused-variable]

[sparse]
ipc/util.c:821:22: sparse: context imbalance in 'ipcctl_pre_down' - different lock contexts for basic block
ipc/util.c:836:22: sparse: context imbalance in 'ipcctl_pre_down_nolock' - different lock contexts for basic block
ipc/sem.c:1127:9: sparse: context imbalance in 'semctl_main' - different lock contexts for basic block
include/linux/rcupdate.h:327:30: sparse: context imbalance in 'semctl_down' - unexpected unlock
ipc/sem.c:1484:32: sparse: context imbalance in 'SyS_semtimedop' - different lock contexts for basic block
ipc/sem.c:426:9: sparse: context imbalance in 'newary' - different lock contexts for basic block
ipc/sem.c:228:17: sparse: context imbalance in 'semctl_setval' - different lock contexts for basic block
ipc/sem.c:228:17: sparse: context imbalance in 'exit_sem' - different lock contexts for basic block
kernel/time/timekeeping.c:539:6: sparse: symbol '__timekeeping_set_tai_offset' was not declared. Should it be static?
include/linux/mfd/winbond_superio.h:60:41: sparse: marked inline, but without a definition
include/linux/mfd/winbond_superio.h:61:40: sparse: marked inline, but without a definition
include/linux/mfd/winbond_superio.h:60:41: sparse: marked inline, but without a definition
include/linux/mfd/winbond_superio.h:61:40: sparse: marked inline, but without a definition

---
0-DAY kernel build testing backend              Open Source Technology Center
http://lists.01.org/mailman/listinfo/kbuild                 Intel Corporation
