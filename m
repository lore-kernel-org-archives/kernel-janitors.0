From: Leann Ogasawara <ogasawara@osdl.org>
Date: Fri, 05 Mar 2004 17:24:56 +0000
Subject: [Kernel-janitors] [PATCH] class_register() always returns 0
Message-Id: <1078507496.29095.19.camel@ibm-d.pdx.osdl.net>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hi All,

I noticed that the class_register() function in drivers/base/class.c
always returns 0 and thus will never fail.  Patch below inserts simple
error checking to return any errors if they occur.  Feedback welcome. 
Thanks,

Leann

diffed against linux-2.6.4-rc2

=== drivers/base/class.c 1.45 vs edited ==--- 1.45/drivers/base/class.c	Tue Mar  2 17:39:28 2004
+++ edited/drivers/base/class.c	Fri Mar  5 08:59:40 2004
@@ -106,13 +106,21 @@
 
 int class_register(struct class * cls)
 {
+	int error;
+
 	pr_debug("device class '%s': registering\n",cls->name);
 
 	INIT_LIST_HEAD(&cls->children);
 	INIT_LIST_HEAD(&cls->interfaces);
-	kobject_set_name(&cls->subsys.kset.kobj,cls->name);
+	error = kobject_set_name(&cls->subsys.kset.kobj,cls->name);
+	if (error)
+		return error;
+
 	subsys_set_kset(cls,class_subsys);
-	subsystem_register(&cls->subsys);
+
+	error = subsystem_register(&cls->subsys);
+	if (error)
+		return error;
 
 	return 0;
 }


_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors
