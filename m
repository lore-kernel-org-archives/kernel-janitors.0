From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 17 Dec 2015 12:40:20 +0000
Subject: [patch 3/3 -next] drm/vc4: fix an error code
Message-Id: <20151217124020.GC27382@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: David Airlie <airlied@linux.ie>, Eric Anholt <eric@anholt.net>
Cc: kernel-janitors@vger.kernel.org, dri-devel@lists.freedesktop.org

"exec->exec_bo" is NULL at this point so this code returns success.  We
want to return -ENOMEM.

Fixes: d5b1a78a772f ('drm/vc4: Add support for drawing 3D frames.')
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/gpu/drm/vc4/vc4_gem.c b/drivers/gpu/drm/vc4/vc4_gem.c
index 2a680d9..98a25b8 100644
--- a/drivers/gpu/drm/vc4/vc4_gem.c
+++ b/drivers/gpu/drm/vc4/vc4_gem.c
@@ -580,7 +580,7 @@ vc4_get_bcl(struct drm_device *dev, struct vc4_exec_info *exec)
 	bo = vc4_bo_create(dev, exec_size, true);
 	if (!bo) {
 		DRM_ERROR("Couldn't allocate BO for binning\n");
-		ret = PTR_ERR(exec->exec_bo);
+		ret = -ENOMEM;
 		goto fail;
 	}
 	exec->exec_bo = &bo->base;
