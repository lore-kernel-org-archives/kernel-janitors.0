From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Date: Fri, 01 May 2020 12:55:11 +0000
Subject: [PATCH] drm/stm: Fix an error handling path in 'stm_drm_platform_probe()'
Message-Id: <20200501125511.132029-1-christophe.jaillet@wanadoo.fr>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: yannick.fertre@st.com, philippe.cornu@st.com, benjamin.gaignard@linaro.org, vincent.abriou@st.com, airlied@linux.ie, daniel@ffwll.ch, mcoquelin.stm32@gmail.com, alexandre.torgue@st.com, eric@anholt.net, narmstrong@baylibre.com
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, Christophe JAILLET <christophe.jaillet@wanadoo.fr>, linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org

If 'drm_dev_register()' fails, a call to 'drv_load()' must be undone, as
already done in the remove function.

Fixes: b759012c5fa7 ("drm/stm: Add STM32 LTDC driver")
Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
 drivers/gpu/drm/stm/drv.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/stm/drv.c b/drivers/gpu/drm/stm/drv.c
index ea9fcbdc68b3..9a66e350abd5 100644
--- a/drivers/gpu/drm/stm/drv.c
+++ b/drivers/gpu/drm/stm/drv.c
@@ -206,12 +206,14 @@ static int stm_drm_platform_probe(struct platform_device *pdev)
 
 	ret = drm_dev_register(ddev, 0);
 	if (ret)
-		goto err_put;
+		goto err_unload;
 
 	drm_fbdev_generic_setup(ddev, 16);
 
 	return 0;
 
+err_unload:
+	drv_unload(ddev);
 err_put:
 	drm_dev_put(ddev);
 
-- 
2.25.1
