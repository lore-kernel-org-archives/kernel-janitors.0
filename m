From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 22 Feb 2019 06:34:04 +0000
Subject: [PATCH] drm/nouveau/dmem: Fix a NULL vs IS_ERR() check
Message-Id: <20190222063404.GA12190@kadam>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, =?iso-8859-1?B?Suly9G1l?= Glisse <jglisse-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, kernel-janitors-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, Daniel Vetter <daniel-/w4YWyX8dFk@public.gmane.org>

The hmm_devmem_add() function doesn't return NULL, it returns error
pointers.

Fixes: 5be73b690875 ("drm/nouveau/dmem: device memory helpers for SVM")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 drivers/gpu/drm/nouveau/nouveau_dmem.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_dmem.c b/drivers/gpu/drm/nouveau/nouveau_dmem.c
index aa9fec80492d..28624dd0c920 100644
--- a/drivers/gpu/drm/nouveau/nouveau_dmem.c
+++ b/drivers/gpu/drm/nouveau/nouveau_dmem.c
@@ -623,7 +623,7 @@ nouveau_dmem_init(struct nouveau_drm *drm)
 	 */
 	drm->dmem->devmem = hmm_devmem_add(&nouveau_dmem_devmem_ops,
 					   device, size);
-	if (drm->dmem->devmem = NULL) {
+	if (IS_ERR(drm->dmem->devmem)) {
 		kfree(drm->dmem);
 		drm->dmem = NULL;
 		return;
-- 
2.17.1
