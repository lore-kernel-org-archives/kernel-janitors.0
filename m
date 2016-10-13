From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 13 Oct 2016 08:53:21 +0000
Subject: [patch] drm/imx: drm_dev_alloc() returns error pointers
Message-Id: <20161013085321.GG16198@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Philipp Zabel <p.zabel@pengutronix.de>, Lucas Stach <l.stach@pengutronix.de>
Cc: kernel-janitors@vger.kernel.org, dri-devel@lists.freedesktop.org

We are checking for NULL here, when we should be checking for error
pointers.

Fixes: 54db5decce17 ("drm/imx: drop deprecated load/unload drm_driver ops")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/gpu/drm/imx/imx-drm-core.c b/drivers/gpu/drm/imx/imx-drm-core.c
index 98df09c..3acc976 100644
--- a/drivers/gpu/drm/imx/imx-drm-core.c
+++ b/drivers/gpu/drm/imx/imx-drm-core.c
@@ -357,8 +357,8 @@ static int imx_drm_bind(struct device *dev)
 	int ret;
 
 	drm = drm_dev_alloc(&imx_drm_driver, dev);
-	if (!drm)
-		return -ENOMEM;
+	if (IS_ERR(drm))
+		return PTR_ERR(drm);
 
 	imxdrm = devm_kzalloc(dev, sizeof(*imxdrm), GFP_KERNEL);
 	if (!imxdrm) {
