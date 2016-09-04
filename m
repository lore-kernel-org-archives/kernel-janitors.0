From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Date: Sun, 04 Sep 2016 06:45:23 +0000
Subject: [PATCH] drm/imx: Fix of_node ref counting
Message-Id: <1472971523-4143-1-git-send-email-christophe.jaillet@wanadoo.fr>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: p.zabel@pengutronix.de, airlied@linux.ie
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Christophe JAILLET <christophe.jaillet@wanadoo.fr>

This code is spurious.
It takes a ref on a node, then call 'of_node_put' on it and then store
this node somewhere.

It is likely that taking the ref on the parent node and releasing the child
node was expected instead.

So, use 'of_get_next_parent' instead. It does all this in just one
function call.

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
Un-tested
---
 drivers/gpu/drm/imx/imx-drm-core.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/imx/imx-drm-core.c b/drivers/gpu/drm/imx/imx-drm-core.c
index 438bac8fbc2b..60fb388c80f8 100644
--- a/drivers/gpu/drm/imx/imx-drm-core.c
+++ b/drivers/gpu/drm/imx/imx-drm-core.c
@@ -449,10 +449,8 @@ static int compare_of(struct device *dev, void *data)
 	}
 
 	/* Special case for LDB, one device for two channels */
-	if (of_node_cmp(np->name, "lvds-channel") = 0) {
-		np = of_get_parent(np);
-		of_node_put(np);
-	}
+	if (of_node_cmp(np->name, "lvds-channel") = 0)
+		np = of_get_next_parent(np);
 
 	return dev->of_node = np;
 }
-- 
2.7.4

