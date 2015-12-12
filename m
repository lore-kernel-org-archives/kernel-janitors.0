From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Sat, 12 Dec 2015 12:38:43 +0000
Subject: [patch] regulator: pv88090: logical vs bitwise AND typo
Message-Id: <20151212123843.GB21408@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Liam Girdwood <lgirdwood@gmail.com>, James Ban <James.Ban.opensource@diasemi.com>
Cc: Mark Brown <broonie@kernel.org>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

These were supposed to be bitwise AND instead of logical.  Also kernel
style is for the operator to be on the first line and I removed some
extra parenthesis.

Fixes: c90456e36d9c ('regulator: pv88090: new regulator driver')
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
At the end we use these values for:

	index = ((range << 1) | conf2);

So, in theory, "index" is a number between 0-3.  The problem is that we
use it as an index into the pv88090_buck_vol[] array which has only 3
elements so it's potentially reading one step beyond then end.  Possibly
the hardware spec says that range and conf2 can not both be set at the
same time.  I don't know.  James, can you take a look at this?

diff --git a/drivers/regulator/pv88090-regulator.c b/drivers/regulator/pv88090-regulator.c
index 3ec5f2b..29c16d9 100644
--- a/drivers/regulator/pv88090-regulator.c
+++ b/drivers/regulator/pv88090-regulator.c
@@ -392,17 +392,17 @@ static int pv88090_i2c_probe(struct i2c_client *i2c,
 			if (ret < 0)
 				return ret;
 
-			conf2 = ((conf2 >> PV88090_BUCK_VDAC_RANGE_SHIFT)
-				&& PV88090_BUCK_VDAC_RANGE_MASK);
+			conf2 = (conf2 >> PV88090_BUCK_VDAC_RANGE_SHIFT) &
+				PV88090_BUCK_VDAC_RANGE_MASK;
 
 			ret = regmap_read(chip->regmap,
 				PV88090_REG_BUCK_FOLD_RANGE, &range);
 			if (ret < 0)
 				return ret;
 
-			range = ((range
-				>> (PV88080_BUCK_VRANGE_GAIN_SHIFT + i - 1))
-				&& PV88080_BUCK_VRANGE_GAIN_MASK);
+			range = (range >>
+				 (PV88080_BUCK_VRANGE_GAIN_SHIFT + i - 1)) &
+				PV88080_BUCK_VRANGE_GAIN_MASK;
 			index = ((range << 1) | conf2);
 
 			pv88090_regulator_info[i].desc.min_uV
