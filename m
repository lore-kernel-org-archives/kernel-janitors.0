From: YueHaibing <yuehaibing@huawei.com>
Date: Wed, 20 Mar 2019 12:59:39 +0000
Subject: [PATCH -next] drm/ttm: remove set but not used variable 'rdev'
Message-Id: <20190320125939.74347-1-yuehaibing@huawei.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1541643300-109641-1-git-send-email-yuehaibing@huawei.com>
In-Reply-To: <1541643300-109641-1-git-send-email-yuehaibing@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: alexander.deucher@amd.com, christian.koenig@amd.com, David1.Zhou@amd.com, airlied@linux.ie, daniel@ffwll.ch
Cc: YueHaibing <yuehaibing@huawei.com>, amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

Fixes gcc '-Wunused-but-set-variable' warning:

drivers/gpu/drm/radeon/radeon_ttm.c: In function 'radeon_move_vram_ram':
drivers/gpu/drm/radeon/radeon_ttm.c:254:24: warning:
 variable 'rdev' set but not used [-Wunused-but-set-variable]

drivers/gpu/drm/radeon/radeon_ttm.c: In function 'radeon_move_ram_vram':
drivers/gpu/drm/radeon/radeon_ttm.c:301:24: warning:
 variable 'rdev' set but not used [-Wunused-but-set-variable]

It's not used since a987fcaa805f ("ttm: Make parts of a struct ttm_bo_device
global.")

Signed-off-by: YueHaibing <yuehaibing@huawei.com>
---
 drivers/gpu/drm/radeon/radeon_ttm.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/drivers/gpu/drm/radeon/radeon_ttm.c b/drivers/gpu/drm/radeon/radeon_ttm.c
index 557bdd7a2fc8..5d42f8d8e68d 100644
--- a/drivers/gpu/drm/radeon/radeon_ttm.c
+++ b/drivers/gpu/drm/radeon/radeon_ttm.c
@@ -251,14 +251,12 @@ static int radeon_move_vram_ram(struct ttm_buffer_object *bo,
 				struct ttm_mem_reg *new_mem)
 {
 	struct ttm_operation_ctx ctx = { interruptible, no_wait_gpu };
-	struct radeon_device *rdev;
 	struct ttm_mem_reg *old_mem = &bo->mem;
 	struct ttm_mem_reg tmp_mem;
 	struct ttm_place placements;
 	struct ttm_placement placement;
 	int r;
 
-	rdev = radeon_get_rdev(bo->bdev);
 	tmp_mem = *new_mem;
 	tmp_mem.mm_node = NULL;
 	placement.num_placement = 1;
@@ -298,14 +296,12 @@ static int radeon_move_ram_vram(struct ttm_buffer_object *bo,
 				struct ttm_mem_reg *new_mem)
 {
 	struct ttm_operation_ctx ctx = { interruptible, no_wait_gpu };
-	struct radeon_device *rdev;
 	struct ttm_mem_reg *old_mem = &bo->mem;
 	struct ttm_mem_reg tmp_mem;
 	struct ttm_placement placement;
 	struct ttm_place placements;
 	int r;
 
-	rdev = radeon_get_rdev(bo->bdev);
 	tmp_mem = *new_mem;
 	tmp_mem.mm_node = NULL;
 	placement.num_placement = 1;
