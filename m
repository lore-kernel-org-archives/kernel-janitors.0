From: Julia Lawall <Julia.Lawall@lip6.fr>
Date: Sat, 19 Dec 2015 15:31:24 +0000
Subject: [PATCH] regulator: wm8*: constify regulator_ops structures
Message-Id: <1450539084-13982-1-git-send-email-Julia.Lawall@lip6.fr>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Liam Girdwood <lgirdwood@gmail.com>
Cc: kernel-janitors@vger.kernel.org, Mark Brown <broonie@kernel.org>, patches@opensource.wolfsonmicro.com, linux-kernel@vger.kernel.org

The regulator_ops structures are never modified, so declare them as const.

Done with the help of Coccinelle.

Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>

---
 drivers/regulator/wm831x-dcdc.c      |    8 ++++----
 drivers/regulator/wm831x-isink.c     |    2 +-
 drivers/regulator/wm831x-ldo.c       |    6 +++---
 drivers/regulator/wm8350-regulator.c |    8 ++++----
 drivers/regulator/wm8400-regulator.c |    4 ++--
 drivers/regulator/wm8994-regulator.c |    4 ++--
 6 files changed, 16 insertions(+), 16 deletions(-)

diff --git a/drivers/regulator/wm831x-dcdc.c b/drivers/regulator/wm831x-dcdc.c
index 05f69d1..5a5bc4b 100644
--- a/drivers/regulator/wm831x-dcdc.c
+++ b/drivers/regulator/wm831x-dcdc.c
@@ -365,7 +365,7 @@ static int wm831x_buckv_get_current_limit(struct regulator_dev *rdev)
 	return wm831x_dcdc_ilim[val];
 }
 
