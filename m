From: Julia Lawall <Julia.Lawall@lip6.fr>
Date: Sun, 11 Sep 2016 13:05:57 +0000
Subject: [PATCH 15/26] platform/chrome: constify local structures
Message-Id: <1473599168-30561-16-git-send-email-Julia.Lawall@lip6.fr>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1473599168-30561-1-git-send-email-Julia.Lawall@lip6.fr>
In-Reply-To: <1473599168-30561-1-git-send-email-Julia.Lawall@lip6.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Olof Johansson <olof@lixom.net>
Cc: joe@perches.com, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

For structure types defined in the same file or local header files, find
top-level static structure declarations that have the following
properties:
1. Never reassigned.
2. Address never taken
3. Not passed to a top-level macro call
4. No pointer or array-typed field passed to a function or stored in a
variable.
Declare structures having all of these properties as const.

Done using Coccinelle.
Based on a suggestion by Joe Perches <joe@perches.com>.

Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>

---
The semantic patch seems too long for a commit log, but is in the cover
letter.

 drivers/platform/chrome/chromeos_laptop.c |   22 +++++++++++-----------
 1 file changed, 11 insertions(+), 11 deletions(-)

diff --git a/drivers/platform/chrome/chromeos_laptop.c b/drivers/platform/chrome/chromeos_laptop.c
index e8a44a9..01a53e7 100644
--- a/drivers/platform/chrome/chromeos_laptop.c
+++ b/drivers/platform/chrome/chromeos_laptop.c
@@ -423,7 +423,7 @@ static int chromeos_laptop_probe(struct platform_device *pdev)
 	return ret;
 }
 
-static struct chromeos_laptop samsung_series_5_550 = {
+static const struct chromeos_laptop samsung_series_5_550 = {
 	.i2c_peripherals = {
 		/* Touchpad. */
 		{ .add = setup_cyapa_tp, I2C_ADAPTER_SMBUS },
@@ -432,14 +432,14 @@ static struct chromeos_laptop samsung_series_5_550 = {
 	},
 };
 
-static struct chromeos_laptop samsung_series_5 = {
+static const struct chromeos_laptop samsung_series_5 = {
 	.i2c_peripherals = {
 		/* Light Sensor. */
 		{ .add = setup_tsl2583_als, I2C_ADAPTER_SMBUS },
 	},
 };
 
-static struct chromeos_laptop chromebook_pixel = {
+static const struct chromeos_laptop chromebook_pixel = {
 	.i2c_peripherals = {
 		/* Touch Screen. */
 		{ .add = setup_atmel_1664s_ts, I2C_ADAPTER_PANEL },
@@ -450,14 +450,14 @@ static struct chromeos_laptop chromebook_pixel = {
 	},
 };
 
-static struct chromeos_laptop hp_chromebook_14 = {
+static const struct chromeos_laptop hp_chromebook_14 = {
 	.i2c_peripherals = {
 		/* Touchpad. */
 		{ .add = setup_cyapa_tp, I2C_ADAPTER_DESIGNWARE_0 },
 	},
 };
 
-static struct chromeos_laptop dell_chromebook_11 = {
+static const struct chromeos_laptop dell_chromebook_11 = {
 	.i2c_peripherals = {
 		/* Touchpad. */
 		{ .add = setup_cyapa_tp, I2C_ADAPTER_DESIGNWARE_0 },
@@ -466,28 +466,28 @@ static struct chromeos_laptop dell_chromebook_11 = {
 	},
 };
 
-static struct chromeos_laptop toshiba_cb35 = {
+static const struct chromeos_laptop toshiba_cb35 = {
 	.i2c_peripherals = {
 		/* Touchpad. */
 		{ .add = setup_cyapa_tp, I2C_ADAPTER_DESIGNWARE_0 },
 	},
 };
 
-static struct chromeos_laptop acer_c7_chromebook = {
+static const struct chromeos_laptop acer_c7_chromebook = {
 	.i2c_peripherals = {
 		/* Touchpad. */
 		{ .add = setup_cyapa_tp, I2C_ADAPTER_SMBUS },
 	},
 };
 
-static struct chromeos_laptop acer_ac700 = {
+static const struct chromeos_laptop acer_ac700 = {
 	.i2c_peripherals = {
 		/* Light Sensor. */
 		{ .add = setup_tsl2563_als, I2C_ADAPTER_SMBUS },
 	},
 };
 
-static struct chromeos_laptop acer_c720 = {
+static const struct chromeos_laptop acer_c720 = {
 	.i2c_peripherals = {
 		/* Touchscreen. */
 		{ .add = setup_atmel_1664s_ts, I2C_ADAPTER_DESIGNWARE_1 },
@@ -500,14 +500,14 @@ static struct chromeos_laptop acer_c720 = {
 	},
 };
 
-static struct chromeos_laptop hp_pavilion_14_chromebook = {
+static const struct chromeos_laptop hp_pavilion_14_chromebook = {
 	.i2c_peripherals = {
 		/* Touchpad. */
 		{ .add = setup_cyapa_tp, I2C_ADAPTER_SMBUS },
 	},
 };
 
-static struct chromeos_laptop cr48 = {
+static const struct chromeos_laptop cr48 = {
 	.i2c_peripherals = {
 		/* Light Sensor. */
 		{ .add = setup_tsl2563_als, I2C_ADAPTER_SMBUS },

