From: Markus Elfring <Markus.Elfring@web.de>
Date: Sun, 05 Apr 2020 15:36:15 +0000
Subject: [PATCH] rtc: Delete an error message in three functions
Message-Id: <04116352-b464-041c-1939-96440133aa6f@web.de>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: linux-rtc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, Alessandro Zummo <a.zummo@towertech.it>, Alexandre Belloni <alexandre.belloni@bootlin.com>, Eddie Huang <eddie.huang@mediatek.com>, Sean Wang <sean.wang@mediatek.com>, Vladimir Zapolskiy <vz@mleia.com>
Cc: kernel-janitors@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Tang Bin <tangbin@cmss.chinamobile.com>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Sun, 5 Apr 2020 17:30:15 +0200

The function “platform_get_irq” can log an error already.
Thus omit redundant messages for the exception handling in the
calling functions.

This issue was detected by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/rtc/rtc-fsl-ftm-alarm.c | 4 +---
 drivers/rtc/rtc-lpc24xx.c       | 4 +---
 drivers/rtc/rtc-mt2712.c        | 4 +---
 3 files changed, 3 insertions(+), 9 deletions(-)

diff --git a/drivers/rtc/rtc-fsl-ftm-alarm.c b/drivers/rtc/rtc-fsl-ftm-alarm.c
index 756af62b0486..23c811da4801 100644
--- a/drivers/rtc/rtc-fsl-ftm-alarm.c
+++ b/drivers/rtc/rtc-fsl-ftm-alarm.c
@@ -268,10 +268,8 @@ static int ftm_rtc_probe(struct platform_device *pdev)
 	}

 	irq = platform_get_irq(pdev, 0);
-	if (irq < 0) {
-		dev_err(&pdev->dev, "can't get irq number\n");
+	if (irq < 0)
 		return irq;
-	}

 	ret = devm_request_irq(&pdev->dev, irq, ftm_rtc_alarm_interrupt,
 			       IRQF_NO_SUSPEND, dev_name(&pdev->dev), rtc);
diff --git a/drivers/rtc/rtc-lpc24xx.c b/drivers/rtc/rtc-lpc24xx.c
index 00ef16ba9480..eec881a81067 100644
--- a/drivers/rtc/rtc-lpc24xx.c
+++ b/drivers/rtc/rtc-lpc24xx.c
@@ -205,10 +205,8 @@ static int lpc24xx_rtc_probe(struct platform_device *pdev)
 		return PTR_ERR(rtc->rtc_base);

 	irq = platform_get_irq(pdev, 0);
-	if (irq < 0) {
-		dev_warn(&pdev->dev, "can't get interrupt resource\n");
+	if (irq < 0)
 		return irq;
-	}

 	rtc->clk_rtc = devm_clk_get(&pdev->dev, "rtc");
 	if (IS_ERR(rtc->clk_rtc)) {
diff --git a/drivers/rtc/rtc-mt2712.c b/drivers/rtc/rtc-mt2712.c
index 581b8731fb8a..f6bdbabd7202 100644
--- a/drivers/rtc/rtc-mt2712.c
+++ b/drivers/rtc/rtc-mt2712.c
@@ -328,10 +328,8 @@ static int mt2712_rtc_probe(struct platform_device *pdev)
 	mt2712_rtc_hw_init(mt2712_rtc);

 	mt2712_rtc->irq = platform_get_irq(pdev, 0);
-	if (mt2712_rtc->irq < 0) {
-		dev_err(&pdev->dev, "No IRQ resource\n");
+	if (mt2712_rtc->irq < 0)
 		return mt2712_rtc->irq;
-	}

 	platform_set_drvdata(pdev, mt2712_rtc);

--
2.26.0
