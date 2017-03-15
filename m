From: "Andrew F. Davis" <afd@ti.com>
Date: Wed, 15 Mar 2017 16:23:10 +0000
Subject: [PATCH 02/14] drm/nouveau: remove unneeded conversions to bool
Message-Id: <20170315162322.12096-2-afd@ti.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Found with scripts/coccinelle/misc/boolconv.cocci.

Signed-off-by: Andrew F. Davis <afd@ti.com>
---
 drivers/gpu/drm/nouveau/nouveau_ttm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_ttm.c b/drivers/gpu/drm/nouveau/nouveau_ttm.c
index 13e5cc5f07fe..0e24c4bb38e8 100644
--- a/drivers/gpu/drm/nouveau/nouveau_ttm.c
+++ b/drivers/gpu/drm/nouveau/nouveau_ttm.c
@@ -389,7 +389,7 @@ nouveau_ttm_init(struct nouveau_drm *drm)
 				  &nouveau_bo_driver,
 				  dev->anon_inode->i_mapping,
 				  DRM_FILE_PAGE_OFFSET,
-				  bits <= 32 ? true : false);
+				  bits <= 32);
 	if (ret) {
 		NV_ERROR(drm, "error initialising bo driver, %d\n", ret);
 		return ret;
-- 
2.11.0

