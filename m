From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 03 Feb 2021 09:54:24 +0000
Subject: [PATCH] drm/virtio: fix an error code in virtio_gpu_init()
Message-Id: <YBpy0GS7GfmafMfe@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: David Airlie <airlied@linux.ie>, Gerd Hoffmann <kraxel@redhat.com>
Cc: Tomeu Vizoso <tomeu.vizoso@collabora.com>, kernel-janitors@vger.kernel.org, dri-devel@lists.freedesktop.org, virtualization@lists.linux-foundation.org, Gurchetan Singh <gurchetansingh@chromium.org>

If devm_request_mem_region() fails this code currently returns success
but it should return -EBUSY.

Fixes: 6076a9711dc5 ("drm/virtio: implement blob resources: probe for host visible region")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 drivers/gpu/drm/virtio/virtgpu_kms.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/virtio/virtgpu_kms.c b/drivers/gpu/drm/virtio/virtgpu_kms.c
index b4ec479c32cd..b375394193be 100644
--- a/drivers/gpu/drm/virtio/virtgpu_kms.c
+++ b/drivers/gpu/drm/virtio/virtgpu_kms.c
@@ -163,6 +163,7 @@ int virtio_gpu_init(struct drm_device *dev)
 					     vgdev->host_visible_region.len,
 					     dev_name(&vgdev->vdev->dev))) {
 			DRM_ERROR("Could not reserve host visible region\n");
+			ret = -EBUSY;
 			goto err_vqs;
 		}
 
-- 
2.30.0
