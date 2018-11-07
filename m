From: Colin King <colin.king@canonical.com>
Date: Wed, 07 Nov 2018 20:31:22 +0000
Subject: [PATCH][drm-next] drm/virtio: fix memory leak of vfpriv on error return path
Message-Id: <20181107203122.6861-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: David Airlie <airlied@linux.ie>, Gerd Hoffmann <kraxel@redhat.com>, dri-devel@lists.freedesktop.org, virtualization@lists.linux-foundation.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

The allocation for vfpriv is being leaked on an error return path,
fix this by kfree'ing it before returning.

Detected by CoverityScan, CID#1475380 ("Resource Leak")

Fixes: 6a37c49a94a9 ("drm/virtio: Handle context ID allocation errors")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/gpu/drm/virtio/virtgpu_kms.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/virtio/virtgpu_kms.c b/drivers/gpu/drm/virtio/virtgpu_kms.c
index bf609dcae224..f4f995639ed1 100644
--- a/drivers/gpu/drm/virtio/virtgpu_kms.c
+++ b/drivers/gpu/drm/virtio/virtgpu_kms.c
@@ -266,8 +266,10 @@ int virtio_gpu_driver_open(struct drm_device *dev, struct drm_file *file)
 
 	get_task_comm(dbgname, current);
 	id = virtio_gpu_context_create(vgdev, strlen(dbgname), dbgname);
-	if (id < 0)
+	if (id < 0) {
+		kfree(vfpriv);
 		return id;
+	}
 
 	vfpriv->ctx_id = id;
 	file->driver_priv = vfpriv;
-- 
2.19.1
