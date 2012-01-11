From: Szymon Janc <szymon@janc.net.pl>
Date: Wed, 11 Jan 2012 22:22:46 +0000
Subject: [PATCH v2 11/17] Staging: quickstart: Get rid of quickstart_data struct
Message-Id: <1326320574-11220-12-git-send-email-szymon@janc.net.pl>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Signed-off-by: Szymon Janc <szymon@janc.net.pl>
---
 drivers/staging/quickstart/quickstart.c |   25 +++++++++++--------------
 1 files changed, 11 insertions(+), 14 deletions(-)

diff --git a/drivers/staging/quickstart/quickstart.c b/drivers/staging/quickstart/quickstart.c
index 9d827f2..03cb675 100644
--- a/drivers/staging/quickstart/quickstart.c
+++ b/drivers/staging/quickstart/quickstart.c
@@ -63,10 +63,8 @@ struct quickstart_acpi {
 	struct quickstart_btn *btn;
 };
 
-static struct quickstart_driver_data {
-	struct quickstart_btn *btn_lst;
-	struct quickstart_btn *pressed;
-} quickstart_data;
+static struct quickstart_btn *btn_list;
+static struct quickstart_btn *pressed;
 
 static struct input_dev *quickstart_input;
 
@@ -76,7 +74,7 @@ static ssize_t quickstart_buttons_show(struct device *dev,
 					char *buf)
 {
 	int count = 0;
-	struct quickstart_btn *ptr = quickstart_data.btn_lst;
+	struct quickstart_btn *ptr = btn_list;
 
 	if (!ptr)
 		return snprintf(buf, PAGE_SIZE, "none");
@@ -98,8 +96,7 @@ static ssize_t quickstart_pressed_button_show(struct device *dev,
 						char *buf)
 {
 	return snprintf(buf, PAGE_SIZE, "%s\n",
-			(quickstart_data.pressed ?
-			 quickstart_data.pressed->name : "none"));
+					(pressed ? pressed->name : "none"));
 }
 
 
@@ -113,14 +110,14 @@ static ssize_t quickstart_pressed_button_store(struct device *dev,
 	if (strncasecmp(buf, "none", 4) != 0)
 		return -EINVAL;
 
-	quickstart_data.pressed = NULL;
+	pressed = NULL;
 	return count;
 }
 
 /* Helper functions */
 static int quickstart_btnlst_add(struct quickstart_btn **data)
 {
-	struct quickstart_btn **ptr = &quickstart_data.btn_lst;
+	struct quickstart_btn **ptr = &btn_list;
 
 	while (*ptr)
 		ptr = &((*ptr)->next);
@@ -137,7 +134,7 @@ static int quickstart_btnlst_add(struct quickstart_btn **data)
 
 static void quickstart_btnlst_del(struct quickstart_btn *data)
 {
-	struct quickstart_btn **ptr = &quickstart_data.btn_lst;
+	struct quickstart_btn **ptr = &btn_list;
 
 	if (!data)
 		return;
@@ -156,7 +153,7 @@ static void quickstart_btnlst_del(struct quickstart_btn *data)
 
 static void quickstart_btnlst_free(void)
 {
-	struct quickstart_btn *ptr = quickstart_data.btn_lst;
+	struct quickstart_btn *ptr = btn_list;
 	struct quickstart_btn *lptr = NULL;
 
 	while (ptr) {
@@ -179,7 +176,7 @@ static void quickstart_acpi_notify(acpi_handle handle, u32 event, void *data)
 
 	switch (event) {
 	case QUICKSTART_EVENT_WAKE:
-		quickstart_data.pressed = quickstart->btn;
+		pressed = quickstart->btn;
 		break;
 	case QUICKSTART_EVENT_RUNTIME:
 		input_report_key(quickstart_input, quickstart->btn->id, 1);
@@ -385,7 +382,7 @@ static void quickstart_exit(void)
 
 static int __init quickstart_init_input(void)
 {
-	struct quickstart_btn **ptr = &quickstart_data.btn_lst;
+	struct quickstart_btn **ptr = &btn_list;
 	int count;
 	int ret;
 
@@ -427,7 +424,7 @@ static int __init quickstart_init(void)
 		return ret;
 
 	/* If existing bus with no devices */
-	if (!quickstart_data.btn_lst) {
+	if (!btn_list) {
 		ret = -ENODEV;
 		goto fail_pfdrv_reg;
 	}
-- 
1.7.8.3


