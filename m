From: Szymon Janc <szymon@janc.net.pl>
Date: Sun, 22 Jan 2012 18:50:13 +0000
Subject: [PATCH v3 15/17] Staging: quickstart: Use pr_err and pr_info for logs
Message-Id: <1327258213-15142-1-git-send-email-szymon@janc.net.pl>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Signed-off-by: Szymon Janc <szymon@janc.net.pl>
---
 drivers/staging/quickstart/quickstart.c |   16 ++++++++--------
 1 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/staging/quickstart/quickstart.c b/drivers/staging/quickstart/quickstart.c
index a67b03a..88f8ff3 100644
--- a/drivers/staging/quickstart/quickstart.c
+++ b/drivers/staging/quickstart/quickstart.c
@@ -25,6 +25,8 @@
 
 #define QUICKSTART_VERSION "1.03"
 
+#define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
+
 #include <linux/kernel.h>
 #include <linux/module.h>
 #include <linux/init.h>
@@ -166,6 +168,7 @@ static void quickstart_acpi_notify(acpi_handle handle, u32 event, void *data)
 		input_sync(quickstart_input);
 		break;
 	default:
+		pr_err("Unexpected ACPI event notify (%u)\n", event);
 		break;
 	}
 }
@@ -183,8 +186,7 @@ static int quickstart_acpi_ghid(struct quickstart_acpi *quickstart)
 	status = acpi_evaluate_object(quickstart->device->handle, "GHID", NULL,
 								&buffer);
 	if (ACPI_FAILURE(status)) {
-		printk(KERN_ERR "quickstart: %s GHID method failed.\n",
-						quickstart->button->name);
+		pr_err("%s GHID method failed\n", quickstart->button->name);
 		return -EINVAL;
 	}
 
@@ -207,8 +209,7 @@ static int quickstart_acpi_ghid(struct quickstart_acpi *quickstart)
 		quickstart->button->id = *(uint64_t *)buffer.pointer;
 		break;
 	default:
-		printk(KERN_ERR "quickstart: %s GHID method returned buffer "
-				"of unexpected length %u\n",
+		pr_err("%s GHID method returned buffer of unexpected length %u\n",
 				quickstart->button->name, buffer.length);
 		ret = -EINVAL;
 		break;
@@ -269,7 +270,7 @@ static int quickstart_acpi_add(struct acpi_device *device)
 						quickstart_acpi_notify,
 						quickstart);
 	if (ACPI_FAILURE(status)) {
-		printk(KERN_ERR "quickstart: Notify handler install error\n");
+		pr_err("Notify handler install error\n");
 		ret = -ENODEV;
 		goto fail_installnotify;
 	}
@@ -309,7 +310,7 @@ static int quickstart_acpi_remove(struct acpi_device *device, int type)
 	status = acpi_remove_notify_handler(device->handle, ACPI_ALL_NOTIFY,
 						quickstart_acpi_notify);
 	if (ACPI_FAILURE(status))
-		printk(KERN_ERR "quickstart: Error removing notify handler\n");
+		pr_err("Error removing notify handler\n");
 
 	kfree(quickstart);
 
@@ -435,8 +436,7 @@ static int __init quickstart_init(void)
 	if (ret)
 		goto fail_input;
 
-	printk(KERN_INFO "quickstart: ACPI Direct App Launch ver %s\n",
-							QUICKSTART_VERSION);
+	pr_info("ACPI Direct App Launch ver %s\n", QUICKSTART_VERSION);
 
 	return 0;
 fail_input:
-- 
1.7.8.3


