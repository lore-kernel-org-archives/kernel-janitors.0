From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Wed, 21 Sep 2016 16:38:12 +0000
Subject: [PATCH 01/14] GPU-DRM-OMAP: Use kmalloc_array() in tiler_map_show()
Message-Id: <1e833599-303e-0ff0-30c8-7b7ee08f8b4f@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <566ABCD9.1060404@users.sourceforge.net>
 <0ea38611-3d93-0ade-a1fb-f8cc2e0b8d61@users.sourceforge.net>
In-Reply-To: <0ea38611-3d93-0ade-a1fb-f8cc2e0b8d61@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: dri-devel@lists.freedesktop.org, David Airlie <airlied@linux.ie>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Tomi Valkeinen <tomi.valkeinen@ti.com>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org, Julia Lawall <julia.lawall@lip6.fr>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Wed, 21 Sep 2016 12:23:46 +0200

A multiplication for the size determination of a memory allocation
indicated that an array data structure should be processed.
Thus use the corresponding function "kmalloc_array".

This issue was detected by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/gpu/drm/omapdrm/omap_dmm_tiler.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/omapdrm/omap_dmm_tiler.c b/drivers/gpu/drm/omapdrm/omap_dmm_tiler.c
index 4ceed7a9..7b32dd3 100644
--- a/drivers/gpu/drm/omapdrm/omap_dmm_tiler.c
+++ b/drivers/gpu/drm/omapdrm/omap_dmm_tiler.c
@@ -917,8 +917,7 @@ int tiler_map_show(struct seq_file *s, void *arg)
 
 	h_adj = omap_dmm->container_height / ydiv;
 	w_adj = omap_dmm->container_width / xdiv;
-
-	map = kmalloc(h_adj * sizeof(*map), GFP_KERNEL);
+	map = kmalloc_array(h_adj, sizeof(*map), GFP_KERNEL);
 	global_map = kmalloc((w_adj + 1) * h_adj, GFP_KERNEL);
 
 	if (!map || !global_map)
-- 
2.10.0

