From: Slawomir Stepien <sst@poczta.fm>
Date: Thu, 27 Oct 2016 14:15:54 +0000
Subject: [PATCH] Input: gpio-keys - use module_platform_driver macro
Message-Id: <20161027141554.GA31977@x220.localdomain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: dmitry.torokhov@gmail.com
Cc: ldewangan@nvidia.com, linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

The gpio_keys_init() and gpio_keys_exit() are not doing anything
more then just register and unregister. Replace these functions with
module_platform_driver.

Signed-off-by: Slawomir Stepien <sst@poczta.fm>
---
 drivers/input/keyboard/gpio_keys.c | 13 +------------
 1 file changed, 1 insertion(+), 12 deletions(-)

diff --git a/drivers/input/keyboard/gpio_keys.c b/drivers/input/keyboard/gpio_keys.c
index 2909365..e54b586 100644
--- a/drivers/input/keyboard/gpio_keys.c
+++ b/drivers/input/keyboard/gpio_keys.c
@@ -877,18 +877,7 @@ static struct platform_driver gpio_keys_device_driver = {
 	}
 };
 
-static int __init gpio_keys_init(void)
-{
-	return platform_driver_register(&gpio_keys_device_driver);
-}
-
-static void __exit gpio_keys_exit(void)
-{
-	platform_driver_unregister(&gpio_keys_device_driver);
-}
-
-late_initcall(gpio_keys_init);
-module_exit(gpio_keys_exit);
+module_platform_driver(gpio_keys_device_driver);
 
 MODULE_LICENSE("GPL");
 MODULE_AUTHOR("Phil Blundell <pb@handhelds.org>");
-- 
2.10.0
