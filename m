From: Vasiliy Kulikov <segooon@gmail.com>
Date: Sun, 12 Sep 2010 18:57:19 +0000
Subject: [PATCH] gpio: stmpe: fix error path
Message-Id: <1284317840-5131-1-git-send-email-segooon@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org
Cc: Rabin Vincent <rabin.vincent@stericsson.com>, Samuel Ortiz <sameo@linux.intel.com>, Wolfram Sang <w.sang@pengutronix.de>, Luotao Fu <l.fu@pengutronix.de>, Linus Walleij <linus.walleij@stericsson.com>, linux-kernel@vger.kernel.org

Free allocated memory.  Call stmpe_disable() if it was enabled.

Signed-off-by: Vasiliy Kulikov <segooon@gmail.com>
---
 Compile tested.
 Maybe It needs better error path.

 drivers/gpio/stmpe-gpio.c |    6 ++++--
 1 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/gpio/stmpe-gpio.c b/drivers/gpio/stmpe-gpio.c
index 65b9960..6e28afa 100644
--- a/drivers/gpio/stmpe-gpio.c
+++ b/drivers/gpio/stmpe-gpio.c
@@ -317,11 +317,11 @@ static int __devinit stmpe_gpio_probe(struct platform_device *pdev)
 
 	ret = stmpe_enable(stmpe, STMPE_BLOCK_GPIO);
 	if (ret)
-		return ret;
+		goto out_free;
 
 	ret = stmpe_gpio_irq_init(stmpe_gpio);
 	if (ret)
-		goto out_free;
+		goto out_disable;
 
 	ret = request_threaded_irq(irq, NULL, stmpe_gpio_irq, IRQF_ONESHOT,
 				   "stmpe-gpio", stmpe_gpio);
@@ -347,6 +347,8 @@ out_freeirq:
 	free_irq(irq, stmpe_gpio);
 out_removeirq:
 	stmpe_gpio_irq_remove(stmpe_gpio);
+out_disable:
+	stmpe_disable(stmpe, STMPE_BLOCK_GPIO);
 out_free:
 	kfree(stmpe_gpio);
 	return ret;
-- 
1.7.0.4

