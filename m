From: "Robert P. J. Day" <rpjday@crashcourse.ca>
Date: Thu, 29 Nov 2007 07:39:25 +0000
Subject: [PATCH][RFC] cleanup of init.h WRT unused parameter definition
Message-Id: <alpine.LFD.0.9999.0711290236010.5566@localhost.localdomain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org


  the following builds on x86 under "make defconfig".  is there
anything else related to this that can be added to a patch to
include/linux/init.h?

diff --git a/include/linux/init.h b/include/linux/init.h
index 5141381..ab6e281 100644
--- a/include/linux/init.h
+++ b/include/linux/init.h
@@ -160,24 +160,21 @@ struct obs_kernel_param {
  * Force the alignment so the compiler doesn't space elements of the
  * obs_kernel_param "array" too far apart in .init.setup.
  */
-#define __setup_param(str, unique_id, fn, early)			\
-	static char __setup_str_##unique_id[] __initdata __aligned(1) = str; \
-	static struct obs_kernel_param __setup_##unique_id	\
+#define __setup_param(str, fn, early)				\
+	static char __setup_str_##fn[] __initdata __aligned(1) = str; \
+	static struct obs_kernel_param __setup_##fn	\
 		__attribute_used__				\
 		__attribute__((__section__(".init.setup")))	\
 		__attribute__((aligned((sizeof(long)))))	\
-		= { __setup_str_##unique_id, fn, early }
-
-#define __setup_null_param(str, unique_id)			\
-	__setup_param(str, unique_id, NULL, 0)
+		= { __setup_str_##fn, fn, early }

 #define __setup(str, fn)					\
-	__setup_param(str, fn, fn, 0)
+	__setup_param(str, fn, 0)

 /* NOTE: fn is as per module_param, not __setup!  Emits warning if fn
  * returns non-zero. */
 #define early_param(str, fn)					\
-	__setup_param(str, fn, fn, 1)
+	__setup_param(str, fn, 1)

 /* Relies on boot_command_line being set */
 void __init parse_early_param(void);
@@ -237,7 +234,6 @@ void __init parse_early_param(void);
 	void cleanup_module(void) __attribute__((alias(#exitfn)));

 #define __setup_param(str, unique_id, fn)	/* nothing */
-#define __setup_null_param(str, unique_id) 	/* nothing */
 #define __setup(str, func) 			/* nothing */
 #endif


====================================
Robert P. J. Day
Linux Consulting, Training and Annoying Kernel Pedantry
Waterloo, Ontario, CANADA

http://crashcourse.ca
====================================
