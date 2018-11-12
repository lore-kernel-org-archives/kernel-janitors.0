From: YueHaibing <yuehaibing@huawei.com>
Date: Mon, 12 Nov 2018 13:32:36 +0000
Subject: [PATCH -next] drm/qxl: remove set but not used variables 'driver, qbo'
Message-Id: <1542029556-88107-1-git-send-email-yuehaibing@huawei.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1541821486-40631-1-git-send-email-yuehaibing@huawei.com>
In-Reply-To: <1541821486-40631-1-git-send-email-yuehaibing@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dave Airlie <airlied@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>, David Airlie <airlied@linux.ie>
Cc: YueHaibing <yuehaibing@huawei.com>, virtualization@lists.linux-foundation.org, dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

Fixes gcc '-Wunused-but-set-variable' warning:

drivers/gpu/drm/qxl/qxl_release.c: In function 'qxl_release_fence_buffer_objects':
drivers/gpu/drm/qxl/qxl_release.c:431:17: warning:
 variable 'qbo' set but not used [-Wunused-but-set-variable]

drivers/gpu/drm/qxl/qxl_release.c:430:24: warning:
 variable 'driver' set but not used [-Wunused-but-set-variable]

'qbo' not used since commit f2c24b83ae90 ("drm/ttm: flip the switch, and convert
to dma_fence")

And 'driver' never used since introduction in
8002db6336dd ("qxl: convert qxl driver to proper use for reservations")

Signed-off-by: YueHaibing <yuehaibing@huawei.com>
---
 drivers/gpu/drm/qxl/qxl_release.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/drivers/gpu/drm/qxl/qxl_release.c b/drivers/gpu/drm/qxl/qxl_release.c
index 3813ec1..0a693fe 100644
--- a/drivers/gpu/drm/qxl/qxl_release.c
+++ b/drivers/gpu/drm/qxl/qxl_release.c
@@ -427,8 +427,6 @@ void qxl_release_fence_buffer_objects(struct qxl_release *release)
 	struct ttm_buffer_object *bo;
 	struct ttm_bo_global *glob;
 	struct ttm_bo_device *bdev;
-	struct ttm_bo_driver *driver;
-	struct qxl_bo *qbo;
 	struct ttm_validate_buffer *entry;
 	struct qxl_device *qdev;
 
@@ -449,14 +447,12 @@ void qxl_release_fence_buffer_objects(struct qxl_release *release)
 		       release->id | 0xf0000000, release->base.seqno);
 	trace_dma_fence_emit(&release->base);
 
-	driver = bdev->driver;
 	glob = bdev->glob;
 
 	spin_lock(&glob->lru_lock);
 
 	list_for_each_entry(entry, &release->bos, head) {
 		bo = entry->bo;
-		qbo = to_qxl_bo(bo);
 
 		reservation_object_add_shared_fence(bo->resv, &release->base);
 		ttm_bo_add_to_lru(bo);
