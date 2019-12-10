From: Colin King <colin.king@canonical.com>
Date: Tue, 10 Dec 2019 14:23:49 +0000
Subject: [PATCH][next] drm/i915: remove redundant checks for a null fb pointer
Message-Id: <20191210142349.333171-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jani Nikula <jani.nikula@linux.intel.com>, Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>, David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

A prior check and return when pointer fb is null makes
subsequent null checks on fb redundant.  Remove the redundant
null checks.

Addresses-Coverity: ("Logically dead code")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/gpu/drm/i915/i915_debugfs.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/i915_debugfs.c b/drivers/gpu/drm/i915/i915_debugfs.c
index 062e5bef637a..a48478be6e8f 100644
--- a/drivers/gpu/drm/i915/i915_debugfs.c
+++ b/drivers/gpu/drm/i915/i915_debugfs.c
@@ -2600,8 +2600,8 @@ static void intel_plane_hw_info(struct seq_file *m, struct intel_plane *plane)
 		       plane_state->hw.rotation);
 
 	seq_printf(m, "\t\thw: fb=%d,%s,%dx%d, visible=%s, src=" DRM_RECT_FP_FMT ", dst=" DRM_RECT_FMT ", rotation=%s\n",
-		   fb ? fb->base.id : 0, fb ? format_name.str : "n/a",
-		   fb ? fb->width : 0, fb ? fb->height : 0,
+		   fb->base.id, format_name.str,
+		   fb->width, fb->height,
 		   yesno(plane_state->uapi.visible),
 		   DRM_RECT_FP_ARG(&plane_state->uapi.src),
 		   DRM_RECT_ARG(&plane_state->uapi.dst),
-- 
2.24.0
