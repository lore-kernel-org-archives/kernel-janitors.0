From: Markus Elfring <Markus.Elfring@web.de>
Date: Sun, 05 Apr 2020 09:16:42 +0000
Subject: [PATCH] drm/imx: imx-tve: Delete an error message in imx_tve_bind()
Message-Id: <eb87043b-1881-da68-ba28-35406b6594ed@web.de>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, linux-imx@nxp.com, kernel@pengutronix.de, Fabio Estevam <festevam@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@linux.ie>, Philipp Zabel <p.zabel@pengutronix.de>, Sascha Hauer <s.hauer@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>
Cc: kernel-janitors@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Tang Bin <tangbin@cmss.chinamobile.com>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Sun, 5 Apr 2020 11:01:49 +0200

The function “platform_get_irq” can log an error already.
Thus omit a redundant message for the exception handling in the
calling function.

This issue was detected by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/gpu/drm/imx/imx-tve.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/imx/imx-tve.c b/drivers/gpu/drm/imx/imx-tve.c
index 5bbfaa2cd0f4..23adbb818d92 100644
--- a/drivers/gpu/drm/imx/imx-tve.c
+++ b/drivers/gpu/drm/imx/imx-tve.c
@@ -598,10 +598,8 @@ static int imx_tve_bind(struct device *dev, struct device *master, void *data)
 	}

 	irq = platform_get_irq(pdev, 0);
-	if (irq < 0) {
-		dev_err(dev, "failed to get irq\n");
+	if (irq < 0)
 		return irq;
-	}

 	ret = devm_request_threaded_irq(dev, irq, NULL,
 					imx_tve_irq_handler, IRQF_ONESHOT,
--
2.26.0
