From: George Spelvin <lkml@sdf.org>
Date: Fri, 29 Mar 2019 04:31:52 +0000
Subject: [PATCH 6/5] lib/list_sort: Fix GCC warning
Message-Id: <201903290431.x2T4Vq5A024120@sdf.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <f63c410e0ff76009c9b58e01027e751ff7fdb749.1552704200.git.lkml@sdf.org>
In-Reply-To: <f63c410e0ff76009c9b58e01027e751ff7fdb749.1552704200.git.lkml@sdf.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Andrew Morton <akpm@linux-foundation.org>, Stephen Rothwell <sfr@canb.auug.org.au>, kbuild test robot <lkp@intel.com>
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, George Spelvin <lkml@sdf.org>, Andrey Abramov <st5pub@yandex.ru>, Geert Uytterhoeven <geert@linux-m68k.org>, Daniel Wagner <daniel.wagner@siemens.com>, Rasmus Villemoes <linux@rasmusvillemoes.dk>, Don Mullis <don.mullis@gmail.com>, Dave Chinner <dchinner@redhat.com>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>

It turns out that GCC 4.9, 7.3, and 8.1 ignore the __pure
attribute on function pointers and (with the standard kernel
compile flags) emit a warning about it.

Even though it accurately describes a comparison function
(the compiler need not reload cached pointers across the call),
it doesn't actually help GCC 8.3's code generation, so just
omit it.

Signed-off-by: George Spelvin <lkml@sdf.org>
Fixes: 820c81be5237 ("lib/list_sort: simplify and remove MAX_LIST_LENGTH_BITS")
Cc: Andrew Morton <akpm@linux-foundation.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>
---
 lib/list_sort.c | 14 +++++++++-----
 1 file changed, 9 insertions(+), 5 deletions(-)

diff --git a/lib/list_sort.c b/lib/list_sort.c
index 623a9158ac8a..b1b492e20f1d 100644
--- a/lib/list_sort.c
+++ b/lib/list_sort.c
@@ -8,12 +8,16 @@
 #include <linux/list.h>
 
 /*
- * By declaring the compare function with the __pure attribute, we give
- * the compiler more opportunity to optimize.  Ideally, we'd use this in
- * the prototype of list_sort(), but that would involve a lot of churn
- * at all call sites, so just cast the function pointer passed in.
+ * A more accurate type for comparison functions.  Ideally, we'd use
+ * this in the prototype of list_sort(), but that would involve a lot of
+ * churn at all call sites, so just cast the function pointer passed in.
+ *
+ * This could also include __pure to give the compiler more opportunity
+ * to optimize, but that elicits an "attribute ignored" warning on
+ * GCC <= 8.1, and doesn't change GCC 8.3's code generation at all,
+ * so it's omitted.
  */
-typedef int __pure __attribute__((nonnull(2,3))) (*cmp_func)(void *,
+typedef int __attribute__((nonnull(2,3))) (*cmp_func)(void *,
 		struct list_head const *, struct list_head const *);
 
 /*
-- 
2.20.1
