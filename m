From: Fengguang Wu <fengguang.wu@intel.com>
Date: Sun, 07 Oct 2012 01:07:12 +0000
Subject: [samsung:v4l-framedesc 60/235] fc2580.c:(.text+0xeb49af): undefined reference to `__umoddi3'
Message-Id: <20121007010712.GA7808@localhost>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hi Antti,

FYI, kernel build failed on

tree:   git://git.infradead.org/users/kmpark/linux-samsung v4l-framedesc
head:   fc4382b505966b2574c985588ac23825dd639e29
commit: 384df49a6a97d411af33da3237558411789b67c5 [60/235] [media] rtl28xxu: add support for FCI FC2580 silicon tuner driver
config: i386-allyesconfig

The problematic code should be introduced by the preceding commit:

d9cb41afbf2aab54133c804009a1b8e76cedaef3 [media] tuners: add FCI FC2580 silicon tuner driver

All error/warnings:

drivers/built-in.o: In function `fc2580_set_params':
fc2580.c:(.text+0xeb49af): undefined reference to `__umoddi3'
fc2580.c:(.text+0xeb4a28): undefined reference to `__udivdi3'

---
0-DAY kernel build testing backend         Open Source Technology Center
Fengguang Wu, Yuanhan Liu                              Intel Corporation
