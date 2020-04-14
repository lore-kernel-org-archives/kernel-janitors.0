From: Mark Brown <broonie@kernel.org>
Date: Tue, 14 Apr 2020 11:40:08 +0000
Subject: Applied "spi: sc18is602: Fix a typo in MODULE_DESCRIPTION" to the spi tree
Message-Id: <applied-20200413154043.23064-1-christophe.jaillet@wanadoo.fr>
List-Id: <kernel-janitors.vger.kernel.org>
In-Reply-To: <20200413154043.23064-1-christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: broonie@kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, linux-spi@vger.kernel.orgMark Brown <broonie@kernel.org>

The patch

   spi: sc18is602: Fix a typo in MODULE_DESCRIPTION

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

From 6d75145bf6b6558dea5ce3b4f83f3f66444bcac0 Mon Sep 17 00:00:00 2001
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Date: Mon, 13 Apr 2020 17:40:43 +0200
Subject: [PATCH] spi: sc18is602: Fix a typo in MODULE_DESCRIPTION

This should be 'SC18IS602', not 'SC18IC602'

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Link: https://lore.kernel.org/r/20200413154043.23064-1-christophe.jaillet@wanadoo.fr
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 drivers/spi/spi-sc18is602.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/spi/spi-sc18is602.c b/drivers/spi/spi-sc18is602.c
index 5497eeb3bf3e..ee0f3edf49cd 100644
--- a/drivers/spi/spi-sc18is602.c
+++ b/drivers/spi/spi-sc18is602.c
@@ -345,6 +345,6 @@ static struct i2c_driver sc18is602_driver = {
 
 module_i2c_driver(sc18is602_driver);
 
-MODULE_DESCRIPTION("SC18IC602/603 SPI Master Driver");
+MODULE_DESCRIPTION("SC18IS602/603 SPI Master Driver");
 MODULE_AUTHOR("Guenter Roeck");
 MODULE_LICENSE("GPL");
-- 
2.20.1
