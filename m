From: YueHaibing <yuehaibing@huawei.com>
Date: Fri, 07 Sep 2018 01:53:58 +0000
Subject: [PATCH -next] drm/virtio: Remove set but not used variable 'bo'
Message-Id: <1536285837-150460-1-git-send-email-yuehaibing@huawei.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: David Airlie <airlied@linux.ie>, Gerd Hoffmann <kraxel@redhat.com>
Cc: YueHaibing <yuehaibing@huawei.com>, dri-devel@lists.freedesktop.org, virtualization@lists.linux-foundation.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

Fixes gcc '-Wunused-but-set-variable' warning:

drivers/gpu/drm/virtio/virtgpu_display.c: In function 'virtio_gpu_framebuffer_init':
drivers/gpu/drm/virtio/virtgpu_display.c:78:28: warning:
 variable 'bo' set but not used [-Wunused-but-set-variable]
  struct virtio_gpu_object *bo;
                            ^

Signed-off-by: YueHaibing <yuehaibing@huawei.com>
---
 drivers/gpu/drm/virtio/virtgpu_display.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/gpu/drm/virtio/virtgpu_display.c b/drivers/gpu/drm/virtio/virtgpu_display.c
index 9f1e0a6..0379d68 100644
--- a/drivers/gpu/drm/virtio/virtgpu_display.c
+++ b/drivers/gpu/drm/virtio/virtgpu_display.c
@@ -75,12 +75,9 @@
 			    struct drm_gem_object *obj)
 {
 	int ret;
-	struct virtio_gpu_object *bo;
 
 	vgfb->base.obj[0] = obj;
 
-	bo = gem_to_virtio_gpu_obj(obj);
-
 	drm_helper_mode_fill_fb_struct(dev, &vgfb->base, mode_cmd);
 
 	ret = drm_framebuffer_init(dev, &vgfb->base, &virtio_gpu_fb_funcs);
