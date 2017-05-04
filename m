From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Thu, 04 May 2017 17:01:30 +0000
Subject: [PATCH 9/9] drm/i915: Combine substrings for two messages in i915_ggtt_probe_hw()
Message-Id: <a776b4f5-31ab-2419-4b0d-bee906a93379@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <39c8a155-cf89-1aa5-9ca6-4e9ccf3aa602@users.sourceforge.net>
In-Reply-To: <39c8a155-cf89-1aa5-9ca6-4e9ccf3aa602@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org, Chris Wilson <chris@chris-wilson.co.uk>, Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>, Jani Nikula <jani.nikula@linux.intel.com>
Cc: kernel-janitors@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Thu, 4 May 2017 14:30:37 +0200

The script "checkpatch.pl" pointed information out like the following.

WARNING: quoted string split across lines

Thus fix the affected source code place.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/gpu/drm/i915/i915_gem_gtt.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/i915/i915_gem_gtt.c b/drivers/gpu/drm/i915/i915_gem_gtt.c
index 9f64dc3f2d05..508431f42b65 100644
--- a/drivers/gpu/drm/i915/i915_gem_gtt.c
+++ b/drivers/gpu/drm/i915/i915_gem_gtt.c
@@ -2905,16 +2905,14 @@ int i915_ggtt_probe_hw(struct drm_i915_private *dev_priv)
 	}
 
 	if ((ggtt->base.total - 1) >> 32) {
-		DRM_ERROR("We never expected a Global GTT with more than 32bits"
-			  " of address space! Found %lldM!\n",
+		DRM_ERROR("We never expected a Global GTT with more than 32bits of address space! Found %lldM!\n",
 			  ggtt->base.total >> 20);
 		ggtt->base.total = 1ULL << 32;
 		ggtt->mappable_end = min(ggtt->mappable_end, ggtt->base.total);
 	}
 
 	if (ggtt->mappable_end > ggtt->base.total) {
-		DRM_ERROR("mappable aperture extends past end of GGTT,"
-			  " aperture=%llx, total=%llx\n",
+		DRM_ERROR("mappable aperture extends past end of GGTT, aperture=%llx, total=%llx\n",
 			  ggtt->mappable_end, ggtt->base.total);
 		ggtt->mappable_end = ggtt->base.total;
 	}
-- 
2.12.2

