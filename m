From: Fengguang Wu <fengguang.wu@intel.com>
Date: Sat, 29 Sep 2012 11:35:27 +0000
Subject: [calxeda:ubuntu-quantal 99/299] make[4]: *** No rule to make target `ubuntu/include/linux/aufs_type.
Message-Id: <20120929113527.GB8674@localhost>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hi Andy,

FYI, kernel build failed on

tree:   git://sources.calxeda.com/kernel/linux.git ubuntu-quantal
head:   c07f1571f9b6e609109d50bd6ba2b2547e873614
commit: 41f493c5f0028c3268a9c92916305e0cf48048c9 [99/299] UBUNTU: ubuntu: AUFS -- include the aufs_types.h file in linux-libc-headers
config: x86_64-allmodconfig

These errors are then fixed by some later commit and only hurts bisectability.
If you don't care about bisectability of your tree, please let me know. Thanks!

All error/warnings:

make[4]: *** No rule to make target `ubuntu/include/linux/aufs_type.h', needed by `usr/include/linux/.install'.
make[4]: Target `__headersinst' not remade because of errors.

---
0-DAY kernel build testing backend         Open Source Technology Centre
Fengguang Wu, Yuanhan Liu                              Intel Corporation
