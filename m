From: Colin King <colin.king@canonical.com>
Date: Sat, 22 Dec 2018 13:00:46 +0000
Subject: [PATCH][next] drm: fix null pointer dereference on null state pointer
Message-Id: <20181222130046.14083-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Rob Clark <robdclark@gmail.com>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <maxime.ripard@bootlin.com>, Sean Paul <sean@poorly.run>, David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, dri-devel@lists.freedesktop.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

In the case where state cannot be allocated, the current exit path via
label 'out' will dereference the null state pointer when calling
drm_atomic_state_put. Fix this by adding a new error exit label and
jumping to this to avoid the drm_atomic_state_put.

Detected by CoverityScan, CID#1476034 ("Dereference after null check")

Fixes: b9fc5e01d1ce ("drm: Add helper to implement legacy dirtyfb")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/gpu/drm/drm_damage_helper.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/drm_damage_helper.c b/drivers/gpu/drm/drm_damage_helper.c
index d2a1c7372f36..31032407254d 100644
--- a/drivers/gpu/drm/drm_damage_helper.c
+++ b/drivers/gpu/drm/drm_damage_helper.c
@@ -178,7 +178,7 @@ int drm_atomic_helper_dirtyfb(struct drm_framebuffer *fb,
 	state = drm_atomic_state_alloc(fb->dev);
 	if (!state) {
 		ret = -ENOMEM;
-		goto out;
+		goto out_drop_locks;
 	}
 	state->acquire_ctx = &ctx;
 
@@ -238,6 +238,7 @@ int drm_atomic_helper_dirtyfb(struct drm_framebuffer *fb,
 	kfree(rects);
 	drm_atomic_state_put(state);
 
+out_drop_locks:
 	drm_modeset_drop_locks(&ctx);
 	drm_modeset_acquire_fini(&ctx);
 
-- 
2.19.1
