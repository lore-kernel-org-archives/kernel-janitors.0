From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 11 Oct 2012 06:56:35 +0000
Subject: [patch] gpio-timberdale: fix a potential wrapping issue
Message-Id: <20121011065635.GD31607@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Grant Likely <grant.likely@secretlab.ca>
Cc: Linus Walleij <linus.walleij@linaro.org>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

->last_ier is an unsigned long but the high bits can't be used int the
original code because the shift wraps.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/gpio/gpio-timberdale.c b/drivers/gpio/gpio-timberdale.c
index 031c6ad..1a3e2b9 100644
--- a/drivers/gpio/gpio-timberdale.c
+++ b/drivers/gpio/gpio-timberdale.c
@@ -116,7 +116,7 @@ static void timbgpio_irq_disable(struct irq_data *d)
 	unsigned long flags;
 
 	spin_lock_irqsave(&tgpio->lock, flags);
-	tgpio->last_ier &= ~(1 << offset);
+	tgpio->last_ier &= ~(1UL << offset);
 	iowrite32(tgpio->last_ier, tgpio->membase + TGPIO_IER);
 	spin_unlock_irqrestore(&tgpio->lock, flags);
 }
@@ -128,7 +128,7 @@ static void timbgpio_irq_enable(struct irq_data *d)
 	unsigned long flags;
 
 	spin_lock_irqsave(&tgpio->lock, flags);
-	tgpio->last_ier |= 1 << offset;
+	tgpio->last_ier |= 1UL << offset;
 	iowrite32(tgpio->last_ier, tgpio->membase + TGPIO_IER);
 	spin_unlock_irqrestore(&tgpio->lock, flags);
 }
