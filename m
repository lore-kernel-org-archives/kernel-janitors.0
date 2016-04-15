From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 15 Apr 2016 14:45:28 +0000
Subject: [patch] gpio: brcmstb: missing error code
Message-Id: <20160415144528.GC8953@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Gregory Fong <gregory.0xf0@gmail.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, Brian Norris <computersforpeace@gmail.com>, Florian Fainelli <f.fainelli@gmail.com>, bcm-kernel-feedback-list@broadcom.com, linux-gpio@vger.kernel.org, kernel-janitors@vger.kernel.org

We should set the error code before returning here.  Otherwise "err"
could be uninitialized or zero.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/gpio/gpio-brcmstb.c b/drivers/gpio/gpio-brcmstb.c
index 42d51c5..e648914 100644
--- a/drivers/gpio/gpio-brcmstb.c
+++ b/drivers/gpio/gpio-brcmstb.c
@@ -461,6 +461,7 @@ static int brcmstb_gpio_probe(struct platform_device *pdev)
 		bank->id = num_banks;
 		if (bank_width <= 0 || bank_width > MAX_GPIO_PER_BANK) {
 			dev_err(dev, "Invalid bank width %d\n", bank_width);
+			err = -EINVAL;
 			goto fail;
 		} else {
 			bank->width = bank_width;
