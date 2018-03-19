From: Colin King <colin.king@canonical.com>
Date: Mon, 19 Mar 2018 13:41:16 +0000
Subject: [PATCH] drm/i915/gvt: fix spelling mistake: "registeration" -> "registration"
Message-Id: <20180319134116.4478-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Zhenyu Wang <zhenyuw@linux.intel.com>, Zhi Wang <zhi.a.wang@intel.com>, Jani Nikula <jani.nikula@linux.intel.com>, Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>, David Airlie <airlied@linux.ie>, intel-gvt-dev@lists.freedesktop.org, intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Trivial fix to spelling mistake in gvt_err error message text

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/gpu/drm/i915/gvt/gvt.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/gvt/gvt.c b/drivers/gpu/drm/i915/gvt/gvt.c
index 61bd14fcb649..8c3422578cc4 100644
--- a/drivers/gpu/drm/i915/gvt/gvt.c
+++ b/drivers/gpu/drm/i915/gvt/gvt.c
@@ -444,7 +444,7 @@ int intel_gvt_init_device(struct drm_i915_private *dev_priv)
 
 	ret = intel_gvt_debugfs_init(gvt);
 	if (ret)
-		gvt_err("debugfs registeration failed, go on.\n");
+		gvt_err("debugfs registration failed, go on.\n");
 
 	gvt_dbg_core("gvt device initialization is done\n");
 	dev_priv->gvt = gvt;
-- 
2.15.1

