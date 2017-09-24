From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Date: Sun, 24 Sep 2017 06:01:03 +0000
Subject: [PATCH] drm/omap: Fix error handling path in 'omap_dmm_probe()'
Message-Id: <20170924060103.26604-1-christophe.jaillet@wanadoo.fr>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: tomi.valkeinen@ti.com, airlied@linux.ie
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Christophe JAILLET <christophe.jaillet@wanadoo.fr>

If we don't find a matching device node, we must free the memory allocated
in 'omap_dmm' a few lines above.

Fixes: 7cb0d6c17b96 ("drm/omap: fix TILER on OMAP5")
Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
 drivers/gpu/drm/omapdrm/omap_dmm_tiler.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/omapdrm/omap_dmm_tiler.c b/drivers/gpu/drm/omapdrm/omap_dmm_tiler.c
index 1dd3dafc59af..c60a85e82c6d 100644
--- a/drivers/gpu/drm/omapdrm/omap_dmm_tiler.c
+++ b/drivers/gpu/drm/omapdrm/omap_dmm_tiler.c
@@ -638,7 +638,8 @@ static int omap_dmm_probe(struct platform_device *dev)
 		match = of_match_node(dmm_of_match, dev->dev.of_node);
 		if (!match) {
 			dev_err(&dev->dev, "failed to find matching device node\n");
-			return -ENODEV;
+			ret = -ENODEV;
+			goto fail;
 		}
 
 		omap_dmm->plat_data = match->data;
-- 
2.11.0

