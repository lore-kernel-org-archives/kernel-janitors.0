From: Nigel Christian <nigel.l.christian@gmail.com>
Date: Sat, 14 Nov 2020 04:57:47 +0000
Subject: [PATCH] power: supply: pm2301_charger: remove unnecessary variable
Message-Id: <20201114045747.GA4209@fedora-project>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: sre@kernel.org
Cc: linux-pm@vger.kernel.org, kernel-janitors@vger.kernel.org

The variable "ret" is initialized to zero and then returned.
Remove it and return zero.

Signed-off-by: Nigel Christian <nigel.l.christian@gmail.com>
---
 drivers/power/supply/pm2301_charger.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/power/supply/pm2301_charger.c b/drivers/power/supply/pm2301_charger.c
index 2df6a2459d1f..ac06ecf7fc9c 100644
--- a/drivers/power/supply/pm2301_charger.c
+++ b/drivers/power/supply/pm2301_charger.c
@@ -455,7 +455,6 @@ static int pm2_int_reg4(void *pm2_data, int val)
 static int pm2_int_reg5(void *pm2_data, int val)
 {
 	struct pm2xxx_charger *pm2 = pm2_data;
-	int ret = 0;
 
 	if (val & (PM2XXX_INT6_ITVPWR2DROP | PM2XXX_INT6_ITVPWR1DROP)) {
 		dev_dbg(pm2->dev, "VMPWR drop to VBAT level\n");
@@ -468,7 +467,7 @@ static int pm2_int_reg5(void *pm2_data, int val)
 		dev_dbg(pm2->dev, "Falling/Rising edge on WPWR1/2\n");
 	}
 
-	return ret;
+	return 0;
 }
 
 static irqreturn_t  pm2xxx_irq_int(int irq, void *data)
-- 
2.28.0
