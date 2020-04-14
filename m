From: Mark Brown <broonie@kernel.org>
Date: Tue, 14 Apr 2020 15:57:55 +0000
Subject: Applied "regulator: tps80031: remove redundant assignment to variables ret and val" to the regulator
Message-Id: <applied-20200410133406.24458-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
In-Reply-To: <20200410133406.24458-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin Ian King <colin.king@canonical.com>
Cc: kernel-janitors@vger.kernel.org, Liam Girdwood <lgirdwood@gmail.com>, linux-kernel@vger.kernel.org, Mark Brown <broonie@kernel.org>

The patch

   regulator: tps80031: remove redundant assignment to variables ret and val

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

From 2ea8db7200d40f89ebfb97fc512ced5f792e0e1c Mon Sep 17 00:00:00 2001
From: Colin Ian King <colin.king@canonical.com>
Date: Fri, 10 Apr 2020 14:34:06 +0100
Subject: [PATCH] regulator: tps80031: remove redundant assignment to variables
 ret and val

The variables ret and val are being initialized with values that are
never read and are being updated later with a new value.  The
initializations are redundant and can be removed.

Signed-off-by: Colin Ian King <colin.king@canonical.com>
Addresses-Coverity: ("Unused value")
Link: https://lore.kernel.org/r/20200410133406.24458-1-colin.king@canonical.com
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 drivers/regulator/tps80031-regulator.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/regulator/tps80031-regulator.c b/drivers/regulator/tps80031-regulator.c
index 85a6a8ca8c1b..a29e65230132 100644
--- a/drivers/regulator/tps80031-regulator.c
+++ b/drivers/regulator/tps80031-regulator.c
@@ -271,7 +271,7 @@ static int tps80031_vbus_is_enabled(struct regulator_dev *rdev)
 {
 	struct tps80031_regulator *ri = rdev_get_drvdata(rdev);
 	struct device *parent = to_tps80031_dev(rdev);
-	int ret = -EIO;
+	int ret;
 	uint8_t ctrl1 = 0;
 	uint8_t ctrl3 = 0;
 
@@ -322,7 +322,7 @@ static int tps80031_vbus_disable(struct regulator_dev *rdev)
 {
 	struct tps80031_regulator *ri = rdev_get_drvdata(rdev);
 	struct device *parent = to_tps80031_dev(rdev);
-	int ret = 0;
+	int ret;
 
 	if (ri->config_flags & TPS80031_VBUS_DISCHRG_EN_PDN) {
 		ret = tps80031_write(parent, TPS80031_SLAVE_ID2,
@@ -530,7 +530,8 @@ static int tps80031_regulator_config(struct device *parent,
 	case TPS80031_REGULATOR_LDOUSB:
 		if (ri->config_flags & (TPS80031_USBLDO_INPUT_VSYS |
 			TPS80031_USBLDO_INPUT_PMID)) {
-			unsigned val = 0;
+			unsigned val;
+
 			if (ri->config_flags & TPS80031_USBLDO_INPUT_VSYS)
 				val = MISC2_LDOUSB_IN_VSYS;
 			else
-- 
2.20.1
