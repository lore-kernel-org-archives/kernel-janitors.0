From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 10 Jun 2015 19:27:11 +0000
Subject: [patch] drm/virtio: checking for NULL instead of IS_ERR
Message-Id: <20150610192710.GA10145@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: David Airlie <airlied@linux.ie>
Cc: kernel-janitors@vger.kernel.org, dri-devel@lists.freedesktop.org, virtualization@lists.linux-foundation.org

virtio_gpu_alloc_object() returns an error pointer, it never returns
NULL.

Fixes: dc5698e80cf7 ('Add virtio gpu driver.')
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/gpu/drm/virtio/virtgpu_fb.c b/drivers/gpu/drm/virtio/virtgpu_fb.c
index 25bf333..df198d9 100644
--- a/drivers/gpu/drm/virtio/virtgpu_fb.c
+++ b/drivers/gpu/drm/virtio/virtgpu_fb.c
@@ -299,8 +299,8 @@ static int virtio_gpufb_create(struct drm_fb_helper *helper,
 
 	size = mode_cmd.pitches[0] * mode_cmd.height;
 	obj = virtio_gpu_alloc_object(dev, size, false, true);
-	if (!obj)
-		return -ENOMEM;
+	if (IS_ERR(obj))
+		return PTR_ERR(obj);
 
 	virtio_gpu_resource_id_get(vgdev, &resid);
 	virtio_gpu_cmd_create_resource(vgdev, resid, format,
