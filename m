From: Markus Elfring <Markus.Elfring@web.de>
Date: Sat, 21 Sep 2019 10:48:25 +0000
Subject: [PATCH] rtc: goldfish: Use devm_platform_ioremap_resource() in goldfish_rtc_probe()
Message-Id: <5ecfcf43-d6b2-1a38-dee8-b8806f30bc83@web.de>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-rtc@vger.kernel.org, Alessandro Zummo <a.zummo@towertech.it>, Alexandre Belloni <alexandre.belloni@bootlin.com>, Miodrag Dinic <miodrag.dinic@mips.com>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org, Aleksandar Markovic <aleksandar.markovic@imgtec.com>, Goran Ferenc <goran.ferenc@imgtec.com>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Sat, 21 Sep 2019 12:20:11 +0200

Simplify this function implementation by using a known wrapper function.

This issue was detected by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/rtc/rtc-goldfish.c | 8 +-------
 1 file changed, 1 insertion(+), 7 deletions(-)

diff --git a/drivers/rtc/rtc-goldfish.c b/drivers/rtc/rtc-goldfish.c
index 1a3420ee6a4d..cb6b0ad7ec3f 100644
--- a/drivers/rtc/rtc-goldfish.c
+++ b/drivers/rtc/rtc-goldfish.c
@@ -165,7 +165,6 @@ static const struct rtc_class_ops goldfish_rtc_ops = {
 static int goldfish_rtc_probe(struct platform_device *pdev)
 {
 	struct goldfish_rtc *rtcdrv;
-	struct resource *r;
 	int err;

 	rtcdrv = devm_kzalloc(&pdev->dev, sizeof(*rtcdrv), GFP_KERNEL);
@@ -173,12 +172,7 @@ static int goldfish_rtc_probe(struct platform_device *pdev)
 		return -ENOMEM;

 	platform_set_drvdata(pdev, rtcdrv);
-
-	r = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	if (!r)
-		return -ENODEV;
-
-	rtcdrv->base = devm_ioremap_resource(&pdev->dev, r);
+	rtcdrv->base = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(rtcdrv->base))
 		return -ENODEV;

--
2.23.0
