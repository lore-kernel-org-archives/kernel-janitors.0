From: Fengguang Wu <fengguang.wu@intel.com>
Date: Mon, 24 Sep 2012 08:15:13 +0000
Subject: [md:for-next 29/29] ERROR: "__tracepoint_block_unplug" [drivers/md/raid456.ko] undefined!
Message-Id: <20120924081513.GA12612@localhost>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hi NeilBrown,

FYI, kernel build failed on

tree:   git://neil.brown.name/md for-next/14817e9
head:   14817e9a6dab027db44783d28429d14f601547a2
commit: 14817e9a6dab027db44783d28429d14f601547a2 [29/29] md/raid5: add blktrace calls
config: sparc64-defconfig

ERROR: "__tracepoint_block_unplug" [drivers/md/raid456.ko] undefined!

The root cause is, the block trace points are only available when
block/blk-core.c is compiled in.

---
0-DAY kernel build testing backend         Open Source Technology Centre
Fengguang Wu <wfg@linux.intel.com>                     Intel Corporation
