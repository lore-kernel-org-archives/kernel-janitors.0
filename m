From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 12 Jul 2017 07:52:28 +0000
Subject: [PATCH] drm: shmobile: checking for NULL instead if IS_ERR()
Message-Id: <20170712075228.tlowlv3xo3uyhhzk@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: linux-renesas-soc@vger.kernel.org, kernel-janitors@vger.kernel.org, dri-devel@lists.freedesktop.org

We changed from ioremap_nocache() to devm_ioremap_resource() so the
check needs to be changed from checking for NULL to checking for error
pointers.

Fixes: 16ad3b2ce8dd ("drm/shmobile: Use devm_* managed functions")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/gpu/drm/shmobile/shmob_drm_drv.c b/drivers/gpu/drm/shmobile/shmob_drm_drv.c
index 800d1d2c435d..6bd777a3dc17 100644
--- a/drivers/gpu/drm/shmobile/shmob_drm_drv.c
+++ b/drivers/gpu/drm/shmobile/shmob_drm_drv.c
@@ -235,8 +235,8 @@ static int shmob_drm_probe(struct platform_device *pdev)
 
 	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
 	sdev->mmio = devm_ioremap_resource(&pdev->dev, res);
-	if (sdev->mmio = NULL)
-		return -ENOMEM;
+	if (IS_ERR(sdev->mmio))
+		return PTR_ERR(sdev->mmio);
 
 	ret = shmob_drm_setup_clocks(sdev, pdata->clk_source);
 	if (ret < 0)
