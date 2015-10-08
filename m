From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 08 Oct 2015 07:12:01 +0000
Subject: [patch] gpio: pl061: returning with lock held in pl061_irq_type()
Message-Id: <20151008064001.GA25441@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Alexandre Courbot <gnurou@gmail.com>, linux-gpio@vger.kernel.org, kernel-janitors@vger.kernel.org

We were returning with "chip->lock" held by mistake.  It's safe to
move the return to before we take the spinlock.

Fixes: 1dbf7f299f90 ('gpio: pl061: detail IRQ trigger handling')
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/gpio/gpio-pl061.c b/drivers/gpio/gpio-pl061.c
index 5b1461f..1793397 100644
--- a/drivers/gpio/gpio-pl061.c
+++ b/drivers/gpio/gpio-pl061.c
@@ -152,12 +152,6 @@ static int pl061_irq_type(struct irq_data *d, unsigned trigger)
 	if (offset < 0 || offset >= PL061_GPIO_NR)
 		return -EINVAL;
 
-	spin_lock_irqsave(&chip->lock, flags);
-
-	gpioiev = readb(chip->base + GPIOIEV);
-	gpiois = readb(chip->base + GPIOIS);
-	gpioibe = readb(chip->base + GPIOIBE);
-
 	if ((trigger & (IRQ_TYPE_LEVEL_HIGH | IRQ_TYPE_LEVEL_LOW)) &&
 	    (trigger & (IRQ_TYPE_EDGE_RISING | IRQ_TYPE_EDGE_FALLING)))
 	{
@@ -168,6 +162,13 @@ static int pl061_irq_type(struct irq_data *d, unsigned trigger)
 		return -EINVAL;
 	}
 
+
+	spin_lock_irqsave(&chip->lock, flags);
+
+	gpioiev = readb(chip->base + GPIOIEV);
+	gpiois = readb(chip->base + GPIOIS);
+	gpioibe = readb(chip->base + GPIOIBE);
+
 	if (trigger & (IRQ_TYPE_LEVEL_HIGH | IRQ_TYPE_LEVEL_LOW)) {
 		bool polarity = trigger & IRQ_TYPE_LEVEL_HIGH;
 
