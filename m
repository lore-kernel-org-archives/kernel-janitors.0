From: Markus Elfring <Markus.Elfring@web.de>
Date: Wed, 18 Sep 2019 07:44:06 +0000
Subject: [PATCH] hwrng: mediatek: Use devm_platform_ioremap_resource() in mtk_rng_probe()
Message-Id: <e6e03822-c68f-55ea-3a65-ee2a44f50e8c@web.de>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-crypto@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, Arnd Bergmann <arnd@arndb.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Herbert Xu <herbert@gondor.apana.org.au>, Matt Mackall <mpm@selenic.com>, Matthias Brugger <matthias.bgg@gmail.com>, Sean Wang <sean.wang@mediatek.com>
Cc: Bartosz Golaszewski <bgolaszewski@baylibre.com>, kernel-janitors@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Himanshu Jha <himanshujha199640@gmail.com>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Wed, 18 Sep 2019 09:34:11 +0200

Simplify this function implementation by using a known wrapper function.

This issue was detected by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/char/hw_random/mtk-rng.c | 9 +--------
 1 file changed, 1 insertion(+), 8 deletions(-)

diff --git a/drivers/char/hw_random/mtk-rng.c b/drivers/char/hw_random/mtk-rng.c
index e649be5a5f13..8ad7b515a51b 100644
--- a/drivers/char/hw_random/mtk-rng.c
+++ b/drivers/char/hw_random/mtk-rng.c
@@ -105,16 +105,9 @@ static int mtk_rng_read(struct hwrng *rng, void *buf, size_t max, bool wait)

 static int mtk_rng_probe(struct platform_device *pdev)
 {
-	struct resource *res;
 	int ret;
 	struct mtk_rng *priv;

-	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	if (!res) {
-		dev_err(&pdev->dev, "no iomem resource\n");
-		return -ENXIO;
-	}
-
 	priv = devm_kzalloc(&pdev->dev, sizeof(*priv), GFP_KERNEL);
 	if (!priv)
 		return -ENOMEM;
@@ -135,7 +128,7 @@ static int mtk_rng_probe(struct platform_device *pdev)
 		return ret;
 	}

-	priv->base = devm_ioremap_resource(&pdev->dev, res);
+	priv->base = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(priv->base))
 		return PTR_ERR(priv->base);

--
2.23.0
