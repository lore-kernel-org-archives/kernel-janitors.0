From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Date: Sun, 17 Jan 2021 14:26:35 +0000
Subject: [PATCH v2 1/2] cpufreq: brcmstb-avs-cpufreq: Fix some resource leaks in the error handling path of t
Message-Id: <20210117142635.568686-1-christophe.jaillet@wanadoo.fr>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mmayer@broadcom.com, bcm-kernel-feedback-list@broadcom.com, rjw@rjwysocki.net, viresh.kumar@linaro.org, f.fainelli@gmail.com
Cc: Christophe JAILLET <christophe.jaillet@wanadoo.fr>, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-pm@vger.kernel.org

If 'cpufreq_register_driver()' fails, we must release the resources
allocated in 'brcm_avs_prepare_init()' as already done in the remove
function.

To do that, introduce a new function 'brcm_avs_prepare_uninit()' in order
to avoid code duplication. This also makes the code more readable (IMHO).

Fixes: de322e085995 ("cpufreq: brcmstb-avs-cpufreq: AVS CPUfreq driver for Broadcom STB SoCs")
Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
v1->v2: be less verbose when writing the error handling path of the probe
---
 drivers/cpufreq/brcmstb-avs-cpufreq.c | 21 ++++++++++++++++-----
 1 file changed, 16 insertions(+), 5 deletions(-)

diff --git a/drivers/cpufreq/brcmstb-avs-cpufreq.c b/drivers/cpufreq/brcmstb-avs-cpufreq.c
index 3e31e5d28b79..e25ccb744187 100644
--- a/drivers/cpufreq/brcmstb-avs-cpufreq.c
+++ b/drivers/cpufreq/brcmstb-avs-cpufreq.c
@@ -597,6 +597,16 @@ static int brcm_avs_prepare_init(struct platform_device *pdev)
 	return ret;
 }
 
+static void brcm_avs_prepare_uninit(struct platform_device *pdev)
+{
+	struct private_data *priv;
+
+	priv = platform_get_drvdata(pdev);
+
+	iounmap(priv->avs_intr_base);
+	iounmap(priv->base);
+}
+
 static int brcm_avs_cpufreq_init(struct cpufreq_policy *policy)
 {
 	struct cpufreq_frequency_table *freq_table;
@@ -732,21 +742,22 @@ static int brcm_avs_cpufreq_probe(struct platform_device *pdev)
 
 	brcm_avs_driver.driver_data = pdev;
 
-	return cpufreq_register_driver(&brcm_avs_driver);
+	ret = cpufreq_register_driver(&brcm_avs_driver);
+	if (ret)
+		brcm_avs_prepare_uninit(pdev);
+
+	return ret;
 }
 
 static int brcm_avs_cpufreq_remove(struct platform_device *pdev)
 {
-	struct private_data *priv;
 	int ret;
 
 	ret = cpufreq_unregister_driver(&brcm_avs_driver);
 	if (ret)
 		return ret;
 
-	priv = platform_get_drvdata(pdev);
-	iounmap(priv->base);
-	iounmap(priv->avs_intr_base);
+	brcm_avs_prepare_uninit(pdev);
 
 	return 0;
 }
-- 
2.27.0
