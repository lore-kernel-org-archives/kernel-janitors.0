From: YueHaibing <yuehaibing@huawei.com>
Date: Sat, 10 Nov 2018 03:44:46 +0000
Subject: [PATCH -next] drm/qxl: remove set but not used variable 'map'
Message-Id: <1541821486-40631-1-git-send-email-yuehaibing@huawei.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dave Airlie <airlied@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>, David Airlie <airlied@linux.ie>
Cc: YueHaibing <yuehaibing@huawei.com>, virtualization@lists.linux-foundation.org, dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

Fixes gcc '-Wunused-but-set-variable' warning:

drivers/gpu/drm/qxl/qxl_object.c: In function 'qxl_bo_kunmap_atomic_page':
drivers/gpu/drm/qxl/qxl_object.c:189:21: warning:
 variable 'map' set but not used [-Wunused-but-set-variable]

Signed-off-by: YueHaibing <yuehaibing@huawei.com>
---
 drivers/gpu/drm/qxl/qxl_object.c | 10 +++-------
 1 file changed, 3 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/qxl/qxl_object.c b/drivers/gpu/drm/qxl/qxl_object.c
index f67a3c5..b1706cb 100644
--- a/drivers/gpu/drm/qxl/qxl_object.c
+++ b/drivers/gpu/drm/qxl/qxl_object.c
@@ -186,13 +186,9 @@ void qxl_bo_kunmap_atomic_page(struct qxl_device *qdev,
 			       struct qxl_bo *bo, void *pmap)
 {
 	struct ttm_mem_type_manager *man = &bo->tbo.bdev->man[bo->tbo.mem.mem_type];
-	struct io_mapping *map;
 
-	if (bo->tbo.mem.mem_type = TTM_PL_VRAM)
-		map = qdev->vram_mapping;
-	else if (bo->tbo.mem.mem_type = TTM_PL_PRIV)
-		map = qdev->surface_mapping;
-	else
+	if ((bo->tbo.mem.mem_type != TTM_PL_VRAM) &&
+	    (bo->tbo.mem.mem_type != TTM_PL_PRIV))
 		goto fallback;
 
 	io_mapping_unmap_atomic(pmap);
@@ -200,7 +196,7 @@ void qxl_bo_kunmap_atomic_page(struct qxl_device *qdev,
 	(void) ttm_mem_io_lock(man, false);
 	ttm_mem_io_free(bo->tbo.bdev, &bo->tbo.mem);
 	ttm_mem_io_unlock(man);
-	return ;
+	return;
  fallback:
 	qxl_bo_kunmap(bo);
 }
