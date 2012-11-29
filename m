From: Fengguang Wu <fengguang.wu@intel.com>
Date: Thu, 29 Nov 2012 17:45:55 +0000
Subject: build regressions 2012-11-29
Message-Id: <50b79f53.h5w13/if7nSkqns7%fengguang.wu@intel.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

[errors]
mm/highmem.c:157:8: error: void value not ignored as it ought to be
mm/highmem.c:158:15: error: 'PKMAP_INVALID_INDEX' undeclared (first use in this function)
arch/mips/kernel/signal.c:250:1: error: unknown type name 'sigset'
arch/mips/kernel/signal32.c:278:47: error: 'compat_uset_t' undeclared (first use in this function)
arch/x86/xen/mmu.c:2213:10: error: 'struct x86_init_ops' has no member named 'mapping'
arch/x86/xen/mmu.c:2213:39: error: 'xen_mapping_pagetable_reserve' undeclared (first use in this function)
arch/x86/built-in.o:(.rodata+0x4b08): undefined reference to `compat_sched_rr_get_interval'
drivers/staging/ramster/ramster/ramster.c:970:2: error: implicit declaration of function 'ramster_debugfs_init' [-Werror=implicit-function-declaration]
fs/notify/fdinfo.c:29:18: error: 'struct fsnotify_group' has no member named 'mark_lock'
include/xen/interface/version.h:72:2: error: implicit declaration of function 'xen_domain' [-Werror=implicit-function-declaration]
drivers/spi/spi-gpio.c:234:4: error: implicit declaration of function 'gpio_request' [-Werror=implicit-function-declaration]
drivers/spi/spi-gpio.c:237:4: error: implicit declaration of function 'gpio_direction_output' [-Werror=implicit-function-declaration]
drivers/spi/spi-gpio.c:244:4: error: implicit declaration of function 'gpio_free' [-Werror=implicit-function-declaration]
drivers/spi/spi-gpio.c:265:4: error: implicit declaration of function 'gpio_direction_input' [-Werror=implicit-function-declaration]
drivers/spi/spi-oc-tiny.c:349:3: error: implicit declaration of function 'gpio_request' [-Werror=implicit-function-declaration]
drivers/spi/spi-oc-tiny.c:352:3: error: implicit declaration of function 'gpio_direction_output' [-Werror=implicit-function-declaration]
drivers/spi/spi-oc-tiny.c:366:3: error: implicit declaration of function 'gpio_free' [-Werror=implicit-function-declaration]
drivers/spi/spi-topcliff-pch.c:230:2: error: implicit declaration of function 'iowrite32' [-Werror=implicit-function-declaration]
drivers/spi/spi-topcliff-pch.c:241:2: error: implicit declaration of function 'ioread32' [-Werror=implicit-function-declaration]
drivers/spi/spi-topcliff-pch.c:1333:2: error: implicit declaration of function 'pci_iomap' [-Werror=implicit-function-declaration]
drivers/spi/spi-topcliff-pch.c:1398:2: error: implicit declaration of function 'pci_iounmap' [-Werror=implicit-function-declaration]
drivers/spi/spi-xilinx.c:99:2: error: implicit declaration of function 'iowrite32' [-Werror=implicit-function-declaration]
drivers/spi/spi-xilinx.c:104:2: error: implicit declaration of function 'ioread32' [-Werror=implicit-function-declaration]
drivers/spi/spi-xilinx.c:109:2: error: implicit declaration of function 'iowrite32be' [-Werror=implicit-function-declaration]
drivers/spi/spi-xilinx.c:114:2: error: implicit declaration of function 'ioread32be' [-Werror=implicit-function-declaration]
make[2]: *** No rule to make target `arch/xtensa/boot/.dtb.o', needed by `arch/xtensa/boot/built-in.o'.

[warnings]
include/linux/of_dma.h:50: warning: 'of_dma_controller_register' defined but not used
include/linux/of_dma.h:55: warning: 'of_dma_controller_free' defined but not used
include/linux/of_dma.h:66: warning: 'of_dma_simple_xlate' defined but not used
net/wireless/scan.c:1320:22: warning: 'ie' may be used uninitialized in this function [-Wmaybe-uninitialized]
net/wireless/scan.c:1243:20: warning: 'rem' may be used uninitialized in this function [-Wmaybe-uninitialized]
net/netfilter/ipset/ip_set_hash_ipportnet.c:284:14: warning: 'ip2_from' may be used uninitialized in this function [-Wmaybe-uninitialized]
drivers/gpu/drm/nouveau/core/engine/disp/dacnv50.c:67:6: warning: 'ret' may be used uninitialized in this function [-Wmaybe-uninitialized]
sound/soc/codecs/wm_adsp.c:556:4: warning: suggest parentheses around comparison in operand of '&' [-Wparentheses]
WARNING: drivers/watchdog/nv_tco.o(.text+0x3bd): Section mismatch in reference from the function nv_tco_init() to the variable .devinit.rodata:tco_pci_tbl
WARNING: drivers/watchdog/sp5100_tco.o(.text+0x2ee): Section mismatch in reference from the function sp5100_tco_init() to the variable .devinit.rodata:sp5100_tco_pci_tbl
WARNING: vmlinux.o(.text+0x4d3dc9): Section mismatch in reference from the function stmpe_spi_probe() to the function .devinit.text:stmpe_probe()
include/linux/of_dma.h:57:1: warning: no return statement in function returning non-void [-Wreturn-type]
drivers/net/can/usb/ems_usb.c:903:6: warning: unused variable 'err' [-Wunused-variable]
include/linux/compat.h:145:2: warning: 'packed' attribute ignored for field of type 'compat_sigset_t' [-Wattributes]
net/sched/sch_qfq.c:962:22: warning: 'cl' may be used uninitialized in this function [-Wmaybe-uninitialized]
WARNING: drivers/built-in.o(.text+0xe2399): Section mismatch in reference from the function stmpe_i2c_probe() to the function .devinit.text:stmpe_probe()
drivers/spi/spi-topcliff-pch.c:1333:22: warning: assignment makes pointer from integer without a cast [enabled by default]

[sparse]
drivers/net/ethernet/broadcom/bnx2x/bnx2x_link.c:10137:48: sparse: cast truncates bits from constant value (ffff7fff becomes 7fff)

[smatch]
drivers/input/misc/arizona-haptics.c:164 arizona_haptics_close() warn: variable dereferenced before check 'haptics->arizona->dapm' (see line 158)
sound/soc/codecs/wm_adsp.c:556 wm_adsp2_event() warn: add some parenthesis here?
net/wireless/scan.c:1365 ieee80211_bss() error: we previously assumed 'ies' could be null (see line 1231)
drivers/media/usb/uvc/uvc_v4l2.c:190 uvc_v4l2_try_format() error: potential NULL dereference 'format'.

[coccinelle]
drivers/net/wireless/brcm80211/brcmsmac/dma.c:352:20-24: ERROR: di is NULL but dereferenced.
drivers/pnp/pnpbios/core.c:582:1-3: WARNING: PTR_RET can be used
drivers/regulator/core.c:203:10-19: ERROR: invalid reference to the index variable of the iterator on line 188

---
0-DAY kernel build testing backend         Open Source Technology Center
Fengguang Wu, Yuanhan Liu                              Intel Corporation
