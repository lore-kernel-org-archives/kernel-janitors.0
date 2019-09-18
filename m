From: Markus Elfring <Markus.Elfring@web.de>
Date: Wed, 18 Sep 2019 11:48:47 +0000
Subject: [PATCH] mfd: ipaq-micro: Use devm_platform_ioremap_resource() in micro_probe()
Message-Id: <d9990bcc-2daa-67ad-4de5-7a849668d038@web.de>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org, Lee Jones <lee.jones@linaro.org>, Linus Walleij <linus.walleij@linaro.org>
Cc: LKML <linux-kernel@vger.kernel.org>, Bartosz Golaszewski <bgolaszewski@baylibre.com>, Himanshu Jha <himanshujha199640@gmail.com>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Wed, 18 Sep 2019 13:40:30 +0200

Simplify this function implementation by using a known wrapper function.

This issue was detected by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/mfd/ipaq-micro.c | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/drivers/mfd/ipaq-micro.c b/drivers/mfd/ipaq-micro.c
index a1d9be82734d..e92eeeb67a98 100644
--- a/drivers/mfd/ipaq-micro.c
+++ b/drivers/mfd/ipaq-micro.c
@@ -396,11 +396,7 @@ static int __init micro_probe(struct platform_device *pdev)
 	if (IS_ERR(micro->base))
 		return PTR_ERR(micro->base);

-	res = platform_get_resource(pdev, IORESOURCE_MEM, 1);
-	if (!res)
-		return -EINVAL;
-
-	micro->sdlc = devm_ioremap_resource(&pdev->dev, res);
+	micro->sdlc = devm_platform_ioremap_resource(pdev, 1);
 	if (IS_ERR(micro->sdlc))
 		return PTR_ERR(micro->sdlc);

--
2.23.0
