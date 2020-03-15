From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Date: Sun, 15 Mar 2020 19:42:39 +0000
Subject: [PATCH] drm/msm: Fix an error handling path 'msm_drm_init()'
Message-Id: <20200315194239.28785-1-christophe.jaillet@wanadoo.fr>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: robdclark@gmail.com, sean@poorly.run, airlied@linux.ie, daniel@ffwll.ch, dianders@chromium.org
Cc: linux-arm-msm@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, Christophe JAILLET <christophe.jaillet@wanadoo.fr>, freedreno@lists.freedesktop.org

If this memory allocation fails, we have to go through the error handling
path to perform some clean-up, as already done in other other paths of
this function.

Fixes: db735fc4036b ("drm/msm: Set dma maximum segment size for mdss")
Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
 drivers/gpu/drm/msm/msm_drv.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
index 2a82c23a6e4d..29295dee2a2e 100644
--- a/drivers/gpu/drm/msm/msm_drv.c
+++ b/drivers/gpu/drm/msm/msm_drv.c
@@ -444,8 +444,10 @@ static int msm_drm_init(struct device *dev, struct drm_driver *drv)
 	if (!dev->dma_parms) {
 		dev->dma_parms = devm_kzalloc(dev, sizeof(*dev->dma_parms),
 					      GFP_KERNEL);
-		if (!dev->dma_parms)
-			return -ENOMEM;
+		if (!dev->dma_parms) {
+			ret = -ENOMEM;
+			goto err_msm_uninit;
+		}
 	}
 	dma_set_max_seg_size(dev, DMA_BIT_MASK(32));
 
-- 
2.20.1
