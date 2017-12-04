From: Colin King <colin.king@canonical.com>
Date: Mon, 04 Dec 2017 16:48:18 +0000
Subject: [PATCH][next] drm/i915/gvt: Add missing breaks in switch statement
Message-Id: <20171204164818.13041-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Zhenyu Wang <zhenyuw@linux.intel.com>, Zhi Wang <zhi.a.wang@intel.com>, Jani Nikula <jani.nikula@linux.intel.com>, Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>, David Airlie <airlied@linux.ie>, intel-gvt-dev@lists.freedesktop.org, intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

The switch statement is missing breaks for the cases of
GVT_FAILSAFE_INSUFFICIENT_RESOURCE and GVT_FAILSAFE_GUEST_ERR. Add them
in.

Detected by CoverityScan, CID#1462416 ("Missing break in switch")

Fixes: e011c6ce2b4f ("drm/i915/gvt: Add VM healthy check for workload_thread")
Fixes: a33fc7a0482a ("drm/i915/gvt: enter failsafe mode when guest requires more resources")

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/gpu/drm/i915/gvt/handlers.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/i915/gvt/handlers.c b/drivers/gpu/drm/i915/gvt/handlers.c
index 94fc04210bac..7354ed816f92 100644
--- a/drivers/gpu/drm/i915/gvt/handlers.c
+++ b/drivers/gpu/drm/i915/gvt/handlers.c
@@ -174,8 +174,10 @@ void enter_failsafe_mode(struct intel_vgpu *vgpu, int reason)
 		break;
 	case GVT_FAILSAFE_INSUFFICIENT_RESOURCE:
 		pr_err("Graphics resource is not enough for the guest\n");
+		break;
 	case GVT_FAILSAFE_GUEST_ERR:
 		pr_err("GVT Internal error  for the guest\n");
+		break;
 	default:
 		break;
 	}
-- 
2.14.1

