From: Colin King <colin.king@canonical.com>
Date: Wed, 02 Sep 2020 10:16:56 +0000
Subject: [PATCH][next] power: supply: fix spelling mistake "unprecise" -> "imprecise"
Message-Id: <20200902101656.57676-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Sebastian Reichel <sre@kernel.org>, linux-pm@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

There is a spelling mistake in a dev_info message. Fix it.

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/power/supply/rn5t618_power.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/power/supply/rn5t618_power.c b/drivers/power/supply/rn5t618_power.c
index 424d2817bee5..dee520f0fdf5 100644
--- a/drivers/power/supply/rn5t618_power.c
+++ b/drivers/power/supply/rn5t618_power.c
@@ -487,7 +487,7 @@ static int rn5t618_power_probe(struct platform_device *pdev)
 		 * gauge will get decalibrated.
 		 */
 		dev_info(&pdev->dev, "Fuel gauge not enabled, enabling now\n");
-		dev_info(&pdev->dev, "Expect unprecise results\n");
+		dev_info(&pdev->dev, "Expect imprecise results\n");
 		regmap_update_bits(info->rn5t618->regmap, RN5T618_CONTROL,
 				   FG_ENABLE, FG_ENABLE);
 	}
-- 
2.27.0
