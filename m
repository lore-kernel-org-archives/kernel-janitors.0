From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Fri, 23 Sep 2016 16:38:03 +0000
Subject: [PATCH 2/3] drm/vmwgfx: Use memdup_user() rather than duplicating its implementation
Message-Id: <4949fd96-a27f-1694-823e-a401abbe032e@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <8de6f7c3-5614-b210-7b2f-66c1aed4279b@users.sourceforge.net>
In-Reply-To: <8de6f7c3-5614-b210-7b2f-66c1aed4279b@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: dri-devel@lists.freedesktop.org, linux-graphics-maintainer@vmware.com, David Airlie <airlied@linux.ie>, Sinclair Yeh <syeh@vmware.com>, Thomas Hellstrom <thellstrom@vmware.com>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org, Julia Lawall <julia.lawall@lip6.fr>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Fri, 23 Sep 2016 17:26:02 +0200

* Reuse existing functionality from memdup_user() instead of keeping
  duplicate source code.

* Try this copy operation before allocating memory for the data structure
  member "offsets".

* Delete the local variable "user_sizes" which became unnecessary
  with this refactoring.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/gpu/drm/vmwgfx/vmwgfx_surface.c | 21 +++++----------------
 1 file changed, 5 insertions(+), 16 deletions(-)

diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_surface.c b/drivers/gpu/drm/vmwgfx/vmwgfx_surface.c
index f557549..15504c6 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_surface.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_surface.c
@@ -700,7 +700,6 @@ int vmw_surface_define_ioctl(struct drm_device *dev, void *data,
 	struct drm_vmw_surface_create_req *req = &arg->req;
 	struct drm_vmw_surface_arg *rep = &arg->rep;
 	struct ttm_object_file *tfile = vmw_fpriv(file_priv)->tfile;
-	struct drm_vmw_size __user *user_sizes;
 	int ret;
 	int i, j;
 	uint32_t cur_bo_offset;
@@ -763,11 +762,11 @@ int vmw_surface_define_ioctl(struct drm_device *dev, void *data,
 	memcpy(srf->mip_levels, req->mip_levels, sizeof(srf->mip_levels));
 	srf->num_sizes = num_sizes;
 	user_srf->size = size;
-	srf->sizes = kmalloc_array(srf->num_sizes,
-				   sizeof(*srf->sizes),
-				   GFP_KERNEL);
-	if (unlikely(srf->sizes = NULL)) {
-		ret = -ENOMEM;
+	srf->sizes = memdup_user((struct drm_vmw_size __user *)(unsigned long)
+				 req->size_addr,
+				 sizeof(*srf->sizes) * srf->num_sizes);
+	if (IS_ERR(srf->sizes)) {
+		ret = PTR_ERR(srf->sizes);
 		goto out_no_sizes;
 	}
 	srf->offsets = kmalloc_array(srf->num_sizes,
@@ -778,16 +777,6 @@ int vmw_surface_define_ioctl(struct drm_device *dev, void *data,
 		goto out_no_offsets;
 	}
 
-	user_sizes = (struct drm_vmw_size __user *)(unsigned long)
-	    req->size_addr;
-
-	ret = copy_from_user(srf->sizes, user_sizes,
-			     srf->num_sizes * sizeof(*srf->sizes));
-	if (unlikely(ret != 0)) {
-		ret = -EFAULT;
-		goto out_no_copy;
-	}
-
 	srf->base_size = *srf->sizes;
 	srf->autogen_filter = SVGA3D_TEX_FILTER_NONE;
 	srf->multisample_count = 0;
-- 
2.10.0

