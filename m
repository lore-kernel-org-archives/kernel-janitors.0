From: Victor Fusco <victor@cetuc.puc-rio.br>
Date: Sun, 10 Jul 2005 23:20:58 +0000
Subject: [KJ] [PATCH 20/20] Fix "nocast type" warnings
Message-Id: <200507102320.58845.victor@cetuc.puc-rio.br>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Description:
    Fix the sparse warning "implicit cast to nocast type"

File/Subsystem:sound/core

Signed-off-by: Victor Fusco <victor@cetuc.puc-rio.br>

--

 include/sound/core.h              |    6 +++---
 include/sound/driver.h            |    2 +-
 sound/core/memalloc.c             |    3 ++-
 sound/core/memory.c               |    8 ++++----
 sound/core/seq/instr/ainstr_gf1.c |    3 ++-
 sound/core/seq/instr/ainstr_iw.c  |    8 +++++---
 sound/core/wrappers.c             |    2 +-
 7 files changed, 18 insertions(+), 14 deletions(-)

Index: linux-git/sound/core/memalloc.c
=================================--- linux-git.orig/sound/core/memalloc.c	2005-07-08 12:06:49.000000000 +0000
+++ linux-git/sound/core/memalloc.c	2005-07-10 22:42:57.000000000 +0000
@@ -105,7 +105,8 @@
  */
 
 static void *snd_dma_hack_alloc_coherent(struct device *dev, size_t size,
-					 dma_addr_t *dma_handle, int flags)
+					 dma_addr_t *dma_handle,
+					 unsigned int __nocast flags)
 {
 	void *ret;
 	u64 dma_mask, coherent_dma_mask;
Index: linux-git/sound/core/wrappers.c
=================================--- linux-git.orig/sound/core/wrappers.c	2005-07-08 12:06:49.000000000 +0000
+++ linux-git/sound/core/wrappers.c	2005-07-10 22:42:57.000000000 +0000
@@ -27,7 +27,7 @@
 #include <linux/fs.h>
 
 #ifdef CONFIG_SND_DEBUG_MEMORY
-void *snd_wrapper_kmalloc(size_t size, int flags)
+void *snd_wrapper_kmalloc(size_t size, unsigned int __nocast flags)
 {
 	return kmalloc(size, flags);
 }
Index: linux-git/include/sound/core.h
=================================--- linux-git.orig/include/sound/core.h	2005-07-08 12:06:49.000000000 +0000
+++ linux-git/include/sound/core.h	2005-07-10 22:42:57.000000000 +0000
@@ -287,12 +287,12 @@
 void snd_memory_done(void);
 int snd_memory_info_init(void);
 int snd_memory_info_done(void);
-void *snd_hidden_kmalloc(size_t size, int flags);
-void *snd_hidden_kcalloc(size_t n, size_t size, int flags);
+void *snd_hidden_kmalloc(size_t size, unsigned int __nocast flags);
+void *snd_hidden_kcalloc(size_t n, size_t size, unsigned int __nocast flags);
 void snd_hidden_kfree(const void *obj);
 void *snd_hidden_vmalloc(unsigned long size);
 void snd_hidden_vfree(void *obj);
-char *snd_hidden_kstrdup(const char *s, int flags);
+char *snd_hidden_kstrdup(const char *s, unsigned int __nocast flags);
 #define kmalloc(size, flags) snd_hidden_kmalloc(size, flags)
 #define kcalloc(n, size, flags) snd_hidden_kcalloc(n, size, flags)
 #define kfree(obj) snd_hidden_kfree(obj)
Index: linux-git/include/sound/driver.h
=================================--- linux-git.orig/include/sound/driver.h	2005-07-08 12:06:49.000000000 +0000
+++ linux-git/include/sound/driver.h	2005-07-10 22:42:57.000000000 +0000
@@ -51,7 +51,7 @@
 #ifdef CONFIG_SND_DEBUG_MEMORY
 #include <linux/slab.h>
 #include <linux/vmalloc.h>
-void *snd_wrapper_kmalloc(size_t, int);
+void *snd_wrapper_kmalloc(size_t, unsigned int __nocast);
 #undef kmalloc
 void snd_wrapper_kfree(const void *);
 #undef kfree
Index: linux-git/sound/core/memory.c
=================================--- linux-git.orig/sound/core/memory.c	2005-07-08 12:06:49.000000000 +0000
+++ linux-git/sound/core/memory.c	2005-07-10 22:42:57.000000000 +0000
@@ -89,7 +89,7 @@
 	}
 }
 
