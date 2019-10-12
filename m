From: Markus Elfring <Markus.Elfring@web.de>
Date: Sat, 12 Oct 2019 09:07:43 +0000
Subject: [PATCH 1/2] drm/imx: Fix error handling for a kmemdup() call in imx_pd_bind()
Message-Id: <3fd6aa8b-2529-7ff5-3e19-05267101b2a4@web.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20191004190938.15353-1-navid.emamdoost@gmail.com>
 <540321eb-7699-1d51-59d5-dde5ffcb8fc4@web.de>
 <CAEkB2ETtVwtmkpup65D3wqyLn=84ZHt0QRo0dJK5GsV=-L=qVw@mail.gmail.com>
 <2abf545b-023b-853a-95ef-ce99e1896a5d@web.de>
In-Reply-To: <2abf545b-023b-853a-95ef-ce99e1896a5d@web.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: dri-devel@lists.freedesktop.org, kernel@pengutronix.de, linux-arm-kernel@lists.infradead.org, linux-imx@nxp.com, Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@linux.ie>, Fabio Estevam <festevam@gmail.com>, Philipp Zabel <p.zabel@pengutronix.de>, Sascha Hauer <s.hauer@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>, Navid Emamdoost <navid.emamdoost@gmail.com>, Peter Senna Tschudin <peter.senna@collabora.com>
Cc: Rob Herring <robh@kernel.org>, kernel-janitors@vger.kernel.org, Kangjie Lu <kjlu@umn.edu>, LKML <linux-kernel@vger.kernel.org>, Thierry Reding <thierry.reding@gmail.com>, Stephen McCamant <smccaman@umn.edu>, Navid Emamdoost <emamd001@umn.edu>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Sat, 12 Oct 2019 10:30:21 +0200

The return value from a call of the function “kmemdup” was not checked
in this function implementation. Thus add the corresponding error handling.

Fixes: 19022aaae677dfa171a719e9d1ff04823ce65a65 ("staging: drm/imx: Add parallel display support")
Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/gpu/drm/imx/parallel-display.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/imx/parallel-display.c b/drivers/gpu/drm/imx/parallel-display.c
index 35518e5de356..39c4798f56b6 100644
--- a/drivers/gpu/drm/imx/parallel-display.c
+++ b/drivers/gpu/drm/imx/parallel-display.c
@@ -210,8 +210,13 @@ static int imx_pd_bind(struct device *dev, struct device *master, void *data)
 		return -ENOMEM;

 	edidp = of_get_property(np, "edid", &imxpd->edid_len);
-	if (edidp)
+	if (edidp) {
 		imxpd->edid = kmemdup(edidp, imxpd->edid_len, GFP_KERNEL);
+		if (!imxpd->edid) {
+			devm_kfree(dev, imxpd);
+			return -ENOMEM;
+		}
+	}

 	ret = of_property_read_string(np, "interface-pix-fmt", &fmt);
 	if (!ret) {
--
2.23.0
