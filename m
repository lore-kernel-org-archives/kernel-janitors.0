From: Wei Yongjun <weiyongjun1@huawei.com>
Date: Thu, 10 Jan 2019 14:07:42 +0000
Subject: [PATCH -next] gpio: pca953x: Make symbol 'pca953x_i2c_regmap' static
Message-Id: <1547129262-102929-1-git-send-email-weiyongjun1@huawei.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <52902326-baf8-d6b5-52e3-0442fdaebc87@gmail.com>
In-Reply-To: <52902326-baf8-d6b5-52e3-0442fdaebc87@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Fixes the following sparse warning:

drivers/gpio/gpio-pca953x.c:292:28: warning:
 symbol 'pca953x_i2c_regmap' was not declared. Should it be static?

Fixes: 49427232764d ("gpio: pca953x: Perform basic regmap conversion")
Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
---
 drivers/gpio/gpio-pca953x.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpio/gpio-pca953x.c b/drivers/gpio/gpio-pca953x.c
index 83617fd..0dc9641 100644
--- a/drivers/gpio/gpio-pca953x.c
+++ b/drivers/gpio/gpio-pca953x.c
@@ -289,7 +289,7 @@ static bool pca953x_volatile_register(struct device *dev, unsigned int reg)
 	return pca953x_check_register(chip, reg, bank);
 }
 
-const struct regmap_config pca953x_i2c_regmap = {
+static const struct regmap_config pca953x_i2c_regmap = {
 	.reg_bits = 8,
 	.val_bits = 8,
