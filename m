From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Date: Mon, 12 Mar 2018 20:15:08 +0000
Subject: [PATCH 1/3] drm/meson: Fix an un-handled error path in 'meson_drv_bind_master()'
Message-Id: <6cbf3d70ac3904489c7194c895225c4103aebb96.1520885192.git.christophe.jaillet@wanadoo.fr>
List-Id: <kernel-janitors.vger.kernel.org>
References: <cover.1520885192.git.christophe.jaillet@wanadoo.fr>
In-Reply-To: <cover.1520885192.git.christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: narmstrong@baylibre.com, airlied@linux.ie, carlo@caione.org, khilman@baylibre.com
Cc: dri-devel@lists.freedesktop.org, linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Christophe JAILLET <christophe.jaillet@wanadoo.fr>

'drm_vblank_init()' can fail. So handle this (unlikely) error.

Fixes: bbbe775ec5b5 ("drm: Add support for Amlogic Meson Graphic Controller")
Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
 drivers/gpu/drm/meson/meson_drv.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/meson/meson_drv.c b/drivers/gpu/drm/meson/meson_drv.c
index f9ad0e960263..02b0886debc0 100644
--- a/drivers/gpu/drm/meson/meson_drv.c
+++ b/drivers/gpu/drm/meson/meson_drv.c
@@ -222,7 +222,10 @@ static int meson_drv_bind_master(struct device *dev, bool has_components)
 
 	priv->vsync_irq = platform_get_irq(pdev, 0);
 
-	drm_vblank_init(drm, 1);
+	ret = drm_vblank_init(drm, 1);
+	if (ret)
+		goto free_drm;
+
 	drm_mode_config_init(drm);
 	drm->mode_config.max_width = 3840;
 	drm->mode_config.max_height = 2160;
-- 
2.14.1


---
L'absence de virus dans ce courrier électronique a été vérifiée par le logiciel antivirus Avast.
https://www.avast.com/antivirus

