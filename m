From: Fengguang Wu <fengguang.wu@intel.com>
Date: Fri, 10 May 2013 16:08:09 +0000
Subject: build regressions 2013-05-10
Message-Id: <518d1b69.7LLLGCWrY+jIOq5Z%fengguang.wu@intel.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

[errors]
kernel/sched/core.c:2587:54: error: 'struct cfs_rq' has no member named 'blocked_load_avg'
drivers/gpu/drm/i915/intel_dp.c:723:1: error: expected expression before '<<' token
drivers/gpu/drm/i915/intel_dp.c:736:1: error: expected expression before '=' token
drivers/gpu/drm/i915/intel_dp.c:738:34: error: 'struct drm_i915_private' has no member named 'edp'
drivers/gpu/drm/i915/intel_dp.c:739:54: error: 'struct drm_i915_private' has no member named 'edp'
drivers/gpu/drm/i915/intel_dp.c:740:1: error: expected expression before '>>' token
drivers/gpu/drm/i915/intel_dp.c:792:1: error: expected expression before '<<' token
drivers/gpu/drm/i915/intel_dp.c:797:1: error: expected expression before '=' token
kernel/sched/sched.h:1039:20: error: inlining failed in call to always_inline '__update_task_entity_contrib': function body not available
kernel/sched/core.c:1606:30: error: called from here
(.text+0x706fe): undefined reference to `dns_query'
arch/powerpc/mm/slice.c:251:16: error: 'struct mm_struct' has no member named 'cached_hole_size'
arch/powerpc/mm/slice.c:253:6: error: 'struct mm_struct' has no member named 'cached_hole_size'
arch/powerpc/mm/slice.c:255:26: error: 'struct mm_struct' has no member named 'free_area_cache'
arch/powerpc/mm/slice.c:280:7: error: 'struct mm_struct' has no member named 'free_area_cache'
arch/powerpc/mm/slice.c:283:30: error: 'struct mm_struct' has no member named 'cached_hole_size'
arch/powerpc/mm/slice.c:284:13: error: 'struct mm_struct' has no member named 'cached_hole_size'
arch/powerpc/mm/slice.c:291:5: error: 'struct mm_struct' has no member named 'cached_hole_size'
arch/powerpc/mm/slice.c:309:16: error: 'struct mm_struct' has no member named 'cached_hole_size'
arch/powerpc/mm/slice.c:310:6: error: 'struct mm_struct' has no member named 'cached_hole_size'
arch/powerpc/mm/slice.c:311:6: error: 'struct mm_struct' has no member named 'free_area_cache'
arch/powerpc/mm/slice.c:317:12: error: 'struct mm_struct' has no member named 'free_area_cache'
arch/powerpc/mm/slice.c:328:16: error: 'struct mm_struct' has no member named 'free_area_cache'
arch/powerpc/mm/slice.c:358:7: error: 'struct mm_struct' has no member named 'free_area_cache'
arch/powerpc/mm/slice.c:363:30: error: 'struct mm_struct' has no member named 'cached_hole_size'
arch/powerpc/mm/slice.c:364:13: error: 'struct mm_struct' has no member named 'cached_hole_size'
arch/powerpc/mm/slice.c:382:5: error: 'struct mm_struct' has no member named 'free_area_cache'
arch/powerpc/mm/slice.c:383:5: error: 'struct mm_struct' has no member named 'cached_hole_size'
net/mac80211/mesh.c:705:2: error: 'struct ieee80211_if_mesh' has no member named 'mtx'
net/mac80211/mesh.c:707:12: error: 'struct ieee80211_if_mesh' has no member named 'mtx'
net/mac80211/mesh.c:717:21: error: 'struct ieee80211_if_mesh' has no member named 'mtx'
net/mac80211/mesh.c:791:2: error: 'struct ieee80211_if_mesh' has no member named 'mtx'
net/mac80211/mesh.c:792:8: error: 'struct ieee80211_if_mesh' has no member named 'mtx'
net/mac80211/mesh.c:796:21: error: 'struct ieee80211_if_mesh' has no member named 'mtx'
net/mac80211/mesh.c:1044:2: error: 'struct ieee80211_if_mesh' has no member named 'mtx'

[warnings]
drivers/md/persistent-data/dm-space-map-metadata.c:419: warning: 'sm_metadata_register_threshold_callback' defined but not used
drivers/block/nvme-core.c:483:19: warning: assignment from incompatible pointer type [enabled by default]
drivers/block/nvme-core.c:484:19: warning: assignment from incompatible pointer type [enabled by default]
drivers/gpu/drm/i915/intel_dp.c:760:1: warning: label 'found' defined but not used [-Wunused-label]
drivers/gpu/drm/i915/intel_dp.c:694:32: warning: unused variable 'link_clock' [-Wunused-variable]
drivers/gpu/drm/i915/intel_dp.c:800:1: warning: control reaches end of non-void function [-Wreturn-type]

[sparse]
block/blk-flush.c:255:9: sparse: context imbalance in 'flush_end_io' - different lock contexts for basic block
net/mac80211/driver-ops.h:935:30: sparse: context imbalance in 'ieee80211_mgd_deauth' - unexpected unlock
net/mac80211/mlme.c:4315:29: sparse: context imbalance in 'ieee80211_mgd_disassoc' - unexpected unlock
net/mac80211/mesh.c:705:9: sparse: no member 'mtx' in struct ieee80211_if_mesh

[coccinelle]
drivers/media/media-entity.c:477:1-11: second lock on line 479
drivers/media/media-entity.c:477:1-11: second lock on line 479

---
0-DAY kernel build testing backend              Open Source Technology Center
http://lists.01.org/mailman/listinfo/kbuild                 Intel Corporation
