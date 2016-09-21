From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Wed, 21 Sep 2016 16:53:12 +0000
Subject: [PATCH 11/14] GPU-DRM-OMAP: Replace a kzalloc() call by kcalloc() in omap_gem_attach_pages()
Message-Id: <cd114982-dfba-df3d-723c-7ff8c89be558@users.sourceforge.net>
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
Date: Wed, 21 Sep 2016 17:40:20 +0200

The script "checkpatch.pl" can point information out like the following.

WARNING: Prefer kcalloc over kzalloc with multiply

Thus fix the affected source code place.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/gpu/drm/omapdrm/omap_gem.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/omapdrm/omap_gem.c b/drivers/gpu/drm/omapdrm/omap_gem.c
index e4f1924..26f1212 100644
--- a/drivers/gpu/drm/omapdrm/omap_gem.c
+++ b/drivers/gpu/drm/omapdrm/omap_gem.c
@@ -283,7 +283,7 @@ static int omap_gem_attach_pages(struct drm_gem_object *obj)
 			}
 		}
 	} else {
-		addrs = kzalloc(npages * sizeof(*addrs), GFP_KERNEL);
+		addrs = kcalloc(npages, sizeof(*addrs), GFP_KERNEL);
 		if (!addrs) {
 			ret = -ENOMEM;
 			goto free_pages;
-- 
2.10.0

