From: Colin King <colin.king@canonical.com>
Date: Thu, 16 Mar 2017 18:54:18 +0000
Subject: [PATCH] drm: vc4: remove redundant check of plane being non-null
Message-Id: <20170316185418.32765-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Eric Anholt <eric@anholt.net>, David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

The pointer plane is always null on the error path at label 'fail'
hence the check if it is non-null is redundant. We can therefore
remove the check and the destruction of plane as well as the fail
error path and instead just return an -ENOMEM ERR_PTR.

Detected by CoverityScan, CID#1339532 ("Logically Dead Code")

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/gpu/drm/vc4/vc4_plane.c | 11 ++---------
 1 file changed, 2 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_plane.c b/drivers/gpu/drm/vc4/vc4_plane.c
index 110224c..0f4564b 100644
--- a/drivers/gpu/drm/vc4/vc4_plane.c
+++ b/drivers/gpu/drm/vc4/vc4_plane.c
@@ -842,10 +842,8 @@ struct drm_plane *vc4_plane_init(struct drm_device *dev,
 
 	vc4_plane = devm_kzalloc(dev->dev, sizeof(*vc4_plane),
 				 GFP_KERNEL);
-	if (!vc4_plane) {
-		ret = -ENOMEM;
-		goto fail;
-	}
+	if (!vc4_plane)
+		return ERR_PTR(-ENOMEM);
 
 	for (i = 0; i < ARRAY_SIZE(hvs_formats); i++) {
 		/* Don't allow YUV in cursor planes, since that means
@@ -866,9 +864,4 @@ struct drm_plane *vc4_plane_init(struct drm_device *dev,
 	drm_plane_helper_add(plane, &vc4_plane_helper_funcs);
 
 	return plane;
-fail:
-	if (plane)
-		vc4_plane_destroy(plane);
-
-	return ERR_PTR(ret);
 }
-- 
2.10.2

