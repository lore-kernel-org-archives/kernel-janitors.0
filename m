From: Markus Elfring <Markus.Elfring@web.de>
Date: Wed, 18 Sep 2019 10:37:24 +0000
Subject: [PATCH] media: rc: Use devm_platform_ioremap_resource() in tango_ir_probe()
Message-Id: <04df8450-1b15-55ec-91e7-7d72ffbedac7@web.de>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Allison Randal <allison@lohutok.net>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Mans Rullgard <mans@mansr.com>, Marc Gonzalez <marc.w.gonzalez@free.fr>, Mauro Carvalho Chehab <mchehab@kernel.org>, Thomas Gleixner <tglx@linutronix.de>
Cc: Bartosz Golaszewski <bgolaszewski@baylibre.com>, kernel-janitors@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Himanshu Jha <himanshujha199640@gmail.com>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Wed, 18 Sep 2019 12:30:18 +0200

Simplify this function implementation by using a known wrapper function.

This issue was detected by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/media/rc/tango-ir.c | 14 ++------------
 1 file changed, 2 insertions(+), 12 deletions(-)

diff --git a/drivers/media/rc/tango-ir.c b/drivers/media/rc/tango-ir.c
index 451ec4e9dcfa..b8eb5bc4d9be 100644
--- a/drivers/media/rc/tango-ir.c
+++ b/drivers/media/rc/tango-ir.c
@@ -157,20 +157,10 @@ static int tango_ir_probe(struct platform_device *pdev)
 	struct device *dev = &pdev->dev;
 	struct rc_dev *rc;
 	struct tango_ir *ir;
-	struct resource *rc5_res;
-	struct resource *rc6_res;
 	u64 clkrate, clkdiv;
 	int irq, err;
 	u32 val;

-	rc5_res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	if (!rc5_res)
-		return -EINVAL;
-
-	rc6_res = platform_get_resource(pdev, IORESOURCE_MEM, 1);
-	if (!rc6_res)
-		return -EINVAL;
-
 	irq = platform_get_irq(pdev, 0);
 	if (irq <= 0)
 		return -EINVAL;
@@ -179,11 +169,11 @@ static int tango_ir_probe(struct platform_device *pdev)
 	if (!ir)
 		return -ENOMEM;

-	ir->rc5_base = devm_ioremap_resource(dev, rc5_res);
+	ir->rc5_base = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(ir->rc5_base))
 		return PTR_ERR(ir->rc5_base);

-	ir->rc6_base = devm_ioremap_resource(dev, rc6_res);
+	ir->rc6_base = devm_platform_ioremap_resource(pdev, 1);
 	if (IS_ERR(ir->rc6_base))
 		return PTR_ERR(ir->rc6_base);

--
2.23.0
