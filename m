From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Mon, 25 Sep 2017 10:25:20 +0000
Subject: [PATCH] drm/tve200: Check for IS_ERR instead of NULL in probe
Message-Id: <20170925102520.a7spymwqqbsczzz2@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Linus Walleij <linus.walleij@linaro.org>
Cc: David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org, kernel-janitors@vger.kernel.org

devm_ioremap_resource() returns error pointer, it never returns NULL on
error.

Fixes: 179c02fe90a4 ("drm/tve200: Add new driver for TVE200")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/gpu/drm/tve200/tve200_drv.c b/drivers/gpu/drm/tve200/tve200_drv.c
index eae38b669f0a..6939f7455a2d 100644
--- a/drivers/gpu/drm/tve200/tve200_drv.c
+++ b/drivers/gpu/drm/tve200/tve200_drv.c
@@ -225,7 +225,7 @@ static int tve200_probe(struct platform_device *pdev)
 
 	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
 	priv->regs = devm_ioremap_resource(dev, res);
-	if (!priv->regs) {
+	if (IS_ERR(priv->regs)) {
 		dev_err(dev, "%s failed mmio\n", __func__);
 		ret = -EINVAL;
 		goto clk_disable;
