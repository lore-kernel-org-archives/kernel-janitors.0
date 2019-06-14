From: Markus Elfring <Markus.Elfring@web.de>
Date: Fri, 14 Jun 2019 16:50:27 +0000
Subject: [PATCH] drivers: Adjust scope for CONFIG_HAS_IOMEM before devm_platform_ioremap_resource()
Message-Id: <9efcbce2-4d49-7197-a3d8-0e83850892d5@web.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190221162627.3476-1-brgl@bgdev.pl>
In-Reply-To: <20190221162627.3476-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Bartosz Golaszewski <brgl@bgdev.pl>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Keerthy <j-keerthy@ti.com>, Linus Walleij <linus.walleij@linaro.org>, "Rafael J. Wysocki" <rafael@kernel.org>
Cc: Bartosz Golaszewski <bgolaszewski@baylibre.com>, linux-gpio@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Fri, 14 Jun 2019 17:45:13 +0200

Move the preprocessor statement “#ifdef CONFIG_HAS_IOMEM” so that
the corresponding scope for conditional compilation includes also comments
for this function implementation.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/base/platform.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/base/platform.c b/drivers/base/platform.c
index 4d1729853d1a..a5f40974a6ef 100644
--- a/drivers/base/platform.c
+++ b/drivers/base/platform.c
@@ -78,6 +78,7 @@ struct resource *platform_get_resource(struct platform_device *dev,
 	return NULL;
 }
 EXPORT_SYMBOL_GPL(platform_get_resource);
+#ifdef CONFIG_HAS_IOMEM

 /**
  * devm_platform_ioremap_resource - call devm_ioremap_resource() for a platform
@@ -87,7 +88,6 @@ EXPORT_SYMBOL_GPL(platform_get_resource);
  *        resource management
  * @index: resource index
  */
-#ifdef CONFIG_HAS_IOMEM
 void __iomem *devm_platform_ioremap_resource(struct platform_device *pdev,
 					     unsigned int index)
 {
--
2.22.0
