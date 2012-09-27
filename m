From: Fengguang Wu <fengguang.wu@intel.com>
Date: Thu, 27 Sep 2012 17:48:47 +0000
Subject: [glommer-memcg:slab-common/slabinfo 20/21] mm/slab.c:4352:6: error: conflicting types for 'slabinfo_
Message-Id: <20120927174847.GB5517@localhost>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hi Glauber,

FYI, kernel build failed on

tree:   git://git.kernel.org/pub/scm/linux/kernel/git/glommer/memcg.git slab-common/slabinfo
head:   0521160acc51bc8385807752e69dd38d976aef22
commit: 0521160acc51bc8385807752e69dd38d976aef22 [20/21] sl[au]b: process slabinfo_show in common code
config: blackfin-BF533-EZKIT_defconfig

All error/warnings:

In file included from mm/slab.c:90:0:
mm/slab.h:63:53: warning: 'struct seq_file' declared inside parameter list [enabled by default]
mm/slab.h:63:53: warning: its scope is only this definition or declaration, which is probably not what you want [enabled by default]
mm/slab.h:65:10: warning: 'struct file' declared inside parameter list [enabled by default]
mm/slab.c:4352:6: error: conflicting types for 'slabinfo_show_stats'
In file included from mm/slab.c:90:0:
mm/slab.h:63:6: note: previous declaration of 'slabinfo_show_stats' was here
mm/slab.c:4393:9: error: conflicting types for 'slabinfo_write'
In file included from mm/slab.c:90:0:
mm/slab.h:64:9: note: previous declaration of 'slabinfo_write' was here

vim +4352 mm/slab.c

0521160a (Glauber Costa  2012-09-26  4346) 	sinfo->shared_avail = shared_avail;
0521160a (Glauber Costa  2012-09-26  4347) 	sinfo->limit = cachep->limit;
0521160a (Glauber Costa  2012-09-26  4348) 	sinfo->batchcount = cachep->batchcount;
0521160a (Glauber Costa  2012-09-26  4349) 	sinfo->shared = cachep->shared;
0521160a (Glauber Costa  2012-09-26  4350) }
0521160a (Glauber Costa  2012-09-26  4351) 
0521160a (Glauber Costa  2012-09-26 @4352) void slabinfo_show_stats(struct seq_file *m, struct kmem_cache *cachep)
0521160a (Glauber Costa  2012-09-26  4353) {
^1da177e (Linus Torvalds 2005-04-16  4354) #if STATS
b28a02de (Pekka Enberg   2006-01-08  4355) 	{			/* list3 stats */

---
0-DAY kernel build testing backend         Open Source Technology Centre
Fengguang Wu, Yuanhan Liu                              Intel Corporation
