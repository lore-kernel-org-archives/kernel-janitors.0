From: matt mooney <mfm@muteddisk.com>
Date: Fri, 20 May 2011 04:36:59 +0000
Subject: [PATCH 05/12] staging: usbip: stub_main.c: rename init and exit functions
Message-Id: <919bb9f191949190dbab8088269ad0105983ce9a.1305866084.git.mfm@muteddisk.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <cover.1305866084.git.mfm@muteddisk.com>
In-Reply-To: <cover.1305866084.git.mfm@muteddisk.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Greg Kroah-Hartman <greg@kroah.com>
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

Change the prefix of the __init and __exit functions to usbip_host_ to
correspond with the modules name.

Signed-off-by: matt mooney <mfm@muteddisk.com>
---
 drivers/staging/usbip/stub_main.c |    8 ++++----
 1 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/usbip/stub_main.c b/drivers/staging/usbip/stub_main.c
index 00398a6..53d6977 100644
--- a/drivers/staging/usbip/stub_main.c
+++ b/drivers/staging/usbip/stub_main.c
@@ -245,7 +245,7 @@ void stub_device_cleanup_urbs(struct stub_device *sdev)
 	}
 }
 
-static int __init usb_stub_init(void)
+static int __init usbip_host_init(void)
 {
 	int ret;
 
@@ -281,7 +281,7 @@ err_usb_register:
 	return ret;
 }
 
-static void __exit usb_stub_exit(void)
+static void __exit usbip_host_exit(void)
 {
 	driver_remove_file(&stub_driver.drvwrap.driver,
 			   &driver_attr_match_busid);
@@ -295,8 +295,8 @@ static void __exit usb_stub_exit(void)
 	kmem_cache_destroy(stub_priv_cache);
 }
 
-module_init(usb_stub_init);
-module_exit(usb_stub_exit);
+module_init(usbip_host_init);
+module_exit(usbip_host_exit);
 
 MODULE_AUTHOR(DRIVER_AUTHOR);
 MODULE_DESCRIPTION(DRIVER_DESC);
-- 
1.7.5.1

