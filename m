From: Markus Elfring <Markus.Elfring@web.de>
Date: Sat, 04 Apr 2020 15:17:19 +0000
Subject: [PATCH] hwrng: xgene - Delete an error message in xgene_rng_probe()
Message-Id: <45447185-d64f-027c-7bca-c59ea21e6021@web.de>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: linux-crypto@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>, Chuhong Yuan <hslester96@gmail.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Herbert Xu <herbert@gondor.apana.org.au>, Ludovic Desroches <ludovic.desroches@microchip.com>, =?UTF-8?Q?=c5=81ukasz_Stelmach?= <l.stelmach@samsung.com>, Matt Mackall <mpm@selenic.com>, Thomas Gleixner <tglx@linutronix.de>, YueHaibing <yuehaibing@huawei.com>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org, Tang Bin <tangbin@cmss.chinamobile.com>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Sat, 4 Apr 2020 17:07:34 +0200

The function “platform_get_irq” can log an error already.
Thus omit a redundant message for the exception handling in the
calling function.

This issue was detected by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/char/hw_random/xgene-rng.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/char/hw_random/xgene-rng.c b/drivers/char/hw_random/xgene-rng.c
index d7516a446987..008e6db9ce01 100644
--- a/drivers/char/hw_random/xgene-rng.c
+++ b/drivers/char/hw_random/xgene-rng.c
@@ -328,10 +328,8 @@ static int xgene_rng_probe(struct platform_device *pdev)
 		return PTR_ERR(ctx->csr_base);

 	rc = platform_get_irq(pdev, 0);
-	if (rc < 0) {
-		dev_err(&pdev->dev, "No IRQ resource\n");
+	if (rc < 0)
 		return rc;
-	}
 	ctx->irq = rc;

 	dev_dbg(&pdev->dev, "APM X-Gene RNG BASE %p ALARM IRQ %d",
--
2.26.0
