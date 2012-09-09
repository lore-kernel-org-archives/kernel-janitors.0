From: Fengguang Wu <fengguang.wu@intel.com>
Date: Sun, 09 Sep 2012 12:15:11 +0000
Subject: [block:for-next 7/35] fs/bio.c:363 bio_alloc_bioset() error: we previously assumed 'bs' could be nul
Message-Id: <20120909121511.GA19841@localhost>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hi Kent,

FYI, there are new smatch warnings show up in

tree:   git://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux-block.git for-next
head:   5611a9dbd54b993fe24f322a0c310a6605824c0f
commit: 3f86a82aeb03e6100f7ab39f4702e033a5e38166 [7/35] block: Consolidate bio_alloc_bioset(), bio_kmalloc()

All smatch warnings:

+ fs/bio.c:363 bio_alloc_bioset() error: we previously assumed 'bs' could be null (see line 327)
  arch/x86/include/asm/jump_label.h:25 arch_static_branch() info: ignoring unreachable code.

---
0-DAY kernel build testing backend         Open Source Technology Centre
Fengguang Wu <wfg@linux.intel.com>                     Intel Corporation
