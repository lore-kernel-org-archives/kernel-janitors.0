From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Date: Sun, 21 Jul 2019 16:03:28 +0000
Subject: [PATCH] power: supply: max17042_battery: Fix a typo in function names
Message-Id: <20190721160328.24660-1-christophe.jaillet@wanadoo.fr>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: sre@kernel.org
Cc: linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Christophe JAILLET <christophe.jaillet@wanadoo.fr>

It is likely that 'max10742_[un]lock_model()' functions should be
'max17042_[un]lock_model()'
(0 and 7 switched in 10742)

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
 drivers/power/supply/max17042_battery.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/power/supply/max17042_battery.c b/drivers/power/supply/max17042_battery.c
index 581c6bd23388..da3904822929 100644
--- a/drivers/power/supply/max17042_battery.c
+++ b/drivers/power/supply/max17042_battery.c
@@ -511,7 +511,7 @@ static inline void max17042_override_por(struct regmap *map,
 		regmap_write(map, reg, value);
 }
 
-static inline void max10742_unlock_model(struct max17042_chip *chip)
+static inline void max17042_unlock_model(struct max17042_chip *chip)
 {
 	struct regmap *map = chip->regmap;
 
@@ -519,7 +519,7 @@ static inline void max10742_unlock_model(struct max17042_chip *chip)
 	regmap_write(map, MAX17042_MLOCKReg2, MODEL_UNLOCK2);
 }
 
-static inline void max10742_lock_model(struct max17042_chip *chip)
+static inline void max17042_lock_model(struct max17042_chip *chip)
 {
 	struct regmap *map = chip->regmap;
 
@@ -577,7 +577,7 @@ static int max17042_init_model(struct max17042_chip *chip)
 	if (!temp_data)
 		return -ENOMEM;
 
-	max10742_unlock_model(chip);
+	max17042_unlock_model(chip);
 	max17042_write_model_data(chip, MAX17042_MODELChrTbl,
 				table_size);
 	max17042_read_model_data(chip, MAX17042_MODELChrTbl, temp_data,
@@ -589,7 +589,7 @@ static int max17042_init_model(struct max17042_chip *chip)
 		temp_data,
 		table_size);
 
-	max10742_lock_model(chip);
+	max17042_lock_model(chip);
 	kfree(temp_data);
 
 	return ret;
-- 
2.20.1
