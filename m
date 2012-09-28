From: Fengguang Wu <fengguang.wu@intel.com>
Date: Fri, 28 Sep 2012 10:20:32 +0000
Subject: [glommer-memcg:slab-common/kmalloc 28/30] include/linux/slab_def.h:135:27: warning: array subscript
Message-Id: <20120928102032.GA29995@localhost>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hi Christoph,

FYI, there are new compile warnings show up in

tree:   git://git.kernel.org/pub/scm/linux/kernel/git/glommer/memcg.git slab-common/kmalloc
head:   f957c1ead131972db578b945e25982f4607da6ba
commit: 55a6b9f968a877c728ed6e438fa68741a7711d89 [28/30] CK1 [12/13] Common names for the array of kmalloc caches
config: blackfin-BF533-EZKIT_defconfig

All warnings:

In file included from include/linux/slab.h:314:0,
                 from include/linux/proc_fs.h:4,
                 from fs/proc/stat.c:6:
fs/proc/stat.c: In function 'stat_open':
include/linux/slab_def.h:135:27: warning: array subscript is above array bounds [-Warray-bounds]

vim +135 include/linux/slab_def.h

36555751 (Eduard - Gabriel Munteanu 2008-08-10  119) 	struct kmem_cache *cachep;
36555751 (Eduard - Gabriel Munteanu 2008-08-10  120) 	void *ret;
36555751 (Eduard - Gabriel Munteanu 2008-08-10  121) 
2e892f43 (Christoph Lameter         2006-12-13  122) 	if (__builtin_constant_p(size)) {
9e396407 (Christoph Lameter         2012-09-26  123) 		int i;
6cb8f913 (Christoph Lameter         2007-07-17  124) 
6cb8f913 (Christoph Lameter         2007-07-17  125) 		if (!size)
6cb8f913 (Christoph Lameter         2007-07-17  126) 			return ZERO_SIZE_PTR;
6cb8f913 (Christoph Lameter         2007-07-17  127) 
9e396407 (Christoph Lameter         2012-09-26  128) 		i = kmalloc_index(size);
9e396407 (Christoph Lameter         2012-09-26  129) 
4b51d669 (Christoph Lameter         2007-02-10  130) #ifdef CONFIG_ZONE_DMA
4b51d669 (Christoph Lameter         2007-02-10  131) 		if (flags & GFP_DMA)
24e75516 (Christoph Lameter         2012-09-26  132) 			cachep = kmalloc_dma_caches[i];
36555751 (Eduard - Gabriel Munteanu 2008-08-10  133) 		else
4b51d669 (Christoph Lameter         2007-02-10  134) #endif
24e75516 (Christoph Lameter         2012-09-26 @135) 			cachep = kmalloc_caches[i];
36555751 (Eduard - Gabriel Munteanu 2008-08-10  136) 
85beb586 (Steven Rostedt            2010-11-24  137) 		ret = kmem_cache_alloc_trace(size, cachep, flags);
36555751 (Eduard - Gabriel Munteanu 2008-08-10  138) 
36555751 (Eduard - Gabriel Munteanu 2008-08-10  139) 		return ret;
2e892f43 (Christoph Lameter         2006-12-13  140) 	}
2e892f43 (Christoph Lameter         2006-12-13  141) 	return __kmalloc(size, flags);
2e892f43 (Christoph Lameter         2006-12-13  142) }
2e892f43 (Christoph Lameter         2006-12-13  143) 

---
0-DAY kernel build testing backend         Open Source Technology Centre
Fengguang Wu, Yuanhan Liu                              Intel Corporation
