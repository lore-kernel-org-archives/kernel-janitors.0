From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Mon, 25 Sep 2017 10:21:33 +0000
Subject: [PATCH] spi: sprd-adi: checking for NULL instead of IS_ERR()
Message-Id: <20170925102133.4kef3fesnh3v3ixe@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Baolin Wang <baolin.wang-lxIno14LUO0EEoCn2XhGlw@public.gmane.org>
Cc: linux-spi-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, kernel-janitors-u79uwXL29TY76Z2rM5mHXA@public.gmane.org

devm_ioremap_resource() returns error pointers, it never returns NULL.

Fixes: 7e2903cb91df ("spi: Add ADI driver for Spreadtrum platform")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/spi/spi-sprd-adi.c b/drivers/spi/spi-sprd-adi.c
index 0d481f8a46c2..bff6ef1caad7 100644
--- a/drivers/spi/spi-sprd-adi.c
+++ b/drivers/spi/spi-sprd-adi.c
@@ -341,8 +341,8 @@ static int sprd_adi_probe(struct platform_device *pdev)
 
 	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
 	sadi->base = devm_ioremap_resource(&pdev->dev, res);
-	if (!sadi->base) {
-		ret = -ENOMEM;
+	if (IS_ERR(sadi->base)) {
+		ret = PTR_ERR(sadi->base);
 		goto put_ctlr;
 	}
 
