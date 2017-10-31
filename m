From: Colin King <colin.king@canonical.com>
Date: Tue, 31 Oct 2017 10:40:00 +0000
Subject: [PATCH] power: supply: generic-adc-battery: remove redundant variable pdata
Message-Id: <20171031104000.20384-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Sebastian Reichel <sre@kernel.org>, linux-pm@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Pointer pdata is assigned but never used, so remove it. Cleans up the
clang warning:

drivers/power/supply/generic-adc-battery.c:211:2: warning: Value
stored to 'pdata' is never read

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/power/supply/generic-adc-battery.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/power/supply/generic-adc-battery.c b/drivers/power/supply/generic-adc-battery.c
index 37e523374fe0..28dc056eaafa 100644
--- a/drivers/power/supply/generic-adc-battery.c
+++ b/drivers/power/supply/generic-adc-battery.c
@@ -201,14 +201,12 @@ static int gab_get_property(struct power_supply *psy,
 static void gab_work(struct work_struct *work)
 {
 	struct gab *adc_bat;
-	struct gab_platform_data *pdata;
 	struct delayed_work *delayed_work;
 	bool is_plugged;
 	int status;
 
 	delayed_work = to_delayed_work(work);
 	adc_bat = container_of(delayed_work, struct gab, bat_work);
-	pdata = adc_bat->pdata;
 	status = adc_bat->status;
 
 	is_plugged = power_supply_am_i_supplied(adc_bat->psy);
-- 
2.14.1

