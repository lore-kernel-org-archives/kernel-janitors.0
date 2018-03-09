From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Fri, 09 Mar 2018 16:20:22 +0000
Subject: [PATCH v2 09/17] mfd: tps65090: Delete an error message for a failed memory allocation in tps65090_i
Message-Id: <7d7253de-7bc9-93a5-9e6b-a0ebf66fb2d0@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <c5d9751e-3ae8-0b66-821a-0e7f45bb8e1c@users.sourceforge.net>
In-Reply-To: <c5d9751e-3ae8-0b66-821a-0e7f45bb8e1c@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org, Lee Jones <lee.jones@linaro.org>
Cc: LKML <linux-kernel@vger.kernel.org>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Thu, 8 Mar 2018 15:25:58 +0100

Omit an extra message for a memory allocation failure in this function.

This issue was detected by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---

v2:
Lee Jones requested a resend for this patch. The change was rebased
on source files from Linux next-20180308.

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
2.16.2

