From: matt mooney <mfmooney@gmail.com>
Date: Wed, 11 May 2011 08:54:19 +0000
Subject: [PATCH 07/12] staging: usbip: stub_main.c: change __init/__exit prefix and use KMEM_CACHE
Message-Id: <3410de2c85cd3aa2396b790c9072b6f22fa97257.1305103212.git.mfm@muteddisk.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <cover.1305103212.git.mfm@muteddisk.com>
In-Reply-To: <cover.1305103212.git.mfm@muteddisk.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Greg Kroah-Hartman <greg@kroah.com>
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

Change prefix to usbip and use the KMEM_CACHE macro for cache creation.

Signed-off-by: matt mooney <mfm@muteddisk.com>
---
 drivers/staging/usbip/stub_main.c |   13 ++++++-------
 1 files changed, 6 insertions(+), 7 deletions(-)

diff --git a/drivers/staging/usbip/stub_main.c b/drivers/staging/usbip/stub_main.c
index d918c49..f2ce939 100644
--- a/drivers/staging/usbip/stub_main.c
+++ b/drivers/staging/usbip/stub_main.c
@@ -246,13 +246,12 @@ void stub_device_cleanup_urbs(struct stub_device *sdev)
 	}
 }
 
-static int __init usb_stub_init(void)
+static int __init usbip_stub_init(void)
 {
 	int ret = 0;
 
-	stub_priv_cache = kmem_cache_create("stub_priv",
-					    sizeof(struct stub_priv), 0,
-					    SLAB_HWCACHE_ALIGN, NULL);
+	stub_priv_cache = KMEM_CACHE(stub_priv, SLAB_HWCACHE_ALIGN);
+
 	if (!stub_priv_cache) {
 		pr_err("kmem_cache_create failed\n");
 		return -ENOMEM;
@@ -283,7 +282,7 @@ out:
 	return ret;
 }
 
-static void __exit usb_stub_exit(void)
+static void __exit usbip_stub_exit(void)
 {
 	driver_remove_file(&stub_driver.drvwrap.driver,
 			   &driver_attr_match_busid);
@@ -297,8 +296,8 @@ static void __exit usb_stub_exit(void)
 	kmem_cache_destroy(stub_priv_cache);
 }
 
-module_init(usb_stub_init);
-module_exit(usb_stub_exit);
+module_init(usbip_stub_init);
+module_exit(usbip_stub_exit);
 
 MODULE_AUTHOR(DRIVER_AUTHOR);
 MODULE_DESCRIPTION(DRIVER_DESC);
-- 
1.7.5.1

