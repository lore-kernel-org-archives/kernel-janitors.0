From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Date: Sat, 19 Dec 2020 07:52:07 +0000
Subject: [PATCH] hwrng: ingenic - Fix a resource leak in an error handling path
Message-Id: <20201219075207.176279-1-christophe.jaillet@wanadoo.fr>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mpm@selenic.com, herbert@gondor.apana.org.au, zhouyanjie@wanyeetech.com, aric.pzqi@ingenic.com
Cc: linux-crypto@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Christophe JAILLET <christophe.jaillet@wanadoo.fr>

In case of error, we should call 'clk_disable_unprepare()' to undo a
previous 'clk_prepare_enable()' call, as already done in the remove
function.

Fixes: 406346d22278 ("hwrng: ingenic - Add hardware TRNG for Ingenic X1830")
Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
 drivers/char/hw_random/ingenic-trng.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/char/hw_random/ingenic-trng.c b/drivers/char/hw_random/ingenic-trng.c
index 954a8411d67d..0eb80f786f4d 100644
--- a/drivers/char/hw_random/ingenic-trng.c
+++ b/drivers/char/hw_random/ingenic-trng.c
@@ -113,13 +113,17 @@ static int ingenic_trng_probe(struct platform_device *pdev)
 	ret = hwrng_register(&trng->rng);
 	if (ret) {
 		dev_err(&pdev->dev, "Failed to register hwrng\n");
-		return ret;
+		goto err_unprepare_clk;
 	}
 
 	platform_set_drvdata(pdev, trng);
 
 	dev_info(&pdev->dev, "Ingenic DTRNG driver registered\n");
 	return 0;
+
+err_unprepare_clk:
+	clk_disable_unprepare(trng->clk);
+	return ret;
 }
 
 static int ingenic_trng_remove(struct platform_device *pdev)
-- 
2.27.0
