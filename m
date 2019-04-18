From: Colin King <colin.king@canonical.com>
Date: Thu, 18 Apr 2019 11:06:22 +0000
Subject: [PATCH] drm/i915: fix spelling mistake "resseting" -> "resetting"
Message-Id: <20190418110622.11452-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Zhenyu Wang <zhenyuw@linux.intel.com>, Zhi Wang <zhi.a.wang@intel.com>, Jani Nikula <jani.nikula@linux.intel.com>, Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>, David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, intel-gvt-dev@lists.freedesktop.org, intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

There is a spelling mistake in a gvt_dbg_core debug message. Fix it.

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/gpu/drm/i915/gvt/vgpu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/gvt/vgpu.c b/drivers/gpu/drm/i915/gvt/vgpu.c
index 44ce3c2b9ac1..d1e818f2b521 100644
--- a/drivers/gpu/drm/i915/gvt/vgpu.c
+++ b/drivers/gpu/drm/i915/gvt/vgpu.c
@@ -533,7 +533,7 @@ void intel_gvt_reset_vgpu_locked(struct intel_vgpu *vgpu, bool dmlr,
 	intel_engine_mask_t resetting_eng = dmlr ? ALL_ENGINES : engine_mask;
 
 	gvt_dbg_core("------------------------------------------\n");
-	gvt_dbg_core("resseting vgpu%d, dmlr %d, engine_mask %08x\n",
+	gvt_dbg_core("resetting vgpu%d, dmlr %d, engine_mask %08x\n",
 		     vgpu->id, dmlr, engine_mask);
 
 	vgpu->resetting_eng = resetting_eng;
-- 
2.20.1
