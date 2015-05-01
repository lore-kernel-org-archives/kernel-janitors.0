From: Christophe Jaillet <christophe.jaillet@wanadoo.fr>
Date: Fri, 01 May 2015 12:29:06 +0000
Subject: [PATCH 2/2] gpio: x-gene: Remove a useless memset
Message-Id: <1430483346-10583-1-git-send-email-christophe.jaillet@wanadoo.fr>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linus.walleij@linaro.org, gnurou@gmail.com
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Christophe Jaillet <christophe.jaillet@wanadoo.fr>

priv->irq is allocated using devm_kzalloc so there is no need to memset it.

Signed-off-by: Christophe Jaillet <christophe.jaillet@wanadoo.fr>
---
 drivers/gpio/gpio-xgene-sb.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpio/gpio-xgene-sb.c b/drivers/gpio/gpio-xgene-sb.c
index fb9d29a..a7b8f8f 100644
--- a/drivers/gpio/gpio-xgene-sb.c
+++ b/drivers/gpio/gpio-xgene-sb.c
@@ -112,7 +112,6 @@ static int xgene_gpio_sb_probe(struct platform_device *pdev)
 				   GFP_KERNEL);
 	if (!priv->irq)
 		return -ENOMEM;
-	memset(priv->irq, 0, sizeof(u32) * XGENE_MAX_GPIO_DS);
 
 	for (i = 0; i < priv->nirq; i++) {
 		priv->irq[default_lines[i]] = platform_get_irq(pdev, i);
-- 
2.1.0

