From: Szymon Janc <szymon@janc.net.pl>
Date: Mon, 09 Jan 2012 22:23:34 +0000
Subject: [PATCH 15/16] Staging: quickstart: Add QS_INFO and QS_ERR macros for logs
Message-Id: <1326147815-11451-16-git-send-email-szymon@janc.net.pl>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Signed-off-by: Szymon Janc <szymon@janc.net.pl>
---
 drivers/staging/quickstart/quickstart.c |   17 +++++++++--------
 1 files changed, 9 insertions(+), 8 deletions(-)

diff --git a/drivers/staging/quickstart/quickstart.c b/drivers/staging/quickstart/quickstart.c
index 51a6d0c..c757ef6 100644
--- a/drivers/staging/quickstart/quickstart.c
+++ b/drivers/staging/quickstart/quickstart.c
@@ -44,6 +44,9 @@ MODULE_LICENSE("GPL");
 #define QUICKSTART_PF_DRIVER_NAME	"quickstart"
 #define QUICKSTART_PF_DEVICE_NAME	"quickstart"
 
+#define QS_INFO(fmt, arg...)	printk(KERN_INFO "quickstart: " fmt "\n", ##arg)
+#define QS_ERR(fmt, arg...)	printk(KERN_ERR "quickstart: " fmt "\n", ##arg)
+
 /*
  * There will be two events:
  * 0x02 - A hot button was pressed while device was off/sleeping.
@@ -164,6 +167,7 @@ static void quickstart_acpi_notify(acpi_handle handle, u32 event, void *data)
 		input_sync(quickstart_input);
 		break;
 	default:
+		QS_ERR("Unexpected ACPI event notify (%u)", event);
 		break;
 	}
 }
@@ -181,8 +185,7 @@ static int quickstart_acpi_ghid(struct quickstart_acpi *quickstart)
 	status = acpi_evaluate_object(quickstart->device->handle, "GHID", NULL,
 								&buffer);
 	if (ACPI_FAILURE(status)) {
-		printk(KERN_ERR "quickstart: %s GHID method failed.\n",
-						quickstart->button->name);
+		QS_ERR("%s GHID method failed", quickstart->button->name);
 		return -EINVAL;
 	}
 
@@ -205,8 +208,7 @@ static int quickstart_acpi_ghid(struct quickstart_acpi *quickstart)
 		quickstart->button->id = *(uint64_t *)buffer.pointer;
 		break;
 	default:
-		printk(KERN_ERR "quickstart: %s GHID method returned buffer "
-				"of unexpected length %u\n",
+		QS_ERR("%s GHID method returned buffer of unexpected length %u",
 				quickstart->button->name, buffer.length);
 		ret = -EINVAL;
 		break;
@@ -267,7 +269,7 @@ static int quickstart_acpi_add(struct acpi_device *device)
 						quickstart_acpi_notify,
 						quickstart);
 	if (ACPI_FAILURE(status)) {
-		printk(KERN_ERR "quickstart: Notify handler install error\n");
+		QS_ERR("Notify handler install error");
 		ret = -ENODEV;
 		goto fail_installnotify;
 	}
@@ -307,7 +309,7 @@ static int quickstart_acpi_remove(struct acpi_device *device, int type)
 	status = acpi_remove_notify_handler(device->handle, ACPI_ALL_NOTIFY,
 						quickstart_acpi_notify);
 	if (ACPI_FAILURE(status))
-		printk(KERN_ERR "quickstart: Error removing notify handler\n");
+		QS_ERR("Error removing notify handler");
 
 	kfree(quickstart);
 
@@ -433,8 +435,7 @@ static int __init quickstart_init(void)
 	if (ret)
 		goto fail_input;
 
-	printk(KERN_INFO "quickstart: ACPI Direct App Launch ver %s\n",
-							QUICKSTART_VERSION);
+	QS_INFO("ACPI Direct App Launch ver %s", QUICKSTART_VERSION);
 
 	return 0;
 fail_input:
-- 
1.7.8.2


