From: Julia Lawall <Julia.Lawall@lip6.fr>
Date: Sat, 19 Dec 2015 15:07:09 +0000
Subject: [PATCH] regulator: da9*: constify regulator_ops structures
Message-Id: <1450537629-25649-1-git-send-email-Julia.Lawall@lip6.fr>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Support Opensource <support.opensource@diasemi.com>
Cc: kernel-janitors@vger.kernel.org, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, linux-kernel@vger.kernel.org

The regulator_ops structures are never modified, so declare them as const.

Done with the help of Coccinelle.

Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>

---
 drivers/regulator/da903x.c           |   10 +++++-----
 drivers/regulator/da9052-regulator.c |    4 ++--
 drivers/regulator/da9055-regulator.c |    4 ++--
 drivers/regulator/da9062-regulator.c |    4 ++--
 drivers/regulator/da9063-regulator.c |    4 ++--
 drivers/regulator/da9210-regulator.c |    2 +-
 drivers/regulator/da9211-regulator.c |    2 +-
 7 files changed, 15 insertions(+), 15 deletions(-)

diff --git a/drivers/regulator/da903x.c b/drivers/regulator/da903x.c
index affa1b1..33e8f3b 100644
--- a/drivers/regulator/da903x.c
+++ b/drivers/regulator/da903x.c
@@ -257,7 +257,7 @@ static const struct regulator_linear_range da9034_ldo12_ranges[] = {
 	REGULATOR_LINEAR_RANGE(2700000, 8, 15, 50000),
 };
 
