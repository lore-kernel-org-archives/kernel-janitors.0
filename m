From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Sat, 16 Dec 2017 20:11:54 +0000
Subject: [PATCH 1/3] pm2301-charger: Delete an error message for a failed memory allocation in pm2xxx_wall_ch
Message-Id: <6841b772-84ad-8f41-af0c-e797bc68a015@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <b11627bc-502d-b3af-ee96-ac2a693448a7@users.sourceforge.net>
In-Reply-To: <b11627bc-502d-b3af-ee96-ac2a693448a7@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-pm@vger.kernel.org, Sebastian Reichel <sre@kernel.org>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Sat, 16 Dec 2017 20:30:26 +0100

Omit an extra message for a memory allocation failure in this function.

This issue was detected by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/power/supply/pm2301_charger.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/power/supply/pm2301_charger.c b/drivers/power/supply/pm2301_charger.c
index 78561b6884fc..0a0c2da936cf 100644
--- a/drivers/power/supply/pm2301_charger.c
+++ b/drivers/power/supply/pm2301_charger.c
@@ -991,10 +991,8 @@ static int pm2xxx_wall_charger_probe(struct i2c_client *i2c_client,
 	}
 
 	pm2 = kzalloc(sizeof(struct pm2xxx_charger), GFP_KERNEL);
-	if (!pm2) {
-		dev_err(&i2c_client->dev, "pm2xxx_charger allocation failed\n");
+	if (!pm2)
 		return -ENOMEM;
-	}
 
 	/* get parent data */
 	pm2->dev = &i2c_client->dev;
-- 
2.15.1

