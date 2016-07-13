From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 13 Jul 2016 10:15:04 +0000
Subject: [patch] drm/rockchip: fix a couple off by one bugs
Message-Id: <20160713101504.GJ29468@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Mark Yao <mark.yao@rock-chips.com>
Cc: linux-rockchip@lists.infradead.org, kernel-janitors@vger.kernel.org, dri-devel@lists.freedesktop.org

The priv->crtc_funcs[] array has ROCKCHIP_MAX_CRTC elements so > should
be >= here.

Fixes: 2048e3286f34 ('drm: rockchip: Add basic drm driver')
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/gpu/drm/rockchip/rockchip_drm_drv.c b/drivers/gpu/drm/rockchip/rockchip_drm_drv.c
index 7fd20c0..37ca427 100644
--- a/drivers/gpu/drm/rockchip/rockchip_drm_drv.c
+++ b/drivers/gpu/drm/rockchip/rockchip_drm_drv.c
@@ -79,7 +79,7 @@ int rockchip_register_crtc_funcs(struct drm_crtc *crtc,
 	int pipe = drm_crtc_index(crtc);
 	struct rockchip_drm_private *priv = crtc->dev->dev_private;
 
-	if (pipe > ROCKCHIP_MAX_CRTC)
+	if (pipe >= ROCKCHIP_MAX_CRTC)
 		return -EINVAL;
 
 	priv->crtc_funcs[pipe] = crtc_funcs;
@@ -92,7 +92,7 @@ void rockchip_unregister_crtc_funcs(struct drm_crtc *crtc)
 	int pipe = drm_crtc_index(crtc);
 	struct rockchip_drm_private *priv = crtc->dev->dev_private;
 
-	if (pipe > ROCKCHIP_MAX_CRTC)
+	if (pipe >= ROCKCHIP_MAX_CRTC)
 		return;
 
 	priv->crtc_funcs[pipe] = NULL;
