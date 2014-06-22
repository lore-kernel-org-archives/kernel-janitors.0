From: Tina Johnson <tinajohnson.1234@gmail.com>
Date: Sun, 22 Jun 2014 12:42:02 +0000
Subject: [PATCH] Base: attribute_container: Fixed coding style errors and warnings
Message-Id: <1403440202-17438-1-git-send-email-tinajohnson.1234@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Fixed coding style and whitespace errors/warnings.

Signed-off-by: Tina Johnson <tinajohnson.1234@gmail.com>
---
 drivers/base/attribute_container.c |   18 ++++++++++--------
 1 file changed, 10 insertions(+), 8 deletions(-)

diff --git a/drivers/base/attribute_container.c b/drivers/base/attribute_container.c
index b84ca8f..aeca7f6 100644
--- a/drivers/base/attribute_container.c
+++ b/drivers/base/attribute_container.c
@@ -74,9 +74,9 @@ int
 attribute_container_register(struct attribute_container *cont)
 {
 	INIT_LIST_HEAD(&cont->node);
-	klist_init(&cont->containers,internal_container_klist_get,
+	klist_init(&cont->containers, internal_container_klist_get,
 		   internal_container_klist_put);
-		
+
 	mutex_lock(&attribute_container_mutex);
 	list_add_tail(&cont->node, &attribute_container_list);
 	mutex_unlock(&attribute_container_mutex);
@@ -94,6 +94,7 @@ int
 attribute_container_unregister(struct attribute_container *cont)
 {
 	int retval = -EBUSY;
+
 	mutex_lock(&attribute_container_mutex);
 	spin_lock(&cont->containers.k_lock);
 	if (!list_empty(&cont->containers.k_list))
@@ -104,14 +105,14 @@ attribute_container_unregister(struct attribute_container *cont)
 	spin_unlock(&cont->containers.k_lock);
 	mutex_unlock(&attribute_container_mutex);
 	return retval;
-		
+
 }
 EXPORT_SYMBOL_GPL(attribute_container_unregister);
 
 /* private function used as class release */
 static void attribute_container_release(struct device *classdev)
 {
-	struct internal_container *ic 
+	struct internal_container *ic
 		= container_of(classdev, struct internal_container, classdev);
 	struct device *dev = classdev->parent;
 
@@ -184,8 +185,8 @@ attribute_container_add_device(struct device *dev,
 		struct klist_node *n = klist_next(iter); \
 		n ? container_of(n, typeof(*pos), member) : \
 			({ klist_iter_exit(iter) ; NULL; }); \
-	}) ) != NULL; )
-			
+	})) != NULL;)
+
 
 /**
  * attribute_container_remove_device - make device eligible for removal.
@@ -247,7 +248,7 @@ attribute_container_remove_device(struct device *dev,
  * container, then use attribute_container_trigger() instead.
  */
 void
-attribute_container_device_trigger(struct device *dev, 
+attribute_container_device_trigger(struct device *dev,
 				   int (*fn)(struct attribute_container *,
 					     struct device *,
 					     struct device *))
@@ -349,6 +350,7 @@ int
 attribute_container_add_class_device(struct device *classdev)
 {
 	int error = device_add(classdev);
+
 	if (error)
 		return error;
 	return attribute_container_add_attrs(classdev);
@@ -387,7 +389,7 @@ attribute_container_remove_attrs(struct device *classdev)
 
 	if (cont->grp) {
 		sysfs_remove_group(&classdev->kobj, cont->grp);
-		return ;
+		return;
 	}
 
 	for (i = 0; attrs[i]; i++)
-- 
1.7.10.4

