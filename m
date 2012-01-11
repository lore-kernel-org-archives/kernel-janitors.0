From: Szymon Janc <szymon@janc.net.pl>
Date: Wed, 11 Jan 2012 22:22:36 +0000
Subject: [PATCH v2 01/17] Staging: quickstart: Some style, whitespaces and typos fixes
Message-Id: <1326320574-11220-2-git-send-email-szymon@janc.net.pl>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Signed-off-by: Szymon Janc <szymon@janc.net.pl>
---
 drivers/staging/quickstart/quickstart.c |   80 +++++++++++++++----------------
 1 files changed, 39 insertions(+), 41 deletions(-)

diff --git a/drivers/staging/quickstart/quickstart.c b/drivers/staging/quickstart/quickstart.c
index c60911c..d03b89d 100644
--- a/drivers/staging/quickstart/quickstart.c
+++ b/drivers/staging/quickstart/quickstart.c
@@ -4,7 +4,7 @@
  *
  *  Copyright (C) 2007-2010 Angelo Arrifano <miknix@gmail.com>
  *
- *  Information gathered from disassebled dsdt and from here:
+ *  Information gathered from disassembled dsdt and from here:
  *  <http://www.microsoft.com/whdc/system/platform/firmware/DirAppLaunch.mspx>
  *
  *  This program is free software; you can redistribute it and/or modify
@@ -37,21 +37,23 @@ MODULE_AUTHOR("Angelo Arrifano");
 MODULE_DESCRIPTION("ACPI Direct App Launch driver");
 MODULE_LICENSE("GPL");
 
-#define QUICKSTART_ACPI_DEVICE_NAME   "quickstart"
-#define QUICKSTART_ACPI_CLASS         "quickstart"
-#define QUICKSTART_ACPI_HID           "PNP0C32"
+#define QUICKSTART_ACPI_DEVICE_NAME	"quickstart"
+#define QUICKSTART_ACPI_CLASS		"quickstart"
+#define QUICKSTART_ACPI_HID		"PNP0C32"
 
-#define QUICKSTART_PF_DRIVER_NAME     "quickstart"
-#define QUICKSTART_PF_DEVICE_NAME     "quickstart"
-#define QUICKSTART_PF_DEVATTR_NAME    "pressed_button"
+#define QUICKSTART_PF_DRIVER_NAME	"quickstart"
+#define QUICKSTART_PF_DEVICE_NAME	"quickstart"
+#define QUICKSTART_PF_DEVATTR_NAME	"pressed_button"
 
-#define QUICKSTART_MAX_BTN_NAME_LEN   16
+#define QUICKSTART_MAX_BTN_NAME_LEN	16
 
