From: Markus Elfring <Markus.Elfring@web.de>
Date: Wed, 18 Sep 2019 06:34:25 +0000
Subject: [PATCH] sata_gemini: Use devm_platform_ioremap_resource() in gemini_sata_probe()
Message-Id: <b17404cd-294f-fe2f-e8a3-2218a0dae14f@web.de>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ide@vger.kernel.org, Jens Axboe <axboe@kernel.dk>, Linus Walleij <linus.walleij@linaro.org>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org, Bartosz Golaszewski <bgolaszewski@baylibre.com>, Himanshu Jha <himanshujha199640@gmail.com>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Wed, 18 Sep 2019 08:28:09 +0200

Simplify this function implementation by using a known wrapper function.

This issue was detected by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/ata/sata_gemini.c | 8 +-------
 1 file changed, 1 insertion(+), 7 deletions(-)

diff --git a/drivers/ata/sata_gemini.c b/drivers/ata/sata_gemini.c
index f793564f3d78..61a34cad90c1 100644
--- a/drivers/ata/sata_gemini.c
+++ b/drivers/ata/sata_gemini.c
@@ -318,7 +318,6 @@ static int gemini_sata_probe(struct platform_device *pdev)
 	struct device_node *np = dev->of_node;
 	struct sata_gemini *sg;
 	struct regmap *map;
-	struct resource *res;
 	enum gemini_muxmode muxmode;
 	u32 gmode;
 	u32 gmask;
@@ -328,12 +327,7 @@ static int gemini_sata_probe(struct platform_device *pdev)
 	if (!sg)
 		return -ENOMEM;
 	sg->dev = dev;
-
-	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	if (!res)
-		return -ENODEV;
-
-	sg->base = devm_ioremap_resource(dev, res);
+	sg->base = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(sg->base))
 		return PTR_ERR(sg->base);

--
2.23.0
