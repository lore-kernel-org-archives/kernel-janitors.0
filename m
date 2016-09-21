From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Wed, 21 Sep 2016 16:40:46 +0000
Subject: [PATCH 03/14] GPU-DRM-OMAP: Less function calls in tiler_map_show() after error detection
Message-Id: <0818f5f2-2acc-cadd-2a60-44f424cd6149@users.sourceforge.net>
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
Date: Wed, 21 Sep 2016 13:16:20 +0200

The kfree() function was called in up to two cases
by the tiler_map_show() function during error handling even if
the passed variable contained a null pointer.

* Adjust jump targets according to the Linux coding style convention.

* Split a condition check for memory allocation failures so that
  each pointer from these function calls will be checked immediately.

  See also background information:
  Topic "CWE-754: Improper check for unusual or exceptional conditions"
  Link: https://cwe.mitre.org/data/definitions/754.html

* Return directly after a call of the function "kmalloc_array" failed
  at the beginning.

* Move an assignment for the local variable "w_adj" behind the first
  memory allocation.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/gpu/drm/omapdrm/omap_dmm_tiler.c | 14 ++++++++------
 1 file changed, 8 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/omapdrm/omap_dmm_tiler.c b/drivers/gpu/drm/omapdrm/omap_dmm_tiler.c
index 3a4f91b..60beeb9 100644
--- a/drivers/gpu/drm/omapdrm/omap_dmm_tiler.c
+++ b/drivers/gpu/drm/omapdrm/omap_dmm_tiler.c
@@ -916,11 +916,14 @@ int tiler_map_show(struct seq_file *s, void *arg)
 	}
 
 	h_adj = omap_dmm->container_height / ydiv;
-	w_adj = omap_dmm->container_width / xdiv;
 	map = kmalloc_array(h_adj, sizeof(*map), GFP_KERNEL);
+	if (!map)
+		return 0;
+
+	w_adj = omap_dmm->container_width / xdiv;
 	global_map = kmalloc_array(h_adj, w_adj + 1, GFP_KERNEL);
-	if (!map || !global_map)
-		goto error;
+	if (!global_map)
+		goto free_map;
 
 	for (lut_idx = 0; lut_idx < omap_dmm->num_lut; lut_idx++) {
 		memset(map, 0, h_adj * sizeof(*map));
@@ -982,10 +985,9 @@ int tiler_map_show(struct seq_file *s, void *arg)
 		}
 	}
 
-error:
-	kfree(map);
 	kfree(global_map);
-
+ free_map:
+	kfree(map);
 	return 0;
 }
 #endif
-- 
2.10.0

