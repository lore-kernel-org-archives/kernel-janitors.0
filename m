From: Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>
Date: Fri, 23 Feb 2018 00:00:57 +0000
Subject: [PATCH 6/7] drm/virtio: Remove multiple blank lines
Message-Id: <c43a006f2ed93a16fe824b4a2686a2d5e2ef56f5.1519343668.git.rodrigosiqueiramelo@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <cover.1519343668.git.rodrigosiqueiramelo@gmail.com>
In-Reply-To: <cover.1519343668.git.rodrigosiqueiramelo@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: David Airlie <airlied@linux.ie>, Gerd Hoffmann <kraxel@redhat.com>
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, virtualization@lists.linux-foundation.org

This patch fixes the checkpatch.pl check:

virtgpu_drv.c:116: CHECK: Please don't use multiple blank lines
virtgpu_vq.c:599: CHECK: Please don't use multiple blank lines
virtgpu_prime.c:42: CHECK: Please don't use multiple blank lines

Signed-off-by: Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>
---
 drivers/gpu/drm/virtio/virtgpu_drv.c   | 1 -
 drivers/gpu/drm/virtio/virtgpu_prime.c | 1 -
 drivers/gpu/drm/virtio/virtgpu_vq.c    | 1 -
 3 files changed, 3 deletions(-)

diff --git a/drivers/gpu/drm/virtio/virtgpu_drv.c b/drivers/gpu/drm/virtio/virtgpu_drv.c
index 5d21433b1cdf..d9287c144fe5 100644
--- a/drivers/gpu/drm/virtio/virtgpu_drv.c
+++ b/drivers/gpu/drm/virtio/virtgpu_drv.c
@@ -113,7 +113,6 @@ static const struct file_operations virtio_gpu_driver_fops = {
 	.llseek = noop_llseek,
 };
 
-
 static struct drm_driver driver = {
 	.driver_features = DRIVER_MODESET | DRIVER_GEM | DRIVER_PRIME | DRIVER_RENDER | DRIVER_ATOMIC,
 	.load = virtio_gpu_driver_load,
diff --git a/drivers/gpu/drm/virtio/virtgpu_prime.c b/drivers/gpu/drm/virtio/virtgpu_prime.c
index 6c6e9dbab096..d27a1688714f 100644
--- a/drivers/gpu/drm/virtio/virtgpu_prime.c
+++ b/drivers/gpu/drm/virtio/virtgpu_prime.c
@@ -39,7 +39,6 @@ void virtgpu_gem_prime_unpin(struct drm_gem_object *obj)
 	WARN_ONCE(1, "not implemented");
 }
 
-
 struct sg_table *virtgpu_gem_prime_get_sg_table(struct drm_gem_object *obj)
 {
 	WARN_ONCE(1, "not implemented");
diff --git a/drivers/gpu/drm/virtio/virtgpu_vq.c b/drivers/gpu/drm/virtio/virtgpu_vq.c
index 809d20eb6571..18c78a7fa044 100644
--- a/drivers/gpu/drm/virtio/virtgpu_vq.c
+++ b/drivers/gpu/drm/virtio/virtgpu_vq.c
@@ -596,7 +596,6 @@ static void virtio_gpu_cmd_capset_cb(struct virtio_gpu_device *vgdev,
 	wake_up(&vgdev->resp_wq);
 }
 
-
 int virtio_gpu_cmd_get_display_info(struct virtio_gpu_device *vgdev)
 {
 	struct virtio_gpu_ctrl_hdr *cmd_p;
-- 
2.16.2

