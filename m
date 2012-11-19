From: Fengguang Wu <fengguang.wu@intel.com>
Date: Mon, 19 Nov 2012 18:29:01 +0000
Subject: build regressions 2012-11-19
Message-Id: <50aa7a6d./znjgG5chtDAFOUB%fengguang.wu@intel.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

[errors]
olpc-xo1-sci.c:(.text+0x1c2f6): undefined reference to `input_event'
olpc-xo1-sci.c:(.text.unlikely+0xb69): undefined reference to `input_unregister_device'
olpc-xo1-sci.c:(.text.unlikely+0xb73): undefined reference to `input_free_device'
olpc-xo1-sci.c:(.devinit.text+0x18e): undefined reference to `input_allocate_device'
olpc-xo1-sci.c:(.devinit.text+0x1de): undefined reference to `input_register_device'
mm/mempolicy.c:2298:12: error: 'HPAGE_SHIFT' undeclared (first use in this function)
arch/m68k/include/asm/delay.h:67:24: error: 'loops_per_jiffy' undeclared (first use in this function)
drivers/mmc/host/rtsx_pci_sdmmc.c:448:2: error: implicit declaration of function 'kzalloc' [-Werror=implicit-function-declaration]
drivers/mmc/host/rtsx_pci_sdmmc.c:472:2: error: implicit declaration of function 'kfree' [-Werror=implicit-function-declaration]
drivers/net/ethernet/marvell/mvmdio.c:57:3: error: implicit declaration of function 'readl' [-Werror=implicit-function-declaration]
drivers/net/ethernet/marvell/mvmdio.c:89:2: error: implicit declaration of function 'writel' [-Werror=implicit-function-declaration]
drivers/net/ethernet/marvell/mvmdio.c:191:3: error: implicit declaration of function 'iounmap' [-Werror=implicit-function-declaration]
(.text+0x230350): undefined reference to `backlight_force_update'
(.text+0x1961c4): undefined reference to `radeon_legacy_set_backlight_level'
drivers/built-in.o:(.data+0x22cb8): undefined reference to `radeon_legacy_get_backlight_level'
kernel/sched/rt.c:948:26: error: 'struct rt_rq' has no member named 'tg'
kernel/sched/fair.c:705:26: error: 'struct cfs_rq' has no member named 'tg'

[warnings]
fs/pstore/ram.c:179:2: warning: comparison of distinct pointer types lacks a cast [enabled by default]
fs/pstore/ram.c:179:2: warning: right shift count >= width of type [enabled by default]
fs/pstore/ram.c:179:2: warning: passing argument 1 of '__div64_32' from incompatible pointer type [enabled by default]
drivers/mmc/host/rtsx_pci_sdmmc.c:448:6: warning: assignment makes pointer from integer without a cast [enabled by default]

[smatch]
drivers/mfd/tps65910.c:254 tps65910_irq_init() error: potentially derefencing uninitialized 'tps6591x_irqs_chip'.

---
0-DAY kernel build testing backend         Open Source Technology Center
Fengguang Wu, Yuanhan Liu                              Intel Corporation
