From: Christoph Lameter <cl@linux.com>
Date: Fri, 28 Sep 2012 17:21:30 +0000
Subject: Re: [glommer-memcg:slab-common/kmalloc 28/30] mm/slab.c:2409:14: error: 'malloc_sizes' undeclared
Message-Id: <0000013a0de5ba7d-443dca97-0df7-421a-9afe-aa323f84aac3-000000@email.amazonses.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20120928102032.GA29995@localhost>
In-Reply-To: <20120928102032.GA29995@localhost>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Fri, 28 Sep 2012, Fengguang Wu wrote:

> tree:   git://git.kernel.org/pub/scm/linux/kernel/git/glommer/memcg.git slab-common/kmalloc
> head:   f957c1ead131972db578b945e25982f4607da6ba
> commit: 55a6b9f968a877c728ed6e438fa68741a7711d89 [28/30] CK1 [12/13] Common names for the array of kmalloc caches
> config: x86_64-allyesdebian (attached as .config)
>
> All error/warnings:
>
> mm/slab.c: In function '__kmem_cache_create':
> mm/slab.c:2409:14: error: 'malloc_sizes' undeclared (first use in this function)
> mm/slab.c:2409:14: note: each undeclared identifier is reported only once for each function it appears in
> mm/slab.c:2410:102: error: 'align' undeclared (first use in this function)

Fixed by this patch:

Index: linux/mm/slab.c
=================================--- linux.orig/mm/slab.c	2012-09-28 12:20:41.504733528 -0500
+++ linux/mm/slab.c	2012-09-28 12:20:12.732133191 -0500
@@ -2406,7 +2406,7 @@ __kmem_cache_create (struct kmem_cache *
 			size += BYTES_PER_WORD;
 	}
 #if FORCED_DEBUG && defined(CONFIG_DEBUG_PAGEALLOC)
-	if (size >= malloc_sizes[INDEX_L3 + 1].cs_size
+	if (size >= kmalloc_size(INDEX_L3 + 1))
 	    && cachep->object_size > cache_line_size() && ALIGN(size, align) < PAGE_SIZE) {
 		cachep->obj_offset += PAGE_SIZE - ALIGN(size, align);
 		size = PAGE_SIZE;

Will be folded into the patchset for the next release.

