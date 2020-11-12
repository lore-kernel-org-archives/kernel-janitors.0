From: Colin King <colin.king@canonical.com>
Date: Thu, 12 Nov 2020 09:50:13 +0000
Subject: [PATCH][next] drm/ttm: fix spelling mistake "swaput" -> "swapout"
Message-Id: <20201112095013.53619-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Christian Koenig <christian.koenig@amd.com>, Huang Rui <ray.huang@amd.com>, David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, dri-devel@lists.freedesktop.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

There is a spelling mistake in a warning message, fix it.

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/gpu/drm/ttm/ttm_bo.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/ttm/ttm_bo.c b/drivers/gpu/drm/ttm/ttm_bo.c
index e6bcbfe530ec..d32ca8734aa7 100644
--- a/drivers/gpu/drm/ttm/ttm_bo.c
+++ b/drivers/gpu/drm/ttm/ttm_bo.c
@@ -1494,7 +1494,7 @@ int ttm_bo_swapout(struct ttm_operation_ctx *ctx)
 
 		ret = ttm_bo_handle_move_mem(bo, &evict_mem, true, &ctx, &hop);
 		if (unlikely(ret != 0)) {
-			WARN(ret = -EMULTIHOP, "Unexpected multihop in swaput - likely driver bug.\n");
+			WARN(ret = -EMULTIHOP, "Unexpected multihop in swapout - likely driver bug.\n");
 			goto out;
 		}
 	}
-- 
2.28.0
