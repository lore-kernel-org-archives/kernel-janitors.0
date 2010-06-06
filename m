From: Javier Martinez Canillas <martinez.javier@gmail.com>
Date: Sun, 06 Jun 2010 01:23:28 +0000
Subject: [PATCH] drivers/staging/batman-adv: fix function prototype
Message-Id: <1275787408.10961.13.camel@lenovo>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

In today linux-next I got a compile warning in staging/batman-adv.

This is due a struct bin_attribute read function prototype change and the driver was not updated.

This patch solves the issue

Signed-off-by: Javier Martinez Canillas <martinez.javier@gmail.com>
---
 drivers/staging/batman-adv/bat_sysfs.c |   24 ++++++++++++------------
 1 files changed, 12 insertions(+), 12 deletions(-)

diff --git a/drivers/staging/batman-adv/bat_sysfs.c b/drivers/staging/batman-adv/bat_sysfs.c
index e2c000b..212bc21 100644
--- a/drivers/staging/batman-adv/bat_sysfs.c
+++ b/drivers/staging/batman-adv/bat_sysfs.c
@@ -225,9 +225,9 @@ static struct bat_attribute *mesh_attrs[] = {
 	NULL,
 };
 
-static ssize_t transtable_local_read(struct kobject *kobj,
-			       struct bin_attribute *bin_attr,
-			       char *buff, loff_t off, size_t count)
+static ssize_t transtable_local_read(struct file *filp, struct kobject *kobj,
+				  struct bin_attribute *bin_attr,
+				  char *buff, loff_t off, size_t count)
 {
 	struct device *dev = to_dev(kobj->parent);
 	struct net_device *net_dev = to_net_dev(dev);
@@ -235,9 +235,9 @@ static ssize_t transtable_local_read(struct kobject *kobj,
 	return hna_local_fill_buffer_text(net_dev, buff, count, off);
 }
 
-static ssize_t transtable_global_read(struct kobject *kobj,
-			       struct bin_attribute *bin_attr,
-			       char *buff, loff_t off, size_t count)
+static ssize_t transtable_global_read(struct file *filp, struct kobject *kobj,
+				  struct bin_attribute *bin_attr,
+				  char *buff, loff_t off, size_t count)
 {
 	struct device *dev = to_dev(kobj->parent);
 	struct net_device *net_dev = to_net_dev(dev);
@@ -245,9 +245,9 @@ static ssize_t transtable_global_read(struct kobject *kobj,
 	return hna_global_fill_buffer_text(net_dev, buff, count, off);
 }
 
-static ssize_t originators_read(struct kobject *kobj,
-			       struct bin_attribute *bin_attr,
-			       char *buff, loff_t off, size_t count)
+static ssize_t originators_read(struct file *filp, struct kobject *kobj,
+				  struct bin_attribute *bin_attr,
+				  char *buff, loff_t off, size_t count)
 {
 	struct device *dev = to_dev(kobj->parent);
 	struct net_device *net_dev = to_net_dev(dev);
@@ -255,9 +255,9 @@ static ssize_t originators_read(struct kobject *kobj,
 	return orig_fill_buffer_text(net_dev, buff, count, off);
 }
 
-static ssize_t vis_data_read(struct kobject *kobj,
-			     struct bin_attribute *bin_attr,
-			     char *buff, loff_t off, size_t count)
+static ssize_t vis_data_read(struct file *filp, struct kobject *kobj,
+				  struct bin_attribute *bin_attr,
+				  char *buff, loff_t off, size_t count)
 {
 	struct device *dev = to_dev(kobj->parent);
 	struct net_device *net_dev = to_net_dev(dev);
-- 
1.7.0.4






