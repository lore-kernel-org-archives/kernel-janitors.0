From: Markus Elfring <Markus.Elfring@web.de>
Date: Sat, 21 Sep 2019 11:49:12 +0000
Subject: [PATCH] rtc: r7301: Use devm_platform_ioremap_resource() in rtc7301_rtc_probe()
Message-Id: <8c17a59c-82ff-aa6b-5653-a38d786d3e83@web.de>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-rtc@vger.kernel.org, Akinobu Mita <akinobu.mita@gmail.com>, Alessandro Zummo <a.zummo@towertech.it>, Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org, Rob Herring <robh@kernel.org>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Sat, 21 Sep 2019 13:43:07 +0200

Simplify this function implementation by using a known wrapper function.

This issue was detected by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/rtc/rtc-r7301.c | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/drivers/rtc/rtc-r7301.c b/drivers/rtc/rtc-r7301.c
index 2498278853af..aaf1b95e3990 100644
--- a/drivers/rtc/rtc-r7301.c
+++ b/drivers/rtc/rtc-r7301.c
@@ -354,21 +354,16 @@ static void rtc7301_init(struct rtc7301_priv *priv)

 static int __init rtc7301_rtc_probe(struct platform_device *dev)
 {
-	struct resource *res;
 	void __iomem *regs;
 	struct rtc7301_priv *priv;
 	struct rtc_device *rtc;
 	int ret;

-	res = platform_get_resource(dev, IORESOURCE_MEM, 0);
-	if (!res)
-		return -ENODEV;
-
 	priv = devm_kzalloc(&dev->dev, sizeof(*priv), GFP_KERNEL);
 	if (!priv)
 		return -ENOMEM;

-	regs = devm_ioremap_resource(&dev->dev, res);
+	regs = devm_platform_ioremap_resource(dev, 0);
 	if (IS_ERR(regs))
 		return PTR_ERR(regs);

--
2.23.0
