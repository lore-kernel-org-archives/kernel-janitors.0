From: Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>
Date: Thu, 22 Feb 2018 23:59:47 +0000
Subject: [PATCH 1/7] drm/virtio: Add tabs at the start of a line
Message-Id: <1c77c233d4454ee2bdb85beaf17d413e310fac0a.1519343668.git.rodrigosiqueiramelo@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <cover.1519343668.git.rodrigosiqueiramelo@gmail.com>
In-Reply-To: <cover.1519343668.git.rodrigosiqueiramelo@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: David Airlie <airlied@linux.ie>, Gerd Hoffmann <kraxel@redhat.com>
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, virtualization@lists.linux-foundation.org

This patch fixes the checkpatch.pl errors:

drivers/gpu/drm/virtio/virtgpu_drv.h:371: ERROR: code indent should use
tabs where possible
...

Signed-off-by: Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>
---
 drivers/gpu/drm/virtio/virtgpu_display.c | 2 +-
 drivers/gpu/drm/virtio/virtgpu_drv.h     | 6 +++---
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/virtio/virtgpu_display.c b/drivers/gpu/drm/virtio/virtgpu_display.c
index 19114a3c5ee4..22513d7f895c 100644
--- a/drivers/gpu/drm/virtio/virtgpu_display.c
+++ b/drivers/gpu/drm/virtio/virtgpu_display.c
@@ -387,7 +387,7 @@ int virtio_gpu_modeset_init(struct virtio_gpu_device *vgdev)
 	for (i = 0 ; i < vgdev->num_scanouts; ++i)
 		vgdev_output_init(vgdev, i);
 
-        drm_mode_config_reset(vgdev->ddev);
+	drm_mode_config_reset(vgdev->ddev);
 	return 0;
 }
 
diff --git a/drivers/gpu/drm/virtio/virtgpu_drv.h b/drivers/gpu/drm/virtio/virtgpu_drv.h
index da2fb585fea4..59801728cfeb 100644
--- a/drivers/gpu/drm/virtio/virtgpu_drv.h
+++ b/drivers/gpu/drm/virtio/virtgpu_drv.h
@@ -363,12 +363,12 @@ int virtgpu_gem_prime_pin(struct drm_gem_object *obj);
 void virtgpu_gem_prime_unpin(struct drm_gem_object *obj);
 struct sg_table *virtgpu_gem_prime_get_sg_table(struct drm_gem_object *obj);
 struct drm_gem_object *virtgpu_gem_prime_import_sg_table(
-        struct drm_device *dev, struct dma_buf_attachment *attach,
-        struct sg_table *sgt);
+	struct drm_device *dev, struct dma_buf_attachment *attach,
+	struct sg_table *sgt);
 void *virtgpu_gem_prime_vmap(struct drm_gem_object *obj);
 void virtgpu_gem_prime_vunmap(struct drm_gem_object *obj, void *vaddr);
 int virtgpu_gem_prime_mmap(struct drm_gem_object *obj,
-                                struct vm_area_struct *vma);
+			   struct vm_area_struct *vma);
 
 static inline struct virtio_gpu_object*
 virtio_gpu_object_ref(struct virtio_gpu_object *bo)
-- 
2.16.2

