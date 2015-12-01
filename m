From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 01 Dec 2015 08:29:12 +0000
Subject: [patch] regulator: pv88060: fix error handling in probe
Message-Id: <20151201082912.GA23996@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Liam Girdwood <lgirdwood@gmail.com>, James Ban <James.Ban.opensource@diasemi.com>
Cc: Mark Brown <broonie@kernel.org>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

There were some missing "ret = " assignments here.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/regulator/pv88060-regulator.c b/drivers/regulator/pv88060-regulator.c
index 69893f2..094376c 100644
--- a/drivers/regulator/pv88060-regulator.c
+++ b/drivers/regulator/pv88060-regulator.c
@@ -351,14 +351,14 @@ static int pv88060_i2c_probe(struct i2c_client *i2c,
 			return ret;
 		}
 
-		regmap_write(chip->regmap, PV88060_REG_MASK_B, 0xFF);
+		ret = regmap_write(chip->regmap, PV88060_REG_MASK_B, 0xFF);
 		if (ret < 0) {
 			dev_err(chip->dev,
 				"Failed to mask B reg: %d\n", ret);
 			return ret;
 		}
 
-		regmap_write(chip->regmap, PV88060_REG_MASK_C, 0xFF);
+		ret = regmap_write(chip->regmap, PV88060_REG_MASK_C, 0xFF);
 		if (ret < 0) {
 			dev_err(chip->dev,
 				"Failed to mask C reg: %d\n", ret);
