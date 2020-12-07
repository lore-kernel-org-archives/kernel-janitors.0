From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Mon, 07 Dec 2020 17:55:44 +0000
Subject: [PATCH] regulator: da9121: Potential Oops in da9121_assign_chip_model()
Message-Id: <X85soGKnWAjPUA7a@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Support Opensource <support.opensource@diasemi.com>, Adam Ward <Adam.Ward.opensource@diasemi.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

There is a missing "return ret;" on this error path so we call
"da9121_check_device_type(i2c, chip);" which will end up dereferencing
"chip->regmap" and lead to an Oops.

Fixes: c860476b9e3a ("regulator: da9121: Add device variant regmaps")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 drivers/regulator/da9121-regulator.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/regulator/da9121-regulator.c b/drivers/regulator/da9121-regulator.c
index db1c2cc838bc..e4fc3a7cd5d8 100644
--- a/drivers/regulator/da9121-regulator.c
+++ b/drivers/regulator/da9121-regulator.c
@@ -915,6 +915,7 @@ static int da9121_assign_chip_model(struct i2c_client *i2c,
 		ret = PTR_ERR(chip->regmap);
 		dev_err(chip->dev, "Failed to configure a register map: %d\n",
 			ret);
+		return ret;
 	}
 
 	ret = da9121_check_device_type(i2c, chip);
-- 
2.29.2
