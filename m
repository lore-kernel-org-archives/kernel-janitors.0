From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Date: Fri, 27 Jan 2017 11:56:42 +0000
Subject: [PATCH] gpiolib: Fix a WARN_ON that can never trigger
Message-Id: <20170127115642.19174-1-christophe.jaillet@wanadoo.fr>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linus.walleij@linaro.org, gnurou@gmail.com
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Christophe JAILLET <christophe.jaillet@wanadoo.fr>

"if (!x) WARN_ON(x)" can never trigger.

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
 drivers/gpio/gpiolib.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index 59d3d960ccd4..1e8bda36b73e 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -1422,8 +1422,7 @@ void devm_gpiochip_remove(struct device *dev, struct gpio_chip *chip)
 
 	ret = devres_release(dev, devm_gpio_chip_release,
 			     devm_gpio_chip_match, chip);
-	if (!ret)
-		WARN_ON(ret);
+	WARN_ON(ret);
 }
 EXPORT_SYMBOL_GPL(devm_gpiochip_remove);
 
-- 
2.9.3

