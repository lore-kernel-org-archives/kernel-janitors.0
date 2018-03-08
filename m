From: Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>
Date: Thu, 08 Mar 2018 02:03:23 +0000
Subject: [PATCH 4/5] drm/vgem: Add space around operators
Message-Id: <524f1d4f3c4b5834d8210ae3476550dba8f02f27.1520474055.git.rodrigosiqueiramelo@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <cover.1520474055.git.rodrigosiqueiramelo@gmail.com>
In-Reply-To: <cover.1520474055.git.rodrigosiqueiramelo@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: David Airlie <airlied@linux.ie>
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org

This patch fixes the checkpatch.pl check and warning:

vgem_fence.c:28: CHECK: spaces preferred around that '*' (ctx:VxV)
vgem_drv.c:255: CHECK: spaces preferred around that '|' (ctx:VxV)
vgem_drv.c:256: WARNING: line over 80 characters

Signed-off-by: Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>
---
 drivers/gpu/drm/vgem/vgem_drv.c   | 8 ++++++--
 drivers/gpu/drm/vgem/vgem_fence.c | 2 +-
 2 files changed, 7 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/vgem/vgem_drv.c b/drivers/gpu/drm/vgem/vgem_drv.c
index bf704ed51da4..6e6084e3204a 100644
--- a/drivers/gpu/drm/vgem/vgem_drv.c
+++ b/drivers/gpu/drm/vgem/vgem_drv.c
@@ -252,8 +252,12 @@ static int vgem_gem_dumb_map(struct drm_file *file, struct drm_device *dev,
 }
 
 static struct drm_ioctl_desc vgem_ioctls[] = {
-	DRM_IOCTL_DEF_DRV(VGEM_FENCE_ATTACH, vgem_fence_attach_ioctl, DRM_AUTH|DRM_RENDER_ALLOW),
-	DRM_IOCTL_DEF_DRV(VGEM_FENCE_SIGNAL, vgem_fence_signal_ioctl, DRM_AUTH|DRM_RENDER_ALLOW),
+	DRM_IOCTL_DEF_DRV(VGEM_FENCE_ATTACH,
+			  vgem_fence_attach_ioctl,
+			  DRM_AUTH | DRM_RENDER_ALLOW),
+	DRM_IOCTL_DEF_DRV(VGEM_FENCE_SIGNAL,
+			  vgem_fence_signal_ioctl,
+			  DRM_AUTH | DRM_RENDER_ALLOW),
 };
 
 static int vgem_mmap(struct file *filp, struct vm_area_struct *vma)
diff --git a/drivers/gpu/drm/vgem/vgem_fence.c b/drivers/gpu/drm/vgem/vgem_fence.c
index f5b659463b00..d0bcb5fb33d1 100644
--- a/drivers/gpu/drm/vgem/vgem_fence.c
+++ b/drivers/gpu/drm/vgem/vgem_fence.c
@@ -25,7 +25,7 @@
 
 #include "vgem_drv.h"
 
-#define VGEM_FENCE_TIMEOUT (10*HZ)
+#define VGEM_FENCE_TIMEOUT (10 * HZ)
 
 struct vgem_fence {
 	struct dma_fence base;
-- 
2.16.2

