From: Fengguang Wu <fengguang.wu@intel.com>
Date: Fri, 19 Apr 2013 16:09:44 +0000
Subject: build regressions 2013-04-19
Message-Id: <51716c48.TItRd6VjDb5+UNPV%fengguang.wu@intel.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

[errors]
FATAL ERROR: Unable to parse input tree
drivers/pinctrl/sh-pfc/pfc-r8a7779.c:2386:2: error: implicit declaration of function 'RCAR_GP_PIN' [-Werror=implicit-function-declaration]
drivers/pinctrl/sh-pfc/pfc-r8a7779.c:2386:2: error: initializer element is not constant
drivers/pinctrl/sh-pfc/pfc-r8a7779.c:2386:2: error: initializer element is not constant
drivers/pinctrl/sh-pfc/pfc-r8a7779.c:2386:2: error: initializer element is not constant
drivers/pinctrl/sh-pfc/pfc-r8a7779.c:2387:2: error: initializer element is not constant
drivers/pinctrl/sh-pfc/pfc-r8a7779.c:2387:2: error: initializer element is not constant
drivers/pinctrl/sh-pfc/pfc-r8a7779.c:2387:2: error: initializer element is not constant
drivers/pinctrl/sh-pfc/pfc-r8a7779.c:2388:2: error: initializer element is not constant
drivers/pinctrl/sh-pfc/pfc-r8a7779.c:2388:2: error: initializer element is not constant
drivers/pinctrl/sh-pfc/pfc-r8a7779.c:2397:2: error: initializer element is not constant
drivers/pinctrl/sh-pfc/pfc-r8a7779.c:2404:2: error: initializer element is not constant
drivers/pinctrl/sh-pfc/pfc-r8a7779.c:2404:2: error: initializer element is not constant
drivers/pinctrl/sh-pfc/pfc-r8a7779.c:2412:2: error: initializer element is not constant
drivers/pinctrl/sh-pfc/pfc-r8a7779.c:2412:2: error: initializer element is not constant
drivers/pinctrl/sh-pfc/pfc-r8a7779.c:2412:2: error: initializer element is not constant
drivers/pinctrl/sh-pfc/pfc-r8a7779.c:2413:2: error: initializer element is not constant
drivers/pinctrl/sh-pfc/pfc-r8a7779.c:2413:2: error: initializer element is not constant
drivers/pinctrl/sh-pfc/pfc-r8a7779.c:2413:2: error: initializer element is not constant
drivers/pinctrl/sh-pfc/pfc-r8a7779.c:2414:2: error: initializer element is not constant
drivers/pinctrl/sh-pfc/pfc-r8a7779.c:2414:2: error: initializer element is not constant
drivers/pinctrl/sh-pfc/pfc-r8a7779.c:2423:2: error: initializer element is not constant
drivers/pinctrl/sh-pfc/pfc-r8a7779.c:2430:2: error: initializer element is not constant
drivers/pinctrl/sh-pfc/pfc-r8a7779.c:2430:2: error: initializer element is not constant
drivers/pinctrl/sh-pfc/pfc-r8a7779.c:2438:2: error: initializer element is not constant
drivers/pinctrl/sh-pfc/pfc-r8a7779.c:2438:2: error: initializer element is not constant
drivers/pinctrl/sh-pfc/pfc-r8a7779.c:2438:2: error: initializer element is not constant
drivers/pinctrl/sh-pfc/pfc-r8a7779.c:2439:2: error: initializer element is not constant
drivers/pinctrl/sh-pfc/pfc-r8a7779.c:2439:2: error: initializer element is not constant
drivers/pinctrl/sh-pfc/pfc-r8a7779.c:2439:2: error: initializer element is not constant
drivers/pinctrl/sh-pfc/pfc-r8a7779.c:2440:2: error: initializer element is not constant
drivers/pinctrl/sh-pfc/pfc-r8a7779.c:2440:2: error: initializer element is not constant
drivers/pinctrl/sh-pfc/pfc-r8a7779.c:2449:2: error: initializer element is not constant
drivers/pinctrl/sh-pfc/pfc-r8a7779.c:2456:2: error: initializer element is not constant
drivers/pinctrl/sh-pfc/pfc-r8a7779.c:2456:2: error: initializer element is not constant
drivers/pinctrl/sh-pfc/pfc-r8a7779.c:2464:2: error: initializer element is not constant
drivers/pinctrl/sh-pfc/pfc-r8a7779.c:2464:2: error: initializer element is not constant
drivers/pinctrl/sh-pfc/pfc-r8a7779.c:2464:2: error: initializer element is not constant
drivers/pinctrl/sh-pfc/pfc-r8a7779.c:2465:2: error: initializer element is not constant
drivers/pinctrl/sh-pfc/pfc-r8a7779.c:2465:2: error: initializer element is not constant
drivers/pinctrl/sh-pfc/pfc-r8a7779.c:2465:2: error: initializer element is not constant
drivers/pinctrl/sh-pfc/pfc-r8a7779.c:2466:2: error: initializer element is not constant
drivers/pinctrl/sh-pfc/pfc-r8a7779.c:2466:2: error: initializer element is not constant
drivers/pinctrl/sh-pfc/pfc-r8a7779.c:2475:2: error: initializer element is not constant
drivers/pinctrl/sh-pfc/pfc-r8a7779.c:2482:2: error: initializer element is not constant
drivers/pinctrl/sh-pfc/pfc-r8a7779.c:2482:2: error: initializer element is not constant
drivers/platform/x86/chromeos_laptop.c:179:2: error: implicit declaration of function 'add_probed_i2c_device' [-Werror=implicit-function-declaration]
drivers/platform/x86/chromeos_laptop.c:179:41: error: 'I2C_ADAPTER_VGADDC' undeclared (first use in this function)
drivers/platform/x86/chromeos_laptop.c:220:44: error: 'I2C_ADAPTER_PANEL' undeclared (first use in this function)
drivers/iommu/amd_iommu_init.c:932:4: error: too few arguments to function 'add_special_device'

