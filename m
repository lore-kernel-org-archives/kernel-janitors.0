From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Date: Fri, 08 May 2020 07:11:50 +0000
Subject: [PATCH] power: supply: lp8788: Fix an error handling path in 'lp8788_charger_probe()'
Message-Id: <20200508071150.204974-1-christophe.jaillet@wanadoo.fr>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: milo.kim@ti.com, sre@kernel.org, anton.vorontsov@linaro.org
Cc: linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Christophe JAILLET <christophe.jaillet@wanadoo.fr>

In case of error, resources allocated in 'lp8788_setup_adc_channel()' must
be released.

Add a call to 'lp8788_release_adc_channel()' as already done in the remove
function.

Fixes: 98a276649358 ("power_supply: Add new lp8788 charger driver")
Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
 drivers/power/supply/lp8788-charger.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/power/supply/lp8788-charger.c b/drivers/power/supply/lp8788-charger.c
index 84a206f42a8e..641815eb24bc 100644
--- a/drivers/power/supply/lp8788-charger.c
+++ b/drivers/power/supply/lp8788-charger.c
@@ -719,13 +719,17 @@ static int lp8788_charger_probe(struct platform_device *pdev)
 
 	ret = lp8788_psy_register(pdev, pchg);
 	if (ret)
-		return ret;
+		goto err_release_adc_channel;
 
 	ret = lp8788_irq_register(pdev, pchg);
 	if (ret)
 		dev_warn(dev, "failed to register charger irq: %d\n", ret);
 
 	return 0;
+
+err_release_adc_channel:
+	lp8788_release_adc_channel(pchg);
+	return ret;
 }
 
 static int lp8788_charger_remove(struct platform_device *pdev)
-- 
2.25.1
