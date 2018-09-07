From: Mark Brown <broonie@kernel.org>
Date: Fri, 07 Sep 2018 16:09:08 +0000
Subject: Applied "spi: pl022: Remove set but not used variable 'chip'" to the spi tree
Message-Id: <20180907160908.454F81122A6D@debutante.sirena.org.uk>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

The patch

   spi: pl022: Remove set but not used variable 'chip'

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

From b9e49520c1144cb4109ec6ed1fa76c326da850d0 Mon Sep 17 00:00:00 2001
From: YueHaibing <yuehaibing@huawei.com>
Date: Fri, 7 Sep 2018 02:19:16 +0000
Subject: [PATCH] spi: pl022: Remove set but not used variable 'chip'

Fixes gcc '-Wunused-but-set-variable' warning:

drivers/spi/spi-pl022.c: In function 'do_polling_transfer':
drivers/spi/spi-pl022.c:1493:20: warning:
 variable 'chip' set but not used [-Wunused-but-set-variable]

Signed-off-by: YueHaibing <yuehaibing@huawei.com>
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 drivers/spi/spi-pl022.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/spi/spi-pl022.c b/drivers/spi/spi-pl022.c
index 5f5f197b153c..6120e6abcd96 100644
--- a/drivers/spi/spi-pl022.c
+++ b/drivers/spi/spi-pl022.c
@@ -1490,10 +1490,8 @@ static void do_polling_transfer(struct pl022 *pl022)
 	struct spi_message *message = NULL;
 	struct spi_transfer *transfer = NULL;
 	struct spi_transfer *previous = NULL;
-	struct chip_data *chip;
 	unsigned long time, timeout;
 
-	chip = pl022->cur_chip;
 	message = pl022->cur_msg;
 
 	while (message->state != STATE_DONE) {
-- 
2.19.0.rc1
