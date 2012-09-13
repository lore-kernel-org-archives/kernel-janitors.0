From: Fengguang Wu <fengguang.wu@intel.com>
Date: Thu, 13 Sep 2012 11:02:23 +0000
Subject: [glommer-memcg:kmemcg-slab 63/63] (.init.text+0x2a48): undefined reference to `memcg_init_kmem_cache
Message-Id: <20120913110223.GA31687@localhost>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hi Glauber,

FYI, kernel build failed on

tree:   git://git.kernel.org/pub/scm/linux/kernel/git/glommer/memcg.git kmemcg-slab
head:   a1fe65d2214cd61722cf29f35822c94b1d2d7c09
commit: a1fe65d2214cd61722cf29f35822c94b1d2d7c09 [63/63] temporary fix to get the benchmark in place.
config: m32r-m32104ut_defconfig

All related error/warning messages:

mm/built-in.o: In function `kmem_cache_init_late':
(.init.text+0x2a48): undefined reference to `memcg_init_kmem_cache'
--
mm/slab.c:815:13: warning: '__slab_error' defined but not used [-Wunused-function]

---
0-DAY kernel build testing backend         Open Source Technology Centre
Fengguang Wu <wfg@linux.intel.com>                     Intel Corporation
