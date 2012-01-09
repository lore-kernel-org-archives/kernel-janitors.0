From: Szymon Janc <szymon@janc.net.pl>
Date: Mon, 09 Jan 2012 22:23:26 +0000
Subject: [PATCH 07/16] Staging: quickstart: Cleanup quickstart_acpi_add
Message-Id: <1326147815-11451-8-git-send-email-szymon@janc.net.pl>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Signed-off-by: Szymon Janc <szymon@janc.net.pl>
---
 drivers/staging/quickstart/quickstart.c |   22 ++++++++++++++--------
 1 files changed, 14 insertions(+), 8 deletions(-)

diff --git a/drivers/staging/quickstart/quickstart.c b/drivers/staging/quickstart/quickstart.c
index de98e18..97e62e9 100644
--- a/drivers/staging/quickstart/quickstart.c
+++ b/drivers/staging/quickstart/quickstart.c
@@ -262,29 +262,29 @@ static int quickstart_acpi_config(struct quickstart_acpi *quickstart, char *bid)
 
 static int quickstart_acpi_add(struct acpi_device *device)
 {
-	int ret = 0;
-	acpi_status status = AE_OK;
-	struct quickstart_acpi *quickstart = NULL;
+	int ret;
+	acpi_status status;
+	struct quickstart_acpi *quickstart;
 
 	if (!device)
 		return -EINVAL;
 
-	quickstart = kzalloc(sizeof(struct quickstart_acpi), GFP_KERNEL);
+	quickstart = kzalloc(sizeof(*quickstart), GFP_KERNEL);
 	if (!quickstart)
 		return -ENOMEM;
 
 	quickstart->device = device;
+
 	strcpy(acpi_device_name(device), QUICKSTART_ACPI_DEVICE_NAME);
 	strcpy(acpi_device_class(device), QUICKSTART_ACPI_CLASS);
 	device->driver_data = quickstart;
 
 	/* Add button to list and initialize some stuff */
 	ret = quickstart_acpi_config(quickstart, acpi_device_bid(device));
-	if (ret)
+	if (ret < 0)
 		goto fail_config;
 
-	status = acpi_install_notify_handler(device->handle,
-						ACPI_ALL_NOTIFY,
+	status = acpi_install_notify_handler(device->handle, ACPI_ALL_NOTIFY,
 						quickstart_acpi_notify,
 						quickstart);
 	if (ACPI_FAILURE(status)) {
@@ -293,10 +293,16 @@ static int quickstart_acpi_add(struct acpi_device *device)
 		goto fail_installnotify;
 	}
 
-	quickstart_acpi_ghid(quickstart);
+	ret = quickstart_acpi_ghid(quickstart);
+	if (ret < 0)
+		goto fail_ghid;
 
 	return 0;
 
+fail_ghid:
+	acpi_remove_notify_handler(device->handle, ACPI_ALL_NOTIFY,
+						quickstart_acpi_notify);
+
 fail_installnotify:
 	quickstart_btnlst_del(quickstart->btn);
 
-- 
1.7.8.2


