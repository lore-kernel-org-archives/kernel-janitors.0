From: Fengguang Wu <fengguang.wu@intel.com>
Date: Sat, 29 Sep 2012 00:21:53 +0000
Subject: kernel_init: undefined reference to `populate_rootfs_domain'
Message-Id: <20120929002153.GB6508@localhost>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hi Surbhi,

FYI, kernel build failed on

commit: 5e345495110f8f7b44e078de5a4f803f9bc70e4c  UBUNTU: SAUCE: Make populate_rootfs asynchronous
config: um-defconfig

All error/warnings:

init/built-in.o: In function `kernel_init':
main.c:(.init.text+0xc38): undefined reference to `populate_rootfs_domain'
collect2: error: ld returned 1 exit status

---
0-DAY kernel build testing backend         Open Source Technology Centre
Fengguang Wu, Yuanhan Liu                              Intel Corporation