-static void *__snd_kmalloc(size_t size, int flags, void *caller)
+static void *__snd_kmalloc(size_t size, unsigned int __nocast flags, void *caller)
 {
 	unsigned long cpu_flags;
 	struct snd_alloc_track *t;
@@ -111,12 +111,12 @@
 }
 
 #define _snd_kmalloc(size, flags) __snd_kmalloc((size), (flags), __builtin_return_address(0));
-void *snd_hidden_kmalloc(size_t size, int flags)
+void *snd_hidden_kmalloc(size_t size, unsigned int __nocast flags)
 {
 	return _snd_kmalloc(size, flags);
 }
 
-void *snd_hidden_kcalloc(size_t n, size_t size, int flags)
+void *snd_hidden_kcalloc(size_t n, size_t size, unsigned int __nocast flags)
 {
 	void *ret = NULL;
 	if (n != 0 && size > INT_MAX / n)
@@ -184,7 +184,7 @@
 	snd_wrapper_vfree(obj);
 }
 
-char *snd_hidden_kstrdup(const char *s, int flags)
+char *snd_hidden_kstrdup(const char *s, unsigned int __nocast flags)
 {
 	int len;
 	char *buf;
Index: linux-git/sound/core/seq/instr/ainstr_gf1.c
=================================--- linux-git.orig/sound/core/seq/instr/ainstr_gf1.c	2005-07-08 12:06:49.000000000 +0000
+++ linux-git/sound/core/seq/instr/ainstr_gf1.c	2005-07-10 22:42:57.000000000 +0000
@@ -50,7 +50,8 @@
 {
 	gf1_wave_t *wp, *prev;
 	gf1_xwave_t xp;
-	int err, gfp_mask;
+	int err;
+	unsigned int gfp_mask;
 	unsigned int real_size;
 	
 	gfp_mask = atomic ? GFP_ATOMIC : GFP_KERNEL;
Index: linux-git/sound/core/seq/instr/ainstr_iw.c
=================================--- linux-git.orig/sound/core/seq/instr/ainstr_iw.c	2005-07-08 12:06:49.000000000 +0000
+++ linux-git/sound/core/seq/instr/ainstr_iw.c	2005-07-10 22:42:57.000000000 +0000
@@ -58,7 +58,7 @@
 					       iwffff_xenv_t *ex,
 					       char __user **data,
 					       long *len,
-					       int gfp_mask)
+					       unsigned int __nocast gfp_mask)
 {
 	__u32 stype;
 	iwffff_env_record_t *rp, *rp_last;
@@ -128,7 +128,8 @@
 {
 	iwffff_wave_t *wp, *prev;
 	iwffff_xwave_t xp;
-	int err, gfp_mask;
+	int err;
+	unsigned int gfp_mask;
 	unsigned int real_size;
 	
 	gfp_mask = atomic ? GFP_ATOMIC : GFP_KERNEL;
@@ -234,7 +235,8 @@
 	iwffff_xinstrument_t ix;
 	iwffff_layer_t *lp, *prev_lp;
 	iwffff_xlayer_t lx;
-	int err, gfp_mask;
+	int err;
+	unsigned int gfp_mask;
 
 	if (cmd != SNDRV_SEQ_INSTR_PUT_CMD_CREATE)
 		return -EINVAL;

--

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
