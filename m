From: Colin King <colin.king@canonical.com>
Date: Thu, 19 Dec 2019 19:09:16 +0000
Subject: [PATCH][next] drm/i915: fix uninitialized pointer reads on pointers to and from
Message-Id: <20191219190916.24693-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jani Nikula <jani.nikula@linux.intel.com>, Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>, David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, Chris Wilson <chris@chris-wilson.co.uk>, intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Currently pointers to and from are not initialized and may contain
garbage values. This will cause uninitialized pointer reads in the
call to intel_frontbuffer_track and later checks to see if to and from
are null.  Fix this by ensuring to and from are initialized to NULL.

Addresses-Coverity: ("Uninitialised pointer read)"
Fixes: da42104f589d ("drm/i915: Hold reference to intel_frontbuffer as we track activity")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/gpu/drm/i915/display/intel_overlay.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/display/intel_overlay.c b/drivers/gpu/drm/i915/display/intel_overlay.c
index 6097594468a9..e869a3d86522 100644
--- a/drivers/gpu/drm/i915/display/intel_overlay.c
+++ b/drivers/gpu/drm/i915/display/intel_overlay.c
@@ -279,7 +279,7 @@ static void intel_overlay_flip_prepare(struct intel_overlay *overlay,
 				       struct i915_vma *vma)
 {
 	enum pipe pipe = overlay->crtc->pipe;
-	struct intel_frontbuffer *from, *to;
+	struct intel_frontbuffer *from = NULL, *to = NULL;
 
 	WARN_ON(overlay->old_vma);
 
-- 
2.24.0
