From: Colin King <colin.king@canonical.com>
Date: Fri, 11 Aug 2017 13:49:38 +0000
Subject: [PATCH][drm-next] drm/i915: make structure intel_sprite_plane_funcs static
Message-Id: <20170811134938.4183-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Daniel Vetter <daniel.vetter@intel.com>, Jani Nikula <jani.nikula@linux.intel.com>, David Airlie <airlied@linux.ie>, intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

The structure intel_sprite_plane_funcs is local to the source
and does not need to be in global scope, so make it static.

Cleans up sparse warning:
symbol 'intel_sprite_plane_funcs' was not declared. Should it be static?

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/gpu/drm/i915/intel_sprite.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/intel_sprite.c b/drivers/gpu/drm/i915/intel_sprite.c
index e11f8782c9eb..524933b01483 100644
--- a/drivers/gpu/drm/i915/intel_sprite.c
+++ b/drivers/gpu/drm/i915/intel_sprite.c
@@ -1184,7 +1184,7 @@ static bool intel_sprite_plane_format_mod_supported(struct drm_plane *plane,
 	unreachable();
 }
 
-const struct drm_plane_funcs intel_sprite_plane_funcs = {
+static const struct drm_plane_funcs intel_sprite_plane_funcs = {
         .update_plane = drm_atomic_helper_update_plane,
         .disable_plane = drm_atomic_helper_disable_plane,
         .destroy = intel_plane_destroy,
-- 
2.11.0

