From: Colin King <colin.king@canonical.com>
Date: Tue, 06 Nov 2018 15:40:22 +0000
Subject: [PATCH][drm-next] drm/panel: s6d16d0: fix spelling mistake "enble" -> "enable"
Message-Id: <20181106154022.9209-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Linus Walleij <linus.walleij@linaro.org>, Thierry Reding <thierry.reding@gmail.com>, David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Trivial fix to spelling mistake in DRM_DEV_ERROR error message

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/gpu/drm/panel/panel-samsung-s6d16d0.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/panel/panel-samsung-s6d16d0.c b/drivers/gpu/drm/panel/panel-samsung-s6d16d0.c
index fa8bfa7c492d..33c22ee036f8 100644
--- a/drivers/gpu/drm/panel/panel-samsung-s6d16d0.c
+++ b/drivers/gpu/drm/panel/panel-samsung-s6d16d0.c
@@ -96,7 +96,7 @@ static int s6d16d0_prepare(struct drm_panel *panel)
 	ret = mipi_dsi_dcs_set_tear_on(dsi,
 				       MIPI_DSI_DCS_TEAR_MODE_VBLANK);
 	if (ret) {
-		DRM_DEV_ERROR(s6->dev, "failed to enble vblank TE (%d)\n",
+		DRM_DEV_ERROR(s6->dev, "failed to enable vblank TE (%d)\n",
 			      ret);
 		return ret;
 	}
-- 
2.19.1
