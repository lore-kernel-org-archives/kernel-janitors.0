From: "Robert P. J. Day" <rpjday@mindspring.com>
Date: Sat, 19 May 2007 19:17:12 +0000
Subject: [KJ] [PATCH][RFC] Move common MODULE_INFO content into a separate
Message-Id: <Pine.LNX.4.64.0705191513070.9252@localhost.localdomain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org


As a first step in being able to treat the header files module.h and
moduleparam.h more independently, extract the common MODULE_INFO from
them and place that content into a new header file.

Signed-off-by: Robert P. J. Day <rpjday@mindspring.com>

---

  would this be the correct form of a patch that changes some existing
files and adds a new file?

  and a rationale for this patch can be found here:

  http://fsdev.net/wiki/index.php?title=Moduleparam.h

 include/linux/module.h      |   12 +++---------
 include/linux/moduleinfo.h  |   18 ++++++++++++++++++
 include/linux/moduleparam.h |   16 +++++-----------
 3 files changed, 26 insertions(+), 20 deletions(-)

diff --git a/include/linux/module.h b/include/linux/module.h
index e6e0f86..d9a9a13 100644
--- a/include/linux/module.h
+++ b/include/linux/module.h
@@ -15,7 +15,8 @@
 #include <linux/elf.h>
 #include <linux/stringify.h>
 #include <linux/kobject.h>
-#include <linux/moduleparam.h>
+#include <linux/moduleparam.h>	/* Ideally, this shouldn't be necessary. */
+#include <linux/moduleinfo.h>
 #include <asm/local.h>

 #include <asm/module.h>
@@ -88,9 +89,6 @@ extern struct module __this_module;
 #define THIS_MODULE ((struct module *)0)
 #endif

-/* Generic info of form tag = "info" */
-#define MODULE_INFO(tag, info) __MODULE_INFO(tag, tag, info)
-
 /* For userspace: you can also call me... */
 #define MODULE_ALIAS(_alias) MODULE_INFO(alias, _alias)

@@ -130,11 +128,6 @@ extern struct module __this_module;
 /* What your module does. */
 #define MODULE_DESCRIPTION(_description) MODULE_INFO(description, _description)

-/* One for each parameter, describing how to use it.  Some files do
-   multiple of these per line, so can't just use MODULE_INFO. */
-#define MODULE_PARM_DESC(_parm, desc) \
-	__MODULE_INFO(parm, _parm, #_parm ":" desc)
-
 #define MODULE_DEVICE_TABLE(type,name)		\
   MODULE_GENERIC_TABLE(type##_device,name)

@@ -576,6 +569,7 @@ struct device_driver;
 struct module;

 extern struct kset module_subsys;
+struct kernel_param;

 int mod_sysfs_init(struct module *mod);
 int mod_sysfs_setup(struct module *mod,
diff --git a/include/linux/moduleinfo.h b/include/linux/moduleinfo.h
new file mode 100644
index 0000000..cee86a9
--- /dev/null
+++ b/include/linux/moduleinfo.h
@@ -0,0 +1,18 @@
+#ifndef _LINUX_MODULEINFO_H
+#define _LINUX_MODULEINFO_H
+
+#ifdef MODULE
+#include <linux/stringify.h>
+#define ___module_cat(a,b) __mod_ ## a ## b
+#define __module_cat(a,b) ___module_cat(a,b)
+#define __MODULE_INFO(tag, name, info)				\
+static const char __module_cat(name,__LINE__)[]			\
+  __attribute_used__						\
+  __attribute__((section(".modinfo"),unused)) = __stringify(tag) "=" info
+#else  /* !MODULE */
+#define __MODULE_INFO(tag, name, info)
+#endif
+
+#define MODULE_INFO(tag, info) __MODULE_INFO(tag, tag, info)
+
+#endif // _LINUX_MODULEINFO_H
diff --git a/include/linux/moduleparam.h b/include/linux/moduleparam.h
index c83588c..650328d 100644
--- a/include/linux/moduleparam.h
+++ b/include/linux/moduleparam.h
@@ -4,6 +4,7 @@
 #include <linux/init.h>
 #include <linux/stringify.h>
 #include <linux/kernel.h>
+#include <linux/moduleinfo.h>

 /* You can override this manually, but generally this should match the
    module name. */
@@ -13,19 +14,12 @@
 #define MODULE_PARAM_PREFIX KBUILD_MODNAME "."
 #endif

-#ifdef MODULE
-#define ___module_cat(a,b) __mod_ ## a ## b
-#define __module_cat(a,b) ___module_cat(a,b)
-#define __MODULE_INFO(tag, name, info)					  \
-static const char __module_cat(name,__LINE__)[]				  \
-  __attribute_used__							  \
-  __attribute__((section(".modinfo"),unused)) = __stringify(tag) "=" info
-#else  /* !MODULE */
-#define __MODULE_INFO(tag, name, info)
-#endif
-#define __MODULE_PARM_TYPE(name, _type)					  \
+#define __MODULE_PARM_TYPE(name, _type)					\
   __MODULE_INFO(parmtype, name##type, #name ":" _type)

+#define MODULE_PARM_DESC(_parm, desc)					\
+  __MODULE_INFO(parm, _parm, #_parm ":" desc)
+
 struct kernel_param;

 /* Returns 0, or -errno.  arg is in kp->arg. */

-- 
====================================
Robert P. J. Day
Linux Consulting, Training and Annoying Kernel Pedantry
Waterloo, Ontario, CANADA

http://fsdev.net/wiki/index.php?title=Main_Page
====================================
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.linux-foundation.org
https://lists.linux-foundation.org/mailman/listinfo/kernel-janitors
