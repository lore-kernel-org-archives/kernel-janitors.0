From: matt mooney <mfm@muteddisk.com>
Date: Fri, 20 May 2011 04:37:03 +0000
Subject: [PATCH 09/12] staging: usbip: stub_dev.c: move stub_driver definition and update driver name
Message-Id: <91b3e9e7b24eb432f40edc93ef175f3c41114bf7.1305866084.git.mfm@muteddisk.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <cover.1305866084.git.mfm@muteddisk.com>
In-Reply-To: <cover.1305866084.git.mfm@muteddisk.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Greg Kroah-Hartman <greg@kroah.com>
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

Move the stub_driver definition to the end of file and, therefore,
remove foward declarations. Update driver name to usbip-host.

A few comments were slightly edited too.

Signed-off-by: matt mooney <mfm@muteddisk.com>
---
 drivers/staging/usbip/stub_dev.c |   28 ++++++++++++----------------
 1 files changed, 12 insertions(+), 16 deletions(-)

diff --git a/drivers/staging/usbip/stub_dev.c b/drivers/staging/usbip/stub_dev.c
index e35d62c..e26b2ee 100644
--- a/drivers/staging/usbip/stub_dev.c
+++ b/drivers/staging/usbip/stub_dev.c
@@ -23,14 +23,10 @@
 #include "usbip_common.h"
 #include "stub.h"
 
-static int stub_probe(struct usb_interface *interface,
-		      const struct usb_device_id *id);
-static void stub_disconnect(struct usb_interface *interface);
-
 /*
  * Define device IDs here if you want to explicitly limit exportable devices.
- * In the most cases, wild card matching will be ok because driver binding can
- * be changed dynamically by a userland program.
+ * In most cases, wildcard matching will be okay because driver binding can be
+ * changed dynamically by a userland program.
  */
 static struct usb_device_id stub_table[] = {
 #if 0
@@ -54,16 +50,9 @@ static struct usb_device_id stub_table[] = {
 };
 MODULE_DEVICE_TABLE(usb, stub_table);
 
-struct usb_driver stub_driver = {
-	.name		= "usbip",
-	.probe		= stub_probe,
-	.disconnect	= stub_disconnect,
-	.id_table	= stub_table,
-};
-
 /*
- * usbip_status shows status of usbip as long as this driver is bound to the
- * target device.
+ * usbip_status shows the status of usbip-host as long as this driver is bound
+ * to the target device.
  */
 static ssize_t show_status(struct device *dev, struct device_attribute *attr,
 			   char *buf)
@@ -423,7 +412,7 @@ static int stub_probe(struct usb_interface *interface,
 		return 0;
 	}
 
-	/* ok. this is my device. */
+	/* ok, this is my device */
 	sdev = stub_device_alloc(udev, interface);
 	if (!sdev)
 		return -ENOMEM;
@@ -534,3 +523,10 @@ static void stub_disconnect(struct usb_interface *interface)
 		del_match_busid((char *)udev_busid);
 	}
 }
+
+struct usb_driver stub_driver = {
+	.name		= "usbip-host",
+	.probe		= stub_probe,
+	.disconnect	= stub_disconnect,
+	.id_table	= stub_table,
+};
-- 
1.7.5.1

