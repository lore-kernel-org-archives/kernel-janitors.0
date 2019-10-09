From: Markus Elfring <Markus.Elfring@web.de>
Date: Wed, 09 Oct 2019 12:14:28 +0000
Subject: [PATCH] string.h: Mark 34 functions with __must_check
Message-Id: <75f70e5e-9ece-d6d1-a2c5-2f3ad79b9ccb@web.de>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: kernel-janitors@vger.kernel.org, Alexander Shishkin <alexander.shishkin@linux.intel.com>, Andrew Morton <akpm@linux-foundation.org>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Joe Perches <joe@perches.com>, Kees Cook <keescook@chromium.org>, Nick Desaulniers <ndesaulniers@google.com>, Steven Rostedt <rostedt@goodmis.org>
Cc: LKML <linux-kernel@vger.kernel.org>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Wed, 9 Oct 2019 13:53:59 +0200

Several functions return values with which useful data processing
should be performed. These values must not be ignored then.
Thus use the annotation “__must_check” in the shown function declarations.

Add also corresponding parameter names for adjusted functions.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 include/linux/string.h | 75 ++++++++++++++++++++++--------------------
 1 file changed, 40 insertions(+), 35 deletions(-)

diff --git a/include/linux/string.h b/include/linux/string.h
index 3cf684db4bc6..5cece3a91434 100644
--- a/include/linux/string.h
+++ b/include/linux/string.h
@@ -9,10 +9,10 @@
 #include <stdarg.h>
 #include <uapi/linux/string.h>

