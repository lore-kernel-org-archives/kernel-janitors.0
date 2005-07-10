From: Victor Fusco <victor@cetuc.puc-rio.br>
Date: Sun, 10 Jul 2005 23:19:53 +0000
Subject: [KJ] [PATCH 12/20] Fix "nocast type" warnings
Message-Id: <200507102319.54055.victor@cetuc.puc-rio.br>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Description:
    Fix the sparse warning "implicit cast to nocast type"

File/Subsystem:lib/textsearch

Signed-off-by: Victor Fusco <victor@cetuc.puc-rio.br>

--

 include/linux/textsearch.h |    3 ++-
 lib/ts_fsm.c               |    2 +-
 lib/ts_kmp.c               |    2 +-
 3 files changed, 4 insertions(+), 3 deletions(-)

Index: linux-git/include/linux/textsearch.h
=================================--- linux-git.orig/include/linux/textsearch.h	2005-07-08 12:06:49.000000000 +0000
+++ linux-git/include/linux/textsearch.h	2005-07-10 22:42:55.000000000 +0000
@@ -158,7 +158,8 @@
 #define TS_PRIV_ALIGNTO	8
 #define TS_PRIV_ALIGN(len) (((len) + TS_PRIV_ALIGNTO-1) & ~(TS_PRIV_ALIGNTO-1))
 
-static inline struct ts_config *alloc_ts_config(size_t payload, int gfp_mask)
+static inline struct ts_config *alloc_ts_config(size_t payload,
+						unsigned int __nocast gfp_mask)
 {
 	struct ts_config *conf;
 
Index: linux-git/lib/ts_kmp.c
=================================--- linux-git.orig/lib/ts_kmp.c	2005-07-08 12:06:48.000000000 +0000
+++ linux-git/lib/ts_kmp.c	2005-07-10 22:42:55.000000000 +0000
@@ -87,7 +87,7 @@
 }
 
 static struct ts_config *kmp_init(const void *pattern, unsigned int len,
-				  int gfp_mask)
+				  unsigned int __nocast gfp_mask)
 {
 	struct ts_config *conf;
 	struct ts_kmp *kmp;
Index: linux-git/lib/ts_fsm.c
=================================--- linux-git.orig/lib/ts_fsm.c	2005-07-08 12:06:48.000000000 +0000
+++ linux-git/lib/ts_fsm.c	2005-07-10 22:42:55.000000000 +0000
@@ -258,7 +258,7 @@
 }
 
 static struct ts_config *fsm_init(const void *pattern, unsigned int len,
-				     int gfp_mask)
+				  unsigned int __nocast gfp_mask)
 {
 	int i, err = -EINVAL;
 	struct ts_config *conf;

--

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
