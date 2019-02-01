From: Wei Yongjun <weiyongjun1@huawei.com>
Date: Fri, 01 Feb 2019 09:18:41 +0000
Subject: [PATCH -next] gpio: tqmx86: Drop unnecessary gpiochip_remove in tqmx86_gpio_probe()
Message-Id: <20190201091841.152704-1-weiyongjun1@huawei.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

It's not necessary to remove gpio_chip which added with
devm_gpiochip_add_data().

Fixes: b868db94a6a7 ("gpio: tqmx86: Add GPIO from for this IO controller")
Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
---
 drivers/gpio/gpio-tqmx86.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/gpio/gpio-tqmx86.c b/drivers/gpio/gpio-tqmx86.c
index 6f7250c6f597..33dbe483f92f 100644
--- a/drivers/gpio/gpio-tqmx86.c
+++ b/drivers/gpio/gpio-tqmx86.c
@@ -291,7 +291,7 @@ static int tqmx86_gpio_probe(struct platform_device *pdev)
 					   IRQ_TYPE_EDGE_BOTH);
 		if (ret) {
 			dev_err(dev, "Could not add irq chip\n");
-			goto out_remove;
+			goto out_pm_dis;
 		}
 
 		gpiochip_set_chained_irqchip(chip, irq_chip,
@@ -309,8 +309,6 @@ static int tqmx86_gpio_probe(struct platform_device *pdev)
 
 	return 0;
 
-out_remove:
-	gpiochip_remove(&gpio->chip);
 out_pm_dis:
 	pm_runtime_disable(&pdev->dev);