-extern char *strndup_user(const char __user *, long);
-extern void *memdup_user(const void __user *, size_t);
-extern void *vmemdup_user(const void __user *, size_t);
-extern void *memdup_user_nul(const void __user *, size_t);
+extern char * __must_check strndup_user(const char __user *src, long n);
+extern void * __must_check memdup_user(const void __user *src, size_t len);
+extern void * __must_check vmemdup_user(const void __user *src, size_t len);
+extern void * __must_check memdup_user_nul(const void __user *src, size_t len);

 /*
  * Include machine specific inline routines
@@ -90,28 +90,29 @@ extern char * strncat(char *, const char *, __kernel_size_t);
 extern size_t strlcat(char *, const char *, __kernel_size_t);
 #endif
 #ifndef __HAVE_ARCH_STRCMP
-extern int strcmp(const char *,const char *);
+extern int __must_check strcmp(const char *s1, const char *s2);
 #endif
 #ifndef __HAVE_ARCH_STRNCMP
-extern int strncmp(const char *,const char *,__kernel_size_t);
+extern int __must_check strncmp(const char *s1, const char *s2,
+				__kernel_size_t n);
 #endif
 #ifndef __HAVE_ARCH_STRCASECMP
-extern int strcasecmp(const char *s1, const char *s2);
+extern int __must_check strcasecmp(const char *s1, const char *s2);
 #endif
 #ifndef __HAVE_ARCH_STRNCASECMP
-extern int strncasecmp(const char *s1, const char *s2, size_t n);
+extern int __must_check strncasecmp(const char *s1, const char *s2, size_t n);
 #endif
 #ifndef __HAVE_ARCH_STRCHR
-extern char * strchr(const char *,int);
+extern char * __must_check strchr(const char *s, int c);
 #endif
 #ifndef __HAVE_ARCH_STRCHRNUL
-extern char * strchrnul(const char *,int);
+extern char * __must_check strchrnul(const char *s, int c);
 #endif
 #ifndef __HAVE_ARCH_STRNCHR
-extern char * strnchr(const char *, size_t, int);
+extern char * __must_check strnchr(const char *s, size_t n, int c);
 #endif
 #ifndef __HAVE_ARCH_STRRCHR
-extern char * strrchr(const char *,int);
+extern char * __must_check strrchr(const char *s, int c);
 #endif
 extern char * __must_check skip_spaces(const char *);

@@ -123,10 +124,10 @@ static inline __must_check char *strstrip(char *str)
 }

 #ifndef __HAVE_ARCH_STRSTR
-extern char * strstr(const char *, const char *);
+extern char * __must_check strstr(const char *s1, const char *s2);
 #endif
 #ifndef __HAVE_ARCH_STRNSTR
-extern char * strnstr(const char *, const char *, size_t);
+extern char * __must_check strnstr(const char *s1, const char *s2, size_t n);
 #endif
 #ifndef __HAVE_ARCH_STRLEN
 extern __kernel_size_t strlen(const char *);
@@ -135,16 +136,16 @@ extern __kernel_size_t strlen(const char *);
 extern __kernel_size_t strnlen(const char *,__kernel_size_t);
 #endif
 #ifndef __HAVE_ARCH_STRPBRK
-extern char * strpbrk(const char *,const char *);
+extern char * __must_check strpbrk(const char *s, const char *c);
 #endif
 #ifndef __HAVE_ARCH_STRSEP
 extern char * strsep(char **,const char *);
 #endif
 #ifndef __HAVE_ARCH_STRSPN
-extern __kernel_size_t strspn(const char *,const char *);
+extern __kernel_size_t __must_check strspn(const char *s, const char *a);
 #endif
 #ifndef __HAVE_ARCH_STRCSPN
-extern __kernel_size_t strcspn(const char *,const char *);
+extern __kernel_size_t __must_check strcspn(const char *s, const char *r);
 #endif

 #ifndef __HAVE_ARCH_MEMSET
@@ -197,13 +198,13 @@ extern void * memmove(void *,const void *,__kernel_size_t);
 extern void * memscan(void *,int,__kernel_size_t);
 #endif
 #ifndef __HAVE_ARCH_MEMCMP
-extern int memcmp(const void *,const void *,__kernel_size_t);
+extern int __must_check memcmp(const void *a, const void *b, __kernel_size_t n);
 #endif
 #ifndef __HAVE_ARCH_BCMP
-extern int bcmp(const void *,const void *,__kernel_size_t);
+extern int __must_check bcmp(const void *a, const void *b, __kernel_size_t n);
 #endif
 #ifndef __HAVE_ARCH_MEMCHR
-extern void * memchr(const void *,int,__kernel_size_t);
+extern void * __must_check memchr(const void *s, int c, __kernel_size_t n);
 #endif
 #ifndef __HAVE_ARCH_MEMCPY_MCSAFE
 static inline __must_check unsigned long memcpy_mcsafe(void *dst,
@@ -219,29 +220,31 @@ static inline void memcpy_flushcache(void *dst, const void *src, size_t cnt)
 	memcpy(dst, src, cnt);
 }
 #endif
-void *memchr_inv(const void *s, int c, size_t n);
+void * __must_check memchr_inv(const void *s, int c, size_t n);
 char *strreplace(char *s, char old, char new);

 extern void kfree_const(const void *x);

-extern char *kstrdup(const char *s, gfp_t gfp) __malloc;
-extern const char *kstrdup_const(const char *s, gfp_t gfp);
-extern char *kstrndup(const char *s, size_t len, gfp_t gfp);
-extern void *kmemdup(const void *src, size_t len, gfp_t gfp);
-extern char *kmemdup_nul(const char *s, size_t len, gfp_t gfp);
+extern char * __must_check kstrdup(const char *s, gfp_t gfp) __malloc;
+extern const char * __must_check kstrdup_const(const char *s, gfp_t gfp);
+extern char * __must_check kstrndup(const char *s, size_t len, gfp_t gfp);
+extern void * __must_check kmemdup(const void *src, size_t len, gfp_t gfp);
+extern char * __must_check kmemdup_nul(const char *s, size_t len, gfp_t gfp);

-extern char **argv_split(gfp_t gfp, const char *str, int *argcp);
+extern char ** __must_check argv_split(gfp_t gfp, const char *str, int *argcp);
 extern void argv_free(char **argv);

-extern bool sysfs_streq(const char *s1, const char *s2);
-extern int kstrtobool(const char *s, bool *res);
-static inline int strtobool(const char *s, bool *res)
+extern bool __must_check sysfs_streq(const char *s1, const char *s2);
+extern int __must_check kstrtobool(const char *s, bool *res);
+static inline int __must_check strtobool(const char *s, bool *res)
 {
 	return kstrtobool(s, res);
 }

-int match_string(const char * const *array, size_t n, const char *string);
-int __sysfs_match_string(const char * const *array, size_t n, const char *s);
+int __must_check match_string(const char * const *array,
+			      size_t n, const char *string);
+int __must_check __sysfs_match_string(const char * const *array,
+				      size_t n, const char *s);

 /**
  * sysfs_match_string - matches given string in an array
@@ -258,8 +261,10 @@ int bstr_printf(char *buf, size_t size, const char *fmt, const u32 *bin_buf);
 int bprintf(u32 *bin_buf, size_t size, const char *fmt, ...) __printf(3, 4);
 #endif

-extern ssize_t memory_read_from_buffer(void *to, size_t count, loff_t *ppos,
-				       const void *from, size_t available);
+extern ssize_t __must_check memory_read_from_buffer(void *to, size_t count,
+						    loff_t *ppos,
+						    const void *from,
+						    size_t available);

 /**
  * strstarts - does @str start with @prefix?
@@ -271,7 +276,7 @@ static inline bool strstarts(const char *str, const char *prefix)
 	return strncmp(str, prefix, strlen(prefix)) == 0;
 }

-size_t memweight(const void *ptr, size_t bytes);
+size_t __must_check memweight(const void *ptr, size_t bytes);
 void memzero_explicit(void *s, size_t count);

 /**
--
2.23.0
