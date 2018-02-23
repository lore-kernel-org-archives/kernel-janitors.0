From: Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>
Date: Fri, 23 Feb 2018 00:00:17 +0000
Subject: [PATCH 3/7] drm/virtio: Add */ in block comments to separate line
Message-Id: <f0bd4104a7d26bf7561c3a2b4632041c5411f1f2.1519343668.git.rodrigosiqueiramelo@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <cover.1519343668.git.rodrigosiqueiramelo@gmail.com>
In-Reply-To: <cover.1519343668.git.rodrigosiqueiramelo@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: David Airlie <airlied@linux.ie>, Gerd Hoffmann <kraxel@redhat.com>
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, virtualization@lists.linux-foundation.org

This patch fixes the checkpatch.pl warning:

virtgpu_ioctl.c:551: WARNING: Block comments use a trailing */ on a
separate line
...

Signed-off-by: Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>
---
 drivers/gpu/drm/virtio/virtgpu_ioctl.c | 3 ++-
 drivers/gpu/drm/virtio/virtgpu_prime.c | 3 ++-
 drivers/gpu/drm/virtio/virtgpu_vq.c    | 3 ++-
 3 files changed, 6 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/virtio/virtgpu_ioctl.c b/drivers/gpu/drm/virtio/virtgpu_ioctl.c
index 86243f131fc1..d52a86eaa884 100644
--- a/drivers/gpu/drm/virtio/virtgpu_ioctl.c
+++ b/drivers/gpu/drm/virtio/virtgpu_ioctl.c
@@ -548,7 +548,8 @@ struct drm_ioctl_desc virtio_gpu_ioctls[DRM_VIRTIO_NUM_IOCTLS] = {
 			  DRM_AUTH|DRM_UNLOCKED|DRM_RENDER_ALLOW),
 
 	/* make transfer async to the main ring? - no sure, can we
-	   thread these in the underlying GL */
+	 * thread these in the underlying GL
+	 */
 	DRM_IOCTL_DEF_DRV(VIRTGPU_TRANSFER_FROM_HOST,
 			  virtio_gpu_transfer_from_host_ioctl,
 			  DRM_AUTH|DRM_UNLOCKED|DRM_RENDER_ALLOW),
diff --git a/drivers/gpu/drm/virtio/virtgpu_prime.c b/drivers/gpu/drm/virtio/virtgpu_prime.c
index 385e0eb9826a..6c6e9dbab096 100644
--- a/drivers/gpu/drm/virtio/virtgpu_prime.c
+++ b/drivers/gpu/drm/virtio/virtgpu_prime.c
@@ -25,7 +25,8 @@
 #include "virtgpu_drv.h"
 
 /* Empty Implementations as there should not be any other driver for a virtual
- * device that might share buffers with virtgpu */
+ * device that might share buffers with virtgpu
+ */
 
 int virtgpu_gem_prime_pin(struct drm_gem_object *obj)
 {
diff --git a/drivers/gpu/drm/virtio/virtgpu_vq.c b/drivers/gpu/drm/virtio/virtgpu_vq.c
index 16c05bc34bef..809d20eb6571 100644
--- a/drivers/gpu/drm/virtio/virtgpu_vq.c
+++ b/drivers/gpu/drm/virtio/virtgpu_vq.c
@@ -383,7 +383,8 @@ static int virtio_gpu_queue_cursor(struct virtio_gpu_device *vgdev,
 }
 
 /* just create gem objects for userspace and long lived objects,
-   just use dma_alloced pages for the queue objects? */
+ * just use dma_alloced pages for the queue objects?
+ */
 
 /* create a basic resource */
 void virtio_gpu_cmd_create_resource(struct virtio_gpu_device *vgdev,
-- 
2.16.2

