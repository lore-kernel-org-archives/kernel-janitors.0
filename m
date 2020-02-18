From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 18 Feb 2020 05:52:47 +0000
Subject: [PATCH] pinctrl: mediatek: Fix some off by one bugs
Message-Id: <20200218055247.74s2xa7veqx2do34@kili.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Sean Wang <sean.wang@kernel.org>, Light Hsieh <light.hsieh@mediatek.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Matthias Brugger <matthias.bgg@gmail.com>, linux-mediatek@lists.infradead.org, linux-gpio@vger.kernel.org, kernel-janitors@vger.kernel.org

These comparisons should be >= instead of > to prevent accessing one
element beyond the end of the hw->soc->pins[] array.

Fixes: 3de7deefce69 ("pinctrl: mediatek: Check gpio pin number and use binary search in mtk_hw_pin_field_lookup()")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 drivers/pinctrl/mediatek/pinctrl-paris.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/pinctrl/mediatek/pinctrl-paris.c b/drivers/pinctrl/mediatek/pinctrl-paris.c
index 83bf29c7ce7e..53f8a14fe542 100644
--- a/drivers/pinctrl/mediatek/pinctrl-paris.c
+++ b/drivers/pinctrl/mediatek/pinctrl-paris.c
@@ -544,7 +544,7 @@ static int mtk_hw_get_value_wrap(struct mtk_pinctrl *hw, unsigned int gpio, int
 	const struct mtk_pin_desc *desc;
 	int value, err;
 
-	if (gpio > hw->soc->npins)
+	if (gpio >= hw->soc->npins)
 		return -EINVAL;
 
 	desc = (const struct mtk_pin_desc *)&hw->soc->pins[gpio];
@@ -583,7 +583,7 @@ ssize_t mtk_pctrl_show_one_pin(struct mtk_pinctrl *hw,
 	int pinmux, pullup, pullen, len = 0, r1 = -1, r0 = -1;
 	const struct mtk_pin_desc *desc;
 
-	if (gpio > hw->soc->npins)
+	if (gpio >= hw->soc->npins)
 		return -EINVAL;
 
 	desc = (const struct mtk_pin_desc *)&hw->soc->pins[gpio];
@@ -766,7 +766,7 @@ static int mtk_gpio_get_direction(struct gpio_chip *chip, unsigned int gpio)
 	const struct mtk_pin_desc *desc;
 	int value, err;
 
-	if (gpio > hw->soc->npins)
+	if (gpio >= hw->soc->npins)
 		return -EINVAL;
 
 	desc = (const struct mtk_pin_desc *)&hw->soc->pins[gpio];
@@ -784,7 +784,7 @@ static int mtk_gpio_get(struct gpio_chip *chip, unsigned int gpio)
 	const struct mtk_pin_desc *desc;
 	int value, err;
 
-	if (gpio > hw->soc->npins)
+	if (gpio >= hw->soc->npins)
 		return -EINVAL;
 
 	desc = (const struct mtk_pin_desc *)&hw->soc->pins[gpio];
@@ -801,7 +801,7 @@ static void mtk_gpio_set(struct gpio_chip *chip, unsigned int gpio, int value)
 	struct mtk_pinctrl *hw = gpiochip_get_data(chip);
 	const struct mtk_pin_desc *desc;
 
-	if (gpio > hw->soc->npins)
+	if (gpio >= hw->soc->npins)
 		return;
 
 	desc = (const struct mtk_pin_desc *)&hw->soc->pins[gpio];
@@ -813,7 +813,7 @@ static int mtk_gpio_direction_input(struct gpio_chip *chip, unsigned int gpio)
 {
 	struct mtk_pinctrl *hw = gpiochip_get_data(chip);
 
-	if (gpio > hw->soc->npins)
+	if (gpio >= hw->soc->npins)
 		return -EINVAL;
 
 	return pinctrl_gpio_direction_input(chip->base + gpio);
@@ -824,7 +824,7 @@ static int mtk_gpio_direction_output(struct gpio_chip *chip, unsigned int gpio,
 {
 	struct mtk_pinctrl *hw = gpiochip_get_data(chip);
 
-	if (gpio > hw->soc->npins)
+	if (gpio >= hw->soc->npins)
 		return -EINVAL;
 
 	mtk_gpio_set(chip, gpio, value);
-- 
2.11.0
