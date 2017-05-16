From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Tue, 16 May 2017 12:08:47 +0000
Subject: [PATCH 2/2] regulator: fixed: Improve a size determination in two functions
Message-Id: <481ddb47-4d4d-6acc-ed31-f66079483179@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <83b84f24-503b-4b45-3e4d-9c88c6b0252b@users.sourceforge.net>
In-Reply-To: <83b84f24-503b-4b45-3e4d-9c88c6b0252b@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, kernel-janitors@vger.kernel.org
Cc: LKML <linux-kernel@vger.kernel.org>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Tue, 16 May 2017 13:43:11 +0200

Replace the specification of two data structures by pointer dereferences
as the parameter for the operator "sizeof" to make the corresponding size
determination a bit safer according to the Linux coding style convention.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/regulator/fixed.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/regulator/fixed.c b/drivers/regulator/fixed.c
index a947f357d0f8..c33e930c9587 100644
--- a/drivers/regulator/fixed.c
+++ b/drivers/regulator/fixed.c
@@ -54,8 +54,7 @@ of_get_fixed_voltage_config(struct device *dev,
 	struct device_node *np = dev->of_node;
 	struct regulator_init_data *init_data;
 
-	config = devm_kzalloc(dev, sizeof(struct fixed_voltage_config),
-								 GFP_KERNEL);
+	config = devm_kzalloc(dev, sizeof(*config), GFP_KERNEL);
 	if (!config)
 		return ERR_PTR(-ENOMEM);
 
@@ -104,8 +103,7 @@ static int reg_fixed_voltage_probe(struct platform_device *pdev)
 	struct regulator_config cfg = { };
 	int ret;
 
-	drvdata = devm_kzalloc(&pdev->dev, sizeof(struct fixed_voltage_data),
-			       GFP_KERNEL);
+	drvdata = devm_kzalloc(&pdev->dev, sizeof(*drvdata), GFP_KERNEL);
 	if (!drvdata)
 		return -ENOMEM;
 
-- 
2.13.0

