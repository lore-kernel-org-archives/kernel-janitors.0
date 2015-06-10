From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 10 Jun 2015 19:27:51 +0000
Subject: [patch] drm/virtio: remove some dead code
Message-Id: <20150610192751.GB10145@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: David Airlie <airlied@linux.ie>
Cc: kernel-janitors@vger.kernel.org, dri-devel@lists.freedesktop.org, virtualization@lists.linux-foundation.org

The goto is correct, and we never reach the return statement so just
delete the dead code.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/gpu/drm/virtio/virtgpu_ttm.c b/drivers/gpu/drm/virtio/virtgpu_ttm.c
index e0e74c6..b092d7b 100644
--- a/drivers/gpu/drm/virtio/virtgpu_ttm.c
+++ b/drivers/gpu/drm/virtio/virtgpu_ttm.c
@@ -443,14 +443,12 @@ int virtio_gpu_ttm_init(struct virtio_gpu_device *vgdev)
 	if (r) {
 		DRM_ERROR("failed initializing buffer object driver(%d).\n", r);
 		goto err_dev_init;
-		return r;
 	}
 
 	r = ttm_bo_init_mm(&vgdev->mman.bdev, TTM_PL_TT, 0);
 	if (r) {
 		DRM_ERROR("Failed initializing GTT heap.\n");
 		goto err_mm_init;
-		return r;
 	}
 	return 0;
 
