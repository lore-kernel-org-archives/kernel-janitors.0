From: "Randy.Dunlap" <rdunlap@xenotime.net>
Date: Wed, 05 Oct 2005 03:13:55 +0000
Subject: [KJ] [PATCH] slab: fix gfp flags type
Message-Id: <20051004201355.65fca77a.rdunlap@xenotime.net>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============0806970526397639=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============0806970526397639==
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

From: Randy Dunlap <rdunlap@xenotime.net>

Fix nocast sparse warnings in slab.h:
include/linux/slab.h:127:34: warning: implicit cast to nocast type

Signed-off-by: Randy Dunlap <rdunlap@xenotime.net>
---

 include/linux/slab.h |    6 ++++--
 1 files changed, 4 insertions(+), 2 deletions(-)

diff -Naurp linux-2614-rc2-git6/include/linux/slab.h~slab_gfpmask linux-2614-rc2-git6/include/linux/slab.h
--- linux-2614-rc2-git6/include/linux/slab.h~slab_gfpmask	2005-09-27 21:36:13.000000000 -0700
+++ linux-2614-rc2-git6/include/linux/slab.h	2005-10-03 22:01:50.000000000 -0700
@@ -122,11 +122,13 @@ extern void *kmem_cache_alloc_node(kmem_
 			unsigned int __nocast flags, int node);
 extern void *kmalloc_node(size_t size, unsigned int __nocast flags, int node);
 #else
-static inline void *kmem_cache_alloc_node(kmem_cache_t *cachep, int flags, int node)
+static inline void *kmem_cache_alloc_node(kmem_cache_t *cachep,
+					unsigned int __nocast flags, int node)
 {
 	return kmem_cache_alloc(cachep, flags);
 }
-static inline void *kmalloc_node(size_t size, unsigned int __nocast flags, int node)
+static inline void *kmalloc_node(size_t size,
+				unsigned int __nocast flags, int node)
 {
 	return kmalloc(size, flags);
 }


---

--===============0806970526397639==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============0806970526397639==--
