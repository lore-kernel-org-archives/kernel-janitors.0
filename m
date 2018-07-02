From: Colin King <colin.king@canonical.com>
Date: Mon, 02 Jul 2018 16:50:37 +0000
Subject: [PATCH] leds: max8997: use mode when calling max8997_led_set_mode
Message-Id: <20180702165037.20035-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jacek Anaszewski <jacek.anaszewski@gmail.com>, Pavel Machek <pavel@ucw.cz>
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Variable mode is assigned to pdata->led_pdata->mode[led->id] and yet
is not being used when calling function max8997_led_set_mode. Fix
this by using mode when calling max8997_led_set_mode.

Cleans up clang warning:
warning: variable 'mode' set but not used [-Wunused-but-set-variable]

Fixes: 8584cb82f151 ("leds: Add suuport for MAX8997-LED driver")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/leds/leds-max8997.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/leds/leds-max8997.c b/drivers/leds/leds-max8997.c
index 4edf74f1d6d4..8c019c28f9f5 100644
--- a/drivers/leds/leds-max8997.c
+++ b/drivers/leds/leds-max8997.c
@@ -268,7 +268,7 @@ static int max8997_led_probe(struct platform_device *pdev)
 		mode = pdata->led_pdata->mode[led->id];
 		brightness = pdata->led_pdata->brightness[led->id];
 
-		max8997_led_set_mode(led, pdata->led_pdata->mode[led->id]);
+		max8997_led_set_mode(led, mode);
 
 		if (brightness > led->cdev.max_brightness)
 			brightness = led->cdev.max_brightness;
-- 
2.17.1

