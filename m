From: Fengguang Wu <fengguang.wu@intel.com>
Date: Sat, 28 Jul 2012 01:52:51 +0000
Subject: [next:akpm 233/308] lib/rbtree_test.c:91:30: sparse: constant 3141592653589793238 is so big it is lo
Message-Id: <20120728015251.GA7527@localhost>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hi Michel,

There are new sparse warnings show up in

tree:   git://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git akpm
head:   247109fa112ac912f31efc28e130ed2a0cc1764c
commit: eef00dbbae467827e34273cf4e07a5bebb660108 [233/308] rbtree: performance and correctness test

All sparse warnings:

+ lib/rbtree_test.c:91:30: sparse: constant 3141592653589793238 is so big it is long long
  include/linux/random.h:87:45: sparse: cast truncates bits from constant value (4f2e5357408c3c09 becomes 408c3c09)
  lib/rbtree_test.c: In function 'check':
  lib/rbtree_test.c:76:4: warning: 'blacks' may be used uninitialized in this function [-Wmaybe-uninitialized]

Could be fixed by appending 'ULL' to the number.

---
0-DAY kernel build testing backend         Open Source Technology Centre
Fengguang Wu <wfg@linux.intel.com>                     Intel Corporation
