From: Dan Carpenter <error27@gmail.com>
Date: Sat, 14 Aug 2010 09:03:16 +0000
Subject: [patch] regulator/ab8500: move dereference below the check for NULL
Message-Id: <20100814090316.GX645@bicker>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Liam Girdwood <lrg@slimlogic.co.uk>
Cc: Mark Brown <broonie@opensource.wolfsonmicro.com>, Bengt JONSSON <bengt.g.jonsson@stericsson.com>, Sundar R Iyer <sundar.iyer@stericsson.com>, Linus Walleij <linus.walleij@stericsson.com>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

I moved the dereference of "ab8500" below the check for NULL.

Signed-off-by: Dan Carpenter <error27@gmail.com>

diff --git a/drivers/regulator/ab8500.c b/drivers/regulator/ab8500.c
index dc3f1a4..cc7cbaf 100644
--- a/drivers/regulator/ab8500.c
+++ b/drivers/regulator/ab8500.c
@@ -344,13 +344,14 @@ static inline struct ab8500_regulator_info *find_regulator_info(int id)
 static __devinit int ab8500_regulator_probe(struct platform_device *pdev)
 {
 	struct ab8500 *ab8500 = dev_get_drvdata(pdev->dev.parent);
-	struct ab8500_platform_data *pdata = dev_get_platdata(ab8500->dev);
+	struct ab8500_platform_data *pdata;
 	int i, err;
 
 	if (!ab8500) {
 		dev_err(&pdev->dev, "null mfd parent\n");
 		return -EINVAL;
 	}
+	pdata = dev_get_platdata(ab8500->dev);
 
 	/* register all regulators */
 	for (i = 0; i < ARRAY_SIZE(ab8500_regulator_info); i++) {
