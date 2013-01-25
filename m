From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 25 Jan 2013 15:43:50 +0000
Subject: [patch] lp8727_charger: small cleanup in naming
Message-Id: <20130125154350.GA5908@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

"pdata" and "pchg->pdata" are the same.  Changing the function call to
pdata->get_batt_present() makes it match the check and it's a little
cleaner.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/power/lp8727_charger.c b/drivers/power/lp8727_charger.c
index 4ee71a9..5ef41b8 100644
--- a/drivers/power/lp8727_charger.c
+++ b/drivers/power/lp8727_charger.c
@@ -367,28 +367,28 @@ static int lp8727_battery_get_property(struct power_supply *psy,
 			return -EINVAL;
 
 		if (pdata->get_batt_present)
-			val->intval = pchg->pdata->get_batt_present();
+			val->intval = pdata->get_batt_present();
 		break;
 	case POWER_SUPPLY_PROP_VOLTAGE_NOW:
 		if (!pdata)
 			return -EINVAL;
 
 		if (pdata->get_batt_level)
-			val->intval = pchg->pdata->get_batt_level();
+			val->intval = pdata->get_batt_level();
 		break;
 	case POWER_SUPPLY_PROP_CAPACITY:
 		if (!pdata)
 			return -EINVAL;
 
 		if (pdata->get_batt_capacity)
-			val->intval = pchg->pdata->get_batt_capacity();
+			val->intval = pdata->get_batt_capacity();
 		break;
 	case POWER_SUPPLY_PROP_TEMP:
 		if (!pdata)
 			return -EINVAL;
 
 		if (pdata->get_batt_temp)
-			val->intval = pchg->pdata->get_batt_temp();
+			val->intval = pdata->get_batt_temp();
 		break;
 	default:
 		break;
