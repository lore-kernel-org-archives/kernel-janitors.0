From: Wei Yongjun <weiyongjun1@huawei.com>
Date: Wed, 06 May 2020 12:42:56 +0000
Subject: [PATCH -next] gpio: exar: Fix error return code in gpio_exar_probe()
Message-Id: <20200506124256.87628-1-weiyongjun1@huawei.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski <bgolaszewski@baylibre.com>, Kangjie Lu <kjlu@umn.edu>
Cc: Wei Yongjun <weiyongjun1@huawei.com>, linux-gpio@vger.kernel.org, kernel-janitors@vger.kernel.org

Fix to return a negative error code from the error handling
case instead of 0, as done elsewhere in this function.

Fixes: 7ecced0934e5 ("gpio: exar: add a check for the return value of ida_simple_get fails")
Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
---
 drivers/gpio/gpio-exar.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/gpio/gpio-exar.c b/drivers/gpio/gpio-exar.c
index da1ef0b1c291..c5c3fa5b519f 100644
--- a/drivers/gpio/gpio-exar.c
+++ b/drivers/gpio/gpio-exar.c
@@ -148,8 +148,10 @@ static int gpio_exar_probe(struct platform_device *pdev)
 	mutex_init(&exar_gpio->lock);
 
 	index = ida_simple_get(&ida_index, 0, 0, GFP_KERNEL);
-	if (index < 0)
+	if (index < 0) {
+		ret = index;
 		goto err_destroy;
+	}
 
 	sprintf(exar_gpio->name, "exar_gpio%d", index);
 	exar_gpio->gpio_chip.label = exar_gpio->name;
