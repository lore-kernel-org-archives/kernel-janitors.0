From: "Robert P. J. Day" <rpjday@mindspring.com>
Date: Fri, 15 Jun 2007 10:52:17 +0000
Subject: [KJ] [PATCH] Centralize checking for adequate version of gcc.
Message-Id: <Pine.LNX.4.64.0706150650010.25667@localhost.localdomain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org


  here's a patch i submitted to andrew to centralize checking for a
proper version of gcc when building the kernel, but andrew claims it
broke the build.  i'm trying to reproduce the problem, and i'd
appreciate it if anyone else wants to apply this patch and try a build
based on "allyesconfig" or "allmodconfig" on x86 to see if they run
into some kind of issue, cuz i'm just not seeing it here.  thanks.

diff --git a/include/linux/compiler.h b/include/linux/compiler.h
index 8287a72..50558f7 100644
--- a/include/linux/compiler.h
+++ b/include/linux/compiler.h
@@ -36,12 +36,20 @@ extern void __chk_io_ptr(const void __iomem *);

 #ifdef __KERNEL__

-#if __GNUC__ >= 4
+/*
+ *  Start with some sanity checking on the version of gcc.
+ */
+
+#if (__GNUC__ < 3) || (__GNUC__ = 3 && __GNUC_MINOR__ < 2)
+# error Sorry, your GCC is too old. It builds incorrect kernels.
+#elif __GNUC__ = 4 && __GNUC_MINOR__ = 1 && __GNUC_PATCHLEVEL__ = 0
+# warning gcc-4.1.0 is known to miscompile the kernel.  A different compiler version is recommended.
+#elif __GNUC__ = 4
 # include <linux/compiler-gcc4.h>
-#elif __GNUC__ = 3 && __GNUC_MINOR__ >= 2
+#elif __GNUC__ = 3
 # include <linux/compiler-gcc3.h>
 #else
-# error Sorry, your compiler is too old/not recognized.
+# error Sorry, your compiler is not recognized.
 #endif

 /* Intel compiler defines __GNUC__. So we will overwrite implementations
diff --git a/init/main.c b/init/main.c
index eb8bdba..db39a80 100644
--- a/init/main.c
+++ b/init/main.c
@@ -5,7 +5,6 @@
  *
  *  GK 2/5/95  -  Changed to support mounting root fs via NFS
  *  Added initrd & change_root: Werner Almesberger & Hans Lermen, Feb '96
- *  Moan early if gcc is old, avoiding bogus kernels - Paul Gortmaker, May '96
  *  Simplified starting of init:  Michael A. Griffith <grif@acm.org>
  */

@@ -66,23 +65,6 @@
 #include <asm/smp.h>
 #endif

-/*
- * This is one of the first .c files built. Error out early if we have compiler
- * trouble.
- *
- * Versions of gcc older than that listed below may actually compile and link
- * okay, but the end product can have subtle run time bugs.  To avoid associated
- * bogus bug reports, we flatly refuse to compile with a gcc that is known to be
- * too old from the very beginning.
- */
-#if (__GNUC__ < 3) || (__GNUC__ = 3 && __GNUC_MINOR__ < 2)
-#error Sorry, your GCC is too old. It builds incorrect kernels.
-#endif
-
-#if __GNUC__ = 4 && __GNUC_MINOR__ = 1 && __GNUC_PATCHLEVEL__ = 0
-#warning gcc-4.1.0 is known to miscompile the kernel.  A different compiler version is recommended.
-#endif
-
 static int kernel_init(void *);

 extern void init_IRQ(void);

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
