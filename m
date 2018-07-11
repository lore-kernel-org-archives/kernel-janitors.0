From: Wei Yongjun <weiyongjun1@huawei.com>
Date: Wed, 11 Jul 2018 13:19:38 +0000
Subject: [PATCH -next] gpio: pxa: fix potential NULL dereference in pxa_gpio_probe()
Message-Id: <1531315178-185878-1-git-send-email-weiyongjun1@huawei.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

platform_get_resource() may fail and return NULL, so we should
better check it's return value to avoid a NULL pointer dereference
a bit later in the code.

This is detected by Coccinelle semantic patch.

@@
expression pdev, res, n, t, e, e1, e2;
@@

res = platform_get_resource(pdev, t, n);
+ if (!res)
+   return -EINVAL;
... when != res = NULL
e = devm_ioremap(e1, res->start, e2);

Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
---
 drivers/gpio/gpio-pxa.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpio/gpio-pxa.c b/drivers/gpio/gpio-pxa.c
index 3c1f65b..c3899ed 100644
--- a/drivers/gpio/gpio-pxa.c
+++ b/drivers/gpio/gpio-pxa.c
@@ -646,6 +646,8 @@ static int pxa_gpio_probe(struct platform_device *pdev)
 	pchip->irq0 = irq0;
 	pchip->irq1 = irq1;
 	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
+	if (!res)
+		return -EINVAL;
 	gpio_reg_base = devm_ioremap(&pdev->dev, res->start,
 				     resource_size(res));
 	if (!gpio_reg_base)

