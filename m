From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Mon, 15 Jan 2018 08:40:23 +0000
Subject: [PATCH] mfd/max8997: Delete an error message for a failed memory allocation in max8997_i2c_parse_dt_
Message-Id: <9f9b92bd-96bc-bf7e-319c-b0f427468014@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org, Lee Jones <lee.jones@linaro.org>
Cc: LKML <linux-kernel@vger.kernel.org>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Mon, 15 Jan 2018 09:35:17 +0100

Omit an extra message for a memory allocation failure in this function.

This issue was detected by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/mfd/max8997.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/mfd/max8997.c b/drivers/mfd/max8997.c
index 2d6e2c392786..3f554c447521 100644
--- a/drivers/mfd/max8997.c
+++ b/drivers/mfd/max8997.c
@@ -148,10 +148,8 @@ static struct max8997_platform_data *max8997_i2c_parse_dt_pdata(
 	struct max8997_platform_data *pd;
 
 	pd = devm_kzalloc(dev, sizeof(*pd), GFP_KERNEL);
-	if (!pd) {
-		dev_err(dev, "could not allocate memory for pdata\n");
+	if (!pd)
 		return ERR_PTR(-ENOMEM);
-	}
 
 	pd->ono = irq_of_parse_and_map(dev->of_node, 1);
 
-- 
2.15.1

