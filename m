From: Markus Elfring <Markus.Elfring@web.de>
Date: Sat, 21 Sep 2019 11:30:29 +0000
Subject: [PATCH] rtc: m48t86: Use devm_platform_ioremap_resource() in m48t86_rtc_probe()
Message-Id: <25448e11-c43f-9ae0-4c43-6f789accc026@web.de>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-rtc@vger.kernel.org, Alessandro Zummo <a.zummo@towertech.it>, Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Sat, 21 Sep 2019 13:13:35 +0200

Simplify this function implementation by using a known wrapper function.

This issue was detected by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/rtc/rtc-m48t86.c | 11 ++---------
 1 file changed, 2 insertions(+), 9 deletions(-)

diff --git a/drivers/rtc/rtc-m48t86.c b/drivers/rtc/rtc-m48t86.c
index 59b54ed9b841..75a0e73071d8 100644
--- a/drivers/rtc/rtc-m48t86.c
+++ b/drivers/rtc/rtc-m48t86.c
@@ -218,7 +218,6 @@ static bool m48t86_verify_chip(struct platform_device *pdev)
 static int m48t86_rtc_probe(struct platform_device *pdev)
 {
 	struct m48t86_rtc_info *info;
-	struct resource *res;
 	unsigned char reg;
 	int err;
 	struct nvmem_config m48t86_nvmem_cfg = {
@@ -235,17 +234,11 @@ static int m48t86_rtc_probe(struct platform_device *pdev)
 	if (!info)
 		return -ENOMEM;

-	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	if (!res)
-		return -ENODEV;
-	info->index_reg = devm_ioremap_resource(&pdev->dev, res);
+	info->index_reg = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(info->index_reg))
 		return PTR_ERR(info->index_reg);

-	res = platform_get_resource(pdev, IORESOURCE_MEM, 1);
-	if (!res)
-		return -ENODEV;
-	info->data_reg = devm_ioremap_resource(&pdev->dev, res);
+	info->data_reg = devm_platform_ioremap_resource(pdev, 1);
 	if (IS_ERR(info->data_reg))
 		return PTR_ERR(info->data_reg);

--
2.23.0
