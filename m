From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Tue, 29 Dec 2015 14:18:24 +0000
Subject: [PATCH 2/2] mfd: smsc-ece1099: Refactoring for smsc_i2c_probe()
Message-Id: <56829630.6030706@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <566ABCD9.1060404@users.sourceforge.net>
 <5682957F.5000604@users.sourceforge.net>
In-Reply-To: <5682957F.5000604@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: LKML <linux-kernel@vger.kernel.org>, Lee Jones <lee.jones@linaro.org>
Cc: kernel-janitors@vger.kernel.org, Julia Lawall <julia.lawall@lip6.fr>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Tue, 29 Dec 2015 15:03:31 +0100

This issue was detected by using the Coccinelle software.

* Let us return directly if a call of the function "devm_regmap_init_i2c"
  or "regmap_write" failed.

* Delete the jump label "err" then.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/mfd/smsc-ece1099.c | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/drivers/mfd/smsc-ece1099.c b/drivers/mfd/smsc-ece1099.c
index bcac488..951333a 100644
--- a/drivers/mfd/smsc-ece1099.c
+++ b/drivers/mfd/smsc-ece1099.c
@@ -46,10 +46,8 @@ static int smsc_i2c_probe(struct i2c_client *i2c,
 	}
 
 	smsc->regmap = devm_regmap_init_i2c(i2c, &smsc_regmap_config);
-	if (IS_ERR(smsc->regmap)) {
-		ret = PTR_ERR(smsc->regmap);
-		goto err;
-	}
+	if (IS_ERR(smsc->regmap))
+		return PTR_ERR(smsc->regmap);
 
 	i2c_set_clientdata(i2c, smsc);
 	smsc->dev = &i2c->dev;
@@ -68,7 +66,7 @@ static int smsc_i2c_probe(struct i2c_client *i2c,
 
 	ret = regmap_write(smsc->regmap, SMSC_CLK_CTRL, smsc->clk);
 	if (ret)
-		goto err;
+		return ret;
 
 #ifdef CONFIG_OF
 	if (i2c->dev.of_node)
@@ -76,7 +74,6 @@ static int smsc_i2c_probe(struct i2c_client *i2c,
 					   NULL, NULL, &i2c->dev);
 #endif
 
-err:
 	return ret;
 }
 
-- 
2.6.3

