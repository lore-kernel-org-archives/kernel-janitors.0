From: Namhyung Kim <namhyung@gmail.com>
Date: Fri, 06 Aug 2010 12:46:08 +0000
Subject: [PATCH] percpu: remove address_space attribute if !SMP
Message-Id: <1281098768-5724-1-git-send-email-namhyung@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: tj@kernel.org
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

percpu data has no special meaning in case of !CONFIG_SMP.
This removes lots of sparse warnings.

Signed-off-by: Namhyung Kim <namhyung@gmail.com>

diff --git a/include/linux/compiler.h b/include/linux/compiler.h
index a5a472b..8dfd41d 100644
--- a/include/linux/compiler.h
+++ b/include/linux/compiler.h
@@ -15,7 +15,11 @@
 # define __acquire(x)	__context__(x,1)
 # define __release(x)	__context__(x,-1)
 # define __cond_lock(x,c)	((c) ? ({ __acquire(x); 1; }) : 0)
-# define __percpu	__attribute__((noderef, address_space(3)))
+# ifdef CONFIG_SMP
+#  define __percpu	__attribute__((noderef, address_space(3)))
+# else
+#  define __percpu
+# endif
 extern void __chk_user_ptr(const volatile void __user *);
 extern void __chk_io_ptr(const volatile void __iomem *);
 #else
-- 
1.7.0.4

