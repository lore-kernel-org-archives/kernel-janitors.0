From: Fengguang Wu <fengguang.wu@intel.com>
Date: Tue, 25 Sep 2012 00:52:14 +0000
Subject: fs/btrfs/disk-io.c:34:28: fatal error: asm/cpufeature.h: No such file or directory
Message-Id: <20120925005214.GA5678@localhost>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Josef Bacik <jbacik@fusionio.com>
Cc: kernel-janitors@vger.kernel.org, linux-btrfs@vger.kernel.org

Hi Josef,

FYI, kernel build failed on

Commit: d5b04fb3bbb6fce0a834e43f51b6a5251867fcb7 Btrfs: do not async metadata csums if we have hardware crc32c
Date: Mon Sep 24 14:40:24 2012 -0400
config: m68k-allmodconfig

All related error/warning messages:

fs/btrfs/disk-io.c:34:28: fatal error: asm/cpufeature.h: No such file or directory
compilation terminated.

vim +34 fs/btrfs/disk-io.c
    28	#include <linux/freezer.h>
    29	#include <linux/crc32c.h>
    30	#include <linux/slab.h>
    31	#include <linux/migrate.h>
    32	#include <linux/ratelimit.h>
    33	#include <asm/unaligned.h>
  > 34	#include <asm/cpufeature.h>
    35	#include "compat.h"
    36	#include "ctree.h"
    37	#include "disk-io.h"

---
0-DAY kernel build testing backend         Open Source Technology Centre
Fengguang Wu, Yuanhan Liu                              Intel Corporation
