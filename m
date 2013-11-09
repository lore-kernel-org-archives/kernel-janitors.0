From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Sat, 09 Nov 2013 23:35:56 +0000
Subject: [patch] pinctrl: abx500: fix some more bitwise AND tests
Message-Id: <20131109233556.GA13643@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Linus Walleij <linus.walleij@linaro.org>, Patrice CHOTARD <patrice.chotard@st.com>
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

I sent a patch to fix some bitwise AND tests but I guess I missed some.
Sorry about that.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/pinctrl/pinctrl-abx500.c b/drivers/pinctrl/pinctrl-abx500.c
index 4780959..5183e7bb 100644
--- a/drivers/pinctrl/pinctrl-abx500.c
+++ b/drivers/pinctrl/pinctrl-abx500.c
@@ -418,7 +418,7 @@ static int abx500_set_mode(struct pinctrl_dev *pctldev, struct gpio_chip *chip,
 			ret = abx500_gpio_set_bits(chip,
 					AB8500_GPIO_ALTFUN_REG,
 					af.alt_bit1,
-					!!(af.alta_val && BIT(0)));
+					!!(af.alta_val & BIT(0)));
 			if (ret < 0)
 				goto out;
 
@@ -439,7 +439,7 @@ static int abx500_set_mode(struct pinctrl_dev *pctldev, struct gpio_chip *chip,
 			goto out;
 
 		ret = abx500_gpio_set_bits(chip, AB8500_GPIO_ALTFUN_REG,
-				af.alt_bit1, !!(af.altb_val && BIT(0)));
+				af.alt_bit1, !!(af.altb_val & BIT(0)));
 		if (ret < 0)
 			goto out;
 
@@ -462,7 +462,7 @@ static int abx500_set_mode(struct pinctrl_dev *pctldev, struct gpio_chip *chip,
 			goto out;
 
 		ret = abx500_gpio_set_bits(chip, AB8500_GPIO_ALTFUN_REG,
-				af.alt_bit2, !!(af.altc_val && BIT(1)));
+				af.alt_bit2, !!(af.altc_val & BIT(1)));
 		break;
 
 	default:
