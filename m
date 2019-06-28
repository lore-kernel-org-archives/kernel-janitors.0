From: Colin King <colin.king@canonical.com>
Date: Fri, 28 Jun 2019 16:14:19 +0000
Subject: [PATCH][next] gpio: bd70528: fix spelling misstake "debouce" -> "debounce"
Message-Id: <20190628161419.26439-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>, Lee Jones <lee.jones@linaro.org>, Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski <bgolaszewski@baylibre.com>, linux-gpio@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

There is a spelling mistake in a dev_err message. Fix it.

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/gpio/gpio-bd70528.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpio/gpio-bd70528.c b/drivers/gpio/gpio-bd70528.c
index fd85605d2dab..633422b430b4 100644
--- a/drivers/gpio/gpio-bd70528.c
+++ b/drivers/gpio/gpio-bd70528.c
@@ -36,7 +36,7 @@ static int bd70528_set_debounce(struct bd70528_gpio *bdgpio,
 		break;
 	default:
 		dev_err(bdgpio->chip.dev,
-			"Invalid debouce value %u\n", debounce);
+			"Invalid debounce value %u\n", debounce);
 		return -EINVAL;
 	}
 	return regmap_update_bits(bdgpio->chip.regmap, GPIO_IN_REG(offset),
-- 
2.20.1
