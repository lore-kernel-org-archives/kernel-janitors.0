From: YueHaibing <yuehaibing@huawei.com>
Date: Mon, 18 Feb 2019 08:54:59 +0000
Subject: [PATCH -next] drm/qxl: remove set but not used variable 'bo_old'
Message-Id: <20190218085459.196470-1-yuehaibing@huawei.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1541821486-40631-1-git-send-email-yuehaibing@huawei.com>
In-Reply-To: <1541821486-40631-1-git-send-email-yuehaibing@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dave Airlie <airlied@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>, David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>
Cc: YueHaibing <yuehaibing@huawei.com>, virtualization@lists.linux-foundation.org, spice-devel@lists.freedesktop.org, dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

Fixes gcc '-Wunused-but-set-variable' warning:

drivers/gpu/drm/qxl/qxl_display.c: In function 'qxl_primary_atomic_update':
drivers/gpu/drm/qxl/qxl_display.c:538:17: warning:
 variable 'bo_old' set but not used [-Wunused-but-set-variable]

It's not used any more after 4979904c62b9 ("drm/qxl: use shadow bo directly")

Signed-off-by: YueHaibing <yuehaibing@huawei.com>
---
 drivers/gpu/drm/qxl/qxl_display.c | 8 +-------
 1 file changed, 1 insertion(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/qxl/qxl_display.c b/drivers/gpu/drm/qxl/qxl_display.c
index 08c725544a2f..8b319ebbb0fb 100644
--- a/drivers/gpu/drm/qxl/qxl_display.c
+++ b/drivers/gpu/drm/qxl/qxl_display.c
@@ -535,7 +535,7 @@ static void qxl_primary_atomic_update(struct drm_plane *plane,
 {
 	struct qxl_device *qdev = plane->dev->dev_private;
 	struct qxl_bo *bo = gem_to_qxl_bo(plane->state->fb->obj[0]);
-	struct qxl_bo *bo_old, *primary;
+	struct qxl_bo *primary;
 	struct drm_clip_rect norect = {
 	    .x1 = 0,
 	    .y1 = 0,
@@ -544,12 +544,6 @@ static void qxl_primary_atomic_update(struct drm_plane *plane,
 	};
 	uint32_t dumb_shadow_offset = 0;
 
-	if (old_state->fb) {
-		bo_old = gem_to_qxl_bo(old_state->fb->obj[0]);
-	} else {
-		bo_old = NULL;
-	}
-
 	primary = bo->shadow ? bo->shadow : bo;
 
 	if (!primary->is_primary) {
