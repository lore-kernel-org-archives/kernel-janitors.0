From: Colin King <colin.king@canonical.com>
Date: Tue, 12 Sep 2017 17:35:30 +0000
Subject: [PATCH] drm/vmwgfx: remove DRM_ERROR message, stops log spamming
Message-Id: <20170912173530.14132-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: VMware Graphics <linux-graphics-maintainer@vmware.com>, Sinclair Yeh <syeh@vmware.com>, Thomas Hellstrom <thellstrom@vmware.com>, David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

mmap'ing the device multiple times will spam the kernel log with the
DRM_ERROR message about illegal mmap'ing the old fifo space. Since
the mmap'ing will fail with an -EINVAL there is no need to emit this
message, so just remove it.

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/gpu/drm/vmwgfx/vmwgfx_ttm_glue.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_ttm_glue.c b/drivers/gpu/drm/vmwgfx/vmwgfx_ttm_glue.c
index e771091d2cd3..1e633c602fb1 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_ttm_glue.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_ttm_glue.c
@@ -33,10 +33,8 @@ int vmw_mmap(struct file *filp, struct vm_area_struct *vma)
 	struct drm_file *file_priv;
 	struct vmw_private *dev_priv;
 
-	if (unlikely(vma->vm_pgoff < VMWGFX_FILE_PAGE_OFFSET)) {
-		DRM_ERROR("Illegal attempt to mmap old fifo space.\n");
+	if (unlikely(vma->vm_pgoff < VMWGFX_FILE_PAGE_OFFSET))
 		return -EINVAL;
-	}
 
 	file_priv = filp->private_data;
 	dev_priv = vmw_priv(file_priv->minor->dev);
-- 
2.14.1

