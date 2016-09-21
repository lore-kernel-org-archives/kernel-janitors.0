From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Wed, 21 Sep 2016 16:47:43 +0000
Subject: [PATCH 06/14] GPU-DRM-OMAP: Improve a size determination in omap_dmm_probe()
Message-Id: <53794942-5588-5db7-fcff-5f6f27b2e1f4@users.sourceforge.net>
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
Date: Wed, 21 Sep 2016 17:21:57 +0200

Replace the specification of a data structure by a pointer dereference
as the parameter for the operator "sizeof" to make the corresponding size
determination a bit safer according to the Linux coding style convention.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/gpu/drm/omapdrm/omap_dmm_tiler.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/omapdrm/omap_dmm_tiler.c b/drivers/gpu/drm/omapdrm/omap_dmm_tiler.c
index f110965..c6a7197 100644
--- a/drivers/gpu/drm/omapdrm/omap_dmm_tiler.c
+++ b/drivers/gpu/drm/omapdrm/omap_dmm_tiler.c
@@ -735,7 +735,8 @@ static int omap_dmm_probe(struct platform_device *dev)
 
 	/* alloc engines */
 	omap_dmm->engines = kcalloc(omap_dmm->num_engines,
-				    sizeof(struct refill_engine), GFP_KERNEL);
+				    sizeof(*omap_dmm->engines),
+				    GFP_KERNEL);
 	if (!omap_dmm->engines) {
 		ret = -ENOMEM;
 		goto fail;
-- 
2.10.0

