From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Date: Tue, 13 Mar 2018 20:33:11 +0000
Subject: [PATCH] regulator: gpio: Fix some error handling paths in 'gpio_regulator_probe()'
Message-Id: <20180313203311.11378-1-christophe.jaillet@wanadoo.fr>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: broonie@kernel.org, lgirdwood@gmail.com, rf@opensource.wolfsonmicro.com
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Christophe JAILLET <christophe.jaillet@wanadoo.fr>

Re-order error handling code and gotos to avoid leaks in error handling
paths.

Fixes: 9f946099fe19 ("regulator: gpio: fix parsing of gpio list")
Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
 drivers/regulator/gpio-regulator.c | 16 +++++++---------
 1 file changed, 7 insertions(+), 9 deletions(-)

diff --git a/drivers/regulator/gpio-regulator.c b/drivers/regulator/gpio-regulator.c
index 0fce06acfaec..a2eb50719c7b 100644
--- a/drivers/regulator/gpio-regulator.c
+++ b/drivers/regulator/gpio-regulator.c
@@ -271,8 +271,7 @@ static int gpio_regulator_probe(struct platform_device *pdev)
 	drvdata->desc.name = kstrdup(config->supply_name, GFP_KERNEL);
 	if (drvdata->desc.name = NULL) {
 		dev_err(&pdev->dev, "Failed to allocate supply name\n");
-		ret = -ENOMEM;
-		goto err;
+		return -ENOMEM;
 	}
 
 	if (config->nr_gpios != 0) {
@@ -292,7 +291,7 @@ static int gpio_regulator_probe(struct platform_device *pdev)
 				dev_err(&pdev->dev,
 					"Could not obtain regulator setting GPIOs: %d\n",
 					ret);
-			goto err_memstate;
+			goto err_memgpio;
 		}
 	}
 
@@ -303,7 +302,7 @@ static int gpio_regulator_probe(struct platform_device *pdev)
 	if (drvdata->states = NULL) {
 		dev_err(&pdev->dev, "Failed to allocate state data\n");
 		ret = -ENOMEM;
-		goto err_memgpio;
+		goto err_stategpio;
 	}
 	drvdata->nr_states = config->nr_states;
 
@@ -324,7 +323,7 @@ static int gpio_regulator_probe(struct platform_device *pdev)
 	default:
 		dev_err(&pdev->dev, "No regulator type set\n");
 		ret = -EINVAL;
-		goto err_memgpio;
+		goto err_memstate;
 	}
 
 	/* build initial state from gpio init data. */
@@ -361,22 +360,21 @@ static int gpio_regulator_probe(struct platform_device *pdev)
 	if (IS_ERR(drvdata->dev)) {
 		ret = PTR_ERR(drvdata->dev);
 		dev_err(&pdev->dev, "Failed to register regulator: %d\n", ret);
-		goto err_stategpio;
+		goto err_memstate;
 	}
 
 	platform_set_drvdata(pdev, drvdata);
 
 	return 0;
 
-err_stategpio:
-	gpio_free_array(drvdata->gpios, drvdata->nr_gpios);
 err_memstate:
 	kfree(drvdata->states);
+err_stategpio:
+	gpio_free_array(drvdata->gpios, drvdata->nr_gpios);
 err_memgpio:
 	kfree(drvdata->gpios);
 err_name:
 	kfree(drvdata->desc.name);
-err:
 	return ret;
 }
 
-- 
2.14.1

