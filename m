From: Matthew Martin <lihnucks@gmail.com>
Date: Mon, 29 May 2006 20:08:14 +0000
Subject: [KJ] [PATCH] Make ixp4xxgpioled_brightness_set static in
Message-Id: <447B54AE.3040709@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hello,
    This makes the function ixp4xxgpioled_brightness_set static.


Signed-Off-By: Matthew Martin <lihnucks@gmail.com>
---

--- vanilla-linux-2.6.16/drivers/leds/leds-ixp4xx-gpio.c	2006-05-11 23:05:46.000000000 -0500
+++ linux-2.6.16/drivers/leds/leds-ixp4xx-gpio.c	2006-05-12 12:36:43.000000000 -0500
@@ -48,7 +48,7 @@ static struct ixp4xxgpioled_device {
 	int               flags;
 } ixp4xxgpioled_devices[GPIO_MAX];
 
-void ixp4xxgpioled_brightness_set(struct led_classdev *pled,
+static void ixp4xxgpioled_brightness_set(struct led_classdev *pled,
 				enum led_brightness value)
 {
 	const struct ixp4xxgpioled_device *const ixp4xx_dev 

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
