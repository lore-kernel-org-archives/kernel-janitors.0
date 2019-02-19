From: Colin King <colin.king@canonical.com>
Date: Tue, 19 Feb 2019 12:10:42 +0000
Subject: [PATCH] drm/imx: fix resource leak of struct drm_display_mode mode
Message-Id: <20190219121042.6584-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>, dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Currently when the call to of_get_drm_display_mode fails the error return
path does not free an earlier allocated struct drm_display_mode, causing
a memory leak. Fix this by kfree'ing mode before returning.

Fixes: 76ecd9c9fb24 ("drm/imx: parallel-display: check return code from of_get_drm_display_mode()")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/gpu/drm/imx/parallel-display.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/imx/parallel-display.c b/drivers/gpu/drm/imx/parallel-display.c
index 1a76de1e8e7b..10eb70577f76 100644
--- a/drivers/gpu/drm/imx/parallel-display.c
+++ b/drivers/gpu/drm/imx/parallel-display.c
@@ -69,8 +69,10 @@ static int imx_pd_connector_get_modes(struct drm_connector *connector)
 		ret = of_get_drm_display_mode(np, &imxpd->mode,
 					      &imxpd->bus_flags,
 					      OF_USE_NATIVE_MODE);
-		if (ret)
+		if (ret) {
+			kfree(mode);
 			return ret;
+		}
 
 		drm_mode_copy(mode, &imxpd->mode);
 		mode->type |= DRM_MODE_TYPE_DRIVER | DRM_MODE_TYPE_PREFERRED,
-- 
2.20.1
