From: Szymon Janc <szymon@janc.net.pl>
Date: Mon, 09 Jan 2012 22:23:22 +0000
Subject: [PATCH 03/16] Staging: quickstart: Move some code to avoid forward declarations
Message-Id: <1326147815-11451-4-git-send-email-szymon@janc.net.pl>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Signed-off-by: Szymon Janc <szymon@janc.net.pl>
---
 drivers/staging/quickstart/quickstart.c |   75 +++++++++++++------------------
 1 files changed, 31 insertions(+), 44 deletions(-)

diff --git a/drivers/staging/quickstart/quickstart.c b/drivers/staging/quickstart/quickstart.c
index adce56b..6617761 100644
--- a/drivers/staging/quickstart/quickstart.c
+++ b/drivers/staging/quickstart/quickstart.c
@@ -61,58 +61,18 @@ struct quickstart_btn {
 	struct quickstart_btn *next;
 };
 
-static struct quickstart_driver_data {
-	struct quickstart_btn *btn_lst;
-	struct quickstart_btn *pressed;
-} quickstart_data;
-
-/* ACPI driver structs */
 struct quickstart_acpi {
 	struct acpi_device *device;
 	struct quickstart_btn *btn;
 };
-static int quickstart_acpi_add(struct acpi_device *device);
-static int quickstart_acpi_remove(struct acpi_device *device, int type);
-static const struct acpi_device_id quickstart_device_ids[] = {
-	{QUICKSTART_ACPI_HID, 0},
-	{"", 0},
-};
 
-static struct acpi_driver quickstart_acpi_driver = {
-	.name = "quickstart",
-	.class = QUICKSTART_ACPI_CLASS,
-	.ids = quickstart_device_ids,
-	.ops = {
-			.add = quickstart_acpi_add,
-			.remove = quickstart_acpi_remove,
-		},
-};
+static struct quickstart_driver_data {
+	struct quickstart_btn *btn_lst;
+	struct quickstart_btn *pressed;
+} quickstart_data;
 
-/* Input device structs */
 struct input_dev *quickstart_input;
 
-/* Platform driver structs */
-static ssize_t quickstart_buttons_show(struct device *dev,
-					struct device_attribute *attr,
-					char *buf);
-static ssize_t quickstart_pressed_button_show(struct device *dev,
-					struct device_attribute *attr,
-					char *buf);
-static ssize_t quickstart_pressed_button_store(struct device *dev,
-					struct device_attribute *attr,
-					 const char *buf,
-					 size_t count);
-static DEVICE_ATTR(pressed_button, 0666, quickstart_pressed_button_show,
-					 quickstart_pressed_button_store);
-static DEVICE_ATTR(buttons, 0444, quickstart_buttons_show, NULL);
-static struct platform_device *pf_device;
-static struct platform_driver pf_driver = {
-	.driver = {
-		.name = QUICKSTART_PF_DRIVER_NAME,
-		.owner = THIS_MODULE,
-	}
-};
-
 /* Platform driver functions */
 static ssize_t quickstart_buttons_show(struct device *dev,
 					struct device_attribute *attr,
@@ -353,6 +313,33 @@ static int quickstart_acpi_remove(struct acpi_device *device, int type)
 	return 0;
 }
 
+/* Platform driver structs */
+static DEVICE_ATTR(pressed_button, 0666, quickstart_pressed_button_show,
+					 quickstart_pressed_button_store);
+static DEVICE_ATTR(buttons, 0444, quickstart_buttons_show, NULL);
+static struct platform_device *pf_device;
+static struct platform_driver pf_driver = {
+	.driver = {
+		.name = QUICKSTART_PF_DRIVER_NAME,
+		.owner = THIS_MODULE,
+	}
+};
+
+static const struct acpi_device_id quickstart_device_ids[] = {
+	{QUICKSTART_ACPI_HID, 0},
+	{"", 0},
+};
+
+static struct acpi_driver quickstart_acpi_driver = {
+	.name = "quickstart",
+	.class = QUICKSTART_ACPI_CLASS,
+	.ids = quickstart_device_ids,
+	.ops = {
+			.add = quickstart_acpi_add,
+			.remove = quickstart_acpi_remove,
+		},
+};
+
 /* Module functions */
 static void quickstart_exit(void)
 {
-- 
1.7.8.2


