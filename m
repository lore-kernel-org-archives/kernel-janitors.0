From: Markus Elfring <Markus.Elfring@web.de>
Date: Fri, 14 Jun 2019 13:26:25 +0000
Subject: [PATCH] drivers: Provide devm_platform_ioremap_resource_byname()
Message-Id: <39e46643-d799-94b7-4aa5-d6d99d738f99@web.de>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: kernel-janitors@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>
Cc: LKML <linux-kernel@vger.kernel.org>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Bartosz Golaszewski <bgolaszewski@baylibre.com>, Enrico Weigelt <lkml@metux.net>, Himanshu Jha <himanshujha199640@gmail.com>, Linus Walleij <linus.walleij@linaro.org>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Fri, 14 Jun 2019 15:15:14 +0200

The functions “platform_get_resource_byname” and “devm_ioremap_resource”
are called together in 181 source files.
This implementation detail can be determined also with the help
of the semantic patch language (Coccinelle software).

Wrap these two calls into another helper function.
Thus a local variable does not need to be declared for a resource
structure pointer before and a redundant argument can be omitted
for the resource type.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/base/platform.c | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/drivers/base/platform.c b/drivers/base/platform.c
index 4d1729853d1a..c1f19a479dd7 100644
--- a/drivers/base/platform.c
+++ b/drivers/base/platform.c
@@ -97,6 +97,24 @@ void __iomem *devm_platform_ioremap_resource(struct platform_device *pdev,
 	return devm_ioremap_resource(&pdev->dev, res);
 }
 EXPORT_SYMBOL_GPL(devm_platform_ioremap_resource);
+
+/**
+ * devm_platform_ioremap_resource_byname
+ * Call devm_ioremap_resource() for a platform device
+ *
+ * @pdev: platform device to use both for memory resource lookup as well as
+ *        resource management
+ * @name: resource name
+ */
+void __iomem *devm_platform_ioremap_resource_byname(struct platform_device *pdev,
+						    const char *name)
+{
+	struct resource *res;
+
+	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, name);
+	return devm_ioremap_resource(&pdev->dev, res);
+}
+EXPORT_SYMBOL_GPL(devm_platform_ioremap_resource_byname);
 #endif /* CONFIG_HAS_IOMEM */

 /**
--
2.22.0
