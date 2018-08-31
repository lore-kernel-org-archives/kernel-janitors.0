From: Mark Brown <broonie@kernel.org>
Date: Fri, 31 Aug 2018 15:43:16 +0000
Subject: Applied "spi: davinci: remove set but not used variable 'pdata'" to the spi tree
Message-Id: <20180831154316.0576411226FE@debutante.sirena.org.uk>
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

From 6e249d1ec1b4e39bd51b01cdfa3fa05641ca918e Mon Sep 17 00:00:00 2001
From: YueHaibing <yuehaibing@huawei.com>
Date: Thu, 30 Aug 2018 14:01:12 +0000
Subject: [PATCH] spi: davinci: remove set but not used variable 'pdata'

Fixes gcc '-Wunused-but-set-variable' warning:

drivers/spi/spi-davinci.c: In function 'davinci_spi_chipselect':
drivers/spi/spi-davinci.c:211:36: warning:
 variable 'pdata' set but not used [-Wunused-but-set-variable]

Signed-off-by: YueHaibing <yuehaibing@huawei.com>
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 drivers/spi/spi-davinci.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/spi/spi-davinci.c b/drivers/spi/spi-davinci.c
index a02099c90c5c..3dabc20b68a1 100644
--- a/drivers/spi/spi-davinci.c
+++ b/drivers/spi/spi-davinci.c
@@ -208,13 +208,11 @@ static inline void clear_io_bits(void __iomem *addr, u32 bits)
 static void davinci_spi_chipselect(struct spi_device *spi, int value)
 {
 	struct davinci_spi *dspi;
-	struct davinci_spi_platform_data *pdata;
 	struct davinci_spi_config *spicfg = spi->controller_data;
 	u8 chip_sel = spi->chip_select;
 	u16 spidat1 = CS_DEFAULT;
 
 	dspi = spi_master_get_devdata(spi->master);
-	pdata = &dspi->pdata;
 
 	/* program delay transfers if tx_delay is non zero */
 	if (spicfg && spicfg->wdelay)
-- 
2.19.0.rc1
