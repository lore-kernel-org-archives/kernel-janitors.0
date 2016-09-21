From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Wed, 21 Sep 2016 16:39:37 +0000
Subject: [PATCH 02/14] GPU-DRM-OMAP: Replace another kmalloc() call by kmalloc_array() in tiler_map_show()
Message-Id: <186b878b-b3a1-f314-c102-d1a230f7f20a@users.sourceforge.net>
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
Date: Wed, 21 Sep 2016 12:54:07 +0200

A multiplication for the size determination of a memory allocation
indicated that an array data structure should be processed.
Thus use the corresponding function "kmalloc_array" at another place.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/gpu/drm/omapdrm/omap_dmm_tiler.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/omapdrm/omap_dmm_tiler.c b/drivers/gpu/drm/omapdrm/omap_dmm_tiler.c
index 7b32dd3..3a4f91b 100644
--- a/drivers/gpu/drm/omapdrm/omap_dmm_tiler.c
+++ b/drivers/gpu/drm/omapdrm/omap_dmm_tiler.c
@@ -918,8 +918,7 @@ int tiler_map_show(struct seq_file *s, void *arg)
 	h_adj = omap_dmm->container_height / ydiv;
 	w_adj = omap_dmm->container_width / xdiv;
 	map = kmalloc_array(h_adj, sizeof(*map), GFP_KERNEL);
-	global_map = kmalloc((w_adj + 1) * h_adj, GFP_KERNEL);
-
+	global_map = kmalloc_array(h_adj, w_adj + 1, GFP_KERNEL);
 	if (!map || !global_map)
 		goto error;
 
-- 
2.10.0

