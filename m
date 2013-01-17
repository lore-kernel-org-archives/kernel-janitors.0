From: Fengguang Wu <fengguang.wu@intel.com>
Date: Thu, 17 Jan 2013 16:09:26 +0000
Subject: build regressions 2013-01-17
Message-Id: <50f82236.RaJBf+/ZyZD1qehQ%fengguang.wu@intel.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

[errors]
arch/arm/include/asm/tlbflush.h:331:6: error: 'TLB_V7_UIS_BP' undeclared (first use in this function)
arch/arm/mm/tlb-v7.S:95: Error: invalid operands (*ABS* and *UND* sections) for `|'
board-paz00.c:(.init.text+0xd4): undefined reference to `debug_ll_io_init'
include/uapi/drm/i915_drm.h:311:1: error: expected identifier or '(' before '<<' token
drivers/gpu/drm/i915/i915_dma.c:916:23: error: 'param' undeclared (first use in this function)
drivers/gpu/drm/i915/i915_dma.c:992:1: error: expected expression before '<<' token
drivers/gpu/drm/i915/i915_dma.c:1845:1: error: subscripted value is neither array nor pointer nor vector
drivers/gpu/drm/i915/i915_dma.c:1859:1: error: invalid application of 'sizeof' to incomplete type 'struct drm_i915_gem_pin'
drivers/gpu/drm/i915/i915_dma.c:1859:1: error: array type has incomplete element type
drivers/gpu/drm/i915/i915_gem.c:3492:8: error: dereferencing pointer to incomplete type
include/linux/sched.h:435:2: error: unknown type name 'cputime_t'
drivers/usb/phy/mv_usb2_phy.c:141:2: error: implicit declaration of function 'readl_relaxed' [-Werror=implicit-function-declaration]
drivers/extcon/extcon-arizona.c:323:3: error: implicit declaration of function 'arizona_start_mic' [-Werror=implicit-function-declaration]
drivers/extcon/extcon-arizona.c:349:3: error: implicit declaration of function 'arizona_stop_mic' [-Werror=implicit-function-declaration]
drivers/extcon/extcon-arizona.c:394:2: error: expected identifier or '(' before '}' token
drivers/extcon/extcon-arizona.c:396:6: error: expected '=', ',', ';', 'asm' or '__attribute__' before '->' token
drivers/extcon/extcon-arizona.c:397:1: error: expected identifier or '(' before '}' token
drivers/extcon/extcon-arizona.c:399:13: error: static declaration of 'arizona_start_mic' follows non-static declaration
drivers/extcon/extcon-arizona.c:437:13: error: static declaration of 'arizona_stop_mic' follows non-static declaration
drivers/usb/phy/mv_usb2_phy.c:151:2: error: implicit declaration of function 'writel_relaxed' [-Werror=implicit-function-declaration]
drivers/usb/phy/mv_usb2_phy.c:354:22: error: expected '=', ',', ';', 'asm' or '__attribute__' before 'usb_phy_parse_dt'
drivers/usb/phy/mv_usb2_phy.c:402:22: error: expected '=', ',', ';', 'asm' or '__attribute__' before 'usb_phy_probe'
drivers/usb/phy/mv_usb2_phy.c:480:22: error: expected '=', ',', ';', 'asm' or '__attribute__' before 'usb_phy_remove'
drivers/usb/phy/mv_usb2_phy.c:495:11: error: 'usb_phy_probe' undeclared here (not in a function)
drivers/usb/phy/mv_usb2_phy.c:496:12: error: 'usb_phy_remove' undeclared here (not in a function)
drivers/net/wireless/ti/wl12xx/main.c:1801:22: error: expected '=', ',', ';', 'asm' or '__attribute__' before 'wl12xx_remove'
drivers/net/wireless/ti/wl12xx/main.c:1824:13: error: 'wl12xx_remove' undeclared here (not in a function)
include/uapi/drm/i915_drm.h:311:1: error: expected identifier or '(' before '<<' token
drivers/gpu/drm/i915/i915_dma.c:916:23: error: 'param' undeclared (first use in this function)
drivers/gpu/drm/i915/i915_dma.c:992:1: error: expected expression before '<<' token
drivers/gpu/drm/i915/i915_dma.c:1845:240: error: subscripted value is neither array nor pointer nor vector
drivers/gpu/drm/i915/i915_dma.c:1859:204: error: invalid application of 'sizeof' to incomplete type 'struct drm_i915_gem_pin'
drivers/gpu/drm/i915/i915_dma.c:1859:246: error: array type has incomplete element type
drivers/gpu/drm/i915/i915_gem.c:3492:115: error: dereferencing pointer to incomplete type
drivers/gpu/drm/i915/i915_ioc32.c:139:23: error: 'request' undeclared (first use in this function)
drivers/gpu/drm/i915/i915_ioc32.c:151:166: error: subscripted value is neither array nor pointer nor vector
mv_udc_core.c:(.text+0x44b4da): undefined reference to `mv_usb2_get_phy'
mv_udc_core.c:(.text+0x44b1ff): undefined reference to `mv_usb2_unregister_notifier'
mv_udc_core.c:(.text+0x44bdaf): undefined reference to `mv_usb2_register_notifier'

[warnings]
drivers/gpu/drm/qxl/qxl_cmd.c:86:3: warning: label 'retry' defined but not used [-Wunused-label]
include/uapi/drm/i915_drm.h:320:3: warning: data definition has no type or storage class [enabled by default]
include/uapi/drm/i915_drm.h:320:3: warning: type defaults to 'int' in declaration of 'drm_i915_getparam_t' [-Wimplicit-int]
drivers/gpu/drm/i915/i915_dma.c:917:2: warning: ISO C90 forbids mixed declarations and code [-Wdeclaration-after-statement]
fs/f2fs/recovery.c:225:52: warning: 'sum.<U 2f8>.<U 260>.ofs_in_node' may be used uninitialized in this function [-Wmaybe-uninitialized]
drivers/usb/gadget/f_uac2.c:263:20: warning: unused variable 'agdev' [-Wunused-variable]
drivers/gpu/drm/qxl/qxl_debugfs.c:411:7: warning: format '%d' expects argument of type 'int', but argument 3 has type 'size_t' [-Wformat]
warning: (CAN_PEAK_PCIEC && SFC && IGB && DRM && FB_DDC && FB_BFIN_7393 && FB_VIA && SND_AOA_ONYX && SND_AOA_TAS && SND_SOC_BFIN_EVAL_ADAU1701 && FB_OLPC_DCON) selects I2C which has unmet direct dependencies (!S390)
drivers/vfio/pci/vfio_pci.c:413:2: warning: passing argument 2 of 'vfio_pci_rw' discards 'const' qualifier from pointer target type [enabled by default]
drivers/extcon/extcon-arizona.c:399:13: warning: conflicting types for 'arizona_start_mic' [enabled by default]
drivers/extcon/extcon-arizona.c:437:13: warning: conflicting types for 'arizona_stop_mic' [enabled by default]
drivers/md/dm-integrity.c:868:2: warning: initialization from incompatible pointer type [enabled by default]
drivers/md/dm-integrity.c:868:2: warning: (near initialization for 'dm_int_target.map') [enabled by default]
include/uapi/drm/i915_drm.h:320:3: warning: data definition has no type or storage class [enabled by default]
include/uapi/drm/i915_drm.h:320:3: warning: type defaults to 'int' in declaration of 'drm_i915_getparam_t' [-Wimplicit-int]
drivers/gpu/drm/i915/i915_dma.c:917:2: warning: ISO C90 forbids mixed declarations and code [-Wdeclaration-after-statement]
drivers/gpu/drm/i915/i915_ioc32.c:153:1: warning: control reaches end of non-void function [-Wreturn-type]

[sparse]
include/uapi/drm/i915_drm.h:311:1: sparse: missing identifier in declaration
drivers/gpu/drm/i915/i915_dma.c:925:14: sparse: incompatible types for 'case' statement
drivers/net/ethernet/intel/igb/igb_main.c:7574:19: sparse: symbol 'igb_get_i2c_client' was not declared. Should it be static?
include/uapi/drm/i915_drm.h:311:1: sparse: Expected ; at the end of type declaration
include/uapi/drm/i915_drm.h:311:1: sparse: got <<
drivers/gpu/drm/i915/i915_dma.c:992:1: sparse: Expected ; at end of statement
drivers/gpu/drm/i915/i915_dma.c:992:1: sparse: got <<
drivers/gpu/drm/i915/i915_dma.c:916:9: sparse: undefined identifier 'drm_i915_getparam_t'
drivers/gpu/drm/i915/i915_dma.c:924:17: sparse: undefined identifier 'param'
drivers/gpu/drm/i915/i915_gem.c:3492:15: sparse: using member 'handle' in incomplete struct drm_i915_gem_pin
drivers/gpu/drm/i915/i915_gem.c:3512:52: sparse: using member 'alignment' in incomplete struct drm_i915_gem_pin
drivers/gpu/drm/i915/i915_gem.c:3524:13: sparse: using member 'offset' in incomplete struct drm_i915_gem_pin
drivers/usb/phy/mv_usb2_phy.c:354:22: sparse: Expected ; at end of declaration
drivers/usb/phy/mv_usb2_phy.c:354:22: sparse: got usb_phy_parse_dt
drivers/usb/phy/mv_usb2_phy.c:364:13: sparse: Expected ) in function declarator
drivers/usb/phy/mv_usb2_phy.c:364:13: sparse: got !
drivers/usb/phy/mv_usb2_phy.c:370:24: sparse: got clks_num
drivers/usb/phy/mv_usb2_phy.c:371:9: sparse: Expected ; at the end of type declaration
drivers/usb/phy/mv_usb2_phy.c:389:27: sparse: got (
drivers/usb/phy/mv_usb2_phy.c:392:32: sparse: got PTR_ERR
drivers/usb/phy/mv_usb2_phy.c:447:24: sparse: got ret

[smatch]
drivers/tty/serial/sccnxp.c:894 sccnxp_probe() error: we previously assumed 'pdata' could be null (see line 887)
drivers/vfio/pci/vfio_pci_rdwr.c:169 vfio_pci_bar_rw() warn: always true condition '(done >= 0) => (0-u32max >= 0)'
drivers/vfio/pci/vfio_pci_rdwr.c:191 vfio_pci_legacy_mem_rw() warn: consider using resource_size() here
drivers/vfio/pci/vfio_pci_rdwr.c:206 vfio_pci_legacy_mem_rw() warn: always true condition '(done >= 0) => (0-u32max >= 0)'
drivers/vfio/pci/vfio_pci_rdwr.c:254 vfio_pci_legacy_io_rw() warn: always true condition '(done >= 0) => (0-u32max >= 0)'

---
0-DAY kernel build testing backend              Open Source Technology Center
http://lists.01.org/mailman/listinfo/kbuild                 Intel Corporation
