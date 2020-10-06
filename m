From: Colin King <colin.king@canonical.com>
Date: Tue, 06 Oct 2020 17:06:00 +0000
Subject: [PATCH][next] power: supply: bq25980: remove redundant zero check on ret
Message-Id: <20201006170600.545361-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Sebastian Reichel <sre@kernel.org>, Dan Murphy <dmurphy@ti.com>, linux-pm@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Currently ret is assigned to zero and the following statement checks
if it is non-zero. This check is redundant and can be removed

Addresses-Coverity: ("Logically dead code")
Fixes: 5069185fc18e ("power: supply: bq25980: Add support for the BQ259xx family")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/power/supply/bq25980_charger.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/power/supply/bq25980_charger.c b/drivers/power/supply/bq25980_charger.c
index 3995fb7cf060..f04f9acdb13b 100644
--- a/drivers/power/supply/bq25980_charger.c
+++ b/drivers/power/supply/bq25980_charger.c
@@ -613,9 +613,6 @@ static int bq25980_set_battery_property(struct power_supply *psy,
 	struct bq25980_device *bq = power_supply_get_drvdata(psy);
 	int ret = 0;
 
-	if (ret)
-		return ret;
-
 	switch (psp) {
 	case POWER_SUPPLY_PROP_CONSTANT_CHARGE_CURRENT:
 		ret = bq25980_set_const_charge_curr(bq, val->intval);
-- 
2.27.0
