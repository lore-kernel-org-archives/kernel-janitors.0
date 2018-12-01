From: YueHaibing <yuehaibing@huawei.com>
Date: Sat, 01 Dec 2018 03:20:44 +0000
Subject: [PATCH -next] drm/vkms: Remove set but not used variable 'vkms_obj'
Message-Id: <1543634444-186448-1-git-send-email-yuehaibing@huawei.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: David Airlie <airlied@linux.ie>, Haneen Mohammed <hamohammed.sa@gmail.com>, Sean Paul <seanpaul@chromium.org>, Daniel Vetter <daniel.vetter@ffwll.ch>, Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>, Eric Anholt <eric@anholt.net>
Cc: YueHaibing <yuehaibing@huawei.com>, dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

Fixes gcc '-Wunused-but-set-variable' warning:

drivers/gpu/drm/vkms/vkms_plane.c: In function 'vkms_prepare_fb':
drivers/gpu/drm/vkms/vkms_plane.c:144:26: warning:
 variable 'vkms_obj' set but not used [-Wunused-but-set-variable]

It never used since introduction in commit
8ce1bb0b5337 ("drm/vkms: map/unmap buffers in [prepare/cleanup]_fb hooks")

Signed-off-by: YueHaibing <yuehaibing@huawei.com>
---
 drivers/gpu/drm/vkms/vkms_plane.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/gpu/drm/vkms/vkms_plane.c b/drivers/gpu/drm/vkms/vkms_plane.c
index e3bcea4..4188176 100644
--- a/drivers/gpu/drm/vkms/vkms_plane.c
+++ b/drivers/gpu/drm/vkms/vkms_plane.c
@@ -141,14 +141,12 @@ static int vkms_prepare_fb(struct drm_plane *plane,
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
