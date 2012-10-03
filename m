From: Fengguang Wu <fengguang.wu@intel.com>
Date: Wed, 03 Oct 2012 01:17:07 +0000
Subject: [block:aio-dio 1/2] usr/include/linux/blk_types.h:11: included file 'linux/llist.h' is not exported
Message-Id: <20121003011707.GC8750@localhost>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hi Jens,

FYI, kernel build failed on

tree:   git://git.kernel.dk/linux-block.git aio-dio
head:   9b74568cadb674d3e8e5693e7ce1eb8096949068
commit: 344423f13a969bc193a13e955839ff91c58c72a3 [1/2] aio/dio: go faster stripes
config: powerpc-allmodconfig

All error/warnings:

usr/include/linux/blk_types.h:11: included file 'linux/llist.h' is not exported
usr/include/linux/kexec.h:49: userspace cannot reference function or variable defined in the kernel
usr/include/linux/soundcard.h:1054: userspace cannot reference function or variable defined in the kernel

Due to this chunk:

--- a/include/linux/aio.h
+++ b/include/linux/aio.h
@@ -6,6 +6,7 @@
 #include <linux/aio_abi.h>
 #include <linux/uio.h>
 #include <linux/rcupdate.h>
+#include <linux/llist.h>

---
0-DAY kernel build testing backend         Open Source Technology Centre
Fengguang Wu, Yuanhan Liu                              Intel Corporation
