From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Date: Sun, 30 Oct 2016 15:50:29 +0000
Subject: [PATCH] drm/tegra: gem: Remove some dead code
Message-Id: <20161030155029.17036-1-christophe.jaillet@wanadoo.fr>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: thierry.reding@gmail.com, airlied@linux.ie, swarren@wwwdotorg.org, gnurou@gmail.com
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Christophe JAILLET <christophe.jaillet@wanadoo.fr>

'dma_buf_map_attachment()' can not return NULL, so there is no need to
check for it.

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
 drivers/gpu/drm/tegra/gem.c | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/drivers/gpu/drm/tegra/gem.c b/drivers/gpu/drm/tegra/gem.c
index 95e622e31931..19bf9cdf1f11 100644
--- a/drivers/gpu/drm/tegra/gem.c
+++ b/drivers/gpu/drm/tegra/gem.c
@@ -318,11 +318,6 @@ static struct tegra_bo *tegra_bo_import(struct drm_device *drm,
 	get_dma_buf(buf);
 
 	bo->sgt = dma_buf_map_attachment(attach, DMA_TO_DEVICE);
-	if (!bo->sgt) {
-		err = -ENOMEM;
-		goto detach;
-	}
-
 	if (IS_ERR(bo->sgt)) {
 		err = PTR_ERR(bo->sgt);
 		goto detach;
-- 
2.9.3

