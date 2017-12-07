From: Mark Brown <broonie@kernel.org>
Date: Thu, 07 Dec 2017 17:48:35 +0000
Subject: Applied "regulator: fix incorrect indentation of two assignment statements" to the regulator tree
Message-Id: <E1eN0Hj-00045n-H3@debutante>
List-Id: <kernel-janitors.vger.kernel.org>
In-Reply-To: <20171207133009.24948-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin Ian King <colin.king@canonical.com>
Cc: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>Mark Brown <broonie@kernel.org>, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.orglinux-kernel@vger.kernel.org

The patch

   regulator: fix incorrect indentation of two assignment statements

has been applied to the regulator tree at

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/regulator.git 

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

From 0d5c8633b173dd64f0005bba83501c8462463e65 Mon Sep 17 00:00:00 2001
From: Colin Ian King <colin.king@canonical.com>
Date: Thu, 7 Dec 2017 13:30:09 +0000
Subject: [PATCH] regulator: fix incorrect indentation of two assignment
 statements

Remove extraneous space to fix indentation on a couple of assignment
statements.

Signed-off-by: Colin Ian King <colin.king@canonical.com>
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 drivers/regulator/core.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/regulator/core.c b/drivers/regulator/core.c
index b64b7916507f..365b32e3f505 100644
--- a/drivers/regulator/core.c
+++ b/drivers/regulator/core.c
@@ -2605,8 +2605,8 @@ int regulator_get_hardware_vsel_register(struct regulator *regulator,
 	if (ops->set_voltage_sel != regulator_set_voltage_sel_regmap)
 		return -EOPNOTSUPP;
 
-	 *vsel_reg = rdev->desc->vsel_reg;
-	 *vsel_mask = rdev->desc->vsel_mask;
+	*vsel_reg = rdev->desc->vsel_reg;
+	*vsel_mask = rdev->desc->vsel_mask;
 
 	 return 0;
 }
-- 
2.15.1