-static struct regulator_ops wm831x_buckv_ops = {
+static const struct regulator_ops wm831x_buckv_ops = {
 	.set_voltage_sel = wm831x_buckv_set_voltage_sel,
 	.get_voltage_sel = wm831x_buckv_get_voltage_sel,
 	.list_voltage = wm831x_buckv_list_voltage,
@@ -585,7 +585,7 @@ static int wm831x_buckp_set_suspend_voltage(struct regulator_dev *rdev, int uV)
 	return wm831x_set_bits(wm831x, reg, WM831X_DC3_ON_VSEL_MASK, sel);
 }
 
-static struct regulator_ops wm831x_buckp_ops = {
+static const struct regulator_ops wm831x_buckp_ops = {
 	.set_voltage_sel = regulator_set_voltage_sel_regmap,
 	.get_voltage_sel = regulator_get_voltage_sel_regmap,
 	.list_voltage = regulator_list_voltage_linear,
@@ -725,7 +725,7 @@ static int wm831x_boostp_get_status(struct regulator_dev *rdev)
 		return REGULATOR_STATUS_OFF;
 }
 
-static struct regulator_ops wm831x_boostp_ops = {
+static const struct regulator_ops wm831x_boostp_ops = {
 	.get_status = wm831x_boostp_get_status,
 
 	.is_enabled = regulator_is_enabled_regmap,
@@ -818,7 +818,7 @@ static struct platform_driver wm831x_boostp_driver = {
 
 #define WM831X_EPE_BASE 6
 
-static struct regulator_ops wm831x_epe_ops = {
+static const struct regulator_ops wm831x_epe_ops = {
 	.is_enabled = regulator_is_enabled_regmap,
 	.enable = regulator_enable_regmap,
 	.disable = regulator_disable_regmap,
diff --git a/drivers/regulator/wm831x-isink.c b/drivers/regulator/wm831x-isink.c
index 1442828..6dd891d 100644
--- a/drivers/regulator/wm831x-isink.c
+++ b/drivers/regulator/wm831x-isink.c
@@ -128,7 +128,7 @@ static int wm831x_isink_get_current(struct regulator_dev *rdev)
 	return wm831x_isinkv_values[ret];
 }
 
-static struct regulator_ops wm831x_isink_ops = {
+static const struct regulator_ops wm831x_isink_ops = {
 	.is_enabled = wm831x_isink_is_enabled,
 	.enable = wm831x_isink_enable,
 	.disable = wm831x_isink_disable,
diff --git a/drivers/regulator/wm831x-ldo.c b/drivers/regulator/wm831x-ldo.c
index 9ad2a29..e4a6f88 100644
--- a/drivers/regulator/wm831x-ldo.c
+++ b/drivers/regulator/wm831x-ldo.c
@@ -198,7 +198,7 @@ static unsigned int wm831x_gp_ldo_get_optimum_mode(struct regulator_dev *rdev,
 }
 
 
-static struct regulator_ops wm831x_gp_ldo_ops = {
+static const struct regulator_ops wm831x_gp_ldo_ops = {
 	.list_voltage = regulator_list_voltage_linear_range,
 	.map_voltage = regulator_map_voltage_linear_range,
 	.get_voltage_sel = regulator_get_voltage_sel_regmap,
@@ -409,7 +409,7 @@ static int wm831x_aldo_get_status(struct regulator_dev *rdev)
 		return regulator_mode_to_status(ret);
 }
 
-static struct regulator_ops wm831x_aldo_ops = {
+static const struct regulator_ops wm831x_aldo_ops = {
 	.list_voltage = regulator_list_voltage_linear_range,
 	.map_voltage = regulator_map_voltage_linear_range,
 	.get_voltage_sel = regulator_get_voltage_sel_regmap,
@@ -557,7 +557,7 @@ static int wm831x_alive_ldo_get_status(struct regulator_dev *rdev)
 		return REGULATOR_STATUS_OFF;
 }
 
-static struct regulator_ops wm831x_alive_ldo_ops = {
+static const struct regulator_ops wm831x_alive_ldo_ops = {
 	.list_voltage = regulator_list_voltage_linear,
 	.map_voltage = regulator_map_voltage_linear,
 	.get_voltage_sel = regulator_get_voltage_sel_regmap,
diff --git a/drivers/regulator/wm8350-regulator.c b/drivers/regulator/wm8350-regulator.c
index 95f6b04..da9106b 100644
--- a/drivers/regulator/wm8350-regulator.c
+++ b/drivers/regulator/wm8350-regulator.c
@@ -941,7 +941,7 @@ static unsigned int wm8350_dcdc_get_optimum_mode(struct regulator_dev *rdev,
 	return mode;
 }
 
-static struct regulator_ops wm8350_dcdc_ops = {
+static const struct regulator_ops wm8350_dcdc_ops = {
 	.set_voltage_sel = regulator_set_voltage_sel_regmap,
 	.get_voltage_sel = regulator_get_voltage_sel_regmap,
 	.list_voltage = regulator_list_voltage_linear,
@@ -958,7 +958,7 @@ static struct regulator_ops wm8350_dcdc_ops = {
 	.set_suspend_mode = wm8350_dcdc_set_suspend_mode,
 };
 
-static struct regulator_ops wm8350_dcdc2_5_ops = {
+static const struct regulator_ops wm8350_dcdc2_5_ops = {
 	.enable = regulator_enable_regmap,
 	.disable = regulator_disable_regmap,
 	.is_enabled = regulator_is_enabled_regmap,
@@ -966,7 +966,7 @@ static struct regulator_ops wm8350_dcdc2_5_ops = {
 	.set_suspend_disable = wm8350_dcdc25_set_suspend_disable,
 };
 
-static struct regulator_ops wm8350_ldo_ops = {
+static const struct regulator_ops wm8350_ldo_ops = {
 	.map_voltage = regulator_map_voltage_linear_range,
 	.set_voltage_sel = regulator_set_voltage_sel_regmap,
 	.get_voltage_sel = regulator_get_voltage_sel_regmap,
@@ -980,7 +980,7 @@ static struct regulator_ops wm8350_ldo_ops = {
 	.set_suspend_disable = wm8350_ldo_set_suspend_disable,
 };
 
-static struct regulator_ops wm8350_isink_ops = {
+static const struct regulator_ops wm8350_isink_ops = {
 	.set_current_limit = wm8350_isink_set_current,
 	.get_current_limit = wm8350_isink_get_current,
 	.enable = wm8350_isink_enable,
diff --git a/drivers/regulator/wm8400-regulator.c b/drivers/regulator/wm8400-regulator.c
index 82d8290..fb18376 100644
--- a/drivers/regulator/wm8400-regulator.c
+++ b/drivers/regulator/wm8400-regulator.c
@@ -24,7 +24,7 @@ static const struct regulator_linear_range wm8400_ldo_ranges[] = {
 	REGULATOR_LINEAR_RANGE(1700000, 15, 31, 100000),
 };
 
-static struct regulator_ops wm8400_ldo_ops = {
+static const struct regulator_ops wm8400_ldo_ops = {
 	.is_enabled = regulator_is_enabled_regmap,
 	.enable = regulator_enable_regmap,
 	.disable = regulator_disable_regmap,
@@ -106,7 +106,7 @@ static unsigned int wm8400_dcdc_get_optimum_mode(struct regulator_dev *dev,
 	return REGULATOR_MODE_NORMAL;
 }
 
-static struct regulator_ops wm8400_dcdc_ops = {
+static const struct regulator_ops wm8400_dcdc_ops = {
 	.is_enabled = regulator_is_enabled_regmap,
 	.enable = regulator_enable_regmap,
 	.disable = regulator_disable_regmap,
diff --git a/drivers/regulator/wm8994-regulator.c b/drivers/regulator/wm8994-regulator.c
index 750e0bd..7a4ce6d 100644
--- a/drivers/regulator/wm8994-regulator.c
+++ b/drivers/regulator/wm8994-regulator.c
@@ -36,7 +36,7 @@ struct wm8994_ldo {
 #define WM8994_LDO1_MAX_SELECTOR 0x7
 #define WM8994_LDO2_MAX_SELECTOR 0x3
 
-static struct regulator_ops wm8994_ldo1_ops = {
+static const struct regulator_ops wm8994_ldo1_ops = {
 	.list_voltage = regulator_list_voltage_linear,
 	.map_voltage = regulator_map_voltage_linear,
 	.get_voltage_sel = regulator_get_voltage_sel_regmap,
@@ -69,7 +69,7 @@ static int wm8994_ldo2_list_voltage(struct regulator_dev *rdev,
 	}
 }
 
-static struct regulator_ops wm8994_ldo2_ops = {
+static const struct regulator_ops wm8994_ldo2_ops = {
 	.list_voltage = wm8994_ldo2_list_voltage,
 	.get_voltage_sel = regulator_get_voltage_sel_regmap,
 	.set_voltage_sel = regulator_set_voltage_sel_regmap,

