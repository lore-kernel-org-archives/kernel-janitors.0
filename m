From: Thomas Hisch <t.hisch@gmail.com>
Date: Tue, 02 Jan 2007 14:53:51 +0000
Subject: [KJ] [PATCH] kmalloc-kzalloc conversion and spacing fixes
Message-Id: <20070102145351.GA8738@unknown-00-0d-60-79-ca-00.lan>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Subject: [PATCH] [PATCH] kmalloc-kzalloc conversion and spacing fixes

i hope everything is ok now.

Signed-off-by: Thomas Hisch <t.hisch@gmail.com>
---
 Documentation/connector/cn_test.c                  |    4 +--
 .../filesystems/configfs/configfs_example.c        |    8 +---
 .../firmware_sample_firmware_class.c               |   33 ++++++++++++--------
 3 files changed, 23 insertions(+), 22 deletions(-)

diff --git a/Documentation/connector/cn_test.c b/Documentation/connector/cn_test.c
index 3e73231..c19fc86 100644
--- a/Documentation/connector/cn_test.c
+++ b/Documentation/connector/cn_test.c
@@ -124,10 +124,8 @@ static void cn_test_timer_func(unsigned long __data)
 	struct cn_msg *m;
 	char data[32];
 
-	m = kmalloc(sizeof(*m) + sizeof(data), GFP_ATOMIC);
+	m = kzalloc(sizeof(*m) + sizeof(data), GFP_ATOMIC);
 	if (m) {
-		memset(m, 0, sizeof(*m) + sizeof(data));
-
 		memcpy(&m->id, &cn_test_id, sizeof(m->id));
 		m->seq = cn_test_timer_counter;
 		m->len = sizeof(data);
diff --git a/Documentation/filesystems/configfs/configfs_example.c b/Documentation/filesystems/configfs/configfs_example.c
index 2d6a14a..6f0e6c6 100644
--- a/Documentation/filesystems/configfs/configfs_example.c
+++ b/Documentation/filesystems/configfs/configfs_example.c
@@ -277,12 +277,10 @@ static struct config_item *simple_children_make_item(struct config_group *group,
 {
 	struct simple_child *simple_child;
 
-	simple_child = kmalloc(sizeof(struct simple_child), GFP_KERNEL);
+	simple_child = kzalloc(sizeof(*simple_child), GFP_KERNEL);
 	if (!simple_child)
 		return NULL;
 
-	memset(simple_child, 0, sizeof(struct simple_child));
-
 	config_item_init_type_name(&simple_child->item, name,
 				   &simple_child_type);
 
@@ -364,13 +362,11 @@ static struct config_group *group_children_make_group(struct config_group *group
 {
 	struct simple_children *simple_children;
 
-	simple_children = kmalloc(sizeof(struct simple_children),
+	simple_children = kzalloc(sizeof(*simple_children),
 				  GFP_KERNEL);
 	if (!simple_children)
 		return NULL;
 
-	memset(simple_children, 0, sizeof(struct simple_children));
-
 	config_group_init_type_name(&simple_children->group, name,
 				    &simple_children_type);
 
diff --git a/Documentation/firmware_class/firmware_sample_firmware_class.c b/Documentation/firmware_class/firmware_sample_firmware_class.c
index 9e1b0e4..f259902 100644
--- a/Documentation/firmware_class/firmware_sample_firmware_class.c
+++ b/Documentation/firmware_class/firmware_sample_firmware_class.c
@@ -27,6 +27,7 @@ static inline struct class_device *to_class_dev(struct kobject *obj)
 {
 	return container_of(obj,struct class_device,kobj);
 }
+
 static inline
 struct class_device_attribute *to_class_dev_attr(struct attribute *_attr)
 {
@@ -49,6 +50,7 @@ static ssize_t firmware_loading_show(struct class_device *class_dev, char *buf)
 	struct firmware_priv *fw_priv = class_get_devdata(class_dev);
 	return sprintf(buf, "%d\n", fw_priv->loading);
 }
+
 static ssize_t firmware_loading_store(struct class_device *class_dev,
 				      const char *buf, size_t count)
 {
@@ -57,7 +59,7 @@ static ssize_t firmware_loading_store(struct class_device *class_dev,
 
 	fw_priv->loading = simple_strtol(buf, NULL, 10);
 	
-	switch(fw_priv->loading){
+	switch (fw_priv->loading) {
 	case -1:
 		/* abort load an panic */
 		break;
@@ -65,7 +67,7 @@ static ssize_t firmware_loading_store(struct class_device *class_dev,
 		/* setup load */
 		break;
 	case 0:
-		if(prev_loading=1){
+		if (prev_loading = 1) {
 			/* finish load and get the device back to working
 			 * state */
 		}
@@ -74,6 +76,7 @@ static ssize_t firmware_loading_store(struct class_device *class_dev,
 
 	return count;
 }
+
 static CLASS_DEVICE_ATTR(loading, 0644,
 			 firmware_loading_show, firmware_loading_store);
 
@@ -87,6 +90,7 @@ static ssize_t firmware_data_read(struct kobject *kobj,
 
 	return count;
 }
+
 static ssize_t firmware_data_write(struct kobject *kobj,
 				   char *buffer, loff_t offset, size_t count)
 {
@@ -97,25 +101,26 @@ static ssize_t firmware_data_write(struct kobject *kobj,
 
 	return count;
 }
+
 static struct bin_attribute firmware_attr_data = {
 	.attr = {.name = "data", .mode = 0644},
 	.size = 0,
 	.read = firmware_data_read,
 	.write = firmware_data_write,
 };
+
 static int fw_setup_class_device(struct class_device *class_dev,
 				 const char *fw_name,
 				 struct device *device)
 {
 	int retval = 0;
-	struct firmware_priv *fw_priv = kmalloc(sizeof(struct firmware_priv),
-						GFP_KERNEL);
+	struct firmware_priv *fw_priv;
 
-	if(!fw_priv){
+	fw_priv = kzalloc(sizeof(*fw_priv), GFP_KERNEL);
+	if (!fw_priv) {
 		retval = -ENOMEM;
 		goto out;
 	}
-	memset(fw_priv, 0, sizeof(*fw_priv));
 	memset(class_dev, 0, sizeof(*class_dev));
 
 	strncpy(fw_priv->fw_id, fw_name, FIRMWARE_NAME_MAX);
@@ -128,14 +133,14 @@ static int fw_setup_class_device(struct class_device *class_dev,
 	class_dev->class = &firmware_class,
 	class_set_devdata(class_dev, fw_priv);
 	retval = class_device_register(class_dev);
-	if (retval){
+	if (retval) {
 		printk(KERN_ERR "%s: class_device_register failed\n",
 		       __FUNCTION__);
 		goto error_free_fw_priv;
 	}
 
 	retval = sysfs_create_bin_file(&class_dev->kobj, &firmware_attr_data);
-	if (retval){
+	if (retval) {
 		printk(KERN_ERR "%s: sysfs_create_bin_file failed\n",
 		       __FUNCTION__);
 		goto error_unreg_class_dev;
@@ -143,7 +148,7 @@ static int fw_setup_class_device(struct class_device *class_dev,
 
 	retval = class_device_create_file(class_dev,
 					  &class_device_attr_loading);
-	if (retval){
+	if (retval) {
 		printk(KERN_ERR "%s: class_device_create_file failed\n",
 		       __FUNCTION__);
 		goto error_remove_data;
@@ -160,6 +165,7 @@ error_free_fw_priv:
 out:
 	return retval;
 }
+
 static void fw_remove_class_device(struct class_device *class_dev)
 {
 	struct firmware_priv *fw_priv = class_get_devdata(class_dev);
@@ -180,19 +186,19 @@ static int __init firmware_sample_init(void)
 	int error;
 
 	device_initialize(&my_device);
-	class_dev = kmalloc(sizeof(struct class_device), GFP_KERNEL);
-	if(!class_dev)
+	class_dev = kmalloc(sizeof(*class_dev), GFP_KERNEL);
+	if (!class_dev)
 		return -ENOMEM;
 
 	error = fw_setup_class_device(class_dev, "my_firmware_image",
 				      &my_device);
-	if(error){
+	if (error) {
 		kfree(class_dev);
 		return error;
 	}
         return 0;
-
 }
+
 static void __exit firmware_sample_exit(void)
 {
 	struct firmware_priv *fw_priv = class_get_devdata(class_dev);
@@ -200,6 +206,7 @@ static void __exit firmware_sample_exit(void)
 	kfree(fw_priv);
 	kfree(class_dev);
 }
+
 module_init(firmware_sample_init);
 module_exit(firmware_sample_exit);
 
-- 
1.5.0.rc0.ge900

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
