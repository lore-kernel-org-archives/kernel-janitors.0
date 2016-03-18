From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 18 Mar 2016 09:00:51 +0000
Subject: [patch] power: ipaq-micro-battery: freeing the wrong variable
Message-Id: <20160318090051.GA19233@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Sebastian Reichel <sre@kernel.org>, Krzysztof Kozlowski <k.kozlowski@samsung.com>
Cc: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>, David Woodhouse <dwmw2@infradead.org>, linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

We accidentally free "micro_ac_power" which is an error pointer and it
leads to an oops.  We intended to free "micro_batt_power".

Fixes: a2c1d531854c ('power_supply: ipaq_micro_battery: Check return values in probe')
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/power/ipaq_micro_battery.c b/drivers/power/ipaq_micro_battery.c
index 3f314b1..35b01c7 100644
--- a/drivers/power/ipaq_micro_battery.c
+++ b/drivers/power/ipaq_micro_battery.c
@@ -261,7 +261,7 @@ static int micro_batt_probe(struct platform_device *pdev)
 	return 0;
 
 ac_err:
-	power_supply_unregister(micro_ac_power);
+	power_supply_unregister(micro_batt_power);
 batt_err:
 	cancel_delayed_work_sync(&mb->update);
 	destroy_workqueue(mb->wq);
