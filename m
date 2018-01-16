From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Tue, 16 Jan 2018 10:07:40 +0000
Subject: [PATCH] mfd/tps6586x: Delete an error message for a failed memory allocation in tps6586x_parse_dt()
Message-Id: <e75d92e0-6994-f415-29bd-97ac9198afa9@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org, Lee Jones <lee.jones@linaro.org>
Cc: LKML <linux-kernel@vger.kernel.org>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Tue, 16 Jan 2018 11:02:56 +0100

Omit an extra message for a memory allocation failure in this function.

This issue was detected by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/mfd/tps6586x.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/mfd/tps6586x.c b/drivers/mfd/tps6586x.c
index 5628a6b5b19b..b89379782741 100644
--- a/drivers/mfd/tps6586x.c
+++ b/drivers/mfd/tps6586x.c
@@ -423,10 +423,8 @@ static struct tps6586x_platform_data *tps6586x_parse_dt(struct i2c_client *clien
 	struct tps6586x_platform_data *pdata;
 
 	pdata = devm_kzalloc(&client->dev, sizeof(*pdata), GFP_KERNEL);
-	if (!pdata) {
-		dev_err(&client->dev, "Memory allocation failed\n");
+	if (!pdata)
 		return NULL;
-	}
 
 	pdata->num_subdevs = 0;
 	pdata->subdevs = NULL;
-- 
2.15.1

