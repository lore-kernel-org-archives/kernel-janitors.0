From: Markus Elfring <Markus.Elfring@web.de>
Date: Wed, 18 Sep 2019 08:55:18 +0000
Subject: [PATCH] leds-bcm63xx: Use devm_platform_ioremap_resource() in two functions
Message-Id: <b6ea044c-c483-0de6-67c5-5ea2fa3c85aa@web.de>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-leds@vger.kernel.org, =?UTF-8?Q?=c3=81lvaro_Fern=c3=a1ndez_Rojas?= <noltari@gmail.com>, Dan Murphy <dmurphy@ti.com>, Jacek Anaszewski <jacek.anaszewski@gmail.com>, Pavel Machek <pavel@ucw.cz>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org, Bartosz Golaszewski <bgolaszewski@baylibre.com>, Himanshu Jha <himanshujha199640@gmail.com>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Wed, 18 Sep 2019 10:45:24 +0200

Simplify these function implementations by using a known function.

This issue was detected by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/leds/leds-bcm6328.c | 7 +------
 drivers/leds/leds-bcm6358.c | 7 +------
 2 files changed, 2 insertions(+), 12 deletions(-)

diff --git a/drivers/leds/leds-bcm6328.c b/drivers/leds/leds-bcm6328.c
index c50d34e2b098..42e1b7598c3a 100644
--- a/drivers/leds/leds-bcm6328.c
+++ b/drivers/leds/leds-bcm6328.c
@@ -346,16 +346,11 @@ static int bcm6328_leds_probe(struct platform_device *pdev)
 	struct device *dev = &pdev->dev;
 	struct device_node *np = pdev->dev.of_node;
 	struct device_node *child;
-	struct resource *mem_r;
 	void __iomem *mem;
 	spinlock_t *lock; /* memory lock */
 	unsigned long val, *blink_leds, *blink_delay;

-	mem_r = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	if (!mem_r)
-		return -EINVAL;
-
-	mem = devm_ioremap_resource(dev, mem_r);
+	mem = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(mem))
 		return PTR_ERR(mem);

diff --git a/drivers/leds/leds-bcm6358.c b/drivers/leds/leds-bcm6358.c
index aec285fd21c0..94fefd456ba0 100644
--- a/drivers/leds/leds-bcm6358.c
+++ b/drivers/leds/leds-bcm6358.c
@@ -151,17 +151,12 @@ static int bcm6358_leds_probe(struct platform_device *pdev)
 	struct device *dev = &pdev->dev;
 	struct device_node *np = pdev->dev.of_node;
 	struct device_node *child;
-	struct resource *mem_r;
 	void __iomem *mem;
 	spinlock_t *lock; /* memory lock */
 	unsigned long val;
 	u32 clk_div;

-	mem_r = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	if (!mem_r)
-		return -EINVAL;
-
-	mem = devm_ioremap_resource(dev, mem_r);
+	mem = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(mem))
 		return PTR_ERR(mem);

--
2.23.0
