From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 12 Feb 2016 06:39:40 +0000
Subject: [patch] regulator: qcom-saw: testing the wrong variable
Message-Id: <20160212063940.GC22756@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Liam Girdwood <lgirdwood@gmail.com>, Georgi Djakov <georgi.djakov@linaro.org>
Cc: Mark Brown <broonie@kernel.org>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

We accidentally test "config.regmap" which is zero instead of
"vreg->regmap".

Fixes: 18bba3b50355 ('regulator: qcom-saw: Add support for SAW regulators')
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/regulator/qcom_saw-regulator.c b/drivers/regulator/qcom_saw-regulator.c
index c800f16..c00f0df 100644
--- a/drivers/regulator/qcom_saw-regulator.c
+++ b/drivers/regulator/qcom_saw-regulator.c
@@ -186,8 +186,8 @@ static int qcom_saw_regulator_probe(struct platform_device *pdev)
 
 	vreg->regmap = syscon_node_to_regmap(saw_np);
 	of_node_put(saw_np);
-	if (IS_ERR(config.regmap))
-		return PTR_ERR(config.regmap);
+	if (IS_ERR(vreg->regmap))
+		return PTR_ERR(vreg->regmap);
 
 	snprintf(name, sizeof(name), "krait%d", cpu);
 
