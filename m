From: Markus Elfring <Markus.Elfring@web.de>
Date: Sat, 12 Oct 2019 09:10:07 +0000
Subject: [PATCH 2/2] drm/imx: Fix error handling for a kmemdup() call in imx_ldb_panel_ddc()
Message-Id: <d35e4483-e310-c5b8-467e-a6a51f49dfef@web.de>
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
Date: Sat, 12 Oct 2019 10:33:47 +0200

The return value from a call of the function “kmemdup” was not checked
in this function implementation. Thus add the corresponding error handling.

This issue was detected by using the Coccinelle software.

Fixes: dc80d7038883feca2abd08975165bc0d83c84762 ("drm/imx-ldb: Add support to drm-bridge")
Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/gpu/drm/imx/imx-ldb.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/imx/imx-ldb.c b/drivers/gpu/drm/imx/imx-ldb.c
index 208069faf183..801a2265dd11 100644
--- a/drivers/gpu/drm/imx/imx-ldb.c
+++ b/drivers/gpu/drm/imx/imx-ldb.c
@@ -569,6 +569,8 @@ static int imx_ldb_panel_ddc(struct device *dev,
 			channel->edid = kmemdup(edidp,
 						channel->edid_len,
 						GFP_KERNEL);
+			if (!channel->edid)
+				return -ENOMEM;
 		} else if (!channel->panel) {
 			/* fallback to display-timings node */
 			ret = of_get_drm_display_mode(child,
--
2.23.0
