From: Fengguang Wu <fengguang.wu@intel.com>
Date: Tue, 09 Jul 2013 16:01:25 +0000
Subject: build regressions 2013-07-09
Message-Id: <51dc33d5.oihLBKnIQFK1qbAt%fengguang.wu@intel.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

[errors]
drivers/gpu/drm/drm_memory.c:153: error: implicit declaration of function 'ioremap_wc'
drivers/gpu/drm/drm_bufs.c:219: error: implicit declaration of function 'ioremap_wc'
drivers/block/nvme-core.c:1490:3: error: implicit declaration of function 'force_successful_syscall_return' [-Werror=implicit-function-declaration]
drivers/block/nvme-core.c:1774:2: error: expected '=', ',', ';', 'asm' or '__attribute__' before 'unsigned'
drivers/block/nvme-core.c:1782:2: error: 'res' undeclared (first use in this function)
perf_event_amd.c:(.text+0x11d77): undefined reference to `kmem_cache_alloc_node_trace'
(.text+0x14426): undefined reference to `kmem_cache_alloc_node_trace'
(.text+0x144ed): undefined reference to `kmem_cache_alloc_node_trace'
(.text+0x1606b): undefined reference to `kmem_cache_alloc_node_trace'
io_apic.c:(.text+0x220e4): undefined reference to `kmem_cache_alloc_node_trace'

[warnings]
Warning(net/mac80211/sta_info.h:412): No description found for parameter 'chain_signal_last[IEEE80211_MAX_CHAINS]'
Warning(net/mac80211/sta_info.h:412): No description found for parameter 'chain_signal_avg[IEEE80211_MAX_CHAINS]'
Warning(net/mac80211/sta_info.h:412): No description found for parameter 'chain_signal_last[IEEE80211_MAX_CHAINS]'
Warning(net/mac80211/sta_info.h:412): No description found for parameter 'chain_signal_avg[IEEE80211_MAX_CHAINS]'
Warning(net/mac80211/sta_info.h:412): No description found for parameter 'chain_signal_last[IEEE80211_MAX_CHAINS]'
Warning(net/mac80211/sta_info.h:412): No description found for parameter 'chain_signal_avg[IEEE80211_MAX_CHAINS]'
Warning(net/mac80211/sta_info.h:412): No description found for parameter 'chain_signal_last[IEEE80211_MAX_CHAINS]'
Warning(net/mac80211/sta_info.h:412): No description found for parameter 'chain_signal_avg[IEEE80211_MAX_CHAINS]'
Warning(net/mac80211/sta_info.h:412): No description found for parameter 'chain_signal_last[IEEE80211_MAX_CHAINS]'
Warning(net/mac80211/sta_info.h:412): No description found for parameter 'chain_signal_avg[IEEE80211_MAX_CHAINS]'
drivers/platform/x86/intel_pmic_gpio.c:304:17: warning: ignoring return value of 'gpiochip_remove', declared with attribute warn_unused_result [-Wunused-result]
include/linux/rcupdate.h:526:15: warning: 'sdata' may be used uninitialized in this function [-Wmaybe-uninitialized]
drivers/block/nvme-core.c:1834:1: warning: control reaches end of non-void function [-Wreturn-type]
include/uapi/linux/swab.h:106:23: warning: 'csum' may be used uninitialized in this function [-Wmaybe-uninitialized]

[sparse]
drivers/scsi/qla2xxx/qla_bsg.c:1985:25: sparse: incorrect type in assignment (different base types) @@    expected unsigned short [unsigned] [usertype] loop_id @@    got  short [unsigned] [usertype] loop_id @@
drivers/scsi/qla2xxx/qla_mr.c:3333:36: sparse: incorrect type in assignment (different base types) @@    expected restricted __le16 [addressable] [assigned] [usertype] req_xfrcnt @@    got sable] [assigned] [usertype] req_xfrcnt @@
drivers/scsi/qla2xxx/qla_mr.c:3334:36: sparse: incorrect type in assignment (different base types) @@    expected restricted __le16 [addressable] [assigned] [usertype] rsp_xfrcnt @@    got sable] [assigned] [usertype] rsp_xfrcnt @@
drivers/scsi/scsi_debug.c:1722:22: sparse: incorrect type in assignment (different base types) @@    expected unsigned short [unsigned] [usertype] csum @@    got  short [unsigned] [usertype] csum @@
drivers/block/nvme-core.c:1774:9: sparse: Expected ; at end of declaration
drivers/block/nvme-core.c:1774:9: sparse: got unsigned
drivers/block/nvme-core.c:1490:17: sparse: undefined identifier 'force_successful_syscall_return'
drivers/block/nvme-core.c:1798:9: sparse: undefined identifier 'nn'
drivers/block/nvme-core.c:1810:21: sparse: undefined identifier 'i'
drivers/gpu/drm/radeon/rv770_dpm.c:2512:6: sparse: symbol 'rv770_dpm_vblank_too_short' was not declared. Should it be static?
drivers/gpu/drm/radeon/cypress_dpm.c:2178:6: sparse: symbol 'cypress_dpm_vblank_too_short' was not declared. Should it be static?
drivers/gpu/drm/radeon/btc_dpm.c:2062:6: sparse: symbol 'btc_dpm_vblank_too_short' was not declared. Should it be static?

---
0-DAY kernel build testing backend              Open Source Technology Center
http://lists.01.org/mailman/listinfo/kbuild                 Intel Corporation
