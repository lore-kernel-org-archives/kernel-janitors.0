From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 18 Oct 2011 06:09:45 +0000
Subject: [patch] vmwgfx: memory leaks caused by double allocation
Message-Id: <20111018060945.GD27732@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: David Airlie <airlied@linux.ie>
Cc: Thomas Hellstrom <thellstrom@vmware.com>, kernel-janitors@vger.kernel.org, dri-devel@lists.freedesktop.org, Rakib Mullick <rakib.mullick@gmail.com>, Dave Airlie <airlied@redhat.com>, Andrew Morton <akpm@linux-foundation.org>

These variables get allocated twice so the first allocation is a
memory leak.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_resource.c b/drivers/gpu/drm/vmwgfx/vmwgfx_resource.c
index c7cff3d..86c5e4c 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_resource.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_resource.c
@@ -1255,8 +1255,7 @@ int vmw_surface_define_ioctl(struct drm_device *dev, void *data,
 			     struct drm_file *file_priv)
 {
 	struct vmw_private *dev_priv = vmw_priv(dev);
-	struct vmw_user_surface *user_srf -	    kmalloc(sizeof(*user_srf), GFP_KERNEL);
+	struct vmw_user_surface *user_srf;
 	struct vmw_surface *srf;
 	struct vmw_resource *res;
 	struct vmw_resource *tmp;
diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_fence.c b/drivers/gpu/drm/vmwgfx/vmwgfx_fence.c
index 35d5f61..15fb260 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_fence.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_fence.c
@@ -953,8 +953,7 @@ int vmw_event_fence_action_create(struct drm_file *file_priv,
 				  uint32_t *tv_usec,
 				  bool interruptible)
 {
-	struct vmw_event_fence_action *eaction -		kzalloc(sizeof(*eaction), GFP_KERNEL);
+	struct vmw_event_fence_action *eaction;
 	struct ttm_mem_global *mem_glob  		vmw_mem_glob(fence->fman->dev_priv);
 	struct vmw_fence_manager *fman = fence->fman;
