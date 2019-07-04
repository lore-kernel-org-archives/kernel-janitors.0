From: Mark Brown <broonie@kernel.org>
Date: Thu, 04 Jul 2019 12:25:05 +0000
Subject: Applied "regulator: max77620: remove redundant assignment to variable ret" to the regulator tree
Message-Id: <20190704122505.D03D92743897@ypsilon.sirena.org.uk>
List-Id: <kernel-janitors.vger.kernel.org>
In-Reply-To: <20190703082009.18779-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin Ian King <colin.king@canonical.com>
Cc: kernel-janitors@vger.kernel.org, Liam Girdwood <lgirdwood@gmail.com>, linux-kernel@vger.kernel.org, Mark Brown <broonie@kernel.org>

The patch

   regulator: max77620: remove redundant assignment to variable ret

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

From a3c7c029c3da01645f2db1bf7737668d17c2c78a Mon Sep 17 00:00:00 2001
From: Colin Ian King <colin.king@canonical.com>
Date: Wed, 3 Jul 2019 09:20:09 +0100
Subject: [PATCH] regulator: max77620: remove redundant assignment to variable
 ret

The variable ret is being initialized with a value that is never
read and it is being updated later with a new value. The
initialization is redundant and can be removed.

Addresses-Coverity: ("Unused value")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
Link: https://lore.kernel.org/r/20190703082009.18779-1-colin.king@canonical.com
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 drivers/regulator/max77620-regulator.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/regulator/max77620-regulator.c b/drivers/regulator/max77620-regulator.c
index 2ae2d319321b..8d9731e4052b 100644
--- a/drivers/regulator/max77620-regulator.c
+++ b/drivers/regulator/max77620-regulator.c
@@ -467,7 +467,7 @@ static int max77620_regulator_is_enabled(struct regulator_dev *rdev)
 {
 	struct max77620_regulator *pmic = rdev_get_drvdata(rdev);
 	int id = rdev_get_id(rdev);
-	int ret = 1;
+	int ret;
 
 	if (pmic->active_fps_src[id] != MAX77620_FPS_SRC_NONE)
 		return 1;
-- 
2.20.1
