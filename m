From: Fengguang Wu <fengguang.wu@intel.com>
Date: Wed, 31 Jul 2013 18:59:35 +0000
Subject: build regressions 2013-07-31
Message-Id: <51f95e97.4/h/fhEahAfngQT+%fengguang.wu@intel.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

[errors]
ERROR: Input tree has errors, aborting (use -f to force output)
FATAL ERROR: Syntax error parsing input tree
kernel/sched/fair.c:3979:89: error: called object is not a function or function pointer
ERROR: "__divdi3" [drivers/gpu/drm/radeon/radeon.ko] undefined!
si_dpm.c:(.text+0x1bfe63): undefined reference to `__divdi3'
mm/mmzone.c:101:5: error: redefinition of 'page_nidpid_xchg_last'
kernel/sched/fair.c:3620:3: error: implicit declaration of function 'task_numa_find_cpu' [-Werror=implicit-function-declaration]
drivers/tty/serial/xilinx_uartps.c:232:13: error: 'struct uart_port' has no member named 'sysrq'
drivers/tty/serial/xilinx_uartps.c:232:13: error: 'struct uart_port' has no member named 'sysrq'
drivers/tty/serial/xilinx_uartps.c:232:13: error: 'struct uart_port' has no member named 'sysrq'
drivers/tty/serial/xilinx_uartps.c:1407:3: error: implicit declaration of function 'dmb' [-Werror=implicit-function-declaration]
drivers/clk/clkdev.c:160:2: error: implicit declaration of function 'of_clk_get_from_provider' [-Werror=implicit-function-declaration]

[warnings]
arch/arm/mach-imx/time.c:126:2: warning: 'setup_sched_clock' is deprecated (declared at include/linux/sched_clock.h:18) [-Wdeprecated-declarations]
arch/arm/plat-omap/counter_32k.c:118:2: warning: 'setup_sched_clock' is deprecated (declared at include/linux/sched_clock.h:18) [-Wdeprecated-declarations]
arch/arm/mach-omap2/timer.c:464:2: warning: 'setup_sched_clock' is deprecated (declared at include/linux/sched_clock.h:18) [-Wdeprecated-declarations]
arch/arm/plat-samsung/samsung-time.c:340:2: warning: 'setup_sched_clock' is deprecated (declared at include/linux/sched_clock.h:18) [-Wdeprecated-declarations]
kernel/sched/fair.c:3979:8: warning: the address of 'static_branch_NUMA_FAVOUR_HIGHER' will always evaluate as 'true' [-Waddress]
mm/memory.c:73:2: warning: #warning Unfortunate NUMA and NUMA Balancing config, growing page-frame for last_nidpid. [-Wcpp]
mm/memory.c:73:2: warning: #warning Unfortunate NUMA and NUMA Balancing config, growing page-frame for last_nidpid. [-Wcpp]
drivers/gpio/gpio-xilinx.c:260:4: warning: large integer implicitly truncated to unsigned type [-Woverflow]
drivers/clk/clkdev.c:160:6: warning: assignment makes pointer from integer without a cast [enabled by default]
include/linux/syscalls.h:805:5: warning: "CONFIG_CLONE_BACKWARDS3" is not defined [-Wundef]
kernel/trace/trace_events.c:704:44: warning: 'flags' may be used uninitialized in this function [-Wmaybe-uninitialized]
arch/xtensa/kernel/time.c:144:2: warning: 'setup_sched_clock' is deprecated (declared at include/linux/sched_clock.h:18) [-Wdeprecated-declarations]

[sparse]
drivers/clk/clkdev.c:160:15: sparse: undefined identifier 'of_clk_get_from_provider'

[coccinelle]
mm/mempolicy.c:2295:56-57: Unneeded semicolon

---
0-DAY kernel build testing backend              Open Source Technology Center
http://lists.01.org/mailman/listinfo/kbuild                 Intel Corporation
