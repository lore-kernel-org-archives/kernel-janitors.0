From: Matthew Dobson <colpatch@us.ibm.com>
Date: Tue, 08 Nov 2005 01:00:04 +0000
Subject: [KJ] [PATCH 8/8] Inline 3 functions
Message-Id: <436FF894.8090204@us.ibm.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="------------070103010906070506080000"
List-Id: <kernel-janitors.vger.kernel.org>
References: <436FF51D.8080509@us.ibm.com>
In-Reply-To: <436FF51D.8080509@us.ibm.com>
To: kernel-janitors@lists.osdl.org
Cc: Pekka J Enberg <penberg@cs.Helsinki.FI>, linux-kernel@vger.kernel.org

This is a multi-part message in MIME format.
--------------070103010906070506080000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

I found three functions in slab.c that have only 1 caller (kmem_getpages,
alloc_slabmgmt, and set_slab_attr), so let's inline them.

mcd@arrakis:~/linux/source/linux-2.6.14+slab_cleanup/patches $ diffstat
inline_functions.patch
 slab.c |    9 +++++----
 1 files changed, 5 insertions(+), 4 deletions(-)

-Matt

--------------070103010906070506080000
Content-Type: text/x-patch;
 name="inline_functions.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="inline_functions.patch"

Inline 3 functions that have only one caller.

Index: linux-2.6.14+slab_cleanup/mm/slab.c
===================================================================
--- linux-2.6.14+slab_cleanup.orig/mm/slab.c	2005-11-07 16:07:59.169063888 -0800
+++ linux-2.6.14+slab_cleanup/mm/slab.c	2005-11-07 16:10:24.981896968 -0800
@@ -1183,7 +1183,7 @@ __initcall(cpucache_init);
  * did not request dmaable memory, we might get it, but that
  * would be relatively rare and ignorable.
  */
-static void *kmem_getpages(kmem_cache_t *cachep, gfp_t flags, int nid)
+static inline void *kmem_getpages(kmem_cache_t *cachep, gfp_t flags, int nid)
 {
 	struct page *page;
 	void *addr;
@@ -2048,8 +2048,8 @@ int kmem_cache_destroy(kmem_cache_t *cac
 EXPORT_SYMBOL(kmem_cache_destroy);
 
 /* Get the memory for a slab management obj. */
-static struct slab *alloc_slabmgmt(kmem_cache_t *cachep, void *objp,
-				   int colour_off, gfp_t local_flags)
+static inline struct slab *alloc_slabmgmt(kmem_cache_t *cachep, void *objp,
+					  int colour_off, gfp_t local_flags)
 {
 	struct slab *slabp;
 	
@@ -2134,7 +2134,8 @@ static void kmem_flagcheck(kmem_cache_t 
 	}
 }
 
-static void set_slab_attr(kmem_cache_t *cachep, struct slab *slabp, void *objp)
+static inline void set_slab_attr(kmem_cache_t *cachep, struct slab *slabp,
+				 void *objp)
 {
 	int i;
 	struct page *page;

--------------070103010906070506080000
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--------------070103010906070506080000--
