From: Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>
Date: Fri, 23 Feb 2018 00:00:45 +0000
Subject: [PATCH 5/7] drm/virtio: Replace 'unsigned' for 'unsigned int'
Message-Id: <ac9c4110785e6519801d44c57d4f05c3e0cdad53.1519343668.git.rodrigosiqueiramelo@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <cover.1519343668.git.rodrigosiqueiramelo@gmail.com>
In-Reply-To: <cover.1519343668.git.rodrigosiqueiramelo@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: David Airlie <airlied@linux.ie>, Gerd Hoffmann <kraxel@redhat.com>
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, virtualization@lists.linux-foundation.org

This patch fixes the checkpatch.pl warning:

drivers/gpu/drm/virtio/virtgpu_display.c:64: WARNING: Prefer 'unsigned
int' to bare use of 'unsigned'
...

Signed-off-by: Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>
---
 drivers/gpu/drm/virtio/virtgpu_display.c | 4 ++--
 drivers/gpu/drm/virtio/virtgpu_drv.h     | 2 +-
 drivers/gpu/drm/virtio/virtgpu_fb.c      | 2 +-
 drivers/gpu/drm/virtio/virtgpu_ttm.c     | 2 +-
 4 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/virtio/virtgpu_display.c b/drivers/gpu/drm/virtio/virtgpu_display.c
index 2d1b25630c0e..8cc8c34d67f5 100644
--- a/drivers/gpu/drm/virtio/virtgpu_display.c
+++ b/drivers/gpu/drm/virtio/virtgpu_display.c
@@ -61,9 +61,9 @@ static void virtio_gpu_user_framebuffer_destroy(struct drm_framebuffer *fb)
 static int
 virtio_gpu_framebuffer_surface_dirty(struct drm_framebuffer *fb,
 				     struct drm_file *file_priv,
-				     unsigned flags, unsigned color,
+				     unsigned int flags, unsigned int color,
 				     struct drm_clip_rect *clips,
-				     unsigned num_clips)
+				     unsigned int num_clips)
 {
 	struct virtio_gpu_framebuffer *virtio_gpu_fb
 		= to_virtio_gpu_framebuffer(fb);
diff --git a/drivers/gpu/drm/virtio/virtgpu_drv.h b/drivers/gpu/drm/virtio/virtgpu_drv.h
index 59801728cfeb..d25c8ca224aa 100644
--- a/drivers/gpu/drm/virtio/virtgpu_drv.h
+++ b/drivers/gpu/drm/virtio/virtgpu_drv.h
@@ -246,7 +246,7 @@ int virtio_gpu_fbdev_init(struct virtio_gpu_device *vgdev);
 void virtio_gpu_fbdev_fini(struct virtio_gpu_device *vgdev);
 int virtio_gpu_surface_dirty(struct virtio_gpu_framebuffer *qfb,
 			     struct drm_clip_rect *clips,
-			     unsigned num_clips);
+			     unsigned int num_clips);
 /* virtio vg */
 int virtio_gpu_alloc_vbufs(struct virtio_gpu_device *vgdev);
 void virtio_gpu_free_vbufs(struct virtio_gpu_device *vgdev);
diff --git a/drivers/gpu/drm/virtio/virtgpu_fb.c b/drivers/gpu/drm/virtio/virtgpu_fb.c
index b933cbba0685..8af69ab58b89 100644
--- a/drivers/gpu/drm/virtio/virtgpu_fb.c
+++ b/drivers/gpu/drm/virtio/virtgpu_fb.c
@@ -118,7 +118,7 @@ static int virtio_gpu_dirty_update(struct virtio_gpu_framebuffer *fb,
 
 int virtio_gpu_surface_dirty(struct virtio_gpu_framebuffer *vgfb,
 			     struct drm_clip_rect *clips,
-			     unsigned num_clips)
+			     unsigned int num_clips)
 {
 	struct virtio_gpu_device *vgdev = vgfb->base.dev->dev_private;
 	struct virtio_gpu_object *obj = gem_to_virtio_gpu_obj(vgfb->obj);
diff --git a/drivers/gpu/drm/virtio/virtgpu_ttm.c b/drivers/gpu/drm/virtio/virtgpu_ttm.c
index cd4a17a1409a..580323ceeb8a 100644
--- a/drivers/gpu/drm/virtio/virtgpu_ttm.c
+++ b/drivers/gpu/drm/virtio/virtgpu_ttm.c
@@ -224,7 +224,7 @@ static int virtio_gpu_init_mem_type(struct ttm_bo_device *bdev, uint32_t type,
 		man->default_caching = TTM_PL_FLAG_CACHED;
 		break;
 	default:
-		DRM_ERROR("Unsupported memory type %u\n", (unsigned)type);
+		DRM_ERROR("Unsupported memory type %u\n", (unsigned int)type);
 		return -EINVAL;
 	}
 	return 0;
-- 
2.16.2

