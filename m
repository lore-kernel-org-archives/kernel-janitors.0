From: "Mike D. Day" <ncmike@us.ibm.com>
Date: Wed, 01 Nov 2006 22:52:30 +0000
Subject: [KJ]  [PATCH] driver core: check for return codes,
Message-Id: <20061101225230.GC5176@silverwood.ncultra.org>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Check return code for functions with attribute, handle errors. Remove
compiler warning messages and fail gracefully if oom or -EINVAL parm.


Signed-off-by: Mike D. Day <ncmike@us.ibm.com>

---

 drivers/base/class.c |   25 +++++++++++++++++++++----
 1 files changed, 21 insertions(+), 4 deletions(-)
diff --git a/drivers/base/class.c b/drivers/base/class.c
index 0ff267a..b58719e 100644
--- a/drivers/base/class.c
+++ b/drivers/base/class.c
@@ -804,21 +804,38 @@ int class_device_rename(struct class_dev
 	pr_debug("CLASS: renaming '%s' to '%s'\n", class_dev->class_id,
 		 new_name);
 
-	if (class_dev->dev)
+	if (class_dev->dev) {
 		old_class_name = make_class_name(class_dev->class->name,
 						 &class_dev->kobj);
 
+		if (IS_ERR(old_class_name)) {
+			error = PTR_ERR(old_class_name);
+			old_class_name = NULL;
+			goto class_name_err;
+		}
+	}
+
 	strlcpy(class_dev->class_id, new_name, KOBJ_NAME_LEN);
 
 	error = kobject_rename(&class_dev->kobj, new_name);
+	if(error)
+		goto class_name_err;
 
 	if (class_dev->dev) {
 		new_class_name = make_class_name(class_dev->class->name,
 						 &class_dev->kobj);
-		sysfs_create_link(&class_dev->dev->kobj, &class_dev->kobj,
-				  new_class_name);
-		sysfs_remove_link(&class_dev->dev->kobj, old_class_name);
+		if (IS_ERR(new_class_name)) {
+			error = PTR_ERR(new_class_name);
+			new_class_name = NULL;
+			goto class_name_err;
+		}
+
+		error = sysfs_create_link(&class_dev->dev->kobj,
+					  &class_dev->kobj, new_class_name);
+		if (!error)
+			sysfs_remove_link(&class_dev->dev->kobj, old_class_name);
 	}
+class_name_err:
 	class_device_put(class_dev);
 
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
