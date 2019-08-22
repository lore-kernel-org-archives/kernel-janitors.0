From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Date: Thu, 22 Aug 2019 20:45:38 +0000
Subject: [PATCH] gpio: ftgpio: Fix an error handling path in 'ftgpio_gpio_probe()'
Message-Id: <20190822204538.4791-1-christophe.jaillet@wanadoo.fr>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linus.walleij@linaro.org, bgolaszewski@baylibre.com
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Christophe JAILLET <christophe.jaillet@wanadoo.fr>

If 'devm_kcalloc()' fails, we should go through the error handling path,
should some clean-up be needed.

Fixes: 42d9fc7176eb ("gpio: ftgpio: Pass irqchip when adding gpiochip")
Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
 drivers/gpio/gpio-ftgpio010.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/gpio/gpio-ftgpio010.c b/drivers/gpio/gpio-ftgpio010.c
index 250e71f3e688..1478259102be 100644
--- a/drivers/gpio/gpio-ftgpio010.c
+++ b/drivers/gpio/gpio-ftgpio010.c
@@ -290,8 +290,10 @@ static int ftgpio_gpio_probe(struct platform_device *pdev)
 	girq->num_parents = 1;
 	girq->parents = devm_kcalloc(dev, 1, sizeof(*girq->parents),
 				     GFP_KERNEL);
-	if (!girq->parents)
-		return -ENOMEM;
+	if (!girq->parents) {
+		ret = -ENOMEM;
+		goto dis_clk;
+	}
 	girq->default_type = IRQ_TYPE_NONE;
 	girq->handler = handle_bad_irq;
 	girq->parents[0] = irq;
-- 
2.20.1
