From: "Mike D. Day" <ncmike@us.ibm.com>
Date: Fri, 27 Oct 2006 18:41:03 +0000
Subject: [KJ] [PATCH] driver core: handle ignored error codes, CodingStyle
Message-Id: <20061027184103.GB26056@silverwood.ncultra.org>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

check return codes in drivers/base/core.c for functions with
attribute warn_unused_result. Handle errors appropriately.
Some CodingStyle changes on labels. Checked with sparse.

Signed-off-by: Mike D. Day <ncmike@us.ibm.com>

---
commit 76a1132818349d691ca233dbe6019d2e45a01d68
tree 72ed5160734f52404c71f1918d941cab806c8981
parent e80391500078b524083ba51c3df01bbaaecc94bb
author Mike Day <mdday@core.silverwood.home> Fri, 27 Oct 2006 14:14:21 -0400
committer Mike Day <mdday@core.silverwood.home> Fri, 27 Oct 2006 14:14:21 -0400

 drivers/base/core.c |  124 ++++++++++++++++++++++++++++++++++-----------------
 1 files changed, 82 insertions(+), 42 deletions(-)

diff --git a/drivers/base/core.c b/drivers/base/core.c
index 68ad11a..d236fa9 100644
--- a/drivers/base/core.c
+++ b/drivers/base/core.c
@@ -187,7 +187,8 @@ static int dev_uevent(struct kset *kset,
 
 	if (dev->class && dev->class->dev_uevent) {
 		/* have the class specific function add its stuff */
-		retval = dev->class->dev_uevent(dev, envp, num_envp, buffer, buffer_size);
+		retval = dev->class->dev_uevent(dev, envp, num_envp, buffer,
+						buffer_size);
 			if (retval) {
 				pr_debug("%s - dev_uevent() returned %d\n",
 					 __FUNCTION__, retval);
@@ -403,13 +404,13 @@ int device_add(struct device *dev)
 
 	dev = get_device(dev);
 	if (!dev || !strlen(dev->bus_id))
-		goto Error;
+		goto error;
 
 	/* if this is a class device, and has no parent, create one */
 	if ((dev->class) && (dev->parent = NULL)) {
 		error = virtual_device_parent(dev);
 		if (error)
-			goto Error;
+			goto error;
 	}
 
 	parent = get_device(dev->parent);
@@ -422,7 +423,7 @@ int device_add(struct device *dev)
 		dev->kobj.parent = &parent->kobj;
 
 	if ((error = kobject_add(&dev->kobj)))
-		goto Error;
+		goto error;
 
 	/* notify platform of device entry */
 	if (platform_notify)
@@ -435,14 +436,14 @@ int device_add(struct device *dev)
 	dev->uevent_attr.store = store_uevent;
 	error = device_create_file(dev, &dev->uevent_attr);
 	if (error)
-		goto attrError;
+		goto attr_error;
 
 	if (MAJOR(dev->devt)) {
 		struct device_attribute *attr;
 		attr = kzalloc(sizeof(*attr), GFP_KERNEL);
 		if (!attr) {
 			error = -ENOMEM;
-			goto ueventattrError;
+			goto uevent_attr_error;
 		}
 		attr->attr.name = "dev";
 		attr->attr.mode = S_IRUGO;
@@ -452,35 +453,57 @@ int device_add(struct device *dev)
 		error = device_create_file(dev, attr);
 		if (error) {
 			kfree(attr);
-			goto ueventattrError;
+			goto uevent_attr_error;
 		}
 
 		dev->devt_attr = attr;
 	}
 
-	if (dev->class) {
-		sysfs_create_link(&dev->kobj, &dev->class->subsys.kset.kobj,
+	if (!dev->class)
+		goto no_dev_class;
+
+	error = sysfs_create_link(&dev->kobj,
+				  &dev->class->subsys.kset.kobj,
 				  "subsystem");
-		sysfs_create_link(&dev->class->subsys.kset.kobj, &dev->kobj,
+	if (error)
+		goto attr_error;
+
+	error = sysfs_create_link(&dev->class->subsys.kset.kobj,
+				  &dev->kobj,
 				  dev->bus_id);
-		if (parent) {
-			sysfs_create_link(&dev->kobj, &dev->parent->kobj, "device");
-			class_name = make_class_name(dev->class->name, &dev->kobj);
-			sysfs_create_link(&dev->parent->kobj, &dev->kobj, class_name);
+	if (error)
+		goto sysfs_error1;
+
+	if (parent) {
+		error = sysfs_create_link(&dev->kobj, &dev->parent->kobj,
+					  "device");
+		if (error)
+			goto sysfs_error2;
+
+		class_name = make_class_name(dev->class->name, &dev->kobj);
+		if (IS_ERR(class_name)) {
+			error = (unsigned long)class_name;
+			goto sysfs_error3;
 		}
+
+		error = sysfs_create_link(&dev->parent->kobj, &dev->kobj,
+					  class_name);
+		if (error)
+			goto sysfs_error3;
 	}
 
+no_dev_class:
 	if ((error = device_add_attrs(dev)))
-		goto AttrsError;
+		goto attrs_error;
 	if ((error = device_add_groups(dev)))
-		goto GroupError;
+		goto group_error;
 	if ((error = device_pm_add(dev)))
-		goto PMError;
+		goto pme_rror;
 	if ((error = bus_add_device(dev)))
-		goto BusError;
+		goto bus_error;
 	kobject_uevent(&dev->kobj, KOBJ_ADD);
 	if ((error = bus_attach_device(dev)))
-		goto AttachError;
+		goto attach_error;
 	if (parent)
 		klist_add_tail(&dev->knode_parent, &parent->klist_children);
 
@@ -495,32 +518,39 @@ int device_add(struct device *dev)
 				class_intf->add_dev(dev, class_intf);
 		up(&dev->class->sem);
 	}
- Done:
+done:
  	kfree(class_name);
 	put_device(dev);
 	return error;
- AttachError:
+attach_error:
 	bus_remove_device(dev);
- BusError:
+bus_error:
 	device_pm_remove(dev);
- PMError:
+pme_rror:
 	device_remove_groups(dev);
- GroupError:
+group_error:
  	device_remove_attrs(dev);
- AttrsError:
+sysfs_error3:
+	sysfs_remove_link(&dev->kobj, "device");
+sysfs_error2:
+	sysfs_remove_link(&dev->class->subsys.kset.kobj,
+			  dev->bus_id);
+sysfs_error1:
+	sysfs_remove_link(&dev->kobj, "subsystem");
+attrs_error:
 	if (dev->devt_attr) {
 		device_remove_file(dev, dev->devt_attr);
 		kfree(dev->devt_attr);
 	}
- ueventattrError:
+uevent_attr_error:
 	device_remove_file(dev, &dev->uevent_attr);
- attrError:
+attr_error:
 	kobject_uevent(&dev->kobj, KOBJ_REMOVE);
 	kobject_del(&dev->kobj);
- Error:
+error:
 	if (parent)
 		put_device(parent);
-	goto Done;
+	goto done;
 }
 
 
@@ -807,8 +837,7 @@ int device_rename(struct device *dev, ch
 
 	pr_debug("DEVICE: renaming '%s' to '%s'\n", dev->bus_id, new_name);
 
-	if ((dev->class) && (dev->parent))
-		old_class_name = make_class_name(dev->class->name, &dev->kobj);
+
 
 	if (dev->class) {
 		old_symlink_name = kmalloc(BUS_ID_SIZE, GFP_KERNEL);
@@ -819,27 +848,38 @@ int device_rename(struct device *dev, ch
 		strlcpy(old_symlink_name, dev->bus_id, BUS_ID_SIZE);
 	}
 
+	error = kobject_rename(&dev->kobj, new_name);
+	if (error)
+		goto out_free_old_symlink;
+
 	strlcpy(dev->bus_id, new_name, BUS_ID_SIZE);
 
-	error = kobject_rename(&dev->kobj, new_name);
+	if ((dev->class) && (dev->parent))
+		old_class_name = make_class_name(dev->class->name, &dev->kobj);
+
+	if (!old_class_name)
+		goto no_old_class_name;
 
-	if (old_class_name) {
-		new_class_name = make_class_name(dev->class->name, &dev->kobj);
-		if (new_class_name) {
-			sysfs_create_link(&dev->parent->kobj, &dev->kobj,
-					  new_class_name);
+	new_class_name = make_class_name(dev->class->name, &dev->kobj);
+	if (new_class_name) {
+		error = sysfs_create_link(&dev->parent->kobj,
+					  &dev->kobj, new_class_name);
+		if (!error)
 			sysfs_remove_link(&dev->parent->kobj, old_class_name);
-		}
 	}
+
+no_old_class_name:
 	if (dev->class) {
-		sysfs_remove_link(&dev->class->subsys.kset.kobj,
-				  old_symlink_name);
-		sysfs_create_link(&dev->class->subsys.kset.kobj, &dev->kobj,
-				  dev->bus_id);
+		error = sysfs_create_link(&dev->class->subsys.kset.kobj,
+					  &dev->kobj, dev->bus_id);
+		if (!error)
+			sysfs_remove_link(&dev->class->subsys.kset.kobj,
+					  old_symlink_name);
 	}
 	put_device(dev);
 
 	kfree(new_class_name);
+out_free_old_symlink:
 	kfree(old_symlink_name);
  out_free_old_class:
 	kfree(old_class_name);


-- 
Mike D. Day
IBM LTC
Cell: 919 412-3900
Sametime: ncmike@us.ibm.com AIM: ncmikeday  Yahoo: ultra.runner
PGP key: http://www.ncultra.org/ncmike/pubkey.asc
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
