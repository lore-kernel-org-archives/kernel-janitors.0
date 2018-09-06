From: Mark Brown <broonie@kernel.org>
Date: Thu, 06 Sep 2018 10:51:07 +0000
Subject: Applied "spi: spi-gpio: Remove set but not used variable 'pdata'" to the spi tree
Message-Id: <20180906105107.83F871122A1F@debutante.sirena.org.uk>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

The patch

   spi: spi-gpio: Remove set but not used variable 'pdata'

has been applied to the spi tree at

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git 

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

From 48c29d0d27fbbb4c78d3c14c50067d7e8919ed95 Mon Sep 17 00:00:00 2001
From: YueHaibing <yuehaibing@huawei.com>
Date: Thu, 6 Sep 2018 01:38:45 +0000
Subject: [PATCH] spi: spi-gpio: Remove set but not used variable 'pdata'

Fixes gcc '-Wunused-but-set-variable' warning:

drivers/spi/spi-gpio.c: In function 'spi_gpio_remove':
drivers/spi/spi-gpio.c:450:33: warning:
 variable 'pdata' set but not used [-Wunused-but-set-variable]

Signed-off-by: YueHaibing <yuehaibing@huawei.com>
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 drivers/spi/spi-gpio.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/spi/spi-gpio.c b/drivers/spi/spi-gpio.c
index 0626e6e3ea0c..d0c6d71b6c0f 100644
--- a/drivers/spi/spi-gpio.c
+++ b/drivers/spi/spi-gpio.c
@@ -447,10 +447,8 @@ static int spi_gpio_probe(struct platform_device *pdev)
 static int spi_gpio_remove(struct platform_device *pdev)
 {
 	struct spi_gpio			*spi_gpio;
-	struct spi_gpio_platform_data	*pdata;
 
 	spi_gpio = platform_get_drvdata(pdev);
-	pdata = dev_get_platdata(&pdev->dev);
 
 	/* stop() unregisters child devices too */
 	spi_bitbang_stop(&spi_gpio->bitbang);
-- 
2.19.0.rc1
