From: Fengguang Wu <fengguang.wu@intel.com>
Date: Mon, 07 Jan 2013 19:26:55 +0000
Subject: build regressions 2013-01-07
Message-Id: <50eb217f.5j0iK7kHR5eVumKv%fengguang.wu@intel.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

[errors]
arch/arm/plat-versatile/fpga-id.c:13:27: fatal error: mach/hardware.h: No such file or directory
FATAL ERROR: Unable to parse input tree
arch/arm/mach-spear13xx/spear1310.c:50:2: error: 'DMAC0_BASE' undeclared here (not in a function)
arch/arm/mach-spear13xx/spear1310.c:51:2: error: 'DMAC1_BASE' undeclared here (not in a function)
arch/m68k/mm/init.c:196:4: error: implicit declaration of function '__pgd_page' [-Werror=implicit-function-declaration]
include/linux/percpu-refcount.h:8:2: error: unknown type name 'atomic64_t'
lib/percpu-refcount.c:24:2: error: implicit declaration of function 'atomic64_set' [-Werror=implicit-function-declaration]
lib/percpu-refcount.c:71:3: error: implicit declaration of function 'atomic64_add_return' [-Werror=implicit-function-declaration]
lib/percpu-refcount.c:96:3: error: implicit declaration of function 'atomic64_dec' [-Werror=implicit-function-declaration]
lib/percpu-refcount.c:99:3: error: implicit declaration of function 'atomic64_dec_return' [-Werror=implicit-function-declaration]
lib/percpu-refcount.c:143:3: error: implicit declaration of function 'atomic64_read' [-Werror=implicit-function-declaration]
lib/percpu-refcount.c:147:3: error: implicit declaration of function 'atomic64_add' [-Werror=implicit-function-declaration]
drivers/dma/dmatest.c:244:21: error: invalid storage class for function 'min_odd'
drivers/dma/dmatest.c:265:12: error: invalid storage class for function 'dmatest_func'
drivers/dma/dmatest.c:548:13: error: invalid storage class for function 'dmatest_cleanup_channel'
drivers/dma/dmatest.c:568:12: error: invalid storage class for function 'dmatest_add_threads'
drivers/dma/dmatest.c:612:12: error: invalid storage class for function 'dmatest_add_channel'
drivers/dma/dmatest.c:650:13: error: invalid storage class for function 'filter'
drivers/dma/dmatest.c:658:19: error: invalid storage class for function 'dmatest_init'
drivers/dma/dmatest.c:683:1: error: invalid storage class for function '__inittest'
drivers/dma/dmatest.c:685:20: error: invalid storage class for function 'dmatest_exit'
drivers/dma/dmatest.c:699:1: error: invalid storage class for function '__exittest'
drivers/dma/dmatest.c:702:1: error: expected declaration or statement at end of input
drivers/dma/dmatest.c:683:1: error: initializer element is not constant
fs/aio.c:696:6: error: dereferencing pointer to incomplete type
fs/aio.c:825:25: error: storage size of 'batch_stack' isn't known

[warnings]
warning: (ARCH_BCM && UX500_SOC_COMMON && SOC_IMX6Q && ARCH_TEGRA_3x_SOC) selects ARM_ERRATA_754322 which has unmet direct dependencies (CPU_V7)
lib/percpu-refcount.c:57: warning: value computed is not used
drivers/media/usb/dvb-usb-v2/af9035.c:136:1: warning: 'af9035_wr_regs' uses dynamic stack allocation [enabled by default]
drivers/media/usb/dvb-usb-v2/af9035.c:269:1: warning: 'af9035_i2c_master_xfer' uses dynamic stack allocation [enabled by default]
drivers/media/usb/dvb-usb-v2/af9015.c:602:1: warning: 'af9015_read_config' uses dynamic stack allocation [enabled by default]
drivers/media/dvb-frontends/af9013.c:77:1: warning: 'af9013_wr_regs_i2c' uses dynamic stack allocation [enabled by default]
drivers/media/dvb-frontends/af9033.c:68:1: warning: 'af9033_wr_regs' uses dynamic stack allocation [enabled by default]
drivers/media/dvb-frontends/rtl2830.c:56:1: warning: 'rtl2830_wr' uses dynamic stack allocation [enabled by default]
drivers/media/dvb-frontends/rtl2832.c:187:1: warning: 'rtl2832_wr' uses dynamic stack allocation [enabled by default]
drivers/media/dvb-frontends/stv6110.c:98:1: warning: 'stv6110_write_regs' uses dynamic stack allocation [enabled by default]
drivers/media/tuners/e4000.c:49:1: warning: 'e4000_wr_regs' uses dynamic stack allocation [enabled by default]
drivers/media/tuners/tda18212.c:57:1: warning: 'tda18212_wr_regs' uses dynamic stack allocation [enabled by default]
drivers/media/tuners/tda18218.c:60:1: warning: 'tda18218_wr_regs' uses dynamic stack allocation [enabled by default]
drivers/media/usb/dvb-usb-v2/mxl111sf.c:80:1: warning: 'mxl111sf_ctrl_msg' uses dynamic stack allocation [enabled by default]
drivers/dma/dmatest.c:244:1: warning: ISO C90 forbids mixed declarations and code [-Wdeclaration-after-statement]
drivers/dma/dmatest.c:683:1: warning: 'alias' attribute ignored [-Wattributes]
include/linux/aio.h:97:43: warning: 'return' with a value, in function returning void [enabled by default]
fs/aio.c:825:25: warning: unused variable 'batch_stack' [-Wunused-variable]

[sparse]
include/linux/highmem.h:136:9: sparse: attribute 'error': unknown attribute
include/linux/bio.h:359:9: sparse: attribute 'error': unknown attribute
include/net/flow.h:184:17: sparse: attribute 'error': unknown attribute
include/linux/netdevice.h:2698:9: sparse: attribute 'error': unknown attribute
include/net/dst.h:244:9: sparse: attribute 'error': unknown attribute
include/net/sock.h:1661:9: sparse: attribute 'error': unknown attribute
include/linux/posix_acl.h:79:17: sparse: attribute 'error': unknown attribute
drivers/video/backlight/lp8788_bl.c:56:25: sparse: symbol 'default_bl_config' was not declared. Should it be static?
lib/percpu-refcount.c:29:25: sparse: incorrect type in assignment (different address spaces)
lib/percpu-refcount.c:51:21: sparse: incorrect type in initializer (different address spaces)
lib/percpu-refcount.c:51:64: sparse: incompatible types in comparison expression (different address spaces)
fs/aio.c:1039:25: sparse: incorrect type in assignment (different base types)
fs/aio.c:1051:21: sparse: restricted fmode_t degrades to integer
net/ipv4/ipconfig.c:139:8: sparse: symbol 'ic_addrservaddr' was not declared. Should it be static?
net/xfrm/xfrm_output.c:116:9: sparse: context imbalance in 'xfrm_output_one' - different lock contexts for basic block
drivers/dma/dmatest.c:244:1: sparse: mixing declarations and code

---
0-DAY kernel build testing backend         Open Source Technology Center
Fengguang Wu, Yuanhan Liu                              Intel Corporation
