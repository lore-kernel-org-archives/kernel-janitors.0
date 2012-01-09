From: Szymon Janc <szymon@janc.net.pl>
Date: Mon, 09 Jan 2012 22:23:31 +0000
Subject: [PATCH 12/16] Staging: quickstart: Use list.h API for buttons list
Message-Id: <1326147815-11451-13-git-send-email-szymon@janc.net.pl>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Signed-off-by: Szymon Janc <szymon@janc.net.pl>
---
 drivers/staging/quickstart/quickstart.c |   95 +++++++++++-------------------
 1 files changed, 35 insertions(+), 60 deletions(-)

diff --git a/drivers/staging/quickstart/quickstart.c b/drivers/staging/quickstart/quickstart.c
index 03cb675..486b973 100644
--- a/drivers/staging/quickstart/quickstart.c
+++ b/drivers/staging/quickstart/quickstart.c
@@ -55,7 +55,7 @@ MODULE_LICENSE("GPL");
 struct quickstart_btn {
 	char *name;
 	unsigned int id;
-	struct quickstart_btn *next;
+	struct list_head list;
 };
 
 struct quickstart_acpi {
@@ -63,7 +63,7 @@ struct quickstart_acpi {
 	struct quickstart_btn *btn;
 };
 
-static struct quickstart_btn *btn_list;
+static LIST_HEAD(buttons);
 static struct quickstart_btn *pressed;
 
 static struct input_dev *quickstart_input;
@@ -74,18 +74,17 @@ static ssize_t quickstart_buttons_show(struct device *dev,
 					char *buf)
 {
 	int count = 0;
-	struct quickstart_btn *ptr = btn_list;
+	struct quickstart_btn *b;
 
-	if (!ptr)
+	if (list_empty(&buttons))
 		return snprintf(buf, PAGE_SIZE, "none");
 
-	while (ptr && (count < PAGE_SIZE)) {
-		if (ptr->name) {
-			count += snprintf(buf + count,
-					PAGE_SIZE - count,
-					"%d\t%s\n", ptr->id, ptr->name);
-		}
-		ptr = ptr->next;
+	list_for_each_entry(b, &buttons, list) {
+		count += snprintf(buf + count, PAGE_SIZE - count, "%d\t%s\n",
+							b->id, b->name);
+
+		if (count = PAGE_SIZE)
+			break;
 	}
 
 	return count;
@@ -115,55 +114,35 @@ static ssize_t quickstart_pressed_button_store(struct device *dev,
 }
 
 /* Helper functions */
-static int quickstart_btnlst_add(struct quickstart_btn **data)
+static struct quickstart_btn *quickstart_buttons_add(void)
 {
-	struct quickstart_btn **ptr = &btn_list;
+	struct quickstart_btn *b;
 
-	while (*ptr)
-		ptr = &((*ptr)->next);
+	b = kzalloc(sizeof(*b), GFP_KERNEL);
+	if (!b)
+		return NULL;
 
-	*ptr = kzalloc(sizeof(struct quickstart_btn), GFP_KERNEL);
-	if (!*ptr) {
-		*data = NULL;
-		return -ENOMEM;
-	}
-	*data = *ptr;
+	list_add_tail(&b->list, &buttons);
 
-	return 0;
+	return b;
 }
 
-static void quickstart_btnlst_del(struct quickstart_btn *data)
+static void quickstart_button_del(struct quickstart_btn *data)
 {
-	struct quickstart_btn **ptr = &btn_list;
-
 	if (!data)
 		return;
 
-	while (*ptr) {
-		if (*ptr = data) {
-			*ptr = (*ptr)->next;
-			kfree(data);
-			return;
-		}
-		ptr = &((*ptr)->next);
-	}
-
-	return;
+	list_del(&data->list);
+	kfree(data->name);
+	kfree(data);
 }
 
-static void quickstart_btnlst_free(void)
+static void quickstart_buttons_free(void)
 {
-	struct quickstart_btn *ptr = btn_list;
-	struct quickstart_btn *lptr = NULL;
-
-	while (ptr) {
-		lptr = ptr;
-		ptr = ptr->next;
-		kfree(lptr->name);
-		kfree(lptr);
-	}
+	struct quickstart_btn *b, *n;
 
-	return;
+	list_for_each_entry_safe(b, n, &buttons, list)
+		quickstart_button_del(b);
 }
 
 /* ACPI Driver functions */
@@ -242,17 +221,16 @@ static int quickstart_acpi_config(struct quickstart_acpi *quickstart)
 {
 	char *bid = acpi_device_bid(quickstart->device);
 	char *name;
-	int ret;
 
 	name = kmalloc(strlen(bid) + 1, GFP_KERNEL);
 	if (!name)
 		return -ENOMEM;
 
-	/* Add button to list */
-	ret = quickstart_btnlst_add(&quickstart->btn);
-	if (ret < 0) {
+	/* Add new button to list */
+	quickstart->btn = quickstart_buttons_add();
+	if (!quickstart->btn) {
 		kfree(name);
-		return ret;
+		return -ENOMEM;
 	}
 
 	quickstart->btn->name = name;
@@ -305,7 +283,7 @@ fail_ghid:
 						quickstart_acpi_notify);
 
 fail_installnotify:
-	quickstart_btnlst_del(quickstart->btn);
+	quickstart_button_del(quickstart->btn);
 
 fail_config:
 
@@ -377,13 +355,12 @@ static void quickstart_exit(void)
 
 	acpi_bus_unregister_driver(&quickstart_acpi_driver);
 
-	quickstart_btnlst_free();
+	quickstart_buttons_free();
 }
 
 static int __init quickstart_init_input(void)
 {
-	struct quickstart_btn **ptr = &btn_list;
-	int count;
+	struct quickstart_btn *b;
 	int ret;
 
 	quickstart_input = input_allocate_device();
@@ -394,11 +371,9 @@ static int __init quickstart_init_input(void)
 	quickstart_input->name = "Quickstart ACPI Buttons";
 	quickstart_input->id.bustype = BUS_HOST;
 
-	while (*ptr) {
-		count++;
+	list_for_each_entry(b, &buttons, list) {
 		set_bit(EV_KEY, quickstart_input->evbit);
-		set_bit((*ptr)->id, quickstart_input->keybit);
-		ptr = &((*ptr)->next);
+		set_bit(b->id, quickstart_input->keybit);
 	}
 
 	ret = input_register_device(quickstart_input);
@@ -424,7 +399,7 @@ static int __init quickstart_init(void)
 		return ret;
 
 	/* If existing bus with no devices */
-	if (!btn_list) {
+	if (list_empty(&buttons)) {
 		ret = -ENODEV;
 		goto fail_pfdrv_reg;
 	}
-- 
1.7.8.2