-static struct regulator_ops da903x_regulator_ldo_ops = {
+static const struct regulator_ops da903x_regulator_ldo_ops = {
 	.set_voltage_sel = da903x_set_voltage_sel,
 	.get_voltage_sel = da903x_get_voltage_sel,
 	.list_voltage	= regulator_list_voltage_linear,
@@ -268,7 +268,7 @@ static struct regulator_ops da903x_regulator_ldo_ops = {
 };
 
 /* NOTE: this is dedicated for the insane DA9030 LDO14 */
-static struct regulator_ops da9030_regulator_ldo14_ops = {
+static const struct regulator_ops da9030_regulator_ldo14_ops = {
 	.set_voltage_sel = da903x_set_voltage_sel,
 	.get_voltage_sel = da903x_get_voltage_sel,
 	.list_voltage	= da9030_list_ldo14_voltage,
@@ -279,7 +279,7 @@ static struct regulator_ops da9030_regulator_ldo14_ops = {
 };
 
 /* NOTE: this is dedicated for the DA9030 LDO1 and LDO15 that have locks  */
-static struct regulator_ops da9030_regulator_ldo1_15_ops = {
+static const struct regulator_ops da9030_regulator_ldo1_15_ops = {
 	.set_voltage_sel = da9030_set_ldo1_15_voltage_sel,
 	.get_voltage_sel = da903x_get_voltage_sel,
 	.list_voltage	= regulator_list_voltage_linear,
@@ -289,7 +289,7 @@ static struct regulator_ops da9030_regulator_ldo1_15_ops = {
 	.is_enabled	= da903x_is_enabled,
 };
 
-static struct regulator_ops da9034_regulator_dvc_ops = {
+static const struct regulator_ops da9034_regulator_dvc_ops = {
 	.set_voltage_sel = da9034_set_dvc_voltage_sel,
 	.get_voltage_sel = da903x_get_voltage_sel,
 	.list_voltage	= regulator_list_voltage_linear,
@@ -300,7 +300,7 @@ static struct regulator_ops da9034_regulator_dvc_ops = {
 };
 
 /* NOTE: this is dedicated for the insane LDO12 */
-static struct regulator_ops da9034_regulator_ldo12_ops = {
+static const struct regulator_ops da9034_regulator_ldo12_ops = {
 	.set_voltage_sel = da903x_set_voltage_sel,
 	.get_voltage_sel = da903x_get_voltage_sel,
 	.list_voltage	= regulator_list_voltage_linear_range,
diff --git a/drivers/regulator/da9052-regulator.c b/drivers/regulator/da9052-regulator.c
index 12a25b4..1050cb7 100644
--- a/drivers/regulator/da9052-regulator.c
+++ b/drivers/regulator/da9052-regulator.c
@@ -265,7 +265,7 @@ static int da9052_regulator_set_voltage_time_sel(struct regulator_dev *rdev,
 	return ret;
 }
 
-static struct regulator_ops da9052_dcdc_ops = {
+static const struct regulator_ops da9052_dcdc_ops = {
 	.get_current_limit = da9052_dcdc_get_current_limit,
 	.set_current_limit = da9052_dcdc_set_current_limit,
 
@@ -279,7 +279,7 @@ static struct regulator_ops da9052_dcdc_ops = {
 	.disable = regulator_disable_regmap,
 };
 
-static struct regulator_ops da9052_ldo_ops = {
+static const struct regulator_ops da9052_ldo_ops = {
 	.list_voltage = da9052_list_voltage,
 	.map_voltage = da9052_map_voltage,
 	.get_voltage_sel = regulator_get_voltage_sel_regmap,
diff --git a/drivers/regulator/da9055-regulator.c b/drivers/regulator/da9055-regulator.c
index cafdafb..d029c94 100644
--- a/drivers/regulator/da9055-regulator.c
+++ b/drivers/regulator/da9055-regulator.c
@@ -324,7 +324,7 @@ static int da9055_suspend_disable(struct regulator_dev *rdev)
 		return 0;
 }
 
-static struct regulator_ops da9055_buck_ops = {
+static const struct regulator_ops da9055_buck_ops = {
 	.get_mode = da9055_buck_get_mode,
 	.set_mode = da9055_buck_set_mode,
 
@@ -345,7 +345,7 @@ static struct regulator_ops da9055_buck_ops = {
 	.set_suspend_mode = da9055_buck_set_mode,
 };
 
-static struct regulator_ops da9055_ldo_ops = {
+static const struct regulator_ops da9055_ldo_ops = {
 	.get_mode = da9055_ldo_get_mode,
 	.set_mode = da9055_ldo_set_mode,
 
diff --git a/drivers/regulator/da9062-regulator.c b/drivers/regulator/da9062-regulator.c
index 5638fe8..0638c8b 100644
--- a/drivers/regulator/da9062-regulator.c
+++ b/drivers/regulator/da9062-regulator.c
@@ -371,7 +371,7 @@ static int da9062_ldo_set_suspend_mode(struct regulator_dev *rdev,
 	return regmap_field_write(regl->suspend_sleep, val);
 }
 
-static struct regulator_ops da9062_buck_ops = {
+static const struct regulator_ops da9062_buck_ops = {
 	.enable			= regulator_enable_regmap,
 	.disable		= regulator_disable_regmap,
 	.is_enabled		= regulator_is_enabled_regmap,
@@ -389,7 +389,7 @@ static struct regulator_ops da9062_buck_ops = {
 	.set_suspend_mode	= da9062_buck_set_suspend_mode,
 };
 
-static struct regulator_ops da9062_ldo_ops = {
+static const struct regulator_ops da9062_ldo_ops = {
 	.enable			= regulator_enable_regmap,
 	.disable		= regulator_disable_regmap,
 	.is_enabled		= regulator_is_enabled_regmap,
diff --git a/drivers/regulator/da9063-regulator.c b/drivers/regulator/da9063-regulator.c
index 536e931..ed9e7e9 100644
--- a/drivers/regulator/da9063-regulator.c
+++ b/drivers/regulator/da9063-regulator.c
@@ -427,7 +427,7 @@ static int da9063_ldo_set_suspend_mode(struct regulator_dev *rdev, unsigned mode
 	return regmap_field_write(regl->suspend_sleep, val);
 }
 
-static struct regulator_ops da9063_buck_ops = {
+static const struct regulator_ops da9063_buck_ops = {
 	.enable			= regulator_enable_regmap,
 	.disable		= regulator_disable_regmap,
 	.is_enabled		= regulator_is_enabled_regmap,
@@ -445,7 +445,7 @@ static struct regulator_ops da9063_buck_ops = {
 	.set_suspend_mode	= da9063_buck_set_suspend_mode,
 };
 
-static struct regulator_ops da9063_ldo_ops = {
+static const struct regulator_ops da9063_ldo_ops = {
 	.enable			= regulator_enable_regmap,
 	.disable		= regulator_disable_regmap,
 	.is_enabled		= regulator_is_enabled_regmap,
diff --git a/drivers/regulator/da9210-regulator.c b/drivers/regulator/da9210-regulator.c
index b351783..8b3cc9f 100644
--- a/drivers/regulator/da9210-regulator.c
+++ b/drivers/regulator/da9210-regulator.c
@@ -46,7 +46,7 @@ static int da9210_set_current_limit(struct regulator_dev *rdev, int min_uA,
 				    int max_uA);
 static int da9210_get_current_limit(struct regulator_dev *rdev);
 
-static struct regulator_ops da9210_buck_ops = {
+static const struct regulator_ops da9210_buck_ops = {
 	.enable = regulator_enable_regmap,
 	.disable = regulator_disable_regmap,
 	.is_enabled = regulator_is_enabled_regmap,
diff --git a/drivers/regulator/da9211-regulator.c b/drivers/regulator/da9211-regulator.c
index 04ef65b..236abf4 100644
--- a/drivers/regulator/da9211-regulator.c
+++ b/drivers/regulator/da9211-regulator.c
@@ -219,7 +219,7 @@ static int da9211_get_current_limit(struct regulator_dev *rdev)
 	return current_limits[data];
 }
 
-static struct regulator_ops da9211_buck_ops = {
+static const struct regulator_ops da9211_buck_ops = {
 	.get_mode = da9211_buck_get_mode,
 	.set_mode = da9211_buck_set_mode,
 	.enable = regulator_enable_regmap,

