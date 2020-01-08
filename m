From: YueHaibing <yuehaibing@huawei.com>
Date: Wed, 08 Jan 2020 01:53:22 +0000
Subject: [PATCH -next] leds: leds-bd2802: remove set but not used variable 'pdata'
Message-Id: <20200108015322.51103-1-yuehaibing@huawei.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jacek Anaszewski <jacek.anaszewski@gmail.com>, Pavel Machek <pavel@ucw.cz>, Linus Walleij <linus.walleij@linaro.org>, Dan Murphy <dmurphy@ti.com>
Cc: YueHaibing <yuehaibing@huawei.com>, linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

Fixes gcc '-Wunused-but-set-variable' warning:

drivers/leds/leds-bd2802.c: In function 'bd2802_probe':
drivers/leds/leds-bd2802.c:663:35: warning:
 variable 'pdata' set but not used [-Wunused-but-set-variable]

commit 4c3718f9d6a6 ("leds: bd2802: Convert to use GPIO descriptors")
left behind this unused variable.

Signed-off-by: YueHaibing <yuehaibing@huawei.com>
---
 drivers/leds/leds-bd2802.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/leds/leds-bd2802.c b/drivers/leds/leds-bd2802.c
index bd61a823d0ca..8bbaef5a2986 100644
--- a/drivers/leds/leds-bd2802.c
+++ b/drivers/leds/leds-bd2802.c
@@ -660,7 +660,6 @@ static int bd2802_probe(struct i2c_client *client,
 			const struct i2c_device_id *id)
 {
 	struct bd2802_led *led;
-	struct bd2802_led_platform_data *pdata;
 	int ret, i;
 
 	led = devm_kzalloc(&client->dev, sizeof(struct bd2802_led), GFP_KERNEL);
@@ -668,7 +667,6 @@ static int bd2802_probe(struct i2c_client *client,
 		return -ENOMEM;
 
 	led->client = client;
-	pdata = led->pdata = dev_get_platdata(&client->dev);
 	i2c_set_clientdata(client, led);
 
 	/*
