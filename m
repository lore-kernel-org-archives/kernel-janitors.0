From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 16 Dec 2014 23:53:59 +0000
Subject: [patch] gpio: grgpio: off by one in grgpio_to_irq()
Message-Id: <20141216235358.GD31467@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Alexandre Courbot <gnurou@gmail.com>, Grant Likely <grant.likely@linaro.org>, Rob Herring <robh+dt@kernel.org>, linux-gpio@vger.kernel.org, kernel-janitors@vger.kernel.org

"gc->ngpio" is a number between 1 and GRGPIO_MAX_NGPIO.  If "offset" is
GRGPIO_MAX_NGPIO then we're going one step beyond the end of the
priv->lirqs[] array.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/gpio/gpio-grgpio.c b/drivers/gpio/gpio-grgpio.c
index 09daaf2..d5bc70f 100644
--- a/drivers/gpio/gpio-grgpio.c
+++ b/drivers/gpio/gpio-grgpio.c
@@ -121,7 +121,7 @@ static int grgpio_to_irq(struct gpio_chip *gc, unsigned offset)
 {
 	struct grgpio_priv *priv = grgpio_gc_to_priv(gc);
 
-	if (offset > gc->ngpio)
+	if (offset >= gc->ngpio)
 		return -ENXIO;
 
 	if (priv->lirqs[offset].index < 0)
