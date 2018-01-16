From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Tue, 16 Jan 2018 08:18:25 +0000
Subject: [PATCH 1/2] mfd: smsc-ece1099: Delete an error message for a failed memory allocation in smsc_i2c_pr
Message-Id: <6be526f1-cf39-9fa9-3508-ac75c9751986@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <978023d9-01f2-3a16-5eba-e06b8359cfc0@users.sourceforge.net>
In-Reply-To: <978023d9-01f2-3a16-5eba-e06b8359cfc0@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org, Lee Jones <lee.jones@linaro.org>
Cc: LKML <linux-kernel@vger.kernel.org>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Tue, 16 Jan 2018 08:52:27 +0100

Omit an extra message for a memory allocation failure in this function.

This issue was detected by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/mfd/smsc-ece1099.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/mfd/smsc-ece1099.c b/drivers/mfd/smsc-ece1099.c
index 93a8297de52a..b9d96651cc0d 100644
--- a/drivers/mfd/smsc-ece1099.c
+++ b/drivers/mfd/smsc-ece1099.c
@@ -39,10 +39,8 @@ static int smsc_i2c_probe(struct i2c_client *i2c,
 
 	smsc = devm_kzalloc(&i2c->dev, sizeof(struct smsc),
 				GFP_KERNEL);
-	if (!smsc) {
-		dev_err(&i2c->dev, "smsc mfd driver memory allocation failed\n");
+	if (!smsc)
 		return -ENOMEM;
-	}
 
 	smsc->regmap = devm_regmap_init_i2c(i2c, &smsc_regmap_config);
 	if (IS_ERR(smsc->regmap))
-- 
2.15.1

