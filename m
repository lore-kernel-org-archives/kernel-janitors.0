From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 08 Mar 2016 12:09:41 +0000
Subject: [patch] drm/vc4: Return -EFAULT on copy_from_user() failure
Message-Id: <20160308120941.GD28684@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: David Airlie <airlied@linux.ie>, Eric Anholt <eric@anholt.net>
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, "Luis R. Rodriguez" <mcgrof@suse.com>, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, Andrew Morton <akpm@linux-foundation.org>

The copy_from_user() function returns the number of bytes not copied but
we want to return a negative error code.

Fixes: 463873d57014 ('drm/vc4: Add an API for creating GPU shaders in GEM BOs.')
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/gpu/drm/vc4/vc4_bo.c b/drivers/gpu/drm/vc4/vc4_bo.c
index 034ef2d..9807bc9 100644
--- a/drivers/gpu/drm/vc4/vc4_bo.c
+++ b/drivers/gpu/drm/vc4/vc4_bo.c
@@ -498,11 +498,12 @@ vc4_create_shader_bo_ioctl(struct drm_device *dev, void *data,
 	if (IS_ERR(bo))
 		return PTR_ERR(bo);
 
-	ret = copy_from_user(bo->base.vaddr,
+	if (copy_from_user(bo->base.vaddr,
 			     (void __user *)(uintptr_t)args->data,
-			     args->size);
-	if (ret != 0)
+			     args->size)) {
+		ret = -EFAULT;
 		goto fail;
+	}
 	/* Clear the rest of the memory from allocating from the BO
 	 * cache.
 	 */
