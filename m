From: Fengguang Wu <fengguang.wu@intel.com>
Date: Tue, 19 Mar 2013 17:16:43 +0000
Subject: build regressions 2013-03-19
Message-Id: <51489d7b.FlwujGubCmjw6dSx%fengguang.wu@intel.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

[errors]
irq_work.c:(.text+0x3a90): undefined reference to `printascii'
mm/bootmem.c:833:45: error: 'PHYS_MASK' undeclared (first use in this function)
mm/bootmem.c:841:6: error: 'PHYS_MASK' undeclared (first use in this function)
mm/bootmem.c:866:16: error: 'PHYS_MASK' undeclared (first use in this function)
arch/arm/kernel/entry-armv.S:739: Error: bad instruction `ldrdne r4,r5,[r3]'
inkern.c:(.text+0xf46d0): undefined reference to `tegra_usb_phy_preresume'
inkern.c:(.text+0xf46ec): undefined reference to `tegra_ehci_phy_restore_start'
inkern.c:(.text+0xf4798): undefined reference to `tegra_ehci_phy_restore_end'
inkern.c:(.text+0xf4940): undefined reference to `tegra_ehci_phy_restore_end'
inkern.c:(.text+0xf4948): undefined reference to `tegra_usb_phy_preresume'
inkern.c:(.text+0xf5d28): undefined reference to `tegra_usb_phy_open'
inkern.c:(.text+0xf7454): undefined reference to `tegra_usb_phy_postresume'
inkern.c:(.text+0xf74b0): undefined reference to `tegra_usb_phy_preresume'
fs/stat.c:169:1: error: invalid storage class for function 'SYSC_stat'
fs/stat.c:169:1: error: implicit declaration of function 'SYSC_stat' [-Werror=implicit-function-declaration]
fs/stat.c:169:1: error: invalid storage class for function 'SYSC_stat'
fs/stat.c:182:1: error: invalid storage class for function 'SYSC_lstat'
fs/stat.c:182:1: error: implicit declaration of function 'SYSC_lstat' [-Werror=implicit-function-declaration]
fs/xattr.c:436:1: error: invalid storage class for function 'SYSC_setxattr'
fs/xattr.c:434:1: error: implicit declaration of function 'SYSC_setxattr' [-Werror=implicit-function-declaration]
fs/xattr.c:436:1: error: invalid storage class for function 'SYSC_setxattr'
fs/xattr.c:461:1: error: invalid storage class for function 'SYSC_lsetxattr'
fs/xattr.c:459:1: error: implicit declaration of function 'SYSC_lsetxattr' [-Werror=implicit-function-declaration]
make[2]: execvp: /bin/bash: Argument list too long
ERROR: "au8522_attach" [drivers/media/usb/au0828/au0828.ko] undefined!
/c/kernel-tests/src/linux/include/linux/sched.h:252:19: error: static declaration of 'sched_select_cpu' follows non-static declaration
/c/kernel-tests/src/x86/include/linux/kvm_host.h:333:34: error: 'KVM_USER_MEM_SLOTS' undeclared here (not in a function)
kernel/workqueue.c:1245:5: error: implicit declaration of function 'sched_select_cpu' [-Werror=implicit-function-declaration]
kernel/time/tick-sched.c:419:4: error: implicit declaration of function 'nohz_balance_enter_idle' [-Werror=implicit-function-declaration]
kernel/time/tick-sched.c:542:2: error: implicit declaration of function 'set_cpu_sd_state_idle' [-Werror=implicit-function-declaration]
/c/kernel-tests/src/x86/include/linux/sched.h:252:19: error: static declaration of 'sched_select_cpu' follows non-static declaration

