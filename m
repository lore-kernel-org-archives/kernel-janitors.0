From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 19 Feb 2016 21:53:30 +0000
Subject: [patch] gpio-pisosr: Unlock on error in pisosr_gpio_refresh()
Message-Id: <20160219215330.GA18915@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Linus Walleij <linus.walleij@linaro.org>, "Andrew F. Davis" <afd@ti.com>
Cc: Alexandre Courbot <gnurou@gmail.com>, linux-gpio@vger.kernel.org, kernel-janitors@vger.kernel.org

We should unlock before returning if spi_read() fails.

Fixes: df6df93c8a73 ('gpio: Add driver for SPI serializers')
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/gpio/gpio-pisosr.c b/drivers/gpio/gpio-pisosr.c
index 58ea08df..f9f1074 100644
--- a/drivers/gpio/gpio-pisosr.c
+++ b/drivers/gpio/gpio-pisosr.c
@@ -53,12 +53,10 @@ static int pisosr_gpio_refresh(struct pisosr_gpio *gpio)
 	}
 
 	ret = spi_read(gpio->spi, gpio->buffer, gpio->buffer_size);
-	if (ret)
-		return ret;
 
 	mutex_unlock(&gpio->lock);
 
-	return 0;
+	return ret;
 }
 
 static int pisosr_gpio_get_direction(struct gpio_chip *chip,
