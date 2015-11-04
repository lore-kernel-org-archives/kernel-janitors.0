From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 04 Nov 2015 13:21:40 +0000
Subject: [patch] drm/vc4: checking for NULL instead of IS_ERR
Message-Id: <20151104132140.GA20966@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: David Airlie <airlied@linux.ie>, Eric Anholt <eric@anholt.net>
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, dri-devel@lists.freedesktop.org, kernel-janitors@vger.kernel.org

vc4_plane_init() returns an ERR_PTR on error, it doesn't return NULL.
This was obviously intended because the next lines call
PTR_ERR(primary_plane) already.

Fixes: c8b75bca92cb ('Eric Anholt <eric@anholt.net>')
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/gpu/drm/vc4/vc4_crtc.c b/drivers/gpu/drm/vc4/vc4_crtc.c
index 7a9f476..0c363df 100644
--- a/drivers/gpu/drm/vc4/vc4_crtc.c
+++ b/drivers/gpu/drm/vc4/vc4_crtc.c
@@ -591,14 +591,14 @@ static int vc4_crtc_bind(struct device *dev, struct device *master, void *data)
 	 * that will take too much.
 	 */
 	primary_plane = vc4_plane_init(drm, DRM_PLANE_TYPE_PRIMARY);
-	if (!primary_plane) {
+	if (IS_ERR(primary_plane)) {
 		dev_err(dev, "failed to construct primary plane\n");
 		ret = PTR_ERR(primary_plane);
 		goto err;
 	}
 
 	cursor_plane = vc4_plane_init(drm, DRM_PLANE_TYPE_CURSOR);
-	if (!cursor_plane) {
+	if (IS_ERR(cursor_plane)) {
 		dev_err(dev, "failed to construct cursor plane\n");
 		ret = PTR_ERR(cursor_plane);
 		goto err_primary;
