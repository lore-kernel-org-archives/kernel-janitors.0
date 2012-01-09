From: Szymon Janc <szymon@janc.net.pl>
Date: Mon, 09 Jan 2012 22:23:33 +0000
Subject: [PATCH 14/16] Staging: quickstart: Rename quickstart_btn to quickstart_button
Message-Id: <1326147815-11451-15-git-send-email-szymon@janc.net.pl>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Signed-off-by: Szymon Janc <szymon@janc.net.pl>
---
 drivers/staging/quickstart/quickstart.c |   46 +++++++++++++++---------------
 1 files changed, 23 insertions(+), 23 deletions(-)

diff --git a/drivers/staging/quickstart/quickstart.c b/drivers/staging/quickstart/quickstart.c
index f830360..51a6d0c 100644
--- a/drivers/staging/quickstart/quickstart.c
+++ b/drivers/staging/quickstart/quickstart.c
@@ -52,7 +52,7 @@ MODULE_LICENSE("GPL");
 #define QUICKSTART_EVENT_WAKE		0x02
 #define QUICKSTART_EVENT_RUNTIME	0x80
 
-struct quickstart_btn {
+struct quickstart_button {
 	char *name;
 	unsigned int id;
 	struct list_head list;
@@ -60,11 +60,11 @@ struct quickstart_btn {
 
 struct quickstart_acpi {
 	struct acpi_device *device;
-	struct quickstart_btn *btn;
+	struct quickstart_button *button;
 };
 
 static LIST_HEAD(buttons);
-static struct quickstart_btn *pressed;
+static struct quickstart_button *pressed;
 
 static struct input_dev *quickstart_input;
 
@@ -74,7 +74,7 @@ static ssize_t quickstart_buttons_show(struct device *dev,
 					char *buf)
 {
 	int count = 0;
-	struct quickstart_btn *b;
+	struct quickstart_button *b;
 
 	if (list_empty(&buttons))
 		return snprintf(buf, PAGE_SIZE, "none");
@@ -114,9 +114,9 @@ static ssize_t quickstart_pressed_button_store(struct device *dev,
 }
 
 /* Helper functions */
-static struct quickstart_btn *quickstart_buttons_add(void)
+static struct quickstart_button *quickstart_buttons_add(void)
 {
-	struct quickstart_btn *b;
+	struct quickstart_button *b;
 
 	b = kzalloc(sizeof(*b), GFP_KERNEL);
 	if (!b)
@@ -127,7 +127,7 @@ static struct quickstart_btn *quickstart_buttons_add(void)
 	return b;
 }
 
-static void quickstart_button_del(struct quickstart_btn *data)
+static void quickstart_button_del(struct quickstart_button *data)
 {
 	if (!data)
 		return;
@@ -139,7 +139,7 @@ static void quickstart_button_del(struct quickstart_btn *data)
 
 static void quickstart_buttons_free(void)
 {
-	struct quickstart_btn *b, *n;
+	struct quickstart_button *b, *n;
 
 	list_for_each_entry_safe(b, n, &buttons, list)
 		quickstart_button_del(b);
@@ -155,12 +155,12 @@ static void quickstart_acpi_notify(acpi_handle handle, u32 event, void *data)
 
 	switch (event) {
 	case QUICKSTART_EVENT_WAKE:
-		pressed = quickstart->btn;
+		pressed = quickstart->button;
 		break;
 	case QUICKSTART_EVENT_RUNTIME:
-		input_report_key(quickstart_input, quickstart->btn->id, 1);
+		input_report_key(quickstart_input, quickstart->button->id, 1);
 		input_sync(quickstart_input);
-		input_report_key(quickstart_input, quickstart->btn->id, 0);
+		input_report_key(quickstart_input, quickstart->button->id, 0);
 		input_sync(quickstart_input);
 		break;
 	default:
@@ -182,7 +182,7 @@ static int quickstart_acpi_ghid(struct quickstart_acpi *quickstart)
 								&buffer);
 	if (ACPI_FAILURE(status)) {
 		printk(KERN_ERR "quickstart: %s GHID method failed.\n",
-						quickstart->btn->name);
+						quickstart->button->name);
 		return -EINVAL;
 	}
 
@@ -193,21 +193,21 @@ static int quickstart_acpi_ghid(struct quickstart_acpi *quickstart)
 	 */
 	switch (buffer.length) {
 	case 1:
-		quickstart->btn->id = *(uint8_t *)buffer.pointer;
+		quickstart->button->id = *(uint8_t *)buffer.pointer;
 		break;
 	case 2:
-		quickstart->btn->id = *(uint16_t *)buffer.pointer;
+		quickstart->button->id = *(uint16_t *)buffer.pointer;
 		break;
 	case 4:
-		quickstart->btn->id = *(uint32_t *)buffer.pointer;
+		quickstart->button->id = *(uint32_t *)buffer.pointer;
 		break;
 	case 8:
-		quickstart->btn->id = *(uint64_t *)buffer.pointer;
+		quickstart->button->id = *(uint64_t *)buffer.pointer;
 		break;
 	default:
 		printk(KERN_ERR "quickstart: %s GHID method returned buffer "
 				"of unexpected length %u\n",
-				quickstart->btn->name, buffer.length);
+				quickstart->button->name, buffer.length);
 		ret = -EINVAL;
 		break;
 	}
@@ -227,14 +227,14 @@ static int quickstart_acpi_config(struct quickstart_acpi *quickstart)
 		return -ENOMEM;
 
 	/* Add new button to list */
-	quickstart->btn = quickstart_buttons_add();
-	if (!quickstart->btn) {
+	quickstart->button = quickstart_buttons_add();
+	if (!quickstart->button) {
 		kfree(name);
 		return -ENOMEM;
 	}
 
-	quickstart->btn->name = name;
-	strcpy(quickstart->btn->name, bid);
+	quickstart->button->name = name;
+	strcpy(quickstart->button->name, bid);
 
 	return 0;
 }
@@ -283,7 +283,7 @@ fail_ghid:
 						quickstart_acpi_notify);
 
 fail_installnotify:
-	quickstart_button_del(quickstart->btn);
+	quickstart_button_del(quickstart->button);
 
 fail_config:
 
@@ -360,7 +360,7 @@ static void quickstart_exit(void)
 
 static int __init quickstart_init_input(void)
 {
-	struct quickstart_btn *b;
+	struct quickstart_button *b;
 	int ret;
 
 	quickstart_input = input_allocate_device();
-- 
1.7.8.2


