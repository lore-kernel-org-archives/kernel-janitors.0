From: YueHaibing <yuehaibing@huawei.com>
Date: Sat, 23 Mar 2019 02:45:23 +0000
Subject: [PATCH -next] leds: lt3593: remove set but not used variable 'flags'
Message-Id: <20190323024523.162210-1-yuehaibing@huawei.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Fixes gcc '-Wunused-but-set-variable' warning:

drivers/leds/leds-lt3593.c: In function 'lt3593_led_probe':
drivers/leds/leds-lt3593.c:69:19: warning:
 variable 'flags' set but not used [-Wunused-but-set-variable]

It's never used since inroduction in
commit 8cd7d6daba93 ("leds: lt3593: Add device tree probing glue")

Signed-off-by: YueHaibing <yuehaibing@huawei.com>
---
 drivers/leds/leds-lt3593.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/leds/leds-lt3593.c b/drivers/leds/leds-lt3593.c
index 54f0e5dbdbd0..912b8d1bbd92 100644
--- a/drivers/leds/leds-lt3593.c
+++ b/drivers/leds/leds-lt3593.c
@@ -66,7 +66,6 @@ static int lt3593_led_probe(struct platform_device *pdev)
 	struct lt3593_led_data *led_data;
 	struct fwnode_handle *child;
 	int ret, state = LEDS_GPIO_DEFSTATE_OFF;
-	enum gpiod_flags flags = GPIOD_OUT_LOW;
 	const char *tmp;
 
 	if (!dev->of_node)
@@ -101,10 +100,8 @@ static int lt3593_led_probe(struct platform_device *pdev)
 	if (!fwnode_property_read_string(child, "default-state", &tmp)) {
 		if (!strcmp(tmp, "keep")) {
 			state = LEDS_GPIO_DEFSTATE_KEEP;
-			flags = GPIOD_ASIS;
 		} else if (!strcmp(tmp, "on")) {
 			state = LEDS_GPIO_DEFSTATE_ON;
-			flags = GPIOD_OUT_HIGH;
 		}
 	}
