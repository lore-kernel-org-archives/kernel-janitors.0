From: Fengguang Wu <fengguang.wu@intel.com>
Date: Wed, 17 Oct 2012 11:36:10 +0000
Subject: [ukl:efm32 14/19] io.c:(.text+0x12b8): undefined reference to `unwind_backtrace'
Message-Id: <20121017113610.GA26182@localhost>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hi Uwe,

FYI, kernel build failed on

tree:   git://git.pengutronix.de/git/ukl/linux efm32
head:   ace35988f9089852b4d7278442ead682fb1fe7a7
commit: 304b1a8cda3ba8a550a9b2568e027d09bbf65829 [14/19] HACK! make stack dumps provoked by BUG a bit more helpful
config: arm-imx_v6_v7_defconfig # make ARCH=arm imx_v6_v7_defconfig

All error/warnings:

arch/arm/kernel/built-in.o: In function `show_regs':
io.c:(.text+0x12b8): undefined reference to `unwind_backtrace'

---
0-DAY kernel build testing backend         Open Source Technology Center
Fengguang Wu, Yuanhan Liu                              Intel Corporation
