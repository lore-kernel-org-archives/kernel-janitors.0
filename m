From: Fengguang Wu <fengguang.wu@intel.com>
Date: Tue, 25 Sep 2012 08:27:16 +0000
Subject: mm/slab.c:3865:7: error: conflicting types for 'kmem_cache_alloc_node_trace'
Message-Id: <20120925082716.GA26111@localhost>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hi Ezequiel,

FYI, kernel build failed on

4052147c0afa1cf05780ed846f37e87cdde9f628 mm, slab: Match SLAB and SLUB kmem_cache_alloc_xxx_trace() prototype
x86_64-allyesdebian

All error/warnings:

mm/slab.c:3865:7: error: conflicting types for 'kmem_cache_alloc_node_trace'
In file included from include/linux/slab.h:213:0,
                 from mm/slab.c:89:
include/linux/slab_def.h:162:14: note: previous declaration of 'kmem_cache_alloc_node_trace' was here
mm/slab.c: In function 'kmem_cache_alloc_node_trace':
mm/slab.c:3872:50: error: '_RET_IP' undeclared (first use in this function)
mm/slab.c:3872:50: note: each undeclared identifier is reported only once for each function it appears in
mm/slab.c: At top level:
mm/slab.c:3879:44: error: conflicting types for 'kmem_cache_alloc_node_trace'
In file included from include/linux/slab.h:213:0,
                 from mm/slab.c:89:
include/linux/slab_def.h:162:14: note: previous declaration of 'kmem_cache_alloc_node_trace' was here

vim +3865 mm/slab.c
  3859	
  3860		return ret;
  3861	}
  3862	EXPORT_SYMBOL(kmem_cache_alloc_node);
  3863	
  3864	#ifdef CONFIG_TRACING
> 3865	void *kmem_cache_alloc_node_trace(struct kmem_cache *cachep,
  3866					  gfp_t flags,
  3867					  int nodeid,
  3868					  size_t size)

---
0-DAY kernel build testing backend         Open Source Technology Centre
Fengguang Wu, Yuanhan Liu                              Intel Corporation
