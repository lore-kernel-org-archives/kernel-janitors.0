From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 16 Jan 2015 10:43:42 +0000
Subject: [patch] drm/tegra: gem: oops in error handling
Message-Id: <20150116104342.GA4860@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Thierry Reding <thierry.reding@gmail.com>
Cc: Alexandre Courbot <gnurou@gmail.com>, Terje =?iso-8859-1?Q?Bergstr=F6m?= <tbergstrom@nvidia.com>, Stephen Warren <swarren@wwwdotorg.org>, kernel-janitors@vger.kernel.org, dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org

kfree(ERR_PTR(-ENOMEM)) will not work very well.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/gpu/drm/tegra/gem.c b/drivers/gpu/drm/tegra/gem.c
index 8777b7f..28215e4 100644
--- a/drivers/gpu/drm/tegra/gem.c
+++ b/drivers/gpu/drm/tegra/gem.c
@@ -244,10 +244,8 @@ static int tegra_bo_get_pages(struct drm_device *drm, struct tegra_bo *bo)
 	for_each_sg(sgt->sgl, s, sgt->nents, i)
 		sg_dma_address(s) = sg_phys(s);
 
-	if (dma_map_sg(drm->dev, sgt->sgl, sgt->nents, DMA_TO_DEVICE) = 0) {
-		sgt = ERR_PTR(-ENOMEM);
+	if (dma_map_sg(drm->dev, sgt->sgl, sgt->nents, DMA_TO_DEVICE) = 0)
 		goto release_sgt;
-	}
 
 	bo->sgt = sgt;
 
@@ -256,6 +254,7 @@ static int tegra_bo_get_pages(struct drm_device *drm, struct tegra_bo *bo)
 release_sgt:
 	sg_free_table(sgt);
 	kfree(sgt);
+	sgt = ERR_PTR(-ENOMEM);
 put_pages:
 	drm_gem_put_pages(&bo->gem, bo->pages, false, false);
 	return PTR_ERR(sgt);
