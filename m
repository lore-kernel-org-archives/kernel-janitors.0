From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 08 Aug 2019 10:33:35 +0000
Subject: [PATCH] regulator: slg51000: Fix a couple NULL vs IS_ERR() checks
Message-Id: <20190808103335.GD30506@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Support Opensource <support.opensource@diasemi.com>, Eric Jeong <eric.jeong.opensource@diasemi.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

The devm_gpiod_get_from_of_node() function never returns NULL, it
returns error pointers on error.

Fixes: a867bde3dd03 ("regulator: slg51000: add slg51000 regulator driver")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
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
