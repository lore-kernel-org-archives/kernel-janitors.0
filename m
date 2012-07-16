From: Fengguang Wu <fengguang.wu@intel.com>
Date: Mon, 16 Jul 2012 19:12:55 +0000
Subject: [drm-intel:drm-intel-next-queued 58/59] drivers/gpu/drm/i915/i915_gem_context.c:454:6: warning: unus
Message-Id: <20120716191255.GA16255@localhost>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Chris Wilson <chris@chris-wilson.co.uk>
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, kernel-janitors@vger.kernel.org, dri-devel@lists.freedesktop.org

Hi Chris,

There are new compile warnings show up in

tree:   git://people.freedesktop.org/~danvet/drm-intel.git drm-intel-next-queued
head:   3cbf0ed71c262c2f07b3386e3c07c8d41440e050
commit: 289513fe7d347ce23f4f45906324601bf7df01af [58/59] drm/i915: fix invalid reference handling of the default ctx obj

All warnings:

drivers/gpu/drm/i915/i915_gem_context.c: In function 'i915_switch_context':
drivers/gpu/drm/i915/i915_gem_context.c:454:6: warning: unused variable 'ret' [-Wunused-variable]

vim +454 drivers/gpu/drm/i915/i915_gem_context.c
   451		struct drm_i915_file_private *file_priv = NULL;
   452		struct i915_hw_context *to;
   453		struct drm_i915_gem_object *from_obj = ring->last_context_obj;
 > 454		int ret;
   455	
   456		if (dev_priv->hw_contexts_disabled)
   457			return 0;

---
0-DAY kernel build testing backend         Open Source Technology Centre
Fengguang Wu <wfg@linux.intel.com>                     Intel Corporation
