From: "Robert P. J. Day" <rpjday@crashcourse.ca>
Date: Fri, 30 Nov 2007 19:24:57 +0000
Subject: [PATCH] Some grammatical and whitespace cleanups in init.h.
Message-Id: <alpine.LFD.0.9999.0711301424120.25301@localhost.localdomain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org


Signed-off-by: Robert P. J. Day <rpjday@crashcourse.ca>

---

diff --git a/include/linux/init.h b/include/linux/init.h
index 5141381..ca59bf8 100644
--- a/include/linux/init.h
+++ b/include/linux/init.h
@@ -3,11 +3,10 @@

 #include <linux/compiler.h>

-/* These macros are used to mark some functions or
- * initialized data (doesn't apply to uninitialized data)
- * as `initialization' functions. The kernel can take this
- * as hint that the function is used only during the initialization
- * phase and free up used memory resources after
+/* These macros are used to mark functions and initialized
+ * data as 'initialization' objects, which tells the kernel that
+ * they are used only during the initialization phase and can be
+ * freed afterwards to recover memory.
  *
  * Usage:
  * For functions:
@@ -20,9 +19,10 @@
  * }
  *
  * If the function has a prototype somewhere, you can also add
- * __init between closing brace of the prototype and semicolon:
+ * __init to the prototype in one of two ways:
  *
  * extern int initialize_foobar_device(int, int, int) __init;
+ * extern int __init initialize_foobar_device(int, int, int);
  *
  * For initialized data:
  * You should insert __initdata between the variable name and equal
@@ -42,7 +42,7 @@
    discard it in modules) */
 #define __init		__attribute__ ((__section__ (".init.text"))) __cold
 #define __initdata	__attribute__ ((__section__ (".init.data")))
-#define __exitdata	__attribute__ ((__section__(".exit.data")))
+#define __exitdata	__attribute__ ((__section__ (".exit.data")))
 #define __exit_call	__attribute_used__ __attribute__ ((__section__ (".exitcall.exit")))

 /* modpost check for section mismatches during the kernel build.
====================================
Robert P. J. Day
Linux Consulting, Training and Annoying Kernel Pedantry
Waterloo, Ontario, CANADA

http://crashcourse.ca
====================================
