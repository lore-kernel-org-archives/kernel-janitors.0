From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Date: Fri, 04 Nov 2016 06:13:52 +0000
Subject: [PATCH] drm/sun4i: Propagate error to the caller
Message-Id: <20161104061352.12596-1-christophe.jaillet@wanadoo.fr>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: maxime.ripard@free-electrons.com, wens@csie.org, airlied@linux.ie
Cc: dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Christophe JAILLET <christophe.jaillet@wanadoo.fr>

If 'sun4i_layers_init()' returns an error, propagate it instead of
returning -EINVAL unconditionally.

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
 drivers/gpu/drm/sun4i/sun4i_drv.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/sun4i/sun4i_drv.c b/drivers/gpu/drm/sun4i/sun4i_drv.c
index 628712e6edd6..ee4e5f987b6f 100644
--- a/drivers/gpu/drm/sun4i/sun4i_drv.c
+++ b/drivers/gpu/drm/sun4i/sun4i_drv.c
@@ -145,7 +145,7 @@ static int sun4i_drv_bind(struct device *dev)
 	drv->layers = sun4i_layers_init(drm);
 	if (IS_ERR(drv->layers)) {
 		dev_err(drm->dev, "Couldn't create the planes\n");
-		ret = -EINVAL;
+		ret = PTR_ERR(drv->layers);
 		goto free_drm;
 	}
 
-- 
2.9.3

