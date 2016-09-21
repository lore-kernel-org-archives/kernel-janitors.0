From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Wed, 21 Sep 2016 16:48:40 +0000
Subject: [PATCH 07/14] GPU-DRM-OMAP: Rename a jump label in omap_dmm_probe()
Message-Id: <a86a5030-cddf-34c5-97c0-2e8f49fdf2c3@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <566ABCD9.1060404@users.sourceforge.net>
 <0ea38611-3d93-0ade-a1fb-f8cc2e0b8d61@users.sourceforge.net>
In-Reply-To: <0ea38611-3d93-0ade-a1fb-f8cc2e0b8d61@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: dri-devel@lists.freedesktop.org, David Airlie <airlied@linux.ie>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Tomi Valkeinen <tomi.valkeinen@ti.com>
Cc: Julia Lawall <julia.lawall@lip6.fr>, kernel-janitors@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Wed, 21 Sep 2016 17:30:25 +0200

Adjust jump labels according to the current Linux coding style convention.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/gpu/drm/omapdrm/omap_dmm_tiler.c | 25 ++++++++++++-------------
 1 file changed, 12 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/omapdrm/omap_dmm_tiler.c b/drivers/gpu/drm/omapdrm/omap_dmm_tiler.c
index c6a7197..5f6f21b 100644
--- a/drivers/gpu/drm/omapdrm/omap_dmm_tiler.c
+++ b/drivers/gpu/drm/omapdrm/omap_dmm_tiler.c
@@ -624,7 +624,7 @@ static int omap_dmm_probe(struct platform_device *dev)
 
 	omap_dmm = kzalloc(sizeof(*omap_dmm), GFP_KERNEL);
 	if (!omap_dmm)
-		goto fail;
+		goto check_dmm_removal;
 
 	/* initialize lists */
 	INIT_LIST_HEAD(&omap_dmm->alloc_head);
@@ -648,20 +648,20 @@ static int omap_dmm_probe(struct platform_device *dev)
 	mem = platform_get_resource(dev, IORESOURCE_MEM, 0);
 	if (!mem) {
 		dev_err(&dev->dev, "failed to get base address resource\n");
-		goto fail;
+		goto check_dmm_removal;
 	}
 
 	omap_dmm->base = ioremap(mem->start, SZ_2K);
 
 	if (!omap_dmm->base) {
 		dev_err(&dev->dev, "failed to get dmm base address\n");
-		goto fail;
+		goto check_dmm_removal;
 	}
 
 	omap_dmm->irq = platform_get_irq(dev, 0);
 	if (omap_dmm->irq < 0) {
 		dev_err(&dev->dev, "failed to get IRQ resource\n");
-		goto fail;
+		goto check_dmm_removal;
 	}
 
 	omap_dmm->dev = &dev->dev;
@@ -699,7 +699,7 @@ static int omap_dmm_probe(struct platform_device *dev)
 		dev_err(&dev->dev, "couldn't register IRQ %d, error %d\n",
 			omap_dmm->irq, ret);
 		omap_dmm->irq = -1;
-		goto fail;
+		goto check_dmm_removal;
 	}
 
 	/* Enable all interrupts for each refill engine except
@@ -714,13 +714,13 @@ static int omap_dmm_probe(struct platform_device *dev)
 	if (!omap_dmm->dummy_page) {
 		dev_err(&dev->dev, "could not allocate dummy page\n");
 		ret = -ENOMEM;
-		goto fail;
+		goto check_dmm_removal;
 	}
 
 	/* set dma mask for device */
 	ret = dma_set_coherent_mask(&dev->dev, DMA_BIT_MASK(32));
 	if (ret)
-		goto fail;
+		goto check_dmm_removal;
 
 	omap_dmm->dummy_pa = page_to_phys(omap_dmm->dummy_page);
 
@@ -730,7 +730,7 @@ static int omap_dmm_probe(struct platform_device *dev)
 					   &omap_dmm->refill_pa, GFP_KERNEL);
 	if (!omap_dmm->refill_va) {
 		dev_err(&dev->dev, "could not allocate refill memory\n");
-		goto fail;
+		goto check_dmm_removal;
 	}
 
 	/* alloc engines */
@@ -739,7 +739,7 @@ static int omap_dmm_probe(struct platform_device *dev)
 				    GFP_KERNEL);
 	if (!omap_dmm->engines) {
 		ret = -ENOMEM;
-		goto fail;
+		goto check_dmm_removal;
 	}
 
 	for (i = 0; i < omap_dmm->num_engines; i++) {
@@ -758,7 +758,7 @@ static int omap_dmm_probe(struct platform_device *dev)
 				GFP_KERNEL);
 	if (!omap_dmm->tcm) {
 		ret = -ENOMEM;
-		goto fail;
+		goto check_dmm_removal;
 	}
 
 	/* init containers */
@@ -772,7 +772,7 @@ static int omap_dmm_probe(struct platform_device *dev)
 		if (!omap_dmm->tcm[i]) {
 			dev_err(&dev->dev, "failed to allocate container\n");
 			ret = -ENOMEM;
-			goto fail;
+			goto check_dmm_removal;
 		}
 
 		omap_dmm->tcm[i]->lut_id = i;
@@ -812,8 +812,7 @@ static int omap_dmm_probe(struct platform_device *dev)
 	dev_info(omap_dmm->dev, "initialized all PAT entries\n");
 
 	return 0;
-
-fail:
+ check_dmm_removal:
 	if (omap_dmm_remove(dev))
 		dev_err(&dev->dev, "cleanup failed\n");
 	return ret;
-- 
2.10.0

