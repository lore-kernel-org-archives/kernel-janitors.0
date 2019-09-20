From: Markus Elfring <Markus.Elfring@web.de>
Date: Fri, 20 Sep 2019 12:50:34 +0000
Subject: [PATCH v2] leds-bcm6358: Use devm_platform_ioremap_resource() in bcm6358_leds_probe()
Message-Id: <45982431-f597-29fb-abef-fb2952296f39@web.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <b6ea044c-c483-0de6-67c5-5ea2fa3c85aa@web.de>
 <658bd05d-376d-adfd-64a5-e20f83d7b90a@gmail.com>
In-Reply-To: <658bd05d-376d-adfd-64a5-e20f83d7b90a@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-leds@vger.kernel.org, =?UTF-8?Q?=c3=81lvaro_Fern=c3=a1ndez_Rojas?= <noltari@gmail.com>, Dan Murphy <dmurphy@ti.com>, Jacek Anaszewski <jacek.anaszewski@gmail.com>, Pavel Machek <pavel@ucw.cz>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Fri, 20 Sep 2019 14:44:06 +0200

Simplify this function implementation by using a known wrapper function.

This issue was detected by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---


v2:
Jacek Anaszewski requested to split updates for two modules
into a separate patch for each driver.
https://lore.kernel.org/r/658bd05d-376d-adfd-64a5-e20f83d7b90a@gmail.com/


 drivers/leds/leds-bcm6358.c | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

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
