From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 08 Aug 2018 12:04:49 +0000
Subject: [PATCH]  pinctrl: nomadik: silence uninitialized variable warning
Message-Id: <20180808120449.ezhesrq7o5qdert2@kili.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

This is harmless, but "val" isn't necessarily initialized if
abx500_get_register_interruptible() fails.  I've re-arranged the code to
just return an error code in that situation.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/pinctrl/nomadik/pinctrl-abx500.c b/drivers/pinctrl/nomadik/pinctrl-abx500.c
index aa592ef23a29..e3689cc62a41 100644
--- a/drivers/pinctrl/nomadik/pinctrl-abx500.c
+++ b/drivers/pinctrl/nomadik/pinctrl-abx500.c
@@ -101,15 +101,16 @@ static int abx500_gpio_get_bit(struct gpio_chip *chip, u8 reg,
 	reg += offset / 8;
 	ret = abx500_get_register_interruptible(pct->dev,
 						AB8500_MISC, reg, &val);
-
-	*bit = !!(val & BIT(pos));
-
-	if (ret < 0)
+	if (ret < 0) {
 		dev_err(pct->dev,
 			"%s read reg =%x, offset=%x failed (%d)\n",
 			__func__, reg, offset, ret);
+		return ret;
+	}
 
-	return ret;
+	*bit = !!(val & BIT(pos));
+
+	return 0;
 }
 
 static int abx500_gpio_set_bits(struct gpio_chip *chip, u8 reg,
