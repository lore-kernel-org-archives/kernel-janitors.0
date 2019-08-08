From: Mark Brown <broonie@kernel.org>
Date: Thu, 08 Aug 2019 20:33:49 +0000
Subject: Applied "regulator: slg51000: Fix a couple NULL vs IS_ERR() checks" to the regulator tree
Message-Id: <20190808203349.8CD7D2742B42@ypsilon.sirena.org.uk>
List-Id: <kernel-janitors.vger.kernel.org>
In-Reply-To: <20190808103335.GD30506@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Eric Jeong <eric.jeong.opensource@diasemi.com>, kernel-janitors@vger.kernel.org, Liam Girdwood <lgirdwood@gmail.com>, linux-kernel@vger.kernel.org, Mark Brown <broonie@kernel.org>, Support Opensource <support.opensource@diasemi.com>

The patch

   regulator: slg51000: Fix a couple NULL vs IS_ERR() checks

has been applied to the regulator tree at

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/regulator.git for-5.3

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

From 7352e72a513fd2757b2fda695a349d86faa4c94e Mon Sep 17 00:00:00 2001
From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 8 Aug 2019 13:33:35 +0300
Subject: [PATCH] regulator: slg51000: Fix a couple NULL vs IS_ERR() checks

The devm_gpiod_get_from_of_node() function never returns NULL, it
returns error pointers on error.

Fixes: a867bde3dd03 ("regulator: slg51000: add slg51000 regulator driver")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
Link: https://lore.kernel.org/r/20190808103335.GD30506@mwanda
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 drivers/regulator/slg51000-regulator.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/regulator/slg51000-regulator.c b/drivers/regulator/slg51000-regulator.c
index 04b732991d69..4d859fef55e6 100644
--- a/drivers/regulator/slg51000-regulator.c
+++ b/drivers/regulator/slg51000-regulator.c
@@ -205,7 +205,7 @@ static int slg51000_of_parse_cb(struct device_node *np,
 	ena_gpiod = devm_gpiod_get_from_of_node(chip->dev, np,
 						"enable-gpios", 0,
 						gflags, "gpio-en-ldo");
-	if (ena_gpiod) {
+	if (!IS_ERR(ena_gpiod)) {
 		config->ena_gpiod = ena_gpiod;
 		devm_gpiod_unhinge(chip->dev, config->ena_gpiod);
 	}
@@ -459,7 +459,7 @@ static int slg51000_i2c_probe(struct i2c_client *client,
 					       GPIOD_OUT_HIGH
 					       | GPIOD_FLAGS_BIT_NONEXCLUSIVE,
 					       "slg51000-cs");
-	if (cs_gpiod) {
+	if (!IS_ERR(cs_gpiod)) {
 		dev_info(dev, "Found chip selector property\n");
 		chip->cs_gpiod = cs_gpiod;
 	}
-- 
2.20.1
