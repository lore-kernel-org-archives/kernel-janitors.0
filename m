From: Fengguang Wu <fengguang.wu@intel.com>
Date: Fri, 28 Sep 2012 10:15:01 +0000
Subject: [glommer-memcg:slab-common/kmalloc 19/30] mm/slab_common.c:206:6: warning: format '%ld' expects argu
Message-Id: <20120928101501.GA29691@localhost>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hi Christoph,

FYI, there are new compile warnings show up in

e32adae5 CK1 [02/13] create common functions for boot slab creation

All warnings:

mm/slab_common.c: In function 'create_boot_cache':
mm/slab_common.c:206:6: warning: format '%ld' expects argument of type 'long int', but argument 3 has type 'size_t' [-Wformat]

vim +206 mm/slab_common.c

97d06609 (Christoph Lameter 2012-07-06  190) 	return slab_state >= UP;
97d06609 (Christoph Lameter 2012-07-06  191) }
e32adae5 (Christoph Lameter 2012-09-26  192) 
e32adae5 (Christoph Lameter 2012-09-26  193) /* Create a cache during boot when no slab services are available yet */
e32adae5 (Christoph Lameter 2012-09-26  194) void __init create_boot_cache(struct kmem_cache *s, const char *name, size_t size,
e32adae5 (Christoph Lameter 2012-09-26  195) 		unsigned long flags)
e32adae5 (Christoph Lameter 2012-09-26  196) {
e32adae5 (Christoph Lameter 2012-09-26  197) 	int err;
e32adae5 (Christoph Lameter 2012-09-26  198) 
e32adae5 (Christoph Lameter 2012-09-26  199) 	s->name = name;
e32adae5 (Christoph Lameter 2012-09-26  200) 	s->size = s->object_size = size;
e32adae5 (Christoph Lameter 2012-09-26  201) 	s->align = ARCH_KMALLOC_MINALIGN;
e32adae5 (Christoph Lameter 2012-09-26  202) 	err = __kmem_cache_create(s, flags);
e32adae5 (Christoph Lameter 2012-09-26  203) 
e32adae5 (Christoph Lameter 2012-09-26  204) 	if (err)
e32adae5 (Christoph Lameter 2012-09-26  205) 		panic("Creation of kmalloc slab %s size=%ld failed. Reason %d\n",
e32adae5 (Christoph Lameter 2012-09-26 @206) 					name, size, err);
e32adae5 (Christoph Lameter 2012-09-26  207) 
e32adae5 (Christoph Lameter 2012-09-26  208) 	list_add(&s->list, &slab_caches);
e32adae5 (Christoph Lameter 2012-09-26  209) 	s->refcount = -1;	/* Exempt from merging for now */
e32adae5 (Christoph Lameter 2012-09-26  210) }
e32adae5 (Christoph Lameter 2012-09-26  211) 
e32adae5 (Christoph Lameter 2012-09-26  212) struct kmem_cache *__init create_kmalloc_cache(const char *name, size_t size,
e32adae5 (Christoph Lameter 2012-09-26  213) 				unsigned long flags)
e32adae5 (Christoph Lameter 2012-09-26  214) {

---
0-DAY kernel build testing backend         Open Source Technology Centre
Fengguang Wu, Yuanhan Liu                              Intel Corporation
