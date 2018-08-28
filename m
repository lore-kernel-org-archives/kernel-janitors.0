From: Colin King <colin.king@canonical.com>
Date: Tue, 28 Aug 2018 10:35:42 +0000
Subject: [PATCH][drm-next] drm/vkms: remove unused pointer vkms_obj
Message-Id: <20180828103542.4924-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: David Airlie <airlied@linux.ie>, Sean Paul <seanpaul@chromium.org>, Haneen Mohammed <hamohammed.sa@gmail.com>, dri-devel@lists.freedesktop.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Pointer vkms_obj is being assigned but is never used hence it is
redundant and can be removed.

Cleans up clang warning:
variable ‘vkms_obj’ set but not used [-Wunused-but-set-variable]

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/gpu/drm/vkms/vkms_plane.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/gpu/drm/vkms/vkms_plane.c b/drivers/gpu/drm/vkms/vkms_plane.c
index c91661631c76..322d8170e769 100644
--- a/drivers/gpu/drm/vkms/vkms_plane.c
+++ b/drivers/gpu/drm/vkms/vkms_plane.c
@@ -128,14 +128,12 @@ static int vkms_prepare_fb(struct drm_plane *plane,
 			   struct drm_plane_state *state)
 {
 	struct drm_gem_object *gem_obj;
-	struct vkms_gem_object *vkms_obj;
 	int ret;
 
 	if (!state->fb)
 		return 0;
 
 	gem_obj = drm_gem_fb_get_obj(state->fb, 0);
-	vkms_obj = drm_gem_to_vkms_gem(gem_obj);
 	ret = vkms_gem_vmap(gem_obj);
 	if (ret)
 		DRM_ERROR("vmap failed: %d\n", ret);
-- 
2.17.1
