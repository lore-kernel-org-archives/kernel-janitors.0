From: Markus Elfring <Markus.Elfring@web.de>
Date: Sat, 21 Sep 2019 18:20:20 +0000
Subject: [PATCH] drm/bridge/synopsys: dsi: Use devm_platform_ioremap_resource() in __dw_mipi_dsi_probe()
Message-Id: <e0d7b7d7-3e89-8b3f-04ed-0b14806e66f7@web.de>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: dri-devel@lists.freedesktop.org, Andrzej Hajda <a.hajda@samsung.com>, Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@linux.ie>, =?UTF-8?Q?Heiko_St=c3=bcbner?= <heiko@sntech.de>, Jernej Skrabec <jernej.skrabec@siol.net>, Jonas Karlman <jonas@kwiboo.se>, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Matt Redfearn <matt.redfearn@thinci.com>, Neil Armstrong <narmstrong@baylibre.com>, Nickey Yang <nickey.yang@rock-chips.com>, Philippe Cornu <philippe.cornu@st.com>, Sam Ravnborg <sam@ravnborg.org>, =?UTF-8?Q?Yannick_Fertr=c3=a9?= <yannick.fertre@st.com>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Sat, 21 Sep 2019 20:04:08 +0200

Simplify this function implementation by using a known wrapper function.

This issue was detected by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c b/drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c
index 675442bfc1bd..6ada149af9ef 100644
--- a/drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c
+++ b/drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c
@@ -981,7 +981,6 @@ __dw_mipi_dsi_probe(struct platform_device *pdev,
 	struct device *dev = &pdev->dev;
 	struct reset_control *apb_rst;
 	struct dw_mipi_dsi *dsi;
-	struct resource *res;
 	int ret;

 	dsi = devm_kzalloc(dev, sizeof(*dsi), GFP_KERNEL);
@@ -997,11 +996,7 @@ __dw_mipi_dsi_probe(struct platform_device *pdev,
 	}

 	if (!plat_data->base) {
-		res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-		if (!res)
-			return ERR_PTR(-ENODEV);
-
-		dsi->base = devm_ioremap_resource(dev, res);
+		dsi->base = devm_platform_ioremap_resource(pdev, 0);
 		if (IS_ERR(dsi->base))
 			return ERR_PTR(-ENODEV);

--
2.23.0
