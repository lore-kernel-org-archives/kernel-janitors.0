From: Colin King <colin.king@canonical.com>
Date: Mon, 12 Mar 2018 11:43:58 +0000
Subject: [PATCH][drm-next] drm/i915/gvt: fix spelling mistake: "destoried" -> "destroyed"
Message-Id: <20180312114358.24456-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Zhenyu Wang <zhenyuw@linux.intel.com>, Zhi Wang <zhi.a.wang@intel.com>, Jani Nikula <jani.nikula@linux.intel.com>, Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, David Airlie <airlied@linux.ie>, intel-gvt-dev@lists.freedesktop.org, intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Trivial fix to spelling mistake in gvt_err error message text.

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/gpu/drm/i915/gvt/gtt.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/gvt/gtt.c b/drivers/gpu/drm/i915/gvt/gtt.c
index 0a100a288e6d..8eb76becd676 100644
--- a/drivers/gpu/drm/i915/gvt/gtt.c
+++ b/drivers/gpu/drm/i915/gvt/gtt.c
@@ -2046,7 +2046,7 @@ static void intel_vgpu_destroy_all_ppgtt_mm(struct intel_vgpu *vgpu)
 	}
 
 	if (GEM_WARN_ON(!list_empty(&vgpu->gtt.ppgtt_mm_list_head)))
-		gvt_err("vgpu ppgtt mm is not fully destoried\n");
+		gvt_err("vgpu ppgtt mm is not fully destroyed\n");
 
 	if (GEM_WARN_ON(!radix_tree_empty(&vgpu->gtt.spt_tree))) {
 		gvt_err("Why we still has spt not freed?\n");
-- 
2.15.1

