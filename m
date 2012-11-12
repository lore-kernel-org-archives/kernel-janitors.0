From: Fengguang Wu <fengguang.wu@intel.com>
Date: Mon, 12 Nov 2012 17:31:34 +0000
Subject: build regressions 2012-11-12
Message-Id: <50a13276.41vvBKlgGmNu7kB9%fengguang.wu@intel.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

[errors]
sound/pci/ice1712/ice1724.c:2366:5: error: 'struct snd_ice1712' has no member named 'pm_suspend_enabled'
arch/mips/fw/arc/misc.c:25:2: error: implicit declaration of function 'local_irq_disable' [-Werror=implicit-function-declaration]

[warnings]
drivers/net/ethernet/8390/lib8390.c:669:3: warning: large integer implicitly truncated to unsigned type [-Woverflow]
make[4]: Warning: File `include/config/auto.conf' has modification time 2.8e+04 s in the future
make[2]: Warning: File `.config' has modification time 2.8e+04 s in the future
make[2]: Warning: File `Makefile' has modification time 2.8e+04 s in the future
make[2]: Warning: File `init/.version.o.cmd' has modification time 2.8e+04 s in the future
make[2]: Warning: File `arch/x86/tools/.relocs.cmd' has modification time 2.8e+04 s in the future
make[2]: Warning: File `net/wireless/built-in.o' has modification time 2.9e+04 s in the future
make[3]: Warning: File `scripts/basic/.fixdep.cmd' has modification time 2.8e+04 s in the future
make[3]: Warning: File `arch/x86/include/generated/asm/clkdev.h' has modification time 2.8e+04 s in the future
make[3]: Warning: File `scripts/.sortextable.cmd' has modification time 2.8e+04 s in the future
make[3]: Warning: File `arch/x86/include/asm/msr-index.h' has modification time 2.8e+04 s in the future
make[4]: Warning: File `include/uapi/linux/perf_event.h' has modification time 2.8e+04 s in the future
make[5]: Warning: File `include/linux/raid/Kbuild' has modification time 2.8e+04 s in the future
make[3]: Warning: File `arch/x86/kernel/Makefile' has modification time 2.8e+04 s in the future
fs/btrfs/tree-log.c:1495:20: warning: 'dst_di' may be used uninitialized in this function [-Wmaybe-uninitialized]
make[3]: Warning: File `drivers/media/common/built-in.o' has modification time 2.9e+04 s in the future
make[2]: Warning: File `drivers/amba/built-in.o' has modification time 2.9e+04 s in the future

---
0-DAY kernel build testing backend         Open Source Technology Center
Fengguang Wu, Yuanhan Liu                              Intel Corporation
