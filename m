From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Tue, 16 Jan 2018 09:43:32 +0000
Subject: [PATCH] mfd/tps65090: Delete an error message for a failed memory allocation in tps65090_i2c_probe()
Message-Id: <298ee6b1-c14b-e794-c800-f2aeb6b42a53@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org, Lee Jones <lee.jones@linaro.org>
Cc: LKML <linux-kernel@vger.kernel.org>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Tue, 16 Jan 2018 10:37:33 +0100

Omit an extra message for a memory allocation failure in this function.

This issue was detected by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/mfd/tps65090.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/mfd/tps65090.c b/drivers/mfd/tps65090.c
index d7ec318c40c3..f13e4cd06e89 100644
--- a/drivers/mfd/tps65090.c
+++ b/drivers/mfd/tps65090.c
@@ -192,10 +192,8 @@ static int tps65090_i2c_probe(struct i2c_client *client,
 		irq_base = pdata->irq_base;
 
 	tps65090 = devm_kzalloc(&client->dev, sizeof(*tps65090), GFP_KERNEL);
-	if (!tps65090) {
-		dev_err(&client->dev, "mem alloc for tps65090 failed\n");
+	if (!tps65090)
 		return -ENOMEM;
-	}
 
 	tps65090->dev = &client->dev;
 	i2c_set_clientdata(client, tps65090);
-- 
2.15.1

