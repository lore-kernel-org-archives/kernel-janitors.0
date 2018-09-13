From: Mark Brown <broonie@kernel.org>
Date: Thu, 13 Sep 2018 12:46:32 +0000
Subject: Applied "spi: davinci: remove set but not used variable 'pdata'" to the spi tree
Message-Id: <20180913124632.C26741121CA6@debutante.sirena.org.uk>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

The patch

   spi: davinci: remove set but not used variable 'pdata'

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

From 37a1aa88f98d688a5d9119fbdd1086ae4f171d1d Mon Sep 17 00:00:00 2001
From: YueHaibing <yuehaibing@huawei.com>
Date: Thu, 13 Sep 2018 01:22:01 +0000
Subject: [PATCH] spi: davinci: remove set but not used variable 'pdata'

Fixes gcc '-Wunused-but-set-variable' warning:

drivers/spi/spi-davinci.c: In function 'davinci_spi_setup':
drivers/spi/spi-davinci.c:422:36: warning:
 variable 'pdata' set but not used [-Wunused-but-set-variable]

Signed-off-by: YueHaibing <yuehaibing@huawei.com>
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 drivers/spi/spi-davinci.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/spi/spi-davinci.c b/drivers/spi/spi-davinci.c
index d502cf504deb..ce0e67d4bfb9 100644
--- a/drivers/spi/spi-davinci.c
+++ b/drivers/spi/spi-davinci.c
@@ -419,13 +419,11 @@ static int davinci_spi_setup(struct spi_device *spi)
 {
 	int retval = 0;
 	struct davinci_spi *dspi;
-	struct davinci_spi_platform_data *pdata;
 	struct spi_master *master = spi->master;
 	struct device_node *np = spi->dev.of_node;
 	bool internal_cs = true;
 
 	dspi = spi_master_get_devdata(spi->master);
-	pdata = &dspi->pdata;
 
 	if (!(spi->mode & SPI_NO_CS)) {
 		if (np && (master->cs_gpios != NULL) && (spi->cs_gpio >= 0)) {
-- 
2.19.0.rc2
