From: Colin King <colin.king@canonical.com>
Date: Sat, 29 Jun 2019 12:33:06 +0000
Subject: [PATCH][next] gpio: bd70528: remove redundant assignment to variable ret
Message-Id: <20190629123306.12519-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski <bgolaszewski@baylibre.com>, linux-gpio@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Variable ret is being initialized with a value that is never read
and ret is being re-assigned a little later on. The assignment is
redundant and hence can be removed.

Addresses-Coverity: ("Unused value")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/gpio/gpio-bd70528.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpio/gpio-bd70528.c b/drivers/gpio/gpio-bd70528.c
index 633422b430b4..0c1ead12d883 100644
--- a/drivers/gpio/gpio-bd70528.c
+++ b/drivers/gpio/gpio-bd70528.c
@@ -153,7 +153,7 @@ static int bd70528_gpio_get_i(struct bd70528_gpio *bdgpio, unsigned int offset)
 
 static int bd70528_gpio_get(struct gpio_chip *chip, unsigned int offset)
 {
-	int ret = -EINVAL;
+	int ret;
 	struct bd70528_gpio *bdgpio = gpiochip_get_data(chip);
 
 	/*
-- 
2.20.1
