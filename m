From: matt mooney <mfmooney@gmail.com>
Date: Wed, 11 May 2011 08:54:14 +0000
Subject: [PATCH 02/12] staging: usbip: use single version for all modules
Message-Id: <0795ecfdf15daf7fe2e7b9c158888eb758153a78.1305103212.git.mfm@muteddisk.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <cover.1305103212.git.mfm@muteddisk.com>
In-Reply-To: <cover.1305103212.git.mfm@muteddisk.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Greg Kroah-Hartman <greg@kroah.com>
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

Having separate versions in this situation makes little sense, so
USBIP_VERSION will be used by all modules.

Signed-off-by: matt mooney <mfm@muteddisk.com>
---
 drivers/staging/usbip/stub_main.c    |    5 ++---
 drivers/staging/usbip/usbip_common.c |    5 ++---
 drivers/staging/usbip/usbip_common.h |    2 ++
 drivers/staging/usbip/vhci_hcd.c     |    5 ++---
 4 files changed, 8 insertions(+), 9 deletions(-)

diff --git a/drivers/staging/usbip/stub_main.c b/drivers/staging/usbip/stub_main.c
index c139f0e..a3c73b2 100644
--- a/drivers/staging/usbip/stub_main.c
+++ b/drivers/staging/usbip/stub_main.c
@@ -22,7 +22,6 @@
 #include "usbip_common.h"
 #include "stub.h"
 
-#define DRIVER_VERSION "1.0"
 #define DRIVER_AUTHOR "Takahiro Hirofuchi"
 #define DRIVER_DESC "Stub Driver for USB/IP"
 
@@ -278,7 +277,7 @@ static int __init usb_stub_init(void)
 		goto error_usb_register;
 	}
 
-	printk(KERN_INFO KBUILD_MODNAME ": " DRIVER_DESC " " DRIVER_VERSION
+	printk(KERN_INFO KBUILD_MODNAME ": " DRIVER_DESC " " USBIP_VERSION
 	       "\n");
 
 	init_busid_table();
@@ -319,4 +318,4 @@ module_exit(usb_stub_exit);
 MODULE_AUTHOR(DRIVER_AUTHOR);
 MODULE_DESCRIPTION(DRIVER_DESC);
 MODULE_LICENSE("GPL");
-MODULE_VERSION(DRIVER_VERSION);
+MODULE_VERSION(USBIP_VERSION);
diff --git a/drivers/staging/usbip/usbip_common.c b/drivers/staging/usbip/usbip_common.c
index 279cad4..6c44fa4 100644
--- a/drivers/staging/usbip/usbip_common.c
+++ b/drivers/staging/usbip/usbip_common.c
@@ -26,7 +26,6 @@
 
 #include "usbip_common.h"
 
-#define DRIVER_VERSION "1.0"
 #define DRIVER_AUTHOR "Takahiro Hirofuchi <hirofuchi@users.sourceforge.net>"
 #define DRIVER_DESC "USB/IP Common Driver"
 
@@ -861,7 +860,7 @@ EXPORT_SYMBOL_GPL(usbip_recv_xbuff);
 
 static int __init usbip_common_init(void)
 {
-	printk(KERN_INFO KBUILD_MODNAME ": " DRIVER_DESC " " DRIVER_VERSION
+	printk(KERN_INFO KBUILD_MODNAME ": " DRIVER_DESC " " USBIP_VERSION
 	       "\n");
 	return 0;
 }
@@ -877,4 +876,4 @@ module_exit(usbip_common_exit);
 MODULE_AUTHOR(DRIVER_AUTHOR);
 MODULE_DESCRIPTION(DRIVER_DESC);
 MODULE_LICENSE("GPL");
-MODULE_VERSION(DRIVER_VERSION);
+MODULE_VERSION(USBIP_VERSION);
diff --git a/drivers/staging/usbip/usbip_common.h b/drivers/staging/usbip/usbip_common.h
index c84bed9..aa5d576 100644
--- a/drivers/staging/usbip/usbip_common.h
+++ b/drivers/staging/usbip/usbip_common.h
@@ -26,6 +26,8 @@
 #include <asm/byteorder.h>
 #include <net/sock.h>
 
+#define USBIP_VERSION "1.0.0"
+
 /**
  * usbip_udbg - print debug messages if CONFIG_USB_IP_DEBUG is defined
  * @fmt:
diff --git a/drivers/staging/usbip/vhci_hcd.c b/drivers/staging/usbip/vhci_hcd.c
index 5a07431..bfb0b5f 100644
--- a/drivers/staging/usbip/vhci_hcd.c
+++ b/drivers/staging/usbip/vhci_hcd.c
@@ -23,7 +23,6 @@
 #include "usbip_common.h"
 #include "vhci.h"
 
-#define DRIVER_VERSION "1.0"
 #define DRIVER_AUTHOR "Takahiro Hirofuchi"
 #define DRIVER_DESC "Virtual Host Controller Interface Driver for USB/IP"
 
@@ -1231,7 +1230,7 @@ static int __init vhci_init(void)
 		return -ENODEV;
 
 	printk(KERN_INFO KBUILD_MODNAME ": %s, %s\n", driver_name,
-	       DRIVER_VERSION);
+	       USBIP_VERSION);
 
 	ret = platform_driver_register(&vhci_driver);
 	if (ret < 0)
@@ -1268,4 +1267,4 @@ module_exit(vhci_cleanup);
 MODULE_AUTHOR(DRIVER_AUTHOR);
 MODULE_DESCRIPTION(DRIVER_DESC);
 MODULE_LICENSE("GPL");
-MODULE_VERSION(DRIVER_VERSION);
+MODULE_VERSION(USBIP_VERSION);
-- 
1.7.5.1