-/* There will be two events:
-	 * 0x02 - A hot button was pressed while device was off/sleeping.
-	 * 0x80 - A hot button was pressed while device was up. */
-#define QUICKSTART_EVENT_WAKE         0x02
-#define QUICKSTART_EVENT_RUNTIME      0x80
+/*
+ * There will be two events:
+ * 0x02 - A hot button was pressed while device was off/sleeping.
+ * 0x80 - A hot button was pressed while device was up.
+ */
+#define QUICKSTART_EVENT_WAKE		0x02
+#define QUICKSTART_EVENT_RUNTIME	0x80
 
 struct quickstart_btn {
 	char *name;
@@ -64,14 +66,14 @@ static struct quickstart_driver_data {
 	struct quickstart_btn *pressed;
 } quickstart_data;
 
-/* ACPI driver Structs */
+/* ACPI driver structs */
 struct quickstart_acpi {
 	struct acpi_device *device;
 	struct quickstart_btn *btn;
 };
 static int quickstart_acpi_add(struct acpi_device *device);
 static int quickstart_acpi_remove(struct acpi_device *device, int type);
-static const struct acpi_device_id  quickstart_device_ids[] = {
+static const struct acpi_device_id quickstart_device_ids[] = {
 	{QUICKSTART_ACPI_HID, 0},
 	{"", 0},
 };
@@ -111,12 +113,10 @@ static struct platform_driver pf_driver = {
 	}
 };
 
-/*
- * Platform driver functions
- */
+/* Platform driver functions */
 static ssize_t buttons_show(struct device *dev,
-					 struct device_attribute *attr,
-					 char *buf)
+					struct device_attribute *attr,
+					char *buf)
 {
 	int count = 0;
 	struct quickstart_btn *ptr = quickstart_data.btn_lst;
@@ -137,8 +137,8 @@ static ssize_t buttons_show(struct device *dev,
 }
 
 static ssize_t pressed_button_show(struct device *dev,
-					struct device_attribute *attr,
-					char *buf)
+						struct device_attribute *attr,
+						char *buf)
 {
 	return snprintf(buf, PAGE_SIZE, "%s\n",
 			(quickstart_data.pressed ?
@@ -147,8 +147,8 @@ static ssize_t pressed_button_show(struct device *dev,
 
 
 static ssize_t pressed_button_store(struct device *dev,
-					 struct device_attribute *attr,
-					 const char *buf, size_t count)
+						struct device_attribute *attr,
+						const char *buf, size_t count)
 {
 	if (count < 2)
 		return -EINVAL;
@@ -160,7 +160,7 @@ static ssize_t pressed_button_store(struct device *dev,
 	return count;
 }
 
-/* Hotstart Helper functions */
+/* Helper functions */
 static int quickstart_btnlst_add(struct quickstart_btn **data)
 {
 	struct quickstart_btn **ptr = &quickstart_data.btn_lst;
@@ -240,22 +240,26 @@ static void quickstart_acpi_ghid(struct quickstart_acpi *quickstart)
 	if (!quickstart)
 		return;
 
-	/* This returns a buffer telling the button usage ID,
-	 * and triggers pending notify events (The ones before booting). */
-	status = acpi_evaluate_object(quickstart->device->handle,
-					"GHID", NULL, &buffer);
+	/*
+	 * This returns a buffer telling the button usage ID,
+	 * and triggers pending notify events (The ones before booting).
+	 */
+	status = acpi_evaluate_object(quickstart->device->handle, "GHID", NULL,
+								&buffer);
 	if (ACPI_FAILURE(status) || !buffer.pointer) {
 		printk(KERN_ERR "quickstart: %s GHID method failed.\n",
-		       quickstart->btn->name);
+						quickstart->btn->name);
 		return;
 	}
 
 	if (buffer.length < 8)
 		return;
 
-	/* <<The GHID method can return a BYTE, WORD, or DWORD.
+	/*
+	 * <<The GHID method can return a BYTE, WORD, or DWORD.
 	 * The value must be encoded in little-endian byte
-	 * order (least significant byte first).>> */
+	 * order (least significant byte first).>>
+	 */
 	usageid = *((uint32_t *)(buffer.pointer + (buffer.length - 8)));
 	quickstart->btn->id = usageid;
 
@@ -339,20 +343,17 @@ static int quickstart_acpi_remove(struct acpi_device *device, int type)
 
 	quickstart = acpi_driver_data(device);
 
-	status = acpi_remove_notify_handler(device->handle,
-						 ACPI_ALL_NOTIFY,
-					    quickstart_acpi_notify);
+	status = acpi_remove_notify_handler(device->handle, ACPI_ALL_NOTIFY,
+						quickstart_acpi_notify);
 	if (ACPI_FAILURE(status))
 		printk(KERN_ERR "quickstart: Error removing notify handler\n");
 
-
 	kfree(quickstart);
 
 	return 0;
 }
 
 /* Module functions */
-
 static void quickstart_exit(void)
 {
 	input_unregister_device(quickstart_input);
@@ -367,8 +368,6 @@ static void quickstart_exit(void)
 	acpi_bus_unregister_driver(&quickstart_acpi_driver);
 
 	quickstart_btnlst_free();
-
-	return;
 }
 
 static int __init quickstart_init_input(void)
@@ -444,14 +443,13 @@ static int __init quickstart_init(void)
 	if (ret)
 		goto fail_dev_file2;
 
-
 	/* Input device */
 	ret = quickstart_init_input();
 	if (ret)
 		goto fail_input;
 
 	printk(KERN_INFO "quickstart: ACPI Direct App Launch ver %s\n",
-						QUICKSTART_VERSION);
+							QUICKSTART_VERSION);
 
 	return 0;
 fail_input:
-- 
1.7.8.3


