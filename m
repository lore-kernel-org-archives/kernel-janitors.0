From: Fengguang Wu <fengguang.wu@intel.com>
Date: Wed, 03 Oct 2012 14:15:38 +0000
Subject: [drm-intel:drm-intel-fixes 15/18] drivers/gpu/drm/i915/intel_ringbuffer.c:1405:24: error:
Message-Id: <20121003141538.GB9009@localhost>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jesse Barnes <jbarnes@virtuousgeek.org>
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, kernel-janitors@vger.kernel.org, dri-devel@lists.freedesktop.org

Hi Jesse,

FYI, kernel build failed on

tree:   git://people.freedesktop.org/~danvet/drm-intel.git drm-intel-fixes
head:   2cb47a9c6d49f2961dcf57f69ff968e65d48e876
commit: 307daa1b856699f1d4acc3972374017c3e99d331 [15/18] drm/i915: TLB invalidation with MI_FLUSH_DW requires a post-sync op
config: x86_64-allyesconfig

All error/warnings:

drivers/gpu/drm/i915/intel_ringbuffer.c: In function 'gen6_ring_flush':
drivers/gpu/drm/i915/intel_ringbuffer.c:1405:24: error: 'I915_GEM_SCRATCH_INDEX' undeclared (first use in this function)
drivers/gpu/drm/i915/intel_ringbuffer.c:1405:24: note: each undeclared identifier is reported only once for each function it appears in
drivers/gpu/drm/i915/intel_ringbuffer.c: In function 'blt_ring_flush':
drivers/gpu/drm/i915/intel_ringbuffer.c:1453:24: error: 'I915_GEM_SCRATCH_INDEX' undeclared (first use in this function)

vim +1405 drivers/gpu/drm/i915/intel_ringbuffer.c

307daa1b (Jesse Barnes 2012-10-02  1399) 	 * Post-Sync Operation field is a value of 1h or 3h."
307daa1b (Jesse Barnes 2012-10-02  1400) 	 */
71a77e07 (Chris Wilson 2011-02-02  1401) 	if (invalidate & I915_GEM_GPU_DOMAINS)
307daa1b (Jesse Barnes 2012-10-02  1402) 		cmd |= MI_INVALIDATE_TLB | MI_INVALIDATE_BSD |
307daa1b (Jesse Barnes 2012-10-02  1403) 			MI_FLUSH_DW_STORE_INDEX | MI_FLUSH_DW_OP_STOREDW;
71a77e07 (Chris Wilson 2011-02-02  1404) 	intel_ring_emit(ring, cmd);
307daa1b (Jesse Barnes 2012-10-02 @1405) 	intel_ring_emit(ring, I915_GEM_SCRATCH_INDEX << 3);
b72f3acb (Chris Wilson 2011-01-04  1406) 	intel_ring_emit(ring, 0);
71a77e07 (Chris Wilson 2011-02-02  1407) 	intel_ring_emit(ring, MI_NOOP);
b72f3acb (Chris Wilson 2011-01-04  1408) 	intel_ring_advance(ring);

---
0-DAY kernel build testing backend         Open Source Technology Centre
Fengguang Wu, Yuanhan Liu                              Intel Corporation
