From: Julia Lawall <Julia.Lawall@lip6.fr>
Date: Fri, 26 Dec 2014 14:35:45 +0000
Subject: [PATCH 14/27] leds: Use setup_timer
Message-Id: <1419604558-29743-15-git-send-email-Julia.Lawall@lip6.fr>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1419604558-29743-1-git-send-email-Julia.Lawall@lip6.fr>
In-Reply-To: <1419604558-29743-1-git-send-email-Julia.Lawall@lip6.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Bryan Wu <cooloney@gmail.com>
Cc: kernel-janitors@vger.kernel.org, Richard Purdie <rpurdie@rpsys.net>, linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org

Convert a call to init_timer and accompanying intializations of
the timer's data and function fields to a call to setup_timer.

A simplified version of the semantic match that fixes this problem is as
follows: (http://coccinelle.lip6.fr/)

// <smpl>
@@
expression t,f,d;
@@

-init_timer(&t);
+setup_timer(&t,f,d);
-t.function = f;
-t.data = d;
// </smpl>

Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>

---
 drivers/leds/led-class.c |    5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/leds/led-class.c b/drivers/leds/led-class.c
index dbeebac..291ca45 100644
--- a/drivers/leds/led-class.c
+++ b/drivers/leds/led-class.c
@@ -239,9 +239,8 @@ int led_classdev_register(struct device *parent, struct led_classdev *led_cdev)
 
 	INIT_WORK(&led_cdev->set_brightness_work, set_brightness_delayed);
 
-	init_timer(&led_cdev->blink_timer);
-	led_cdev->blink_timer.function = led_timer_function;
-	led_cdev->blink_timer.data = (unsigned long)led_cdev;
+	setup_timer(&led_cdev->blink_timer, led_timer_function,
+		    (unsigned long)led_cdev);
 
 #ifdef CONFIG_LEDS_TRIGGERS
 	led_trigger_set_default(led_cdev);

