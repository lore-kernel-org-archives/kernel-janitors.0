From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 30 Oct 2020 11:48:08 +0000
Subject: [PATCH] drm/virtio: Fix a double free in virtio_gpu_cmd_map()
Message-Id: <20201030114808.GD3251003@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: David Airlie <airlied@linux.ie>, Gerd Hoffmann <kraxel@redhat.com>
Cc: Tomeu Vizoso <tomeu.vizoso@collabora.com>, kernel-janitors@vger.kernel.org, dri-devel@lists.freedesktop.org, virtualization@lists.linux-foundation.org, Gurchetan Singh <gurchetansingh@chromium.org>

This is freed both here and in the caller (virtio_gpu_vram_map()) so
it's a double free.  The correct place is only in the caller.

Fixes: 16845c5d5409 ("drm/virtio: implement blob resources: implement vram object")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 drivers/gpu/drm/virtio/virtgpu_vq.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/virtio/virtgpu_vq.c b/drivers/gpu/drm/virtio/virtgpu_vq.c
index 72586cd8cc4c..3f200306c9d7 100644
--- a/drivers/gpu/drm/virtio/virtgpu_vq.c
+++ b/drivers/gpu/drm/virtio/virtgpu_vq.c
@@ -1212,10 +1212,8 @@ int virtio_gpu_cmd_map(struct virtio_gpu_device *vgdev,
 	struct virtio_gpu_resp_map_info *resp_buf;
 
 	resp_buf = kzalloc(sizeof(*resp_buf), GFP_KERNEL);
-	if (!resp_buf) {
-		virtio_gpu_array_put_free(objs);
+	if (!resp_buf)
 		return -ENOMEM;
-	}
 
 	cmd_p = virtio_gpu_alloc_cmd_resp
 		(vgdev, virtio_gpu_cmd_resource_map_cb, &vbuf, sizeof(*cmd_p),
-- 
2.28.0
