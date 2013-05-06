From: Fengguang Wu <fengguang.wu@intel.com>
Date: Mon, 06 May 2013 16:16:07 +0000
Subject: build regressions 2013-05-06
Message-Id: <5187d747.4zIlpd0XURAT68Uy%fengguang.wu@intel.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

[errors]
drivers/pci/../gpu/drm/i915/i915_reg.h:2775:1: error: expected identifier or '(' before '<<' token
drivers/pci/quirks.c:3216:3: error: 'reset_ivb_igd' undeclared here (not in a function)
drivers/gpu/drm/i915/i915_reg.h:2775:1: error: expected identifier or '(' before '<<' token
drivers/gpu/drm/i915/i915_reg.h:2775:1: error: expected identifier or '(' before '<<' token
drivers/gpu/drm/i915/i915_reg.h:2775:1: error: expected identifier or '(' before '<<' token
/usr/lib/gcc/x86_64-linux-gnu/4.7/include/stdarg.h:102:1: error: unknown type name '__gnuc_va_list'
drivers/gpu/drm/i915/i915_reg.h:2775:1: error: expected identifier or '(' before '<<' token
drivers/gpu/drm/i915/intel_bios.c:705:17: error: dereferencing pointer to incomplete type
drivers/gpu/drm/i915/intel_bios.c:706:4: error: dereferencing pointer to incomplete type
drivers/gpu/drm/i915/intel_bios.c:708:49: error: dereferencing pointer to incomplete type
drivers/gpu/drm/i915/intel_bios.c:736:45: error: dereferencing pointer to incomplete type
(.text+0x616364): undefined reference to `find_font'

[warnings]
drivers/media/dvb-frontends/dib8000.c:3537: warning: 'ret' is used uninitialized in this function
WARNING: vmlinux.o(.text.unlikely+0x2c9d): Section mismatch in reference from the function __node_set.constprop.0() to the variable .init.data:numa_nodes_parsed
arch/x86/kernel/head_32.S:93: Warning: using `%bl' instead of `%ebx' due to `b' suffix
arch/x86/kernel/head_32.S:94: Warning: using `%bl' instead of `%ebx' due to `b' suffix
arch/x86/kernel/head_32.S:143: Warning: using `%bl' instead of `%ebx' due to `b' suffix
arch/x86/kernel/head_32.S:143: Warning: using `%bl' instead of `%ebx' due to `b' suffix
arch/x86/kernel/head_32.S:93: Warning: using `%bl' instead of `%ebx' due to `b' suffix
arch/x86/kernel/head_32.S:94: Warning: using `%bl' instead of `%ebx' due to `b' suffix
arch/x86/kernel/head_32.S:143: Warning: using `%bl' instead of `%ebx' due to `b' suffix
arch/x86/kernel/head_32.S:143: Warning: using `%bl' instead of `%ebx' due to `b' suffix
security/integrity/ima/ima_api.c:288:10: warning: 'filename_len' may be used uninitialized in this function [-Wmaybe-uninitialized]
drivers/gpu/drm/i915/intel_bios.h:42:1: warning: empty declaration [enabled by default]
drivers/gpu/drm/i915/intel_bios.h:42:1: warning: empty declaration [enabled by default]
include/linux/kernel.h:359:50: warning: conflicting types for built-in function 'vsprintf' [enabled by default]
include/linux/kernel.h:363:5: warning: conflicting types for built-in function 'vsnprintf' [enabled by default]
include/linux/kernel.h:375:5: warning: conflicting types for built-in function 'vsscanf' [enabled by default]

[sparse]
drivers/gpu/drm/radeon/radeon_cs.c:639:35: sparse: incorrect type in argument 1 (different base types)
drivers/gpu/drm/radeon/radeon_cs.c:639:66: sparse: incorrect type in argument 2 (different base types)
net/ipv6/af_inet6.c:511:5: sparse: symbol 'inet6_killaddr_ioctl' was not declared. Should it be static?
drivers/input/misc/gpio_axis.c:28:10: sparse: symbol 'gpio_axis_4bit_gray_map_table' was not declared. Should it be static?
drivers/input/misc/gpio_axis.c:43:10: sparse: symbol 'gpio_axis_5bit_singletrack_map_table' was not declared. Should it be static?
drivers/input/misc/gpio_axis.c:28:10: sparse: symbol 'gpio_axis_4bit_gray_map_table' was not declared. Should it be static?
drivers/input/misc/gpio_axis.c:43:10: sparse: symbol 'gpio_axis_5bit_singletrack_map_table' was not declared. Should it be static?
drivers/gpu/drm/drm_fops.c:428:5: sparse: symbol 'drm_file_fini' was not declared. Should it be static?
drivers/gpu/drm/nouveau/core/engine/device/nve0.c:152:57: sparse: undefined identifier 'nvc0_devinit_oclass'
drivers/usb/host/ohs900-hcd.c:1555:22: sparse: Expected ; at end of declaration
drivers/usb/host/ohs900-hcd.c:1555:22: sparse: got ohs900h_remove
drivers/usb/host/ohs900-hcd.c:1560:9: sparse: got {
drivers/usb/host/ohs900-hcd.c:1560:9: sparse: Expected ) in function declarator
drivers/usb/host/ohs900-hcd.c:1560:9: sparse: got (
drivers/usb/host/ohs900-hcd.c:1560:9: sparse: Expected ; at the end of type declaration
drivers/usb/host/ohs900-hcd.c:1566:17: sparse: got iounmap
drivers/char/scet.c:255:22: sparse: Expected ; at end of declaration
drivers/char/scet.c:255:22: sparse: got scet_probe
drivers/char/scet.c:261:9: sparse: got {
drivers/char/scet.c:261:9: sparse: Expected ) in function declarator
drivers/char/scet.c:261:9: sparse: got (
drivers/char/scet.c:261:9: sparse: Expected ; at the end of type declaration
drivers/char/scet.c:269:22: sparse: got out
drivers/char/scet.c:294:4: sparse: got :
drivers/char/scet.c:263:29: sparse: undefined identifier 'pdev'
drivers/char/scet.c:265:9: sparse: symbol 'r' redeclared with different type (originally declared at drivers/char/scet.c:259) - different base types
drivers/char/scet.c:319:18: sparse: undefined identifier 'scet_probe'
drivers/char/scet.c:320:19: sparse: undefined identifier '__devexit_p'
drivers/char/scet.c:324:38: sparse: undefined identifier 'scet_match'
drivers/input/serio/opencores_ps2.c:113:21: sparse: undefined identifier 'platform_get_resource'
drivers/input/serio/opencores_ps2.c:119:24: sparse: undefined identifier 'platform_get_irq'
drivers/input/serio/opencores_ps2.c:125:14: sparse: using member 'name' in incomplete struct platform_device
drivers/input/serio/opencores_ps2.c:146:9: sparse: using member 'dev' in incomplete struct platform_device
drivers/input/serio/opencores_ps2.c:161:9: sparse: undefined identifier 'platform_set_drvdata'
drivers/input/serio/opencores_ps2.c:178:38: sparse: undefined identifier 'platform_get_drvdata'
drivers/input/serio/opencores_ps2.c:195:10: sparse: unknown field name in initializer
drivers/input/serio/opencores_ps2.c:206:16: sparse: undefined identifier 'platform_driver_register'
drivers/input/serio/opencores_ps2.c:211:9: sparse: undefined identifier 'platform_driver_unregister'
mm/page_alloc.c:199:5: sparse: symbol 'min_free_order_shift' was not declared. Should it be static?
mm/vmscan.c:157:15: sparse: symbol 'debug_file' was not declared. Should it be static?
drivers/ata/sata_exynos.c:38:9: sparse: Initializer entry defined twice
net/activity_stats.c:36:6: sparse: symbol 'activity_stats_update' was not declared. Should it be static?
drivers/mmc/core/sdio.c:1246:5: sparse: symbol 'sdio_reset_comm' was not declared. Should it be static?
drivers/cpufreq/cpufreq_interactive.c:58:8: sparse: symbol 'cpuinfo' was not declared. Should it be static?
drivers/gator/gator_events_meminfo.c:29:1: sparse: symbol 'work' was not declared. Should it be static?
drivers/gator/gator_events_perf_pmu.c:46:8: sparse: symbol 'events' was not declared. Should it be static?
drivers/gator/gator_events_perf_pmu.c:48:8: sparse: symbol 'perf_cnt' was not declared. Should it be static?
drivers/staging/android/ashmem.h:37:23: sparse: Expected } at end of struct-union-enum-specifier
drivers/staging/android/ashmem.h:37:23: sparse: got offset
drivers/staging/android/ashmem.h:38:23: sparse: Expected ; at end of declaration
drivers/staging/android/ashmem.h:38:23: sparse: got len
drivers/staging/android/ashmem.h:39:1: sparse: Expected ; at the end of type declaration
drivers/staging/android/ashmem.h:39:1: sparse: got }
drivers/staging/android/ashmem.c:696:43: sparse: no member 'offset' in struct compat_ashmem_pin
drivers/staging/android/ashmem.c:697:40: sparse: no member 'len' in struct compat_ashmem_pin
drivers/staging/android/ashmem.c:685:14: sparse: Expected constant expression in case statement
drivers/switch/switch_class.c:26:14: sparse: symbol 'switch_class' was not declared. Should it be static?

---
0-DAY kernel build testing backend              Open Source Technology Center
http://lists.01.org/mailman/listinfo/kbuild                 Intel Corporation
