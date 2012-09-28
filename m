From: Fengguang Wu <fengguang.wu@intel.com>
Date: Fri, 28 Sep 2012 09:55:26 +0000
Subject: [tip:master 30/35] mm/memory.c:72:2: warning: #warning Unfortunate NUMA config, growing page-frame f
Message-Id: <20120928095526.GA28747@localhost>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hi Peter,

FYI, there are new compile warnings show up in

tree:   git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git master
head:   2ef756a2e79149dc84c88f7ccc42ec38cbb7722e
commit: 835e3cf29f4eeba6c5c8bcc188b2138029157938 [30/35] mm: Fold page::nid_last into page::flags when possible
config: i386-allmodconfig

All warnings:

mm/memory.c:72:2: warning: #warning Unfortunate NUMA config, growing page-frame for last_nid. [-Wcpp]

vim +72 mm/memory.c

42b77728 (Jan Beulich     2008-07-23  69) #include "internal.h"
42b77728 (Jan Beulich     2008-07-23  70) 
835e3cf2 (Peter Zijlstra  2012-08-13  71) #ifdef LAST_NID_NOT_IN_PAGE_FLAGS
835e3cf2 (Peter Zijlstra  2012-08-13 @72) #warning Unfortunate NUMA config, growing page-frame for last_nid.
835e3cf2 (Peter Zijlstra  2012-08-13  73) #endif
835e3cf2 (Peter Zijlstra  2012-08-13  74) 
d41dee36 (Andy Whitcroft  2005-06-23  75) #ifndef CONFIG_NEED_MULTIPLE_NODES
^1da177e (Linus Torvalds  2005-04-16  76) /* use the per-pgdat data instead for discontigmem - mbligh */
^1da177e (Linus Torvalds  2005-04-16  77) unsigned long max_mapnr;
^1da177e (Linus Torvalds  2005-04-16  78) struct page *mem_map;
^1da177e (Linus Torvalds  2005-04-16  79) 
^1da177e (Linus Torvalds  2005-04-16  80) EXPORT_SYMBOL(max_mapnr);

---
0-DAY kernel build testing backend         Open Source Technology Centre
Fengguang Wu, Yuanhan Liu                              Intel Corporation
