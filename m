From: Henne <henne@nachtwindheim.de>
Date: Tue, 04 Jul 2006 11:55:44 +0000
Subject: [KJ] [PATCH] kernel-doc in drivers/base/core.c corrections
Message-Id: <44AA5740.8050906@nachtwindheim.de>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

From: Henrik Kretzschmar <henne@nachtwindheim.de>

Corrects the kerneldocs for device_create() and device_destroy()
with an eye on coding style and grammar.
Signed-off-by: Henrik Kretzschmar <henne@nachtwindheim.de>
---

--- linux-2.6.17-git22/drivers/base/core.c	2006-07-04 11:12:06.000000000 +0200
+++ linux/drivers/base/core.c	2006-07-04 13:42:49.000000000 +0200
@@ -559,9 +559,9 @@

 /**
  * device_create - creates a device and registers it with sysfs
- * @cs: pointer to the struct class that this device should be registered to.
- * @parent: pointer to the parent struct device of this new device, if any.
- * @dev: the dev_t for the char device to be added.
+ * @class: pointer to the struct class that this device should be registered to
+ * @parent: pointer to the parent struct device of this new device, if any
+ * @devt: the dev_t for the char device to be added
  * @fmt: string for the class device's name
  *
  * This function can be used by char device classes.  A struct
@@ -620,11 +620,11 @@

 /**
  * device_destroy - removes a device that was created with device_create()
- * @class: the pointer to the struct class that this device was registered * with.
- * @dev: the dev_t of the device that was previously registered.
+ * @class: pointer to the struct class that this device was registered with
+ * @devt: the dev_t of the device that was previously registered
  *
  * This call unregisters and cleans up a class device that was created with a
- * call to class_device_create()
+ * call to class_device_create().
  */
 void device_destroy(struct class *class, dev_t devt)
 {
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
