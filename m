From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 27 Jun 2012 09:10:56 +0000
Subject: [patch -resend] leds-lp5523: BUG() in error handling in probe()
Message-Id: <20120627091055.GW31212@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
In-Reply-To: <20120627085800.GA3007@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Bryan Wu <bryan.wu@canonical.com>
Cc: Richard Purdie <rpurdie@rpsys.net>, linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

Inside the error handling in lp5523_init_led(), there is a place that
calls to led_classdev_unregister().  When we unregister the LED drivers,
it tries to set the brightness to OFF.  In this driver setting the
brightness is done through a work queue and the work queue hasn't been
initialized yet.

The result is that we trigger a WARN_ON() in the __queue_work().

The fix is to move the INIT_WORK() in front of the call to
lp5523_init_led().

Matt Renzelmann found this using a bug finding tool.

Reported-by: Matt Renzelmann <mjr@cs.wisc.edu>
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
I don't have this hardware, so I can't test it.  I originally sent this
on Fri, 13 Apr 2012, and that was before Bryan Wu took on the LED
subsystem.  Also when I sent it, the WARN_ON() in __queue_work() was
a BUG_ON() so I've updated the commit message.

diff --git a/drivers/leds/leds-lp5523.c b/drivers/leds/leds-lp5523.c
index 857a3e1..e8a2712 100644
--- a/drivers/leds/leds-lp5523.c
+++ b/drivers/leds/leds-lp5523.c
@@ -943,6 +943,9 @@ static int __devinit lp5523_probe(struct i2c_client *client,
 		if (pdata->led_config[i].led_current = 0)
 			continue;
 
+		INIT_WORK(&chip->leds[led].brightness_work,
+			lp5523_led_brightness_work);
+
 		ret = lp5523_init_led(&chip->leds[led], &client->dev, i, pdata);
 		if (ret) {
 			dev_err(&client->dev, "error initializing leds\n");
@@ -956,9 +959,6 @@ static int __devinit lp5523_probe(struct i2c_client *client,
 			  LP5523_REG_LED_CURRENT_BASE + chip->leds[led].chan_nr,
 			  chip->leds[led].led_current);
 
-		INIT_WORK(&(chip->leds[led].brightness_work),
-			lp5523_led_brightness_work);
-
 		led++;
 	}
 
