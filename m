From: Mark Brown <broonie@kernel.org>
Date: Mon, 25 Sep 2017 16:16:40 +0000
Subject: Applied "spi: sprd-adi: checking for NULL instead of IS_ERR()" to the spi tree
Message-Id: <20170925161640.0D23644005B@finisterre.ee.mobilebroadband>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170925102133.4kef3fesnh3v3ixe@mwanda>
In-Reply-To: <20170925102133.4kef3fesnh3v3ixe@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter-QHcLZuEGTsvQT0dZR+AlfA@public.gmane.org>
Cc: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Baolin Wang <baolin.wang-lxIno14LUO0EEoCn2XhGlw@public.gmane.org>, linux-spi-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, kernel-janitors-u79uwXL29TY76Z2rM5mHXA@public.gmane.orglinux-spi-u79uwXL29TY76Z2rM5mHXA@public.gmane.org

The patch

   spi: sprd-adi: checking for NULL instead of IS_ERR()

has been applied to the spi tree at

   git://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git 

All being well this means that it will be integrated into the linux-next
tree (usually sometime in the next 24 hours) and sent to Linus during
the next merge window (or sooner if it is a bug fix), however if
problems are discovered then the patch may be dropped or reverted.  

You may get further e-mails resulting from automated or manual testing
and review of the tree, please engage with people reporting problems and
send followup patches addressing any issues that are reported if needed.

If any updates are required or you are submitting further changes they
should be sent as incremental updates against current git, existing
patches will not be replaced.

Please add any relevant lists and maintainers to the CCs when replying
to this mail.

Thanks,
Mark

From 04063a011f2f35c37e1146c736e6d4ad402a8557 Mon Sep 17 00:00:00 2001
From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Mon, 25 Sep 2017 13:21:33 +0300
Subject: [PATCH] spi: sprd-adi: checking for NULL instead of IS_ERR()

devm_ioremap_resource() returns error pointers, it never returns NULL.

Fixes: 7e2903cb91df ("spi: Add ADI driver for Spreadtrum platform")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 drivers/spi/spi-sprd-adi.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

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
 
-- 
2.14.1