[warnings]
drivers/dma/dmatest.c:337:2: warning: format '%llx' expects argument of type 'long long unsigned int', but argument 3 has type 'phys_addr_t' [-Wformat]
drivers/dma/dmatest.c:350:2: warning: format '%llx' expects argument of type 'long long unsigned int', but argument 3 has type 'phys_addr_t' [-Wformat]
drivers/gpu/drm/i915/intel_drv.h:445:1: warning: control reaches end of non-void function [-Wreturn-type]
drivers/gpu/drm/i915/intel_drv.h:445:1: warning: control reaches end of non-void function [-Wreturn-type]
arch/x86/include/asm/irq_remapping.h:93:18: warning: 'struct irq_cfg' declared inside parameter list [enabled by default]
net/ceph/messenger.c:1008:2: warning: 'new_piece' may be used uninitialized in this function [-Wmaybe-uninitialized]
drivers/net/wireless/brcm80211/brcmfmac/dhd_dbg.c:63:1: warning: control reaches end of non-void function [-Wreturn-type]
drivers/net/wireless/brcm80211/brcmfmac/dhd_dbg.c:52:1: warning: control reaches end of non-void function [-Wreturn-type]
arch/x86/include/asm/irq_remapping.h:50:18: warning: 'struct irq_chip' declared inside parameter list [enabled by default]
arch/x86/include/asm/irq_remapping.h:50:18: warning: its scope is only this definition or declaration, which is probably not what you want [enabled by default]
arch/x86/include/asm/irq_remapping.h:52:44: warning: 'struct irq_chip' declared inside parameter list [enabled by default]

