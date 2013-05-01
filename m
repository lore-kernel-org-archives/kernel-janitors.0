From: Fengguang Wu <fengguang.wu@intel.com>
Date: Wed, 01 May 2013 23:20:35 +0000
Subject: build regressions 2013-05-01
Message-Id: <5181a343.pWzbEDtxXTPLj8MN%fengguang.wu@intel.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

[errors]
arch/arm/mm/nommu.c:84:15: error: conflicting types for '__arm_ioremap'
arch/arm/mm/nommu.c:91:18: error: conflicting types for 'arch_ioremap_caller'
arch/arm/mm/nommu.c:93:15: error: conflicting types for '__arm_ioremap_caller'
arch/arm/mach-imx/hotplug.c:53:2: error: implicit declaration of function 'cpu_do_idle' [-Werror=implicit-function-declaration]
arch/arm/mach-imx/hotplug.c:58:26: error: 'jiffies' undeclared (first use in this function)
arch/arm/mach-imx/hotplug.c:58:2: error: implicit declaration of function 'msecs_to_jiffies' [-Werror=implicit-function-declaration]
arch/arm/mach-imx/hotplug.c:61:3: error: implicit declaration of function 'time_after' [-Werror=implicit-function-declaration]
drivers/clk/versatile/clk-vexpress-spc.c:39:2: error: implicit declaration of function 'vexpress_spc_get_performance' [-Werror=implicit-function-declaration]
drivers/clk/versatile/clk-vexpress-spc.c:58:2: error: implicit declaration of function 'vexpress_spc_set_performance' [-Werror=implicit-function-declaration]
drivers/regulator/mc13892-regulator.c:488:17: error: 'regulator_map_voltage_ascend' undeclared here (not in a function)
awk: line 2: function and never defined

[warnings]
arch/arm/mach-imx/mm-imx3.c:142:22: warning: assignment from incompatible pointer type [enabled by default]
arch/arm/mach-imx/mm-imx3.c:221:22: warning: assignment from incompatible pointer type [enabled by default]
arch/arm/mach-imx/common.h:99:29: warning: 'struct pt_regs' declared inside parameter list [enabled by default]
arch/arm/mach-imx/common.h:99:29: warning: its scope is only this definition or declaration, which is probably not what you want [enabled by default]
arch/arm/mach-imx/common.h:100:29: warning: 'struct pt_regs' declared inside parameter list [enabled by default]
fs/file_table.c:334:23: warning: unused variable 'task' [-Wunused-variable]

---
0-DAY kernel build testing backend              Open Source Technology Center
http://lists.01.org/mailman/listinfo/kbuild                 Intel Corporation
