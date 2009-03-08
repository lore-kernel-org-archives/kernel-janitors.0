From: Leonardo Potenza <leo.potenza@gmail.com>
Date: Sun, 08 Mar 2009 19:17:34 +0000
Subject: [PATCH] drivers/gpio: fix section mismatch warnings in twl4030-gpio.c
Message-Id: <200903082017.35072.lpotenza@inwind.it>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org
Cc: hskinnemoen@atmel.com, linux-kernel@vger.kernel.org

From: Leonardo Potenza <lpotenza@inwind.it>

Removed the __devexit annotation of gpio_twl4030_remove(), in order to suppress the following section mismatch messages:

WARNING: drivers/gpio/built-in.o(.devinit.text+0xa0b): Section mismatch in reference from the function gpio_twl4030_probe() to the function .devexit.text:gpio_twl4030_remove()
The function __devinit gpio_twl4030_probe() references
a function __devexit gpio_twl4030_remove().
This is often seen when error handling in the init function
uses functionality in the exit path.
The fix is often to remove the __devexit annotation of
gpio_twl4030_remove() so it may be used outside an exit section.

WARNING: drivers/built-in.o(.devinit.text+0xa0b): Section mismatch in reference from the function gpio_twl4030_probe() to the function .devexit.text:gpio_twl4030_remove()
The function __devinit gpio_twl4030_probe() references
a function __devexit gpio_twl4030_remove().
This is often seen when error handling in the init function
uses functionality in the exit path.
The fix is often to remove the __devexit annotation of
gpio_twl4030_remove() so it may be used outside an exit section.

WARNING: vmlinux.o(.devinit.text+0x1702): Section mismatch in reference from the function gpio_twl4030_probe() to the function .devexit.text:gpio_twl4030_remove()
The function __devinit gpio_twl4030_probe() references
a function __devexit gpio_twl4030_remove().
This is often seen when error handling in the init function
uses functionality in the exit path.
The fix is often to remove the __devexit annotation of
gpio_twl4030_remove() so it may be used outside an exit section.

Signed-off-by: Leonardo Potenza <lpotenza@inwind.it>
---
Index: linux-2.6/drivers/gpio/twl4030-gpio.c
=================================--- linux-2.6.orig/drivers/gpio/twl4030-gpio.c	2009-03-08 19:23:06.000000000 +0100
+++ linux-2.6/drivers/gpio/twl4030-gpio.c	2009-03-08 20:07:41.000000000 +0100
@@ -460,7 +460,7 @@ no_irqs:
 	return ret;
 }
 
-static int __devexit gpio_twl4030_remove(struct platform_device *pdev)
+static int gpio_twl4030_remove(struct platform_device *pdev)
 {
 	struct twl4030_gpio_platform_data *pdata = pdev->dev.platform_data;
 	int status;
@@ -493,7 +493,7 @@ static struct platform_driver gpio_twl40
 	.driver.name	= "twl4030_gpio",
 	.driver.owner	= THIS_MODULE,
 	.probe		= gpio_twl4030_probe,
-	.remove		= __devexit_p(gpio_twl4030_remove),
+	.remove		= gpio_twl4030_remove,
 };
 
 static int __init gpio_twl4030_init(void)
