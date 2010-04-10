From: Christoph Fritz <chf.fritz@googlemail.com>
Date: Sat, 10 Apr 2010 12:40:37 +0000
Subject: [PATCH] fix checking in probe function
Message-Id: <1270903237.3689.2.camel@lovely>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org



Improve device and platform data checks in probe function.


Signed-off-by: Haojian Zhuang <haojian.zhuang@marvell.com>
Signed-off-by: Christoph Fritz <chf.fritz@googlemail.com>
---
 drivers/leds/leds-88pm860x.c |   11 ++++++++---
 1 files changed, 8 insertions(+), 3 deletions(-)

diff --git a/drivers/leds/leds-88pm860x.c b/drivers/leds/leds-88pm860x.c
index 16a60c0..b767710 100644
--- a/drivers/leds/leds-88pm860x.c
+++ b/drivers/leds/leds-88pm860x.c
@@ -256,8 +256,10 @@ static int pm860x_led_probe(struct platform_device *pdev)
 	if (pdev->dev.parent->platform_data) {
 		pm860x_pdata = pdev->dev.parent->platform_data;
 		pdata = pm860x_pdata->led;
-	} else
-		pdata = NULL;
+	} else {
+		dev_err(&pdev->dev, "missing platform data\n");
+		return -EINVAL;
+	}
 
 	data = kzalloc(sizeof(struct pm860x_led), GFP_KERNEL);
 	if (data = NULL)
@@ -268,8 +270,11 @@ static int pm860x_led_probe(struct platform_device *pdev)
 	data->i2c = (chip->id = CHIP_PM8606) ? chip->client : chip->companion;
 	data->iset = pdata->iset;
 	data->port = __check_device(pdata, data->name);
-	if (data->port < 0)
+	if (data->port < 0) {
+		dev_err(&pdev->dev, "check device failed\n");
+		kfree(data);
 		return -EINVAL;
+	}
 
 	data->current_brightness = 0;
 	data->cdev.name = data->name;
-- 
1.5.6.5


