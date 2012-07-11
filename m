From: wfg@linux.intel.com
Date: Wed, 11 Jul 2012 00:14:20 +0000
Subject: [slab:for-next 12/13] mm/slab_common.c:101:1: warning: label 'oops' defined but not used
Message-Id: <20120711001420.GA5556@localhost>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hi Christoph,

There are new compile warnings show up in

tree:   git://github.com/penberg/linux.git for-next
head:   737b719ed6569ffcd015fcdf3039dc7af47af877
commit: 20cea9683ecc6dd75a80c0dd02dc69c64e95be75 [12/13] mm, sl[aou]b: Move kmem_cache_create mutex handling to common code

All warnings:

mm/slab_common.c: In function 'kmem_cache_create':
mm/slab_common.c:101:1: warning: label 'oops' defined but not used [-Wunused-label]

The patch removed all references to oops: w/o removing the label
itself.

vim +101 mm/slab_common.c
    98	
    99		s = __kmem_cache_create(name, size, align, flags, ctor);
   100	
 > 101	oops:
   102		mutex_unlock(&slab_mutex);
   103		put_online_cpus();
   104	

---
0-DAY kernel build testing backend         Open Source Technology Centre
Fengguang Wu <wfg@linux.intel.com>                     Intel Corporation
