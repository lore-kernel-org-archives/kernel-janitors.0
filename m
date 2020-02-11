From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 11 Feb 2020 07:35:44 +0000
Subject: [PATCH] gpio: siox: potentially enabling IRQs too early
Message-Id: <20200211073511.r24n3bygyjxrsuez@kili.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>, Thorsten Scherer <t.scherer@eckelmann.de>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>, Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski <bgolaszewski@baylibre.com>, Gavin Schenk <g.schenk@eckelmann.de>, linux-gpio@vger.kernel.org, kernel-janitors@vger.kernel.org

Smatch thinks that gpio_siox_irq_set_type() can be called from
probe_irq_on().  In that case the call to spin_unlock_irq() would
renable IRQs too early.

Fixes: be8c8facc707 ("gpio: new driver to work with a 8x12 siox")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 drivers/gpio/gpio-siox.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/gpio/gpio-siox.c b/drivers/gpio/gpio-siox.c
index 311f66757b92..578b71760939 100644
--- a/drivers/gpio/gpio-siox.c
+++ b/drivers/gpio/gpio-siox.c
@@ -133,10 +133,11 @@ static int gpio_siox_irq_set_type(struct irq_data *d, u32 type)
 	struct irq_chip *ic = irq_data_get_irq_chip(d);
 	struct gpio_siox_ddata *ddata  		container_of(ic, struct gpio_siox_ddata, ichip);
+	unsigned long flags;
 
-	spin_lock_irq(&ddata->irqlock);
+	spin_lock_irqsave(&ddata->irqlock, flags);
 	ddata->irq_type[d->hwirq] = type;
-	spin_unlock_irq(&ddata->irqlock);
+	spin_unlock_irqrestore(&ddata->irqlock, flags);
 
 	return 0;
 }
-- 
2.11.0
