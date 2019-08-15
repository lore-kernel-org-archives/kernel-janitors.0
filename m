From: Mark Brown <broonie@kernel.org>
Date: Thu, 15 Aug 2019 17:14:34 +0000
Subject: Applied "regulator: max8660: remove redundant assignment of variable ret" to the regulator tree
Message-Id: <20190815171434.DD14E2742BD6@ypsilon.sirena.org.uk>
List-Id: <kernel-janitors.vger.kernel.org>
In-Reply-To: <20190813133114.14931-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin Ian King <colin.king@canonical.com>
Cc: kernel-janitors@vger.kernel.org, Liam Girdwood <lgirdwood@gmail.com>, linux-kernel@vger.kernel.org, Mark Brown <broonie@kernel.org>

The patch

   regulator: max8660: remove redundant assignment of variable ret

has been applied to the regulator tree at

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/regulator.git for-5.4

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

From 9e127fab67e3ec4451696da0c7872fd291b9372b Mon Sep 17 00:00:00 2001
From: Colin Ian King <colin.king@canonical.com>
Date: Tue, 13 Aug 2019 14:31:14 +0100
Subject: [PATCH] regulator: max8660: remove redundant assignment of variable
 ret

Variable ret is initialized to a value that is never read before
a return statement and hence can be removed. Remove it.

Addresses-Coverity: ("Unused value")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
Link: https://lore.kernel.org/r/20190813133114.14931-1-colin.king@canonical.com
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 drivers/regulator/max8660.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/regulator/max8660.c b/drivers/regulator/max8660.c
index 4bca54446287..347043a5a9a7 100644
--- a/drivers/regulator/max8660.c
+++ b/drivers/regulator/max8660.c
@@ -485,7 +485,6 @@ static int max8660_probe(struct i2c_client *client,
 		rdev = devm_regulator_register(&client->dev,
 						  &max8660_reg[id], &config);
 		if (IS_ERR(rdev)) {
-			ret = PTR_ERR(rdev);
 			dev_err(&client->dev, "failed to register %s\n",
 				max8660_reg[id].name);
 			return PTR_ERR(rdev);
-- 
2.20.1
