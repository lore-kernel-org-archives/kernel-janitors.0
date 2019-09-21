From: Markus Elfring <Markus.Elfring@web.de>
Date: Sat, 21 Sep 2019 10:00:52 +0000
Subject: [PATCH] rtc: fsl-ftm-alarm: Use devm_platform_ioremap_resource() in ftm_rtc_probe()
Message-Id: <4552ef52-f218-93b1-6dfa-668d137676f8@web.de>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-rtc@vger.kernel.org, Alessandro Zummo <a.zummo@towertech.it>, Alexandre Belloni <alexandre.belloni@bootlin.com>, Biwen Li <biwen.li@nxp.com>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Sat, 21 Sep 2019 11:49:01 +0200

Simplify this function implementation by using a known wrapper function.

This issue was detected by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/rtc/rtc-fsl-ftm-alarm.c | 9 +--------
 1 file changed, 1 insertion(+), 8 deletions(-)

diff --git a/drivers/rtc/rtc-fsl-ftm-alarm.c b/drivers/rtc/rtc-fsl-ftm-alarm.c
index 8df2075af9a2..b83f7afa8311 100644
--- a/drivers/rtc/rtc-fsl-ftm-alarm.c
+++ b/drivers/rtc/rtc-fsl-ftm-alarm.c
@@ -248,7 +248,6 @@ static const struct rtc_class_ops ftm_rtc_ops = {
 static int ftm_rtc_probe(struct platform_device *pdev)
 {
 	struct device_node *np = pdev->dev.of_node;
-	struct resource *r;
 	int irq;
 	int ret;
 	struct ftm_rtc *rtc;
@@ -265,13 +264,7 @@ static int ftm_rtc_probe(struct platform_device *pdev)
 	if (IS_ERR(rtc->rtc_dev))
 		return PTR_ERR(rtc->rtc_dev);

-	r = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	if (!r) {
-		dev_err(&pdev->dev, "cannot get resource for rtc\n");
-		return -ENODEV;
-	}
-
-	rtc->base = devm_ioremap_resource(&pdev->dev, r);
+	rtc->base = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(rtc->base)) {
 		dev_err(&pdev->dev, "cannot ioremap resource for rtc\n");
 		return PTR_ERR(rtc->base);
--
2.23.0
