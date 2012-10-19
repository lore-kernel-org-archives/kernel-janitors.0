From: Fengguang Wu <fengguang.wu@intel.com>
Date: Fri, 19 Oct 2012 14:01:37 +0000
Subject: [arm-platforms:kvm-perf 1/2] hw_breakpoint.c:(.text+0x8746c): undefined reference to `perf_misc_flag
Message-Id: <20121019140137.GB17742@localhost>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hi Marc,

FYI, kernel build failed on

tree:   git://git.kernel.org/pub/scm/linux/kernel/git/maz/arm-platforms.git kvm-perf
head:   bde35887bb04b39f9b3402865c672b04a69730d1
commit: f2618bbd3af6820e82d9aeae18e443d2c67fb33d [1/2] ARM: perf: add guest vs host discrimination
config: arm-omap2plus_defconfig # make ARCH=arm omap2plus_defconfig

All error/warnings:

kernel/built-in.o: In function `perf_prepare_sample':
hw_breakpoint.c:(.text+0x8746c): undefined reference to `perf_misc_flags'
hw_breakpoint.c:(.text+0x87574): undefined reference to `perf_instruction_pointer'

---
0-DAY kernel build testing backend         Open Source Technology Center
Fengguang Wu, Yuanhan Liu                              Intel Corporation