[warnings]
warning: (ARCH_TEGRA_2x_SOC && ARCH_TEGRA_3x_SOC) selects USB_ULPI which has unmet direct dependencies (USB_SUPPORT && USB_PHY && ARM)
warning: (ARCH_TEGRA_2x_SOC && ARCH_TEGRA_3x_SOC) selects USB_ULPI_VIEWPORT which has unmet direct dependencies (USB_SUPPORT && USB_PHY && USB_ULPI)
warning: (ARCH_TEGRA_2x_SOC && ARCH_TEGRA_3x_SOC) selects USB_ULPI which has unmet direct dependencies (USB_SUPPORT && USB_PHY && ARM)
warning: (ARCH_TEGRA_2x_SOC && ARCH_TEGRA_3x_SOC) selects USB_ULPI_VIEWPORT which has unmet direct dependencies (USB_SUPPORT && USB_PHY && USB_ULPI)
warning: (ARCH_TEGRA_2x_SOC && ARCH_TEGRA_3x_SOC) selects USB_ULPI which has unmet direct dependencies (USB_SUPPORT && USB_PHY && ARM)
warning: (ARCH_TEGRA_2x_SOC && ARCH_TEGRA_3x_SOC) selects USB_ULPI_VIEWPORT which has unmet direct dependencies (USB_SUPPORT && USB_PHY && USB_ULPI)
drivers/usb/phy/phy-gpio-vbus-usb.c:72:20: warning: ignoring return value of 'regulator_enable', declared with attribute warn_unused_result [-Wunused-result]
net/ieee802154/6lowpan.c:327:15: warning: 'tmp' may be used uninitialized in this function [-Wmaybe-uninitialized]
net/ieee802154/6lowpan.c:847:19: warning: 'tmp' may be used uninitialized in this function [-Wmaybe-uninitialized]
net/ieee802154/6lowpan.c:801:2: warning: 'iphc1' may be used uninitialized in this function [-Wmaybe-uninitialized]
net/ieee802154/6lowpan.c:759:3: warning: 'offset' may be used uninitialized in this function [-Wmaybe-uninitialized]
net/ieee802154/6lowpan.c:667:16: warning: 'iphc0' may be used uninitialized in this function [-Wmaybe-uninitialized]
drivers/net/wireless/ath/ath6kl/./trace.h:38:1: warning: format '%d' expects argument of type 'int', but argument 4 has type 'size_t' [-Wformat]
drivers/net/wireless/ath/ath6kl/./trace.h:61:1: warning: format '%d' expects argument of type 'int', but argument 4 has type 'size_t' [-Wformat]
drivers/net/wireless/ath/ath6kl/./trace.h:84:1: warning: format '%d' expects argument of type 'int', but argument 6 has type 'size_t' [-Wformat]
drivers/net/wireless/ath/ath6kl/./trace.h:119:1: warning: format '%d' expects argument of type 'int', but argument 7 has type 'size_t' [-Wformat]
drivers/net/wireless/ath/ath6kl/./trace.h:173:1: warning: format '%d' expects argument of type 'int', but argument 3 has type 'size_t' [-Wformat]
drivers/net/wireless/ath/ath6kl/./trace.h:193:1: warning: format '%d' expects argument of type 'int', but argument 5 has type 'size_t' [-Wformat]
drivers/net/wireless/ath/ath6kl/./trace.h:221:1: warning: format '%d' expects argument of type 'int', but argument 5 has type 'size_t' [-Wformat]

