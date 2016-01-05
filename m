From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 05 Jan 2016 09:56:37 +0000
Subject: [patch] gpio: pxa: checking IS_ERR() instead of NULL
Message-Id: <20160105095637.GE23619@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Robert Jarzmik <robert.jarzmik@free.fr>
Cc: Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, linux-gpio@vger.kernel.org, kernel-janitors@vger.kernel.org

irq_domain_add_legacy() returns NULL on error, it doesn't return error
pointers.

Fixes: 384ca3c6a28d ('gpio: pxa: change the interrupt management')
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/gpio/gpio-pxa.c b/drivers/gpio/gpio-pxa.c
index c2d1a47..415852d 100644
--- a/drivers/gpio/gpio-pxa.c
+++ b/drivers/gpio/gpio-pxa.c
@@ -646,8 +646,8 @@ static int pxa_gpio_probe(struct platform_device *pdev)
 	pchip->irqdomain = irq_domain_add_legacy(pdev->dev.of_node,
 						 pxa_last_gpio + 1, irq_base,
 						 0, &pxa_irq_domain_ops, pchip);
-	if (IS_ERR(pchip->irqdomain))
-		return PTR_ERR(pchip->irqdomain);
+	if (!pchip->irqdomain)
+		return -ENOMEM;
 
 	irq0 = platform_get_irq_byname(pdev, "gpio0");
 	irq1 = platform_get_irq_byname(pdev, "gpio1");
