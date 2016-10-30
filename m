From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Date: Sun, 30 Oct 2016 15:38:42 +0000
Subject: [PATCH] drm/armada: Remove some dead code
Message-Id: <20161030153842.16745-1-christophe.jaillet@wanadoo.fr>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: rmk+kernel@armlinux.org.uk, airlied@linux.ie
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Christophe JAILLET <christophe.jaillet@wanadoo.fr>

'dma_buf_map_attachment()' can not return NULL, so there is no need to
check for it.

Also add a space in order to improve layout.

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
 drivers/gpu/drm/armada/armada_gem.c | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/armada/armada_gem.c b/drivers/gpu/drm/armada/armada_gem.c
index 806791897304..17a77f22b497 100644
--- a/drivers/gpu/drm/armada/armada_gem.c
+++ b/drivers/gpu/drm/armada/armada_gem.c
@@ -594,11 +594,7 @@ int armada_gem_map_import(struct armada_gem_object *dobj)
 	int ret;
 
 	dobj->sgt = dma_buf_map_attachment(dobj->obj.import_attach,
-					  DMA_TO_DEVICE);
-	if (!dobj->sgt) {
-		DRM_ERROR("dma_buf_map_attachment() returned NULL\n");
-		return -EINVAL;
-	}
+					   DMA_TO_DEVICE);
 	if (IS_ERR(dobj->sgt)) {
 		ret = PTR_ERR(dobj->sgt);
 		dobj->sgt = NULL;
-- 
2.9.3

