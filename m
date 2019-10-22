From: Wei Yongjun <weiyongjun1@huawei.com>
Date: Tue, 22 Oct 2019 11:18:56 +0000
Subject: [PATCH -next] power: supply: ab8500_charger: Fix wrong pointer passed to PTR_ERR()
Message-Id: <20191022111856.44118-1-weiyongjun1@huawei.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Sebastian Reichel <sre@kernel.org>, Linus Walleij <linus.walleij@linaro.org>
Cc: Wei Yongjun <weiyongjun1@huawei.com>, linux-pm@vger.kernel.org, kernel-janitors@vger.kernel.org

PTR_ERR should access the value just tested by IS_ERR, otherwise
the wrong error code will be returned.

Fixes: 97ab78bac5d0 ("power: supply: ab8500_charger: Convert to IIO ADC")
Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
---
 drivers/power/supply/ab8500_charger.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/power/supply/ab8500_charger.c b/drivers/power/supply/ab8500_charger.c
index ff2bb4411a22..8a0f9d769690 100644
--- a/drivers/power/supply/ab8500_charger.c
+++ b/drivers/power/supply/ab8500_charger.c
@@ -3393,7 +3393,7 @@ static int ab8500_charger_probe(struct platform_device *pdev)
 		if (PTR_ERR(di->adc_main_charger_c) = -ENODEV)
 			return -EPROBE_DEFER;
 		dev_err(&pdev->dev, "failed to get ADC main charger current\n");
-		return PTR_ERR(di->adc_main_charger_v);
+		return PTR_ERR(di->adc_main_charger_c);
 	}
 	di->adc_vbus_v = devm_iio_channel_get(&pdev->dev, "vbus_v");
 	if (IS_ERR(di->adc_vbus_v)) {
