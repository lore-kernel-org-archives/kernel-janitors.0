From: Dan Carpenter <error27@gmail.com>
Date: Thu, 23 Jun 2011 05:57:15 +0000
Subject: [patch] regulator/tps65912: storing error codes in u8
Message-Id: <20110623055715.GM14591@shale.localdomain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Liam Girdwood <lrg@ti.com>
Cc: Mark Brown <broonie@opensource.wolfsonmicro.com>, open list <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

get_ctrl_reg() returns -EINVAL so the error handling won't work here
if reg is a u8.

Signed-off-by: Dan Carpenter <error27@gmail.com>

diff --git a/drivers/regulator/tps65912-regulator.c b/drivers/regulator/tps65912-regulator.c
index d2c6542..3a9313e 100644
--- a/drivers/regulator/tps65912-regulator.c
+++ b/drivers/regulator/tps65912-regulator.c
@@ -417,7 +417,7 @@ static int tps65912_reg_enable(struct regulator_dev *dev)
 	struct tps65912_reg *pmic = rdev_get_drvdata(dev);
 	struct tps65912 *mfd = pmic->mfd;
 	int id = rdev_get_id(dev);
-	u8 reg;
+	int reg;
 
 	if (id < TPS65912_REG_DCDC1 || id > TPS65912_REG_LDO10)
 		return -EINVAL;
