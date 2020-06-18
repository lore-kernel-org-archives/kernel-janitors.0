From: Wei Yongjun <weiyongjun1@huawei.com>
Date: Thu, 18 Jun 2020 13:46:50 +0000
Subject: [PATCH] drm/panel: otm8009a: Drop unnessary backlight_device_unregister()
Message-Id: <20200618134650.44311-1-weiyongjun1@huawei.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>, David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, Philippe CORNU <philippe.cornu@st.com>
Cc: kernel-janitors@vger.kernel.org, Wei Yongjun <weiyongjun1@huawei.com>, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, Hulk Robot <hulkci@huawei.com>

It's not necessary to unregister backlight device which
registered with devm_backlight_device_register().

Fixes: 12a6cbd4f3f1 ("drm/panel: otm8009a: Use new backlight API")
Reported-by: Hulk Robot <hulkci@huawei.com>
Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
---
 drivers/gpu/drm/panel/panel-orisetech-otm8009a.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpu/drm/panel/panel-orisetech-otm8009a.c b/drivers/gpu/drm/panel/panel-orisetech-otm8009a.c
index 895ee3d1371e..d956522f32ee 100644
--- a/drivers/gpu/drm/panel/panel-orisetech-otm8009a.c
+++ b/drivers/gpu/drm/panel/panel-orisetech-otm8009a.c
@@ -479,7 +479,6 @@ static int otm8009a_probe(struct mipi_dsi_device *dsi)
 	if (ret < 0) {
 		dev_err(dev, "mipi_dsi_attach failed. Is host ready?\n");
 		drm_panel_remove(&ctx->panel);
-		backlight_device_unregister(ctx->bl_dev);
 		return ret;
 	}
