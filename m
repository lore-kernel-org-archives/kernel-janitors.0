From: YueHaibing <yuehaibing@huawei.com>
Date: Fri, 28 Sep 2018 02:18:09 +0000
Subject: [PATCH -next] gpio: htc-egpio: Remove set but not used variable 'bit'
Message-Id: <1538101089-160557-1-git-send-email-yuehaibing@huawei.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Fixes gcc '-Wunused-but-set-variable' warning:

drivers/gpio/gpio-htc-egpio.c: In function 'egpio_set':
drivers/gpio/gpio-htc-egpio.c:192:20: warning:
 variable 'bit' set but not used [-Wunused-but-set-variable]

Signed-off-by: YueHaibing <yuehaibing@huawei.com>
---
 drivers/gpio/gpio-htc-egpio.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/gpio/gpio-htc-egpio.c b/drivers/gpio/gpio-htc-egpio.c
index 38be44d..9d3ac51 100644
--- a/drivers/gpio/gpio-htc-egpio.c
+++ b/drivers/gpio/gpio-htc-egpio.c
@@ -189,7 +189,6 @@ static void egpio_set(struct gpio_chip *chip, unsigned offset, int value)
 	unsigned long     flag;
 	struct egpio_chip *egpio;
 	struct egpio_info *ei;
-	unsigned          bit;
 	int               pos;
 	int               reg;
 	int               shift;
@@ -199,7 +198,6 @@ static void egpio_set(struct gpio_chip *chip, unsigned offset, int value)
 
 	egpio = gpiochip_get_data(chip);
 	ei    = dev_get_drvdata(egpio->dev);
-	bit   = egpio_bit(ei, offset);
 	pos   = egpio_pos(ei, offset);
 	reg   = egpio->reg_start + pos;
 	shift = pos << ei->reg_shift;
