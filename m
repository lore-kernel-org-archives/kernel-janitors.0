From: Fengguang Wu <fengguang.wu@intel.com>
Date: Mon, 01 Oct 2012 11:40:30 +0000
Subject: [arm-perf:delay 3/3] ERROR: "read_current_timer" [fs/ext4/ext4.ko] undefined!
Message-Id: <20121001114030.GB16393@localhost>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hi Jonathan,

FYI, kernel build failed on

tree:   git://git.kernel.org/pub/scm/linux/kernel/git/will/linux.git delay
head:   d9ed51a6b84c5724fd047a4715449356fffca83f
commit: d9ed51a6b84c5724fd047a4715449356fffca83f [3/3] ARM: delay: add registration mechanism for delay timer sources
config: arm-s3c2410_defconfig

All error/warnings:

ERROR: "read_current_timer" [fs/ext4/ext4.ko] undefined!

---
0-DAY kernel build testing backend         Open Source Technology Centre
Fengguang Wu, Yuanhan Liu                              Intel Corporation
