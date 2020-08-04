From: Wei Yongjun <weiyongjun1@huawei.com>
Date: Tue, 04 Aug 2020 08:11:53 +0000
Subject: [PATCH] crypto: ingenic - Drop kfree for memory allocated with devm_kzalloc
Message-Id: <20200804081153.45342-1-weiyongjun1@huawei.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mpm@selenic.com, herbert@gondor.apana.org.au, arnd@arndb.de, gregkh@linuxfoundation.org, zhouyanjie@wanyeetech.com, prasannatsmkumar@gmail.com
Cc: Wei Yongjun <weiyongjun1@huawei.com>, linux-crypto@vger.kernel.org, kernel-janitors@vger.kernel.org, Hulk Robot <hulkci@huawei.com>

It's not necessary to free memory allocated with devm_kzalloc
and using kfree leads to a double free.

Fixes: 190873a0ea45 ("crypto: ingenic - Add hardware RNG for Ingenic JZ4780 and X1000")
Reported-by: Hulk Robot <hulkci@huawei.com>
Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
---
 drivers/char/hw_random/ingenic-rng.c | 9 ++-------
 1 file changed, 2 insertions(+), 7 deletions(-)

diff --git a/drivers/char/hw_random/ingenic-rng.c b/drivers/char/hw_random/ingenic-rng.c
index d704cef64b64..055cfe59f519 100644
--- a/drivers/char/hw_random/ingenic-rng.c
+++ b/drivers/char/hw_random/ingenic-rng.c
@@ -92,8 +92,7 @@ static int ingenic_rng_probe(struct platform_device *pdev)
 	priv->base = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(priv->base)) {
 		pr_err("%s: Failed to map RNG registers\n", __func__);
-		ret = PTR_ERR(priv->base);
-		goto err_free_rng;
+		return PTR_ERR(priv->base);
 	}
 
 	priv->version = (enum ingenic_rng_version)of_device_get_match_data(&pdev->dev);
@@ -106,17 +105,13 @@ static int ingenic_rng_probe(struct platform_device *pdev)
 	ret = hwrng_register(&priv->rng);
 	if (ret) {
 		dev_err(&pdev->dev, "Failed to register hwrng\n");
-		goto err_free_rng;
+		return ret;
 	}
 
 	platform_set_drvdata(pdev, priv);
 
 	dev_info(&pdev->dev, "Ingenic RNG driver registered\n");
 	return 0;
-
-err_free_rng:
-	kfree(priv);
-	return ret;
 }
 
 static int ingenic_rng_remove(struct platform_device *pdev)
