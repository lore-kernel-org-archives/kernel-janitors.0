From: Fengguang Wu <fengguang.wu@intel.com>
Date: Thu, 13 Sep 2012 17:01:26 +0000
Subject: [memcg:since-3.5 123/137] mm/internal.h:380:3: error: implicit declaration of function 'atomic_dec_i
Message-Id: <20120913170126.GB4127@localhost>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hi Shaohua,

FYI, kernel build failed on

tree:   git://git.kernel.org/pub/scm/linux/kernel/git/mhocko/mm.git since-3.5
head:   d64f22e5761b1e367ba5d1e04d2fe5e0283aecbc
commit: cfb0997213ba955c7239735affdfd20fefc2dbba [123/137] swap: add a simple detector for inappropriate swapin readahead
config: m32r-mappi3.smp_defconfig

All related error/warning messages:

In file included from mm/filemap.c:36:0:
mm/internal.h: In function 'swap_cache_hit':
mm/internal.h:380:3: error: implicit declaration of function 'atomic_dec_if_positive' [-Werror=implicit-function-declaration]
cc1: some warnings being treated as errors
--
In file included from mm/page_alloc.c:64:0:
mm/internal.h: In function 'swap_cache_hit':
mm/internal.h:380:3: error: implicit declaration of function 'atomic_dec_if_positive' [-Werror=implicit-function-declaration]
cc1: some warnings being treated as errors
--
In file included from mm/swap.c:34:0:
mm/internal.h: In function 'swap_cache_hit':
mm/internal.h:380:3: error: implicit declaration of function 'atomic_dec_if_positive' [-Werror=implicit-function-declaration]
cc1: some warnings being treated as errors
--
In file included from mm/truncate.c:23:0:
mm/internal.h: In function 'swap_cache_hit':
mm/internal.h:380:3: error: implicit declaration of function 'atomic_dec_if_positive' [-Werror=implicit-function-declaration]
cc1: some warnings being treated as errors
--
In file included from mm/vmscan.c:51:0:
mm/internal.h: In function 'swap_cache_hit':
mm/internal.h:380:3: error: implicit declaration of function 'atomic_dec_if_positive' [-Werror=implicit-function-declaration]
cc1: some warnings being treated as errors
--
In file included from mm/util.c:10:0:
mm/internal.h: In function 'swap_cache_hit':
mm/internal.h:380:3: error: implicit declaration of function 'atomic_dec_if_positive' [-Werror=implicit-function-declaration]
cc1: some warnings being treated as errors
--
In file included from mm/mm_init.c:12:0:
mm/internal.h: In function 'swap_cache_hit':
mm/internal.h:380:3: error: implicit declaration of function 'atomic_dec_if_positive' [-Werror=implicit-function-declaration]
cc1: some warnings being treated as errors
--
In file included from mm/compaction.c:17:0:
mm/internal.h: In function 'swap_cache_hit':
mm/internal.h:380:3: error: implicit declaration of function 'atomic_dec_if_positive' [-Werror=implicit-function-declaration]
cc1: some warnings being treated as errors
--
In file included from mm/fremap.c:24:0:
mm/internal.h: In function 'swap_cache_hit':
mm/internal.h:380:3: error: implicit declaration of function 'atomic_dec_if_positive' [-Werror=implicit-function-declaration]
cc1: some warnings being treated as errors
--
In file included from mm/memory.c:68:0:
mm/internal.h: In function 'swap_cache_hit':
mm/internal.h:380:3: error: implicit declaration of function 'atomic_dec_if_positive' [-Werror=implicit-function-declaration]
cc1: some warnings being treated as errors
--
In file included from mm/mlock.c:22:0:
mm/internal.h: In function 'swap_cache_hit':
mm/internal.h:380:3: error: implicit declaration of function 'atomic_dec_if_positive' [-Werror=implicit-function-declaration]
cc1: some warnings being treated as errors
..

vim +380 mm/internal.h
   375	#define SWAPRA_MISS_THRESHOLD  (100)
   376	#define SWAPRA_MAX_MISS ((SWAPRA_MISS_THRESHOLD) * 10)
   377	static inline void swap_cache_hit(struct vm_area_struct *vma)
   378	{
   379		if (vma && vma->anon_vma)
 > 380			atomic_dec_if_positive(&vma->anon_vma->swapra_miss);
   381	}
   382	
   383	static inline void swap_cache_miss(struct vm_area_struct *vma)
   384	{
   385		if (!vma || !vma->anon_vma)

---
0-DAY kernel build testing backend         Open Source Technology Centre
Fengguang Wu <wfg@linux.intel.com>                     Intel Corporation
