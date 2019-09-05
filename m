From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 05 Sep 2019 09:57:28 +0000
Subject: [PATCH] led: triggers: Fix NULL dereference in led_trigger_set() error handling
Message-Id: <20190905095728.GA26005@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jacek Anaszewski <jacek.anaszewski@gmail.com>, Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>
Cc: Pavel Machek <pavel@ucw.cz>, Dan Murphy <dmurphy@ti.com>, linux-leds@vger.kernel.org, kernel-janitors@vger.kernel.org

The problem is we set "led_cdev->trigger = NULL;" and then dereference
it when we call write_lock_irqsave():

	write_lock_irqsave(&led_cdev->trigger->leddev_list_lock, flags);
                            ^^^^^^^^^^^^^^^^^

Fixes: 2282e125a406 ("leds: triggers: let struct led_trigger::activate() return an error code")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 drivers/leds/led-triggers.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/leds/led-triggers.c b/drivers/leds/led-triggers.c
index eff1bda8b520..13cea227277c 100644
--- a/drivers/leds/led-triggers.c
+++ b/drivers/leds/led-triggers.c
@@ -167,12 +167,12 @@ int led_trigger_set(struct led_classdev *led_cdev, struct led_trigger *trig)
 		trig->deactivate(led_cdev);
 err_activate:
 
-	led_cdev->trigger = NULL;
-	led_cdev->trigger_data = NULL;
 	write_lock_irqsave(&led_cdev->trigger->leddev_list_lock, flags);
 	list_del(&led_cdev->trig_list);
 	write_unlock_irqrestore(&led_cdev->trigger->leddev_list_lock, flags);
+	led_cdev->trigger = NULL;
+	led_cdev->trigger_data = NULL;
 	led_set_brightness(led_cdev, LED_OFF);
 	kfree(event);
 
 	return ret;
-- 
2.20.1
