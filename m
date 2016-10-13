From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 13 Oct 2016 08:54:31 +0000
Subject: [patch] drm/vc4: Fix a couple error codes in vc4_cl_lookup_bos()
Message-Id: <20161013085431.GI16198@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Eric Anholt <eric@anholt.net>
Cc: kernel-janitors@vger.kernel.org, dri-devel@lists.freedesktop.org

If the allocation fails the current code returns success.  If
copy_from_user() fails it returns the number of bytes remaining instead
of -EFAULT.

Fixes: d5b1a78a772f ("drm/vc4: Add support for drawing 3D frames.")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/gpu/drm/vc4/vc4_gem.c b/drivers/gpu/drm/vc4/vc4_gem.c
index 47a095f..303f23c 100644
--- a/drivers/gpu/drm/vc4/vc4_gem.c
+++ b/drivers/gpu/drm/vc4/vc4_gem.c
@@ -544,14 +544,15 @@ vc4_cl_lookup_bos(struct drm_device *dev,
 
 	handles = drm_malloc_ab(exec->bo_count, sizeof(uint32_t));
 	if (!handles) {
+		ret = -ENOMEM;
 		DRM_ERROR("Failed to allocate incoming GEM handles\n");
 		goto fail;
 	}
 
-	ret = copy_from_user(handles,
-			     (void __user *)(uintptr_t)args->bo_handles,
-			     exec->bo_count * sizeof(uint32_t));
-	if (ret) {
+	if (copy_from_user(handles,
+			   (void __user *)(uintptr_t)args->bo_handles,
+			   exec->bo_count * sizeof(uint32_t))) {
+		ret = -EFAULT;
 		DRM_ERROR("Failed to copy in GEM handles\n");
 		goto fail;
 	}
