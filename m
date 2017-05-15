From: Mark Brown <broonie@kernel.org>
Date: Mon, 15 May 2017 08:04:17 +0000
Subject: Applied "regulator: max8997/8966: fix charger cv voltage set bug" to the regulator tree
Message-Id: <E1dAAzJ-0002bJ-Cu@finisterre>
List-Id: <kernel-janitors.vger.kernel.org>
In-Reply-To: <20170508054544epcms1p6d3d429e6f062e987adf72fc2c04ed159@epcms1p6>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: MyungJoo Ham <myungjoo.ham@samsung.com>
Cc: Mark Brown <broonie@kernel.org>, Dan Carpenter <dan.carpenter@oracle.com>, "lgirdwood@gmail.com" <lgirdwood@gmail.com>"broonie@kernel.org" <broonie@kernel.org>, Chanwoo Choi <cw00.choi@samsung.com>, "krzk@kernel.org" <krzk@kernel.org>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>linux-kernel@vger.kernel.org

The patch

   regulator: max8997/8966: fix charger cv voltage set bug

has been applied to the regulator tree at

   git://git.kernel.org/pub/scm/linux/kernel/git/broonie/regulator.git 

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

From f74521ca578f38daa3e800efde7fdb2ac3ba76ef Mon Sep 17 00:00:00 2001
From: MyungJoo Ham <myungjoo.ham@samsung.com>
Date: Mon, 8 May 2017 05:45:44 +0000
Subject: [PATCH] regulator: max8997/8966: fix charger cv voltage set bug

When min charger-CV is <= 4.0V and max charger-CV is >= 4.0V,
we can use 4.00V as CV (register value = 0x1).`

The original code had a typo that wrote ">=" (max_uV >= 4000000),
which should've been "<", which is not necessary anyway
as mentioned by Dan Carpenter.

Reported-By: Dan Carpenter <dan.carpenter@oracle.com>
Signed-off-by: MyungJoo Ham <myungjoo.ham@samsung.com>
Reviewed-by: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Reviewed-by: Chanwoo Choi <cw00.choi@samsung.com>
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 drivers/regulator/max8997-regulator.c | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/drivers/regulator/max8997-regulator.c b/drivers/regulator/max8997-regulator.c
index efabc0ea0e96..559b9ac45404 100644
--- a/drivers/regulator/max8997-regulator.c
+++ b/drivers/regulator/max8997-regulator.c
@@ -428,12 +428,9 @@ static int max8997_set_voltage_charger_cv(struct regulator_dev *rdev,
 	if (max_uV < 4000000 || min_uV > 4350000)
 		return -EINVAL;
 
-	if (min_uV <= 4000000) {
-		if (max_uV >= 4000000)
-			return -EINVAL;
-		else
-			val = 0x1;
-	} else if (min_uV <= 4200000 && max_uV >= 4200000)
+	if (min_uV <= 4000000)
+		val = 0x1;
+	else if (min_uV <= 4200000 && max_uV >= 4200000)
 		val = 0x0;
 	else {
 		lb = (min_uV - 4000001) / 20000 + 2;
-- 
2.11.0

