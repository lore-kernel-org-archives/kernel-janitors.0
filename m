From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Tue, 16 May 2017 12:07:24 +0000
Subject: [PATCH 1/2] regulator: fixed: Delete error messages for failed memory allocations in reg_fixed_volta
Message-Id: <b195b319-5bc3-15d1-96e7-c19ab45e1f84@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <83b84f24-503b-4b45-3e4d-9c88c6b0252b@users.sourceforge.net>
In-Reply-To: <83b84f24-503b-4b45-3e4d-9c88c6b0252b@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, kernel-janitors@vger.kernel.org
Cc: LKML <linux-kernel@vger.kernel.org>, Wolfram Sang <wsa@the-dreams.de>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Tue, 16 May 2017 13:31:20 +0200

Omit two extra messages for memory allocation failures in this function.

This issue was detected by using the Coccinelle software.

Link: http://events.linuxfoundation.org/sites/events/files/slides/LCJ16-Refactor_Strings-WSang_0.pdf
Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/regulator/fixed.c | 10 +++-------
 1 file changed, 3 insertions(+), 7 deletions(-)

diff --git a/drivers/regulator/fixed.c b/drivers/regulator/fixed.c
index 988a7472c2ab..a947f357d0f8 100644
--- a/drivers/regulator/fixed.c
+++ b/drivers/regulator/fixed.c
@@ -124,10 +124,9 @@ static int reg_fixed_voltage_probe(struct platform_device *pdev)
 	drvdata->desc.name = devm_kstrdup(&pdev->dev,
 					  config->supply_name,
 					  GFP_KERNEL);
-	if (drvdata->desc.name = NULL) {
-		dev_err(&pdev->dev, "Failed to allocate supply name\n");
+	if (!drvdata->desc.name)
 		return -ENOMEM;
-	}
+
 	drvdata->desc.type = REGULATOR_VOLTAGE;
 	drvdata->desc.owner = THIS_MODULE;
 	drvdata->desc.ops = &fixed_voltage_ops;
@@ -138,11 +137,8 @@ static int reg_fixed_voltage_probe(struct platform_device *pdev)
 		drvdata->desc.supply_name = devm_kstrdup(&pdev->dev,
 					    config->input_supply,
 					    GFP_KERNEL);
-		if (!drvdata->desc.supply_name) {
-			dev_err(&pdev->dev,
-				"Failed to allocate input supply\n");
+		if (!drvdata->desc.supply_name)
 			return -ENOMEM;
-		}
 	}
 
 	if (config->microvolts)
-- 
2.13.0

