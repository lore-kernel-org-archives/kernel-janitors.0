From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 03 May 2019 12:25:25 +0000
Subject: [PATCH] drm/komeda: Potential error pointer dereference
Message-Id: <20190503122525.GA29695@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "James (Qian) Wang" <james.qian.wang@arm.com>
Cc: David Airlie <airlied@linux.ie>, Liviu Dudau <liviu.dudau@arm.com>, kernel-janitors@vger.kernel.org, dri-devel@lists.freedesktop.org

We need to check whether drm_atomic_get_crtc_state() returns an error
pointer before dereferencing "crtc_st".

Fixes: 7d31b9e7a550 ("drm/komeda: Add komeda_plane/plane_helper_funcs")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 drivers/gpu/drm/arm/display/komeda/komeda_plane.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/arm/display/komeda/komeda_plane.c b/drivers/gpu/drm/arm/display/komeda/komeda_plane.c
index 07ed0cc1bc44..c7e5fc6e5500 100644
--- a/drivers/gpu/drm/arm/display/komeda/komeda_plane.c
+++ b/drivers/gpu/drm/arm/display/komeda/komeda_plane.c
@@ -64,7 +64,7 @@ komeda_plane_atomic_check(struct drm_plane *plane,
 		return 0;
 
 	crtc_st = drm_atomic_get_crtc_state(state->state, state->crtc);
-	if (!crtc_st->enable) {
+	if (IS_ERR(crtc_st) || !crtc_st->enable) {
 		DRM_DEBUG_ATOMIC("Cannot update plane on a disabled CRTC.\n");
 		return -EINVAL;
 	}
-- 
2.18.0
