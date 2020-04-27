From: Wei Yongjun <weiyongjun1@huawei.com>
Date: Mon, 27 Apr 2020 11:08:29 +0000
Subject: [PATCH -next] gpio: mlxbf2: fix return value check in mlxbf2_gpio_get_lock_res()
Message-Id: <20200427110829.154785-1-weiyongjun1@huawei.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski <bgolaszewski@baylibre.com>
Cc: Wei Yongjun <weiyongjun1@huawei.com>, linux-gpio@vger.kernel.org, kernel-janitors@vger.kernel.org

In case of error, the function devm_ioremap() returns NULL pointer not
ERR_PTR(). The IS_ERR() test in the return value check should be
replaced with NULL test.

Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
---
 drivers/gpio/gpio-mlxbf2.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpio/gpio-mlxbf2.c b/drivers/gpio/gpio-mlxbf2.c
index 240b488609ac..fca6a50d9308 100644
--- a/drivers/gpio/gpio-mlxbf2.c
+++ b/drivers/gpio/gpio-mlxbf2.c
@@ -109,8 +109,8 @@ static int mlxbf2_gpio_get_lock_res(struct platform_device *pdev)
 	}
 
 	yu_arm_gpio_lock_param.io = devm_ioremap(dev, res->start, size);
-	if (IS_ERR(yu_arm_gpio_lock_param.io))
-		ret = PTR_ERR(yu_arm_gpio_lock_param.io);
+	if (!yu_arm_gpio_lock_param.io)
+		ret = -ENOMEM;
 
 exit:
 	mutex_unlock(yu_arm_gpio_lock_param.lock);
