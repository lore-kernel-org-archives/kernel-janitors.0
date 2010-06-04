From: Dan Carpenter <error27@gmail.com>
Date: Fri, 04 Jun 2010 10:24:13 +0000
Subject: [patch] drm/vmwgfx: return -EFAULT for copy_to_user errors
Message-Id: <20100604102413.GA5483@bicker>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: David Airlie <airlied@linux.ie>
Cc: Thomas Hellstrom <thellstrom@vmware.com>, kernel-janitors@vger.kernel.org, dri-devel@lists.freedesktop.org

copy_to/from_user() returns the number of bytes remaining to be copied
but we want to return a negative error code here.  This gets returned to
userspace.

Signed-off-by: Dan Carpenter <error27@gmail.com>

diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_resource.c b/drivers/gpu/drm/vmwgfx/vmwgfx_resource.c
index f8fbbc6..8612378 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_resource.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_resource.c
@@ -597,8 +597,10 @@ int vmw_surface_define_ioctl(struct drm_device *dev, void *data,
 
 	ret = copy_from_user(srf->sizes, user_sizes,
 			     srf->num_sizes * sizeof(*srf->sizes));
-	if (unlikely(ret != 0))
+	if (unlikely(ret != 0)) {
+		ret = -EFAULT;
 		goto out_err1;
+	}
 
 	if (srf->scanout &&
 	    srf->num_sizes = 1 &&
@@ -697,9 +699,11 @@ int vmw_surface_reference_ioctl(struct drm_device *dev, void *data,
 	if (user_sizes)
 		ret = copy_to_user(user_sizes, srf->sizes,
 				   srf->num_sizes * sizeof(*srf->sizes));
-	if (unlikely(ret != 0))
+	if (unlikely(ret != 0)) {
 		DRM_ERROR("copy_to_user failed %p %u\n",
 			  user_sizes, srf->num_sizes);
+		ret = -EFAULT;
+	}
 out_bad_resource:
 out_no_reference:
 	ttm_base_object_unref(&base);
diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_execbuf.c b/drivers/gpu/drm/vmwgfx/vmwgfx_execbuf.c
index dbd36b8..ba15038 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_execbuf.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_execbuf.c
@@ -644,6 +644,7 @@ int vmw_execbuf_ioctl(struct drm_device *dev, void *data,
 	ret = copy_from_user(cmd, user_cmd, arg->command_size);
 
 	if (unlikely(ret != 0)) {
+		ret = -EFAULT;
 		DRM_ERROR("Failed copying commands.\n");
 		goto out_commit;
 	}
