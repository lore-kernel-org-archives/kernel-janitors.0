From: Szymon Janc <szymon@janc.net.pl>
Date: Wed, 11 Jan 2012 22:22:37 +0000
Subject: [PATCH v2 02/17] Staging: quickstart: Prefix remaining functions names with quickstart_
Message-Id: <1326320574-11220-3-git-send-email-szymon@janc.net.pl>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Signed-off-by: Szymon Janc <szymon@janc.net.pl>
---
 drivers/staging/quickstart/quickstart.c |   18 +++++++++---------
 1 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/drivers/staging/quickstart/quickstart.c b/drivers/staging/quickstart/quickstart.c
index d03b89d..adce56b 100644
--- a/drivers/staging/quickstart/quickstart.c
+++ b/drivers/staging/quickstart/quickstart.c
@@ -92,19 +92,19 @@ static struct acpi_driver quickstart_acpi_driver = {
 struct input_dev *quickstart_input;
 
 /* Platform driver structs */
-static ssize_t buttons_show(struct device *dev,
+static ssize_t quickstart_buttons_show(struct device *dev,
 					struct device_attribute *attr,
 					char *buf);
-static ssize_t pressed_button_show(struct device *dev,
+static ssize_t quickstart_pressed_button_show(struct device *dev,
 					struct device_attribute *attr,
 					char *buf);
-static ssize_t pressed_button_store(struct device *dev,
+static ssize_t quickstart_pressed_button_store(struct device *dev,
 					struct device_attribute *attr,
 					 const char *buf,
 					 size_t count);
-static DEVICE_ATTR(pressed_button, 0666, pressed_button_show,
-					 pressed_button_store);
-static DEVICE_ATTR(buttons, 0444, buttons_show, NULL);
+static DEVICE_ATTR(pressed_button, 0666, quickstart_pressed_button_show,
+					 quickstart_pressed_button_store);
+static DEVICE_ATTR(buttons, 0444, quickstart_buttons_show, NULL);
 static struct platform_device *pf_device;
 static struct platform_driver pf_driver = {
 	.driver = {
@@ -114,7 +114,7 @@ static struct platform_driver pf_driver = {
 };
 
 /* Platform driver functions */
-static ssize_t buttons_show(struct device *dev,
+static ssize_t quickstart_buttons_show(struct device *dev,
 					struct device_attribute *attr,
 					char *buf)
 {
@@ -136,7 +136,7 @@ static ssize_t buttons_show(struct device *dev,
 	return count;
 }
 
-static ssize_t pressed_button_show(struct device *dev,
+static ssize_t quickstart_pressed_button_show(struct device *dev,
 						struct device_attribute *attr,
 						char *buf)
 {
@@ -146,7 +146,7 @@ static ssize_t pressed_button_show(struct device *dev,
 }
 
 
-static ssize_t pressed_button_store(struct device *dev,
+static ssize_t quickstart_pressed_button_store(struct device *dev,
 						struct device_attribute *attr,
 						const char *buf, size_t count)
 {
-- 
1.7.8.3


