From: YueHaibing <yuehaibing@huawei.com>
Date: Thu, 08 Nov 2018 02:15:00 +0000
Subject: [PATCH -next] drm/ttm: remove set but not used variable 'driver'
Message-Id: <1541643300-109641-1-git-send-email-yuehaibing@huawei.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Christian Koenig <christian.koenig@amd.com>, Huang Rui <ray.huang@amd.com>, Junwei Zhang <Jerry.Zhang@amd.com>, David Airlie <airlied@linux.ie>
Cc: YueHaibing <yuehaibing@huawei.com>, dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

Fixes gcc '-Wunused-but-set-variable' warning:

drivers/gpu/drm/ttm/ttm_execbuf_util.c: In function 'ttm_eu_fence_buffer_objects':
drivers/gpu/drm/ttm/ttm_execbuf_util.c:190:24: warning:
 variable 'driver' set but not used [-Wunused-but-set-variable]

It not used any more after
commit f2c24b83ae90 ("drm/ttm: flip the switch, and convert to dma_fence")

Signed-off-by: YueHaibing <yuehaibing@huawei.com>
---
 drivers/gpu/drm/ttm/ttm_execbuf_util.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/gpu/drm/ttm/ttm_execbuf_util.c b/drivers/gpu/drm/ttm/ttm_execbuf_util.c
index e493edb..efa005a 100644
--- a/drivers/gpu/drm/ttm/ttm_execbuf_util.c
+++ b/drivers/gpu/drm/ttm/ttm_execbuf_util.c
@@ -187,14 +187,12 @@ void ttm_eu_fence_buffer_objects(struct ww_acquire_ctx *ticket,
 	struct ttm_buffer_object *bo;
 	struct ttm_bo_global *glob;
 	struct ttm_bo_device *bdev;
-	struct ttm_bo_driver *driver;
 
 	if (list_empty(list))
 		return;
 
 	bo = list_first_entry(list, struct ttm_validate_buffer, head)->bo;
 	bdev = bo->bdev;
-	driver = bdev->driver;
 	glob = bo->bdev->glob;
 
 	spin_lock(&glob->lru_lock);
