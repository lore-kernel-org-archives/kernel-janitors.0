From: Markus Elfring <Markus.Elfring@web.de>
Date: Wed, 18 Sep 2019 12:10:19 +0000
Subject: [PATCH] misc/pvpanic: Use devm_platform_ioremap_resource() in pvpanic_mmio_probe()
Message-Id: <4fa1c1b3-71db-4d8d-ddc9-86219b74b87d@web.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <e0ce24fe-ff3c-cbbb-4a56-4e529ebbe8d0@web.de>
In-Reply-To: <e0ce24fe-ff3c-cbbb-4a56-4e529ebbe8d0@web.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Peng Hao <peng.hao2@zte.com.cn>
Cc: LKML <linux-kernel@vger.kernel.org>, Bartosz Golaszewski <bgolaszewski@baylibre.com>, Himanshu Jha <himanshujha199640@gmail.com>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Wed, 18 Sep 2019 14:00:13 +0200

Simplify this function implementation by using a known wrapper function.

This issue was detected by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/misc/pvpanic.c | 8 +-------
 1 file changed, 1 insertion(+), 7 deletions(-)

diff --git a/drivers/misc/pvpanic.c b/drivers/misc/pvpanic.c
index 95ff7c5a1dfb..74bcdd171558 100644
--- a/drivers/misc/pvpanic.c
+++ b/drivers/misc/pvpanic.c
@@ -137,13 +137,7 @@ static void pvpanic_unregister_acpi_driver(void) {}

 static int pvpanic_mmio_probe(struct platform_device *pdev)
 {
-	struct resource *mem;
-
-	mem = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	if (!mem)
-		return -EINVAL;
-
-	base = devm_ioremap_resource(&pdev->dev, mem);
+	base = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(base))
 		return PTR_ERR(base);

--
2.23.0
