From: Colin King <colin.king@canonical.com>
Date: Fri, 15 Jan 2021 13:15:24 +0000
Subject: [PATCH][next] power: supply: cpcap-charger: Fix power_supply_put on null battery pointer
Message-Id: <20210115131524.71339-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Sebastian Reichel <sre@kernel.org>, Tony Lindgren <tony@atomide.com>, linux-pm@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Currently if the pointer battery is null there is a null pointer
dereference on the call to power_supply_put.  Fix this by only
performing the put if battery is not null.

Addresses-Coverity: ("Dereference after null check")
Fixes: 4bff91bb3231 ("power: supply: cpcap-charger: Fix missing power_supply_put()")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/power/supply/cpcap-charger.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/power/supply/cpcap-charger.c b/drivers/power/supply/cpcap-charger.c
index 823d666f09e0..641dcad1133f 100644
--- a/drivers/power/supply/cpcap-charger.c
+++ b/drivers/power/supply/cpcap-charger.c
@@ -300,8 +300,9 @@ cpcap_charger_get_bat_const_charge_voltage(struct cpcap_charger_ddata *ddata)
 				&prop);
 		if (!error)
 			voltage = prop.intval;
+
+		power_supply_put(battery);
 	}
-	power_supply_put(battery);
 
 	return voltage;
 }
-- 
2.29.2
