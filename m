From: Thomas Hisch <t.hisch@gmail.com>
Date: Tue, 02 Jan 2007 13:08:14 +0000
Subject: [KJ] [PATCH] kmalloc -> kzalloc conversion in Documentation examples
Message-Id: <20070102130813.GA7459@unknown-00-0d-60-79-ca-00.lan>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Signed-off-by: Thomas Hisch <t.hisch@gmail.com>
---
 Documentation/connector/cn_test.c                  |    4 +---
 .../filesystems/configfs/configfs_example.c        |    8 ++------
 .../firmware_sample_firmware_class.c               |    6 ++----
 3 files changed, 5 insertions(+), 13 deletions(-)

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
index 2d6a14a..473433c 100644
--- a/Documentation/filesystems/configfs/configfs_example.c
+++ b/Documentation/filesystems/configfs/configfs_example.c
@@ -277,12 +277,10 @@ static struct config_item *simple_children_make_item(struct config_group *group,
 {
 	struct simple_child *simple_child;
 
-	simple_child = kmalloc(sizeof(struct simple_child), GFP_KERNEL);
+	simple_child = kzalloc(sizeof(struct simple_child), GFP_KERNEL);
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
+	simple_children = kzalloc(sizeof(struct simple_children),
 				  GFP_KERNEL);
 	if (!simple_children)
 		return NULL;
 
-	memset(simple_children, 0, sizeof(struct simple_children));
-
 	config_group_init_type_name(&simple_children->group, name,
 				    &simple_children_type);
 
diff --git a/Documentation/firmware_class/firmware_sample_firmware_class.c b/Documentation/firmware_class/firmware_sample_firmware_class.c
index 9e1b0e4..da888f0 100644
--- a/Documentation/firmware_class/firmware_sample_firmware_class.c
+++ b/Documentation/firmware_class/firmware_sample_firmware_class.c
@@ -108,15 +108,13 @@ static int fw_setup_class_device(struct class_device *class_dev,
 				 struct device *device)
 {
 	int retval = 0;
-	struct firmware_priv *fw_priv = kmalloc(sizeof(struct firmware_priv),
+	struct firmware_priv *fw_priv = kzalloc(sizeof(struct firmware_priv),
 						GFP_KERNEL);
 
 	if(!fw_priv){
 		retval = -ENOMEM;
 		goto out;
 	}
-	memset(fw_priv, 0, sizeof(*fw_priv));
-	memset(class_dev, 0, sizeof(*class_dev));
 
 	strncpy(fw_priv->fw_id, fw_name, FIRMWARE_NAME_MAX);
 	fw_priv->fw_id[FIRMWARE_NAME_MAX-1] = '\0';
@@ -180,7 +178,7 @@ static int __init firmware_sample_init(void)
 	int error;
 
 	device_initialize(&my_device);
-	class_dev = kmalloc(sizeof(struct class_device), GFP_KERNEL);
+	class_dev = kzalloc(sizeof(struct class_device), GFP_KERNEL);
 	if(!class_dev)
 		return -ENOMEM;
 
-- 
1.5.0.rc0.ge900

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
