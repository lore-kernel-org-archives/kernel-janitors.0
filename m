From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 30 Aug 2017 14:03:58 +0000
Subject: [PATCH] regulator: da9063: Return an error code on probe failure
Message-Id: <20170830140358.k3i3rehnrtdrys4t@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Support Opensource <support.opensource@diasemi.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

If "regl_pdata->n_regulators = 0" is true then we accidentally return
PTR_ERR(<some_valid_pointer>) instead of an error code.  I've changed it
to return -ENODEV instead.

Fixes: 69ca3e58d178 ("regulator: da9063: Add Dialog DA9063 voltage regulators support.")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/regulator/da9063-regulator.c b/drivers/regulator/da9063-regulator.c
index c6af343f54ea..6a8f9cd69f52 100644
--- a/drivers/regulator/da9063-regulator.c
+++ b/drivers/regulator/da9063-regulator.c
@@ -736,7 +736,7 @@ static int da9063_regulator_probe(struct platform_device *pdev)
 	if (IS_ERR(regl_pdata) || regl_pdata->n_regulators = 0) {
 		dev_err(&pdev->dev,
 			"No regulators defined for the platform\n");
-		return PTR_ERR(regl_pdata);
+		return -ENODEV;
 	}
 
 	/* Find regulators set for particular device model */
