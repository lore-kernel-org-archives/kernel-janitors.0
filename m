From: Fengguang Wu <fengguang.wu@intel.com>
Date: Thu, 11 Apr 2013 16:33:14 +0000
Subject: build regressions 2013-04-11
Message-Id: <5166e5ca.5q0ScotTEsYOf68R%fengguang.wu@intel.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

[errors]
FATAL ERROR: Couldn't open "arch/arm/boot/dts/imx51-apf51.dts": No such file or directory
FATAL ERROR: Couldn't open "arch/arm/boot/dts/imx27-apf27.dts": No such file or directory
include/linux/gpio.h:257:2: error: implicit declaration of function 'gpio_export_with_name' [-Werror=implicit-function-declaration]
include/asm-generic/gpio.h:205:12: error: conflicting types for 'gpio_export_with_name'
drivers/rtc/rtc-palmas.c:292:11: error: 'palmas_rtc' undeclared (first use in this function)
drivers/staging/rtl8192u/r8192U_core.c:687:12: error: incompatible type for argument 4 of 'proc_create_data'
(.text+0xa4b8c): undefined reference to `get_mtd_device_nm'
(.text+0xa4bb5): undefined reference to `mtd_read'
(.text+0xa4bbe): undefined reference to `put_mtd_device'
proc.c:(.text+0x98a0): undefined reference to `mips_get_machine_name'
proc.c:(.text+0x98b0): undefined reference to `mips_get_machine_name'
net/core/netprio_cgroup.c:250:29: error: static declaration of 'net_prio_subsys' follows non-static declaration

[warnings]
drivers/gpio/gpio-mcp23s08.c:622:10: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
drivers/gpio/gpiolib-acpi.c:193:7: warning: 'data' may be used uninitialized in this function [-Wmaybe-uninitialized]

[smatch]
sound/isa/cs423x/cs4236.c:314 snd_cs423x_pnp_init_mpu() warn: always true condition '(pnp_irq(pdev, 0) >= 0) => (0-u64max >= 0)'

[cppcheck]
kernel/rcutree.h:73: error: "CONFIG_RCU_FANOUT insufficient for NR_CPUS"

---
0-DAY kernel build testing backend              Open Source Technology Center
http://lists.01.org/mailman/listinfo/kbuild                 Intel Corporation
