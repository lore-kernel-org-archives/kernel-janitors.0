From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Fri, 12 Jan 2018 20:03:35 +0000
Subject: [PATCH 3/4] gpio-stmpe: Move an assignment in stmpe_gpio_probe()
Message-Id: <25ddf208-1f02-8bb7-b6b8-e0ffa422b754@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <df11c007-360e-ce6b-2f70-61b6fb6b49cf@users.sourceforge.net>
In-Reply-To: <df11c007-360e-ce6b-2f70-61b6fb6b49cf@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-gpio@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Fri, 12 Jan 2018 20:44:15 +0100

Move the assignment for the local variable "irq" so that its setting
will only be performed directly before it is checked by this function.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/gpio/gpio-stmpe.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/gpio/gpio-stmpe.c b/drivers/gpio/gpio-stmpe.c
index 2cf30dcba82a..d51e27eb1c59 100644
--- a/drivers/gpio/gpio-stmpe.c
+++ b/drivers/gpio/gpio-stmpe.c
@@ -435,8 +435,6 @@ static int stmpe_gpio_probe(struct platform_device *pdev)
 	int ret;
 	int irq = 0;
 
-	irq = platform_get_irq(pdev, 0);
-
 	stmpe_gpio = kzalloc(sizeof(*stmpe_gpio), GFP_KERNEL);
 	if (!stmpe_gpio)
 		return -ENOMEM;
@@ -459,6 +457,7 @@ static int stmpe_gpio_probe(struct platform_device *pdev)
 	if (stmpe_gpio->norequest_mask)
 		stmpe_gpio->chip.irq.need_valid_mask = true;
 
+	irq = platform_get_irq(pdev, 0);
 	if (irq < 0)
 		dev_info(&pdev->dev,
 			"device configured in no-irq mode: "
-- 
2.15.1

