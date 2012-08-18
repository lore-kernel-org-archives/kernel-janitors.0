From: Emil Goode <emilgoode@gmail.com>
Date: Sat, 18 Aug 2012 16:12:48 +0000
Subject: [PATCH 1/2] tty: serial: Check return code of gpiochip_remove
Message-Id: <1345306369-10407-1-git-send-email-emilgoode@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: alan@linux.intel.com, gregkh@linuxfoundation.org
Cc: linux-serial@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Emil Goode <emilgoode@gmail.com>

The gpiochip_remove function may fail to remove a gpio_chip
if any GPIOs are still requested. This patch informs the caller
of such a senario.

Sparse is warning because the function prototype has a
__must_check annotation.

Sparse warning:
drivers/tty/serial/max310x.c:1223:18: warning:
	ignoring return value of ‘gpiochip_remove’,
	declared with attribute warn_unused_result
	[-Wunused-result]

Signed-off-by: Emil Goode <emilgoode@gmail.com>
---
 drivers/tty/serial/max310x.c |   10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/drivers/tty/serial/max310x.c b/drivers/tty/serial/max310x.c
index 534e448..06ff5ad 100644
--- a/drivers/tty/serial/max310x.c
+++ b/drivers/tty/serial/max310x.c
@@ -1207,6 +1207,7 @@ static int __devexit max310x_remove(struct spi_device *spi)
 {
 	struct device *dev = &spi->dev;
 	struct max310x_port *s = dev_get_drvdata(dev);
+	int ret = 0;
 
 	dev_dbg(dev, "Removing port\n");
 
@@ -1219,8 +1220,11 @@ static int __devexit max310x_remove(struct spi_device *spi)
 	uart_unregister_driver(&s->uart);
 
 #ifdef CONFIG_GPIOLIB
-	if (s->pdata->gpio_base)
-		gpiochip_remove(&s->gpio);
+	if (s->pdata->gpio_base) {
+		ret = gpiochip_remove(&s->gpio);
+		if (ret)
+			dev_err(dev, "Failed to remove gpio chip: %d\n", ret);
+	}
 #endif
 
 	dev_set_drvdata(dev, NULL);
@@ -1232,7 +1236,7 @@ static int __devexit max310x_remove(struct spi_device *spi)
 
 	devm_kfree(dev, s);
 
-	return 0;
+	return ret;
 }
 
 static const struct spi_device_id max310x_id_table[] = {
-- 
1.7.10.4