[sparse]
drivers/gpu/drm/i915/intel_hdmi.c:1007:6: sparse: symbol 'intel_hdmi_pre_pll_enable' was not declared. Should it be static?
drivers/gpu/drm/i915/intel_hdmi.c:1040:6: sparse: symbol 'intel_hdmi_post_disable' was not declared. Should it be static?
drivers/net/ethernet/intel/igb/e1000_82575.c:2460:5: sparse: symbol 'igb_get_eee_status_i354' was not declared. Should it be static?
drivers/base/regmap/regmap.c:946:58: sparse: incorrect type in argument 1 (different modifiers)
net/ceph/osd_client.c:370:23: sparse: incorrect type in assignment (different base types)
fs/gfs2/./trace_gfs2.h:160:1: sparse: expression using sizeof bool
drivers/media/common/siano/smsdvb-main.c:58:5: sparse: symbol 'sms_to_guard_interval_table' was not declared. Should it be static?
drivers/media/common/siano/smsdvb-main.c:65:5: sparse: symbol 'sms_to_code_rate_table' was not declared. Should it be static?
drivers/media/common/siano/smsdvb-main.c:74:5: sparse: symbol 'sms_to_hierarchy_table' was not declared. Should it be static?
drivers/media/common/siano/smsdvb-main.c:81:5: sparse: symbol 'sms_to_modulation_table' was not declared. Should it be static?
drivers/staging/media/solo6x10/solo6x10-core.c:213:48: sparse: incorrect type in argument 3 (different base types)
drivers/staging/media/solo6x10/solo6x10-core.c:230:24: sparse: cast to restricted __be16
drivers/staging/media/solo6x10/solo6x10-core.c:230:24: sparse: cast to restricted __be16
drivers/staging/media/solo6x10/solo6x10-core.c:230:24: sparse: cast to restricted __be16
drivers/staging/media/solo6x10/solo6x10-core.c:230:24: sparse: cast to restricted __be16
drivers/staging/media/solo6x10/solo6x10-disp.c:184:24: sparse: incorrect type in assignment (different base types)
drivers/staging/media/solo6x10/solo6x10-disp.c:214:32: sparse: incorrect type in assignment (different base types)
drivers/staging/media/solo6x10/solo6x10-enc.c:161:15: sparse: memset with byte count of 131072
drivers/media/usb/em28xx/em28xx-cards.c:2912:50: sparse: restricted __le16 degrades to integer
drivers/media/tuners/r820t.c:1215:32: sparse: dubious: !x & y
net/ceph/osd_client.c:128:22: sparse: symbol 'osd_req_op_cls_request_info' was not declared. Should it be static?
net/ceph/osd_client.c:138:22: sparse: symbol 'osd_req_op_cls_request_data' was not declared. Should it be static?
kernel/sched/core.c:825:6: sparse: symbol 'sched_set_stop_task' was not declared. Should it be static?
drivers/media/usb/hdpvr/hdpvr-video.c:41:9: sparse: unknown field name in initializer
drivers/staging/media/solo6x10/solo6x10-core.c:43:10: sparse: symbol 'video_nr' was not declared. Should it be static?
drivers/staging/media/solo6x10/solo6x10-jpeg.h:113:21: sparse: symbol 'jpeg_dqt' was not declared. Should it be static?
drivers/cpufreq/amd_freq_sensitivity.c:38:8: sparse: symbol 'cpu_data' was not declared. Should it be static?

[smatch]
fs/ocfs2/ioctl.c:333 ocfs2_info_scan_inode_alloc() error: we previously assumed 'inode_alloc' could be null (see line 329)
fs/ocfs2/ioctl.c:589 ocfs2_info_freefrag_scan_bitmap() error: we previously assumed 'gb_inode' could be null (see line 585)

[coccinelle]
drivers/gpu/drm/radeon/evergreen.c:68:3-20: code aligned with following code on line 69
drivers/gpu/drm/radeon/evergreen.c:68:3-20: code aligned with following code on line 69
drivers/gpu/drm/radeon/radeon_fence.c:207:3-9: preceding lock on line 254
drivers/gpu/drm/radeon/radeon_fence.c:280:4-10: preceding lock on line 254
drivers/gpu/drm/radeon/radeon_fence.c:207:3-9: preceding lock on line 254
drivers/gpu/drm/radeon/radeon_fence.c:280:4-10: preceding lock on line 254
drivers/platform/x86/thinkpad_acpi.c:401:1-6: code aligned with following code on line 7639
drivers/platform/x86/thinkpad_acpi.c:675:1-31: code aligned with following code on line 4459
drivers/platform/x86/thinkpad_acpi.c:392:1-25: code aligned with following code on line 6964

---
0-DAY kernel build testing backend              Open Source Technology Center
http://lists.01.org/mailman/listinfo/kbuild                 Intel Corporation
