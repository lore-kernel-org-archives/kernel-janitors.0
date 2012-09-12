From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Date: Wed, 12 Sep 2012 05:19:47 +0000
Subject: [PATCH] gpio: pcf857x: fixup smatch WARNING
Message-Id: <87fw6nn7gx.wl%kuninori.morimoto.gx@renesas.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20120912031131.GA22076@localhost>
In-Reply-To: <20120912031131.GA22076@localhost>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Linus Walleij <linus.walleij@linaro.org>, Fengguang Wu <fengguang.wu@intel.com>
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

6e20a0a429bd4dc07d6de16d9c247270e04e4aa0
(gpio: pcf857x: enable gpio_to_irq() support)
added new smatch warnings

drivers/gpio/gpio-pcf857x.c:288 pcf857x_probe() error: we previously \
	assumed 'pdata' could be null (see line 277)
drivers/gpio/gpio-pcf857x.c:364 pcf857x_probe() warn: variable dereferenced\
	 before check 'pdata' (see line 292)
drivers/gpio/gpio-pcf857x.c:421 pcf857x_remove() error: we previously\
	 assumed 'pdata' could be null (see line 410)

This patch fixes it

Reported-by: Fengguang Wu <fengguang.wu@intel.com>
Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 drivers/gpio/gpio-pcf857x.c |    6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpio/gpio-pcf857x.c b/drivers/gpio/gpio-pcf857x.c
index 12e3e48..16af35c 100644
--- a/drivers/gpio/gpio-pcf857x.c
+++ b/drivers/gpio/gpio-pcf857x.c
@@ -285,7 +285,7 @@ static int pcf857x_probe(struct i2c_client *client,
 	gpio->chip.ngpio		= id->driver_data;
 
 	/* enable gpio_to_irq() if platform has settings */
-	if (pdata->irq) {
+	if (pdata && pdata->irq) {
 		status = pcf857x_irq_domain_init(gpio, pdata, &client->dev);
 		if (status < 0) {
 			dev_err(&client->dev, "irq_domain init failed\n");
@@ -394,7 +394,7 @@ fail:
 	dev_dbg(&client->dev, "probe error %d for '%s'\n",
 			status, client->name);
 
-	if (pdata->irq)
+	if (pdata && pdata->irq)
 		pcf857x_irq_domain_cleanup(gpio);
 
 	kfree(gpio);
@@ -418,7 +418,7 @@ static int pcf857x_remove(struct i2c_client *client)
 		}
 	}
 
-	if (pdata->irq)
+	if (pdata && pdata->irq)
 		pcf857x_irq_domain_cleanup(gpio);
 
 	status = gpiochip_remove(&gpio->chip);
-- 
1.7.9.5

