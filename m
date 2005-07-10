From: Victor Fusco <victor@cetuc.puc-rio.br>
Date: Sun, 10 Jul 2005 23:18:00 +0000
Subject: [KJ] [PATCH 01/20] Fix "nocast type" warnings
Message-Id: <200507102318.00992.victor@cetuc.puc-rio.br>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Description:
    Fix the sparse warning "implicit cast to nocast type"

File/Subsystem:fs/xfs

Signed-off-by: Victor Fusco <victor@cetuc.puc-rio.br>

--

 fs/xfs/linux-2.6/kmem.c  |   23 ++++++++++++-----------
 fs/xfs/linux-2.6/kmem.h  |   23 ++++++++++++-----------
 fs/xfs/xfs_log_recover.c |    2 +-
 3 files changed, 25 insertions(+), 23 deletions(-)

Index: linux-git/fs/xfs/linux-2.6/kmem.c
=================================--- linux-git.orig/fs/xfs/linux-2.6/kmem.c	2005-07-08 12:06:49.000000000 +0000
+++ linux-git/fs/xfs/linux-2.6/kmem.c	2005-07-10 22:43:16.000000000 +0000
@@ -45,11 +45,11 @@
 
 
 void *
-kmem_alloc(size_t size, int flags)
+kmem_alloc(size_t size, unsigned int __nocast flags)
 {
-	int	retries = 0;
-	int	lflags = kmem_flags_convert(flags);
-	void	*ptr;
+	int		retries = 0;
+	unsigned int	lflags = kmem_flags_convert(flags);
+	void		*ptr;
 
 	do {
 		if (size < MAX_SLAB_SIZE || retries > MAX_VMALLOCS)
@@ -67,7 +67,7 @@
 }
 
 void *
-kmem_zalloc(size_t size, int flags)
+kmem_zalloc(size_t size, unsigned int __nocast flags)
 {
 	void	*ptr;
 
@@ -89,7 +89,8 @@
 }
 
 void *
-kmem_realloc(void *ptr, size_t newsize, size_t oldsize, int flags)
+kmem_realloc(void *ptr, size_t newsize, size_t oldsize,
+	     unsigned int __nocast flags)
 {
 	void	*new;
 
@@ -104,11 +105,11 @@
 }
 
 void *
-kmem_zone_alloc(kmem_zone_t *zone, int flags)
+kmem_zone_alloc(kmem_zone_t *zone, unsigned int __nocast flags)
 {
-	int	retries = 0;
-	int	lflags = kmem_flags_convert(flags);
-	void	*ptr;
+	int		retries = 0;
+	unsigned int	lflags = kmem_flags_convert(flags);
+	void		*ptr;
 
 	do {
 		ptr = kmem_cache_alloc(zone, lflags);
@@ -123,7 +124,7 @@
 }
 
 void *
-kmem_zone_zalloc(kmem_zone_t *zone, int flags)
+kmem_zone_zalloc(kmem_zone_t *zone, unsigned int __nocast flags)
 {
 	void	*ptr;
 
Index: linux-git/fs/xfs/linux-2.6/kmem.h
=================================--- linux-git.orig/fs/xfs/linux-2.6/kmem.h	2005-07-08 12:06:49.000000000 +0000
+++ linux-git/fs/xfs/linux-2.6/kmem.h	2005-07-10 22:43:16.000000000 +0000
@@ -39,10 +39,10 @@
 /*
  * memory management routines
  */
-#define KM_SLEEP	0x0001
-#define KM_NOSLEEP	0x0002
-#define KM_NOFS		0x0004
-#define KM_MAYFAIL	0x0008
+#define KM_SLEEP	0x0001u
+#define KM_NOSLEEP	0x0002u
+#define KM_NOFS		0x0004u
+#define KM_MAYFAIL	0x0008u
 
 #define	kmem_zone	kmem_cache_s
 #define kmem_zone_t	kmem_cache_t
@@ -81,9 +81,9 @@
 	*(NSTATEP) = *(OSTATEP);	\
 } while (0)
 
-static __inline unsigned int kmem_flags_convert(int flags)
+static __inline unsigned int kmem_flags_convert(unsigned int __nocast flags)
 {
-	int	lflags = __GFP_NOWARN;	/* we'll report problems, if need be */
+	unsigned int	lflags = __GFP_NOWARN;	/* we'll report problems, if need be */
 
 #ifdef DEBUG
 	if (unlikely(flags & ~(KM_SLEEP|KM_NOSLEEP|KM_NOFS|KM_MAYFAIL))) {
@@ -125,12 +125,13 @@
 		BUG();
 }
 
-extern void	    *kmem_zone_zalloc(kmem_zone_t *, int);
-extern void	    *kmem_zone_alloc(kmem_zone_t *, int);
+extern void	    *kmem_zone_zalloc(kmem_zone_t *, unsigned int __nocast);
+extern void	    *kmem_zone_alloc(kmem_zone_t *, unsigned int __nocast);
 
-extern void	    *kmem_alloc(size_t, int);
-extern void	    *kmem_realloc(void *, size_t, size_t, int);
-extern void	    *kmem_zalloc(size_t, int);
+extern void	    *kmem_alloc(size_t, unsigned int __nocast);
+extern void	    *kmem_realloc(void *, size_t, size_t,
+				  unsigned int __nocast);
+extern void	    *kmem_zalloc(size_t, unsigned int __nocast);
 extern void         kmem_free(void *, size_t);
 
 typedef struct shrinker *kmem_shaker_t;
Index: linux-git/fs/xfs/xfs_log_recover.c
=================================--- linux-git.orig/fs/xfs/xfs_log_recover.c	2005-07-08 12:06:49.000000000 +0000
+++ linux-git/fs/xfs/xfs_log_recover.c	2005-07-10 22:43:16.000000000 +0000
@@ -1387,7 +1387,7 @@
 	old_ptr = item->ri_buf[item->ri_cnt-1].i_addr;
 	old_len = item->ri_buf[item->ri_cnt-1].i_len;
 
-	ptr = kmem_realloc(old_ptr, len+old_len, old_len, 0);
+	ptr = kmem_realloc(old_ptr, len+old_len, old_len, 0u);
 	memcpy(&ptr[old_len], dp, len); /* d, s, l */
 	item->ri_buf[item->ri_cnt-1].i_len += len;
 	item->ri_buf[item->ri_cnt-1].i_addr = ptr;

--

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