[sparse]
kernel/sys.c:1051:49: sparse: incorrect type in argument 2 (different modifiers)
kernel/sys.c:1051:49: sparse: implicit cast to nocast type
kernel/sys.c:1051:59: sparse: incorrect type in argument 3 (different modifiers)
kernel/sys.c:1051:59: sparse: implicit cast to nocast type
kernel/sys.c:1115:32: sparse: incorrect type in argument 1 (different address spaces)
kernel/sys.c:1706:25: sparse: implicit cast to nocast type
kernel/sys.c:1709:49: sparse: incorrect type in argument 2 (different modifiers)
kernel/sys.c:1709:49: sparse: implicit cast to nocast type
kernel/sys.c:1709:57: sparse: incorrect type in argument 3 (different modifiers)
kernel/sys.c:1709:57: sparse: implicit cast to nocast type
kernel/sys.c:1735:59: sparse: incorrect type in argument 2 (different modifiers)
kernel/sys.c:1735:59: sparse: implicit cast to nocast type
kernel/sys.c:1735:69: sparse: incorrect type in argument 3 (different modifiers)
kernel/sys.c:1735:69: sparse: implicit cast to nocast type
kernel/sys.c:1989:16: sparse: incorrect type in argument 1 (different address spaces)
kernel/trace/trace.c:1169:14: sparse: expression using sizeof bool
kernel/trace/trace.c:1169:14: sparse: expression using sizeof bool
kernel/trace/trace.c:1169:14: sparse: expression using sizeof bool
kernel/trace/trace.c:1169:14: sparse: expression using sizeof bool
kernel/trace/trace.c:1169:14: sparse: expression using sizeof bool
kernel/trace/trace.c:1172:9: sparse: expression using sizeof bool
kernel/trace/trace.c:1172:9: sparse: expression using sizeof bool
kernel/trace/trace.c:1172:9: sparse: expression using sizeof bool
kernel/trace/trace.c:1172:9: sparse: expression using sizeof bool
kernel/trace/trace.c:1172:9: sparse: expression using sizeof bool
kernel/trace/trace.c:1219:9: sparse: expression using sizeof bool
kernel/trace/trace.c:1219:9: sparse: expression using sizeof bool
kernel/trace/trace.c:1219:9: sparse: expression using sizeof bool
kernel/trace/trace.c:1219:9: sparse: expression using sizeof bool
kernel/trace/trace.c:1219:9: sparse: expression using sizeof bool
kernel/trace/trace.c:1551:16: sparse: incorrect type in initializer (different address spaces)
kernel/trace/trace.c:1561:17: sparse: incorrect type in assignment (different address spaces)
kernel/trace/trace.c:1565:22: sparse: incorrect type in assignment (different address spaces)
kernel/trace/trace.c:1569:21: sparse: incorrect type in assignment (different address spaces)
kernel/trace/trace.c:1573:21: sparse: incorrect type in assignment (different address spaces)
kernel/trace/trace.c:1585:21: sparse: incorrect type in argument 1 (different address spaces)
kernel/trace/trace.c:1587:21: sparse: incorrect type in argument 1 (different address spaces)
kernel/trace/trace.c:1589:21: sparse: incorrect type in argument 1 (different address spaces)
kernel/trace/trace.c:990:15: sparse: memset with byte count of 131076
net/bluetooth/hci_event.c:625:40: sparse: cast to restricted __le16
drivers/tty/tty_io.c:781:6: sparse: symbol 'tty_vhangup_session' was not declared. Should it be static?
drivers/usb/musb/musb_dsps.c:504:34: sparse: incorrect type in argument 1 (different address spaces)
drivers/usb/musb/musb_dsps.c:505:45: sparse: incorrect type in argument 1 (different address spaces)
drivers/usb/gadget/pxa27x_udc.c:2157:20: sparse: incorrect type in assignment (different base types)
drivers/usb/gadget/pxa27x_udc.c:2186:20: sparse: incorrect type in assignment (different base types)
drivers/usb/gadget/pxa27x_udc.c:2187:20: sparse: incorrect type in assignment (different base types)
drivers/usb/gadget/pxa27x_udc.c:2370:17: sparse: incorrect type in initializer (different base types)
drivers/usb/gadget/pxa27x_udc.c:2371:17: sparse: incorrect type in initializer (different base types)
drivers/usb/gadget/pxa27x_udc.c:2372:17: sparse: incorrect type in initializer (different base types)
drivers/usb/gadget/pxa27x_udc.c:2373:17: sparse: incorrect type in initializer (different base types)
drivers/usb/gadget/pxa27x_udc.c:2374:17: sparse: incorrect type in initializer (different base types)
drivers/usb/gadget/pxa27x_udc.c:2375:17: sparse: incorrect type in initializer (different base types)
drivers/usb/gadget/pxa27x_udc.c:759:39: sparse: context imbalance in 'req_done' - unexpected unlock
drivers/usb/dwc3/gadget.c:1633:37: sparse: dubious: x | !y
drivers/usb/phy/phy-omap-control.c:223:31: sparse: incorrect type in argument 1 (different address spaces)
drivers/usb/phy/phy-omap-control.c:224:43: sparse: incorrect type in argument 1 (different address spaces)
drivers/usb/phy/phy-omap-control.c:231:39: sparse: incorrect type in argument 1 (different address spaces)
drivers/usb/phy/phy-omap-control.c:232:51: sparse: incorrect type in argument 1 (different address spaces)
drivers/usb/phy/phy-omap-control.c:240:39: sparse: incorrect type in argument 1 (different address spaces)
drivers/usb/phy/phy-omap-control.c:241:51: sparse: incorrect type in argument 1 (different address spaces)
drivers/usb/phy/phy-omap-usb3.c:216:23: sparse: incorrect type in argument 1 (different address spaces)
drivers/usb/phy/phy-omap-usb3.c:217:35: sparse: incorrect type in argument 1 (different address spaces)
drivers/usb/phy/phy-samsung-usb2.c:50:26: sparse: incorrect type in argument 1 (different address spaces)
drivers/usb/phy/phy-samsung-usb2.c:73:35: sparse: incorrect type in argument 1 (different address spaces)
drivers/usb/phy/phy-samsung-usb2.c:372:20: sparse: incorrect type in argument 1 (different address spaces)
drivers/usb/phy/phy-samsung-usb2.c:373:32: sparse: incorrect type in argument 1 (different address spaces)

---
0-DAY kernel build testing backend              Open Source Technology Center
http://lists.01.org/mailman/listinfo/kbuild                 Intel Corporation
