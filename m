From: Wei Yongjun <weiyongjun1@huawei.com>
Date: Wed, 04 Sep 2019 14:18:34 +0000
Subject: [PATCH] gpio: mockup: add missing single_release()
Message-Id: <20190904141834.195294-1-weiyongjun1@huawei.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Bamvor Jian Zhang <bamv2005@gmail.com>, Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski <bgolaszewski@baylibre.com>
Cc: Wei Yongjun <weiyongjun1@huawei.com>, linux-gpio@vger.kernel.org, kernel-janitors@vger.kernel.org

When using single_open() for opening, single_release() should be
used instead of seq_release(), otherwise there is a memory leak.

Fixes: 2a9e27408e12 ("gpio: mockup: rework debugfs interface")
Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
---
 drivers/gpio/gpio-mockup.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpio/gpio-mockup.c b/drivers/gpio/gpio-mockup.c
index f1a9c0544e3f..213aedc97dc2 100644
--- a/drivers/gpio/gpio-mockup.c
+++ b/drivers/gpio/gpio-mockup.c
@@ -309,6 +309,7 @@ static const struct file_operations gpio_mockup_debugfs_ops = {
 	.read = gpio_mockup_debugfs_read,
 	.write = gpio_mockup_debugfs_write,
 	.llseek = no_llseek,
+	.release = single_release,
 };
 
 static void gpio_mockup_debugfs_setup(struct device *dev,
