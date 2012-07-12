From: Fengguang Wu <fengguang.wu@intel.com>
Date: Thu, 12 Jul 2012 23:42:42 +0000
Subject: [ceph:wip-tunables 10/10] net/ceph/crush/mapper.c:309:21: warning: unused variable 'orig_tries'
Message-Id: <20120712234242.GA5608@localhost>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hi caleb,

There are new compile warnings show up in

tree:   git://github.com/ceph/ceph-client.git wip-tunables
head:   891d71b246d89f03fce85c6503d2429fbe628114
commit: 891d71b246d89f03fce85c6503d2429fbe628114 [10/10] CRUSH: allow OSD's to decode crush tunables

All warnings:

net/ceph/crush/mapper.c: In function 'crush_choose':
net/ceph/crush/mapper.c:309:21: warning: unused variable 'orig_tries' [-Wunused-variable]
net/ceph/osdmap.c: In function 'crush_decode':
net/ceph/osdmap.c:302:2: warning: ISO C90 forbids mixed declarations and code [-Wdeclaration-after-statement]

vim +309 net/ceph/crush/mapper.c
   306		int item = 0;
   307		int itemtype;
   308		int collide, reject;
 > 309		const unsigned int orig_tries = 5; /* attempts before we fall back to search */
   310	
   311		dprintk("CHOOSE%s bucket %d x %d outpos %d numrep %d\n", recurse_to_leaf ? "_LEAF" : "",
   312			bucket->id, x, outpos, numrep);

---
0-DAY kernel build testing backend         Open Source Technology Centre
Fengguang Wu <wfg@linux.intel.com>                     Intel Corporation
