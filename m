From: Colin King <colin.king@canonical.com>
Date: Mon, 04 Jan 2021 13:05:13 +0000
Subject: [PATCH][next] power: supply: max8997_charger: fix spelling mistake "diconnected" -> "disconnected"
Message-Id: <20210104130513.35563-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Sebastian Reichel <sre@kernel.org>, linux-pm@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

There is a spelling mistake in a dev_dbg message. Fix it.

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/power/supply/max8997_charger.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/power/supply/max8997_charger.c b/drivers/power/supply/max8997_charger.c
index 23df91ed2c72..321bd6b8ee41 100644
--- a/drivers/power/supply/max8997_charger.c
+++ b/drivers/power/supply/max8997_charger.c
@@ -124,7 +124,7 @@ static void max8997_battery_extcon_evt_worker(struct work_struct *work)
 		dev_dbg(charger->dev, "USB CDP charger is connected\n");
 		current_limit = 650000;
 	} else {
-		dev_dbg(charger->dev, "USB charger is diconnected\n");
+		dev_dbg(charger->dev, "USB charger is disconnected\n");
 		current_limit = -1;
 	}
 
-- 
2.29.2
