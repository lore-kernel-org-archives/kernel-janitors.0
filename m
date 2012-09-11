From: Fengguang Wu <fengguang.wu@intel.com>
Date: Tue, 11 Sep 2012 09:16:37 +0000
Subject: [glommer-memcg:kmemcg-slab 51/62] slab_common.c:(.init.text+0x12b8): undefined reference to `__kmem_
Message-Id: <20120911091637.GB29599@localhost>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

tree:   git://git.kernel.org/pub/scm/linux/kernel/git/glommer/memcg.git kmemcg-slab
head:   b20a4abf14992a969b761691f8978a28cacdecb4
commit: dd5f38a8831cf1b4d73a2069ab000f847bd617a3 [51/62] provide a common place for initcall processing in kmem_cache
config: sh-allnoconfig

All related error/warning messages:

mm/built-in.o: In function `kmem_cache_initcall':
slab_common.c:(.init.text+0x12b8): undefined reference to `__kmem_cache_initcall'

---
0-DAY kernel build testing backend         Open Source Technology Centre
Fengguang Wu <wfg@linux.intel.com>                     Intel Corporation
