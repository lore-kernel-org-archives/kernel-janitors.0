From: Markus Elfring <Markus.Elfring@web.de>
Date: Sat, 04 Apr 2020 14:56:57 +0000
Subject: [PATCH] hwrng: omap - Delete an error message in of_get_omap_rng_device_details()
Message-Id: <eae7170c-4371-4865-7b85-589c0ed2b5b6@web.de>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: linux-crypto@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>, Deepak Saxena <dsaxena@plexity.net>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Herbert Xu <herbert@gondor.apana.org.au>, Matt Mackall <mpm@selenic.com>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org, Tang Bin <tangbin@cmss.chinamobile.com>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Sat, 4 Apr 2020 16:45:57 +0200

The function “platform_get_irq” can log an error already.
Thus omit a redundant message for the exception handling in the
calling function.

This issue was detected by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/char/hw_random/omap-rng.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/char/hw_random/omap-rng.c b/drivers/char/hw_random/omap-rng.c
index 65952393e1bb..7290c603fcb8 100644
--- a/drivers/char/hw_random/omap-rng.c
+++ b/drivers/char/hw_random/omap-rng.c
@@ -392,11 +392,8 @@ static int of_get_omap_rng_device_details(struct omap_rng_dev *priv,
 	if (of_device_is_compatible(dev->of_node, "ti,omap4-rng") ||
 	    of_device_is_compatible(dev->of_node, "inside-secure,safexcel-eip76")) {
 		irq = platform_get_irq(pdev, 0);
-		if (irq < 0) {
-			dev_err(dev, "%s: error getting IRQ resource - %d\n",
-				__func__, irq);
+		if (irq < 0)
 			return irq;
-		}

 		err = devm_request_irq(dev, irq, omap4_rng_irq,
 				       IRQF_TRIGGER_NONE, dev_name(dev), priv);
--
2.26.0
