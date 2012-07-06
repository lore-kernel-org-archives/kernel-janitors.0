From: wfg@linux.intel.com
Date: Fri, 06 Jul 2012 17:31:17 +0000
Subject: [random:dev 2/9] drivers/char/random.c:682:62: sparse: Using plain integer as NULL pointer
Message-Id: <20120706173117.GA21914@localhost>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hi Theodore,

Some trivial sparse warnings :)

tree:   git://git.kernel.org/pub/scm/linux/kernel/git/tytso/random.git dev
head:   0ca6c546645d39d68e67b70e5c8f00ad9a955fcb
commit: 4d5ecd27a003dbdecfbaca413803c7d6723cc1d4 [2/9] random: use lockless techniques in the interrupt path

All sparse warnings:

  drivers/char/random.c:287:8: sparse: symbol 'trickle_count' was not declared. Should it be static?
+ drivers/char/random.c:682:62: sparse: Using plain integer as NULL pointer
  drivers/char/random.c:739:8: sparse: symbol 'irq_randomness' was not declared. Should it be static?
  drivers/char/random.c:766:72: sparse: Using plain integer as NULL pointer
  drivers/char/random.c:818:47: sparse: Using plain integer as NULL pointer
  drivers/char/random.c:1027:46: sparse: Using plain integer as NULL pointer
  drivers/char/random.c:1031:52: sparse: Using plain integer as NULL pointer
  drivers/char/random.c:1033:60: sparse: Using plain integer as NULL pointer
  drivers/char/random.c:1170:47: sparse: Using plain integer as NULL pointer
  drivers/char/random.c:1332:11: sparse: symbol 'random_table' was not declared. Should it be static?
  drivers/char/random.c:1397:1: sparse: symbol '__pcpu_scope_get_random_int_hash' was not declared. Should it be static?
  drivers/char/random.c:1397:1: sparse: symbol 'get_random_int_hash' was not declared. Should it be static?

vim +682 drivers/char/random.c
   679			sample.cycles = get_cycles();
   680	
   681		sample.num = num;
 > 682		mix_pool_bytes(&input_pool, &sample, sizeof(sample), 0);
   683	
   684		/*
   685		 * Calculate number of bits of randomness we probably added.

---
0-DAY kernel build testing backend         Open Source Technology Centre
Fengguang Wu <wfg@linux.intel.com>                     Intel Corporation
