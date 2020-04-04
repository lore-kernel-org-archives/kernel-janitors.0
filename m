From: Markus Elfring <Markus.Elfring@web.de>
Date: Sat, 04 Apr 2020 19:35:24 +0000
Subject: [PATCH] gpio: msic: Delete an error message in platform_msic_gpio_probe()
Message-Id: <bb60007c-585f-052d-2f86-5598ff7619cd@web.de>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: linux-gpio@vger.kernel.org, Andy Shevchenko <andy@kernel.org>, Bartosz Golaszewski <bgolaszewski@baylibre.com>, Linus Walleij <linus.walleij@linaro.org>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org, Tang Bin <tangbin@cmss.chinamobile.com>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Sat, 4 Apr 2020 21:30:12 +0200

The function “platform_get_irq” can log an error already.
Thus omit a redundant message for the exception handling in the
calling function.

This issue was detected by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/gpio/gpio-msic.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/gpio/gpio-msic.c b/drivers/gpio/gpio-msic.c
index 7e3c96e4ab2c..5548b7be36b3 100644
--- a/drivers/gpio/gpio-msic.c
+++ b/drivers/gpio/gpio-msic.c
@@ -248,10 +248,8 @@ static int platform_msic_gpio_probe(struct platform_device *pdev)
 	int retval;
 	int i;

-	if (irq < 0) {
-		dev_err(dev, "no IRQ line: %d\n", irq);
+	if (irq < 0)
 		return irq;
-	}

 	if (!pdata || !pdata->gpio_base) {
 		dev_err(dev, "incorrect or missing platform data\n");
--
2.26.0
