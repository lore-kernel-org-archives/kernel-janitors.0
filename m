From: Colin King <colin.king@canonical.com>
Date: Sat, 26 May 2018 13:56:06 +0000
Subject: [PATCH] power: supply: max1721x: fix spelling mistake "RSenese" -> "RSense"
Message-Id: <20180526135606.1153-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Sebastian Reichel <sre@kernel.org>, linux-pm@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Trivial fix to spelling mistake in dev_warn message text

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/power/supply/max1721x_battery.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/power/supply/max1721x_battery.c b/drivers/power/supply/max1721x_battery.c
index 9ee601a03d9b..9ca895b0dabb 100644
--- a/drivers/power/supply/max1721x_battery.c
+++ b/drivers/power/supply/max1721x_battery.c
@@ -372,7 +372,7 @@ static int devm_w1_max1721x_add_device(struct w1_slave *sl)
 	}
 
 	if (!info->rsense) {
-		dev_warn(info->w1_dev, "RSenese not calibrated, set 10 mOhms!\n");
+		dev_warn(info->w1_dev, "RSense not calibrated, set 10 mOhms!\n");
 		info->rsense = 1000; /* in regs in 10^-5 */
 	}
 	dev_info(info->w1_dev, "RSense: %d mOhms.\n", info->rsense / 100);
-- 
2.17.0

