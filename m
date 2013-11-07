From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 07 Nov 2013 07:56:51 +0000
Subject: [patch] gpio: rcar: NULL dereference on error in probe()
Message-Id: <20131107075651.GN21844@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Linus Walleij <linus.walleij@linaro.org>, Magnus Damm <damm@opensource.se>
Cc: Grant Likely <grant.likely@linaro.org>, Kishon Vijay Abraham I <kishon@ti.com>, Rob Herring <rob.herring@calxeda.com>, linux-gpio@vger.kernel.org, kernel-janitors@vger.kernel.org

It's not obvious from the label name but "err1" tries to release
"p->irq_domain" which leads to a NULL dereference.

Fixes: 119f5e448d32 ('gpio: Renesas R-Car GPIO driver V3')
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/gpio/gpio-rcar.c b/drivers/gpio/gpio-rcar.c
index d3f15ae..fe088a3 100644
--- a/drivers/gpio/gpio-rcar.c
+++ b/drivers/gpio/gpio-rcar.c
@@ -381,7 +381,7 @@ static int gpio_rcar_probe(struct platform_device *pdev)
 	if (!p->irq_domain) {
 		ret = -ENXIO;
 		dev_err(&pdev->dev, "cannot initialize irq domain\n");
-		goto err1;
+		goto err0;
 	}
 
 	if (devm_request_irq(&pdev->dev, irq->start,
