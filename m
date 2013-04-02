From: Fengguang Wu <fengguang.wu@intel.com>
Date: Tue, 02 Apr 2013 16:44:40 +0000
Subject: build regressions 2013-04-02
Message-Id: <515b0af8.x6DfaX1uFB2sI2g4%fengguang.wu@intel.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

[errors]
drivers/media/platform/soc_camera/mx3_camera.c:543:3: error: implicit declaration of function 'dma_release_channel' [-Werror=implicit-function-declaration]
sound/soc/soc-dmaengine-pcm.c:314:2: error: implicit declaration of function 'dma_release_channel' [-Werror=implicit-function-declaration]
drivers/video/mx3fb.c:1540:2: error: implicit declaration of function 'dma_release_channel' [-Werror=implicit-function-declaration]
drivers/mtd/nand/gpmi-nand/gpmi-nand.c:450:4: error: implicit declaration of function 'dma_release_channel' [-Werror=implicit-function-declaration]
imx-pcm.c:(.text+0x464): multiple definition of `imx_pcm_free'
sound/soc/fsl/snd-soc-imx-pcm-fiq.o:imx-pcm-fiq.c:(.text+0x1a4): first defined here
imx-pcm.c:(.text+0x360): multiple definition of `snd_imx_pcm_mmap'
sound/soc/fsl/snd-soc-imx-pcm-fiq.o:imx-pcm-fiq.c:(.text+0xa0): first defined here
imx-pcm.c:(.text+0x3e0): multiple definition of `imx_pcm_new'
sound/soc/fsl/snd-soc-imx-pcm-fiq.o:imx-pcm-fiq.c:(.text+0x120): first defined here
drivers/mmc/host/mmci.c:385:3: error: implicit declaration of function 'dma_release_channel' [-Werror=implicit-function-declaration]
drivers/tty/serial/amba-pl011.c:356:3: error: implicit declaration of function 'dma_release_channel' [-Werror=implicit-function-declaration]
drivers/spi/spi-omap2-mcspi.c:835:3: error: implicit declaration of function 'dma_release_channel' [-Werror=implicit-function-declaration]
drivers/mtd/nand/omap2.c:2070:3: error: implicit declaration of function 'dma_release_channel' [-Werror=implicit-function-declaration]
drivers/mmc/host/omap_hsmmc.c:2015:3: error: implicit declaration of function 'dma_release_channel' [-Werror=implicit-function-declaration]
drivers/mmc/host/omap.c:1482:3: error: implicit declaration of function 'dma_release_channel' [-Werror=implicit-function-declaration]
drivers/mtd/nand/fsmc_nand.c:1159:3: error: implicit declaration of function 'dma_release_channel' [-Werror=implicit-function-declaration]
drivers/spi/spi-pl022.c:1132:2: error: implicit declaration of function 'dma_release_channel' [-Werror=implicit-function-declaration]
arch/arm/mach-tegra/apbio.c:80:2: error: implicit declaration of function 'dma_release_channel' [-Werror=implicit-function-declaration]
drivers/tty/serial/serial-tegra.c:922:4: error: implicit declaration of function 'dma_release_channel' [-Werror=implicit-function-declaration]
drivers/spi/spi-tegra20-slink.c:652:3: error: implicit declaration of function 'dma_release_channel' [-Werror=implicit-function-declaration]
drivers/mmc/host/atmel-mci.c:2457: error: implicit declaration of function 'dma_release_channel'
drivers/mtd/nand/atmel_nand.c:1670: error: implicit declaration of function 'dma_release_channel'
drivers/dma/dmaengine.c:561:18: error: conflicting types for 'dma_request_slave_channel'
drivers/dma/dmaengine.c:569:42: error: conflicting types for 'dma_request_slave_channel'
drivers/ata/pata_arasan_cf.c:546:2: error: implicit declaration of function 'dma_release_channel' [-Werror=implicit-function-declaration]
drivers/media/platform/m2m-deinterlace.c:1072:2: error: implicit declaration of function 'dma_release_channel' [-Werror=implicit-function-declaration]
drivers/net/ethernet/micrel/ks8842.c:903:3: error: implicit declaration of function 'dma_release_channel' [-Werror=implicit-function-declaration]
drivers/spi/spi-dw-mid.c:84:2: error: implicit declaration of function 'dma_release_channel' [-Werror=implicit-function-declaration]
drivers/spi/spi-pxa2xx-dma.c:347:3: error: implicit declaration of function 'dma_release_channel' [-Werror=implicit-function-declaration]
drivers/spi/spi-topcliff-pch.c:961:3: error: implicit declaration of function 'dma_release_channel' [-Werror=implicit-function-declaration]
drivers/net/wireless/rtlwifi/rtl8188ee/dm.c:30:18: fatal error: wifi.h: No such file or directory
drivers/net/wireless/rtlwifi/rtl8188ee/fw.c:30:18: fatal error: wifi.h: No such file or directory
drivers/net/wireless/rtlwifi/rtl8188ee/hw.c:30:18: fatal error: wifi.h: No such file or directory
drivers/net/wireless/rtlwifi/rtl8188ee/led.c:30:18: fatal error: wifi.h: No such file or directory
drivers/net/wireless/rtlwifi/rtl8188ee/phy.c:30:18: fatal error: wifi.h: No such file or directory
drivers/net/wireless/rtlwifi/rtl8188ee/pwrseqcmd.h:33:18: fatal error: wifi.h: No such file or directory
drivers/net/wireless/rtlwifi/rtl8188ee/rf.c:30:18: fatal error: wifi.h: No such file or directory
drivers/net/wireless/rtlwifi/rtl8188ee/sw.c:30:18: fatal error: wifi.h: No such file or directory
drivers/net/wireless/rtlwifi/rtl8188ee/trx.c:30:18: fatal error: wifi.h: No such file or directory
arch/powerpc/include/asm/eeh.h:196:36: error: '__cold__' attribute ignored [-Werror=attributes]
arch/powerpc/include/asm/eeh.h:197:1: error: '__used__' attribute ignored [-Werror=attributes]
arch/powerpc/include/asm/eeh.h:197:1: error: '__cold__' attribute ignored [-Werror=attributes]
arch/powerpc/include/asm/eeh.h:201:1: error: '__cold__' attribute ignored [-Werror=attributes]
include/linux/pci.h:1187:54: error: expected declaration specifiers before ';' token
include/linux/mm.h:1348:1: error: '__cold__' attribute ignored [-Werror=attributes]
include/linux/mm.h:1359:1: error: '__cold__' attribute ignored [-Werror=attributes]
include/linux/mm.h:1361:1: error: '__cold__' attribute ignored [-Werror=attributes]
include/linux/swiotlb.h:114:39: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
arch/powerpc/include/asm/swiotlb.h:21:1: error: '__cold__' attribute ignored [-Werror=attributes]
include/linux/pci.h:1826:67: error: 'weak' attribute ignored [-Werror=attributes]
arch/powerpc/include/asm/udbg.h:40:1: error: '__cold__' attribute ignored [-Werror=attributes]
arch/powerpc/include/asm/udbg.h:41:1: error: '__cold__' attribute ignored [-Werror=attributes]
arch/powerpc/include/asm/udbg.h:42:1: error: '__cold__' attribute ignored [-Werror=attributes]
arch/powerpc/include/asm/udbg.h:43:1: error: '__cold__' attribute ignored [-Werror=attributes]
arch/powerpc/include/asm/udbg.h:44:1: error: '__cold__' attribute ignored [-Werror=attributes]
arch/powerpc/include/asm/udbg.h:45:1: error: '__cold__' attribute ignored [-Werror=attributes]
arch/powerpc/include/asm/udbg.h:46:1: error: '__cold__' attribute ignored [-Werror=attributes]
arch/powerpc/include/asm/udbg.h:47:1: error: '__cold__' attribute ignored [-Werror=attributes]
arch/powerpc/include/asm/udbg.h:48:1: error: '__cold__' attribute ignored [-Werror=attributes]
arch/powerpc/include/asm/udbg.h:49:1: error: '__cold__' attribute ignored [-Werror=attributes]
arch/powerpc/include/asm/udbg.h:50:1: error: '__cold__' attribute ignored [-Werror=attributes]
arch/powerpc/include/asm/udbg.h:51:1: error: '__cold__' attribute ignored [-Werror=attributes]
arch/powerpc/include/asm/udbg.h:52:1: error: '__cold__' attribute ignored [-Werror=attributes]
arch/powerpc/include/asm/udbg.h:53:1: error: '__cold__' attribute ignored [-Werror=attributes]
arch/powerpc/include/asm/udbg.h:54:1: error: '__cold__' attribute ignored [-Werror=attributes]
arch/powerpc/include/asm/udbg.h:55:1: error: '__cold__' attribute ignored [-Werror=attributes]
arch/powerpc/include/asm/udbg.h:56:1: error: '__cold__' attribute ignored [-Werror=attributes]
arch/powerpc/include/asm/udbg.h:57:1: error: '__cold__' attribute ignored [-Werror=attributes]
arch/powerpc/include/asm/udbg.h:58:1: error: '__cold__' attribute ignored [-Werror=attributes]
arch/powerpc/include/asm/trace.h:28:1: error: '__used__' attribute ignored [-Werror=attributes]
arch/powerpc/include/asm/trace.h:35:1: error: '__used__' attribute ignored [-Werror=attributes]
arch/powerpc/include/asm/trace.h:42:1: error: '__used__' attribute ignored [-Werror=attributes]
arch/powerpc/include/asm/trace.h:49:1: error: '__used__' attribute ignored [-Werror=attributes]
arch/powerpc/include/asm/trace.h:60:1: error: '__used__' attribute ignored [-Werror=attributes]
arch/powerpc/include/asm/trace.h:79:1: error: '__used__' attribute ignored [-Werror=attributes]
include/linux/idr.h:240:1: error: '__cold__' attribute ignored [-Werror=attributes]
include/linux/nsproxy.h:71:1: error: '__cold__' attribute ignored [-Werror=attributes]
arch/powerpc/include/asm/trace.h:28:1: error: '__used__' attribute ignored [-Werror=attributes]
arch/powerpc/include/asm/trace.h:35:1: error: '__used__' attribute ignored [-Werror=attributes]
arch/powerpc/include/asm/trace.h:42:1: error: '__used__' attribute ignored [-Werror=attributes]
arch/powerpc/include/asm/trace.h:49:1: error: '__used__' attribute ignored [-Werror=attributes]
arch/powerpc/include/asm/trace.h:60:1: error: '__used__' attribute ignored [-Werror=attributes]
arch/powerpc/include/asm/trace.h:79:1: error: '__used__' attribute ignored [-Werror=attributes]
arch/powerpc/include/asm/trace.h:11:1: error: '__used__' attribute ignored [-Werror=attributes]
arch/powerpc/include/asm/trace.h:28:1: error: '__used__' attribute ignored [-Werror=attributes]
arch/powerpc/include/asm/trace.h:28:1: error: '__used__' attribute ignored [-Werror=attributes]
arch/powerpc/include/asm/trace.h:35:1: error: '__used__' attribute ignored [-Werror=attributes]
arch/powerpc/include/asm/trace.h:35:1: error: '__used__' attribute ignored [-Werror=attributes]
arch/powerpc/include/asm/trace.h:42:1: error: '__used__' attribute ignored [-Werror=attributes]
arch/powerpc/include/asm/trace.h:42:1: error: '__used__' attribute ignored [-Werror=attributes]
arch/powerpc/include/asm/trace.h:49:1: error: '__used__' attribute ignored [-Werror=attributes]
arch/powerpc/include/asm/trace.h:49:1: error: '__used__' attribute ignored [-Werror=attributes]
arch/powerpc/include/asm/trace.h:60:1: error: '__used__' attribute ignored [-Werror=attributes]
arch/powerpc/include/asm/trace.h:60:1: error: '__used__' attribute ignored [-Werror=attributes]
arch/powerpc/include/asm/trace.h:60:1: error: '__used__' attribute ignored [-Werror=attributes]
arch/powerpc/include/asm/trace.h:79:1: error: '__used__' attribute ignored [-Werror=attributes]
arch/powerpc/include/asm/trace.h:79:1: error: '__used__' attribute ignored [-Werror=attributes]
arch/powerpc/include/asm/trace.h:79:1: error: '__used__' attribute ignored [-Werror=attributes]
arch/powerpc/kernel/irq.c:80:1: error: 'weak' attribute ignored [-Werror=attributes]
arch/powerpc/kernel/irq.c:80:1: error: '__used__' attribute ignored [-Werror=attributes]
arch/powerpc/kernel/irq.c:80:1: error: '__used__' attribute ignored [-Werror=attributes]
arch/powerpc/kernel/irq.c:276:1: error: 'weak' attribute ignored [-Werror=attributes]
arch/powerpc/kernel/irq.c:276:1: error: '__used__' attribute ignored [-Werror=attributes]
arch/powerpc/kernel/irq.c:276:1: error: '__used__' attribute ignored [-Werror=attributes]
arch/powerpc/kernel/irq.c:636:1: error: 'weak' attribute ignored [-Werror=attributes]
arch/powerpc/kernel/irq.c:636:1: error: '__used__' attribute ignored [-Werror=attributes]
arch/powerpc/kernel/irq.c:636:1: error: '__used__' attribute ignored [-Werror=attributes]
arch/powerpc/kernel/irq.c:686:1: error: '__used__' attribute ignored [-Werror=attributes]
include/linux/slab.h:125:1: error: '__cold__' attribute ignored [-Werror=attributes]
include/linux/slab.h:446:1: error: '__cold__' attribute ignored [-Werror=attributes]
include/linux/security.h:2034:13: error: type defaults to 'int' in declaration of 'initxattrs' [-Werror=implicit-int]
include/linux/security.h:2034:24: error: expected ';', ',' or ')' before 'initxattrs'
arch/powerpc/include/asm/eeh.h:196:36: error: '__cold__' attribute ignored [-Werror=attributes]
arch/powerpc/include/asm/eeh.h:197:1: error: '__used__' attribute ignored [-Werror=attributes]
arch/powerpc/include/asm/eeh.h:197:1: error: '__cold__' attribute ignored [-Werror=attributes]
arch/powerpc/include/asm/eeh.h:201:1: error: '__cold__' attribute ignored [-Werror=attributes]
arch/powerpc/include/asm/nvram.h:35:1: error: '__cold__' attribute ignored [-Werror=attributes]
include/linux/swiotlb.h:114:39: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
arch/powerpc/include/asm/swiotlb.h:21:1: error: '__cold__' attribute ignored [-Werror=attributes]
arch/powerpc/kernel/time.c:111:1: error: 'weak' attribute ignored [-Werror=attributes]
arch/powerpc/kernel/time.c:111:1: error: '__used__' attribute ignored [-Werror=attributes]
arch/powerpc/kernel/time.c:111:1: error: '__used__' attribute ignored [-Werror=attributes]
arch/powerpc/kernel/time.c:114:8: error: storage class specified for parameter 'decrementers'
arch/powerpc/kernel/time.c:114:8: error: section attribute not allowed for 'decrementers'
arch/powerpc/kernel/time.c:127:1: error: 'weak' attribute ignored [-Werror=attributes]
arch/powerpc/kernel/time.c:127:1: error: '__used__' attribute ignored [-Werror=attributes]
arch/powerpc/kernel/time.c:127:1: error: '__used__' attribute ignored [-Werror=attributes]
arch/powerpc/kernel/time.c:129:1: error: 'weak' attribute ignored [-Werror=attributes]
arch/powerpc/kernel/time.c:129:1: error: '__used__' attribute ignored [-Werror=attributes]
arch/powerpc/kernel/time.c:129:1: error: '__used__' attribute ignored [-Werror=attributes]
arch/powerpc/kernel/time.c:132:1: error: 'weak' attribute ignored [-Werror=attributes]
arch/powerpc/kernel/time.c:132:1: error: '__used__' attribute ignored [-Werror=attributes]
arch/powerpc/kernel/time.c:132:1: error: '__used__' attribute ignored [-Werror=attributes]
arch/powerpc/kernel/time.c:142:1: error: 'weak' attribute ignored [-Werror=attributes]
arch/powerpc/kernel/time.c:142:1: error: '__used__' attribute ignored [-Werror=attributes]
arch/powerpc/kernel/time.c:142:1: error: '__used__' attribute ignored [-Werror=attributes]
arch/powerpc/kernel/time.c:144:1: error: 'weak' attribute ignored [-Werror=attributes]
arch/powerpc/kernel/time.c:144:1: error: '__used__' attribute ignored [-Werror=attributes]
arch/powerpc/kernel/time.c:144:1: error: '__used__' attribute ignored [-Werror=attributes]
arch/powerpc/kernel/time.c:153:1: error: 'weak' attribute ignored [-Werror=attributes]
arch/powerpc/kernel/time.c:153:1: error: '__used__' attribute ignored [-Werror=attributes]
arch/powerpc/kernel/time.c:153:1: error: '__used__' attribute ignored [-Werror=attributes]
arch/powerpc/kernel/time.c:155:1: error: 'weak' attribute ignored [-Werror=attributes]
arch/powerpc/kernel/time.c:155:1: error: '__used__' attribute ignored [-Werror=attributes]
arch/powerpc/kernel/time.c:155:1: error: '__used__' attribute ignored [-Werror=attributes]
arch/powerpc/kernel/time.c:157:1: error: 'weak' attribute ignored [-Werror=attributes]
arch/powerpc/kernel/time.c:157:1: error: '__used__' attribute ignored [-Werror=attributes]
arch/powerpc/kernel/time.c:157:1: error: '__used__' attribute ignored [-Werror=attributes]
arch/powerpc/kernel/time.c:159:1: error: 'weak' attribute ignored [-Werror=attributes]
arch/powerpc/kernel/time.c:159:1: error: '__used__' attribute ignored [-Werror=attributes]
arch/powerpc/kernel/time.c:159:1: error: '__used__' attribute ignored [-Werror=attributes]
arch/powerpc/kernel/time.c:350:1: error: 'weak' attribute ignored [-Werror=attributes]
arch/powerpc/kernel/time.c:350:1: error: '__used__' attribute ignored [-Werror=attributes]
arch/powerpc/kernel/time.c:350:1: error: '__used__' attribute ignored [-Werror=attributes]
arch/powerpc/kernel/time.c:405:1: error: 'weak' attribute ignored [-Werror=attributes]
arch/powerpc/kernel/time.c:405:1: error: '__used__' attribute ignored [-Werror=attributes]
arch/powerpc/kernel/time.c:405:1: error: '__used__' attribute ignored [-Werror=attributes]
arch/powerpc/kernel/time.c:411:1: error: 'weak' attribute ignored [-Werror=attributes]
arch/powerpc/kernel/time.c:411:1: error: '__used__' attribute ignored [-Werror=attributes]
arch/powerpc/kernel/time.c:411:1: error: '__used__' attribute ignored [-Werror=attributes]
arch/powerpc/kernel/time.c:423:1: error: 'weak' attribute ignored [-Werror=attributes]
arch/powerpc/kernel/time.c:423:1: error: '__used__' attribute ignored [-Werror=attributes]
arch/powerpc/kernel/time.c:423:1: error: '__used__' attribute ignored [-Werror=attributes]
arch/powerpc/kernel/time.c:1058:1: error: '__used__' attribute ignored [-Werror=attributes]
include/linux/swiotlb.h:114:39: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
include/linux/swiotlb.h:114:39: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
include/linux/swiotlb.h:114:39: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
include/linux/capability.h:144:37: error: type defaults to 'int' in declaration of 'kernel_cap_t' [-Werror=implicit-int]
include/linux/capability.h:161:38: error: type defaults to 'int' in declaration of 'kernel_cap_t' [-Werror=implicit-int]
arch/powerpc/include/asm/cputime.h:49:54: error: type defaults to 'int' in declaration of 'cputime_t' [-Werror=implicit-int]
arch/powerpc/include/asm/cputime.h:105:48: error: type defaults to 'int' in declaration of 'cputime_t' [-Werror=implicit-int]
arch/powerpc/include/asm/cputime.h:115:52: error: type defaults to 'int' in declaration of 'cputime_t' [-Werror=implicit-int]
arch/powerpc/include/asm/cputime.h:144:51: error: type defaults to 'int' in declaration of 'cputime_t' [-Werror=implicit-int]
arch/powerpc/include/asm/cputime.h:157:46: error: type defaults to 'int' in declaration of 'cputime_t' [-Werror=implicit-int]
arch/powerpc/include/asm/cputime.h:181:45: error: type defaults to 'int' in declaration of 'cputime_t' [-Werror=implicit-int]
arch/powerpc/include/asm/cputime.h:207:54: error: type defaults to 'int' in declaration of 'cputime_t' [-Werror=implicit-int]
include/linux/signal.h:120:1: error: type defaults to 'int' in declaration of 'sigset_t' [-Werror=implicit-int]
include/linux/signal.h:123:1: error: type defaults to 'int' in declaration of 'sigset_t' [-Werror=implicit-int]
include/linux/signal.h:126:1: error: type defaults to 'int' in declaration of 'sigset_t' [-Werror=implicit-int]
include/linux/signal.h:244:34: error: type defaults to 'int' in declaration of 'sigset_t' [-Werror=implicit-int]
include/linux/signal.h:248:41: error: type defaults to 'int' in declaration of 'sigset_t' [-Werror=implicit-int]
include/linux/signal.h:434:28: error: type defaults to 'int' in declaration of 'stack_t' [-Werror=implicit-int]
include/linux/hrtimer.h:450:1: error: '__cold__' attribute ignored [-Werror=attributes]
include/linux/key.h:107:48: error: type defaults to 'int' in declaration of 'key_ref_t' [-Werror=implicit-int]
include/linux/key.h:112:52: error: type defaults to 'int' in declaration of 'key_ref_t' [-Werror=implicit-int]
include/linux/cred.h:157:1: error: '__cold__' attribute ignored [-Werror=attributes]
include/linux/sched.h:818:1: error: 'weak' attribute ignored [-Werror=attributes]
include/linux/module.h:645:32: error: type defaults to 'int' in declaration of 'Elf64_Ehdr' [-Werror=implicit-int]
include/linux/percpu.h:121:13: error: '__cold__' attribute ignored [-Werror=attributes]
include/linux/percpu.h:122:48: error: '__cold__' attribute ignored [-Werror=attributes]
include/linux/percpu.h:125:7: error: '__cold__' attribute ignored [-Werror=attributes]
include/linux/percpu.h:159:1: error: '__cold__' attribute ignored [-Werror=attributes]
include/linux/hrtimer.h:450:1: error: '__cold__' attribute ignored [-Werror=attributes]
arch/powerpc/oprofile/../../../drivers/oprofile/timer_int.c:23:8: error: storage class specified for parameter 'oprofile_hrtimer'
arch/powerpc/oprofile/../../../drivers/oprofile/timer_int.c:23:8: error: section attribute not allowed for 'oprofile_hrtimer'
include/linux/compat.h:364:70: error: type defaults to 'int' in declaration of 'compat_uptr_t' [-Werror=implicit-int]
include/linux/compat.h:382:51: error: type defaults to 'int' in declaration of 'compat_ulong_t' [-Werror=implicit-int]
include/linux/compat.h:431:53: error: type defaults to 'int' in declaration of 'compat_sigset_t' [-Werror=implicit-int]
include/linux/compat.h:435:33: error: type defaults to 'int' in declaration of 'compat_ulong_t' [-Werror=implicit-int]
include/linux/compat.h:455:10: error: type defaults to 'int' in declaration of 'compat_sigset_t' [-Werror=implicit-int]
include/linux/compat.h:468:15: error: type defaults to 'int' in declaration of 'compat_sigset_t' [-Werror=implicit-int]
include/linux/compat.h:549:12: error: type defaults to 'int' in declaration of 'compat_sigset_t' [-Werror=implicit-int]
include/linux/compat.h:552:16: error: type defaults to 'int' in declaration of 'compat_sigset_t' [-Werror=implicit-int]
include/linux/compat.h:688:46: error: type defaults to 'int' in declaration of 'compat_stack_t' [-Werror=implicit-int]
include/linux/compat.h:691:35: error: type defaults to 'int' in declaration of 'compat_stack_t' [-Werror=implicit-int]
include/linux/hugetlb.h:261:43: error: '__cold__' attribute ignored [-Werror=attributes]
include/linux/hugetlb.h:263:1: error: '__cold__' attribute ignored [-Werror=attributes]
include/trace/events/kvm.h:19:1: error: '__used__' attribute ignored [-Werror=attributes]
include/trace/events/kvm.h:157:1: error: '__used__' attribute ignored [-Werror=attributes]
include/trace/events/kvm.h:184:1: error: '__used__' attribute ignored [-Werror=attributes]
include/trace/events/kvm.h:199:1: error: '__used__' attribute ignored [-Werror=attributes]
include/trace/events/kvm.h:19:1: error: '__used__' attribute ignored [-Werror=attributes]
include/trace/events/kvm.h:157:1: error: '__used__' attribute ignored [-Werror=attributes]
include/trace/events/kvm.h:184:1: error: '__used__' attribute ignored [-Werror=attributes]
include/trace/events/kvm.h:199:1: error: '__used__' attribute ignored [-Werror=attributes]
include/trace/events/kvm.h:19:1: error: '__used__' attribute ignored [-Werror=attributes]
include/trace/events/kvm.h:19:1: error: '__used__' attribute ignored [-Werror=attributes]
include/trace/events/kvm.h:19:1: error: '__used__' attribute ignored [-Werror=attributes]
include/trace/events/kvm.h:157:1: error: '__used__' attribute ignored [-Werror=attributes]
include/trace/events/kvm.h:157:1: error: '__used__' attribute ignored [-Werror=attributes]
include/trace/events/kvm.h:157:1: error: '__used__' attribute ignored [-Werror=attributes]
include/trace/events/kvm.h:184:1: error: '__used__' attribute ignored [-Werror=attributes]
include/trace/events/kvm.h:184:1: error: '__used__' attribute ignored [-Werror=attributes]
include/trace/events/kvm.h:184:1: error: '__used__' attribute ignored [-Werror=attributes]
include/trace/events/kvm.h:199:1: error: '__used__' attribute ignored [-Werror=attributes]
include/trace/events/kvm.h:199:1: error: '__used__' attribute ignored [-Werror=attributes]
include/trace/events/kvm.h:199:1: error: '__used__' attribute ignored [-Werror=attributes]
arch/powerpc/kvm/../../../virt/kvm/kvm_main.c:64:1: error: '__used__' attribute ignored [-Werror=attributes]
arch/powerpc/kvm/../../../virt/kvm/kvm_main.c:65:1: error: '__used__' attribute ignored [-Werror=attributes]
arch/powerpc/kvm/../../../virt/kvm/kvm_main.c:81:1: error: 'weak' attribute ignored [-Werror=attributes]
arch/powerpc/kvm/../../../virt/kvm/kvm_main.c:81:1: error: '__used__' attribute ignored [-Werror=attributes]
arch/powerpc/kvm/../../../virt/kvm/kvm_main.c:81:1: error: '__used__' attribute ignored [-Werror=attributes]
arch/powerpc/kvm/../../../virt/kvm/kvm_main.c:99:1: error: 'weak' attribute ignored [-Werror=attributes]
arch/powerpc/kvm/../../../virt/kvm/kvm_main.c:99:1: error: '__used__' attribute ignored [-Werror=attributes]
arch/powerpc/kvm/../../../virt/kvm/kvm_main.c:99:1: error: '__used__' attribute ignored [-Werror=attributes]
arch/powerpc/kvm/../../../virt/kvm/kvm_main.c:258:1: error: 'weak' attribute ignored [-Werror=attributes]
arch/powerpc/kvm/../../../virt/kvm/kvm_main.c:258:1: error: '__used__' attribute ignored [-Werror=attributes]
arch/powerpc/kvm/../../../virt/kvm/kvm_main.c:258:1: error: '__used__' attribute ignored [-Werror=attributes]
arch/powerpc/kvm/../../../virt/kvm/kvm_main.c:266:1: error: 'weak' attribute ignored [-Werror=attributes]
arch/powerpc/kvm/../../../virt/kvm/kvm_main.c:266:1: error: '__used__' attribute ignored [-Werror=attributes]
arch/powerpc/kvm/../../../virt/kvm/kvm_main.c:266:1: error: '__used__' attribute ignored [-Werror=attributes]
arch/powerpc/kvm/../../../virt/kvm/kvm_main.c:613:1: error: 'weak' attribute ignored [-Werror=attributes]
arch/powerpc/kvm/../../../virt/kvm/kvm_main.c:613:1: error: '__used__' attribute ignored [-Werror=attributes]
arch/powerpc/kvm/../../../virt/kvm/kvm_main.c:613:1: error: '__used__' attribute ignored [-Werror=attributes]
arch/powerpc/kvm/../../../virt/kvm/kvm_main.c:620:1: error: 'weak' attribute ignored [-Werror=attributes]
arch/powerpc/kvm/../../../virt/kvm/kvm_main.c:620:1: error: '__used__' attribute ignored [-Werror=attributes]
arch/powerpc/kvm/../../../virt/kvm/kvm_main.c:620:1: error: '__used__' attribute ignored [-Werror=attributes]
arch/powerpc/kvm/../../../virt/kvm/kvm_main.c:932:1: error: 'weak' attribute ignored [-Werror=attributes]
arch/powerpc/kvm/../../../virt/kvm/kvm_main.c:932:1: error: '__used__' attribute ignored [-Werror=attributes]
arch/powerpc/kvm/../../../virt/kvm/kvm_main.c:932:1: error: '__used__' attribute ignored [-Werror=attributes]
arch/powerpc/kvm/../../../virt/kvm/kvm_main.c:945:1: error: 'weak' attribute ignored [-Werror=attributes]
arch/powerpc/kvm/../../../virt/kvm/kvm_main.c:945:1: error: '__used__' attribute ignored [-Werror=attributes]
arch/powerpc/kvm/../../../virt/kvm/kvm_main.c:945:1: error: '__used__' attribute ignored [-Werror=attributes]
arch/powerpc/kvm/../../../virt/kvm/kvm_main.c:1000:1: error: 'weak' attribute ignored [-Werror=attributes]
arch/powerpc/kvm/../../../virt/kvm/kvm_main.c:1000:1: error: '__used__' attribute ignored [-Werror=attributes]
arch/powerpc/kvm/../../../virt/kvm/kvm_main.c:1000:1: error: '__used__' attribute ignored [-Werror=attributes]
arch/powerpc/kvm/../../../virt/kvm/kvm_main.c:1006:1: error: 'weak' attribute ignored [-Werror=attributes]
arch/powerpc/kvm/../../../virt/kvm/kvm_main.c:1006:1: error: '__used__' attribute ignored [-Werror=attributes]
arch/powerpc/kvm/../../../virt/kvm/kvm_main.c:1006:1: error: '__used__' attribute ignored [-Werror=attributes]
arch/powerpc/kvm/../../../virt/kvm/kvm_main.c:1018:1: error: 'weak' attribute ignored [-Werror=attributes]
arch/powerpc/kvm/../../../virt/kvm/kvm_main.c:1018:1: error: '__used__' attribute ignored [-Werror=attributes]
arch/powerpc/kvm/../../../virt/kvm/kvm_main.c:1018:1: error: '__used__' attribute ignored [-Werror=attributes]
arch/powerpc/kvm/../../../virt/kvm/kvm_main.c:1075:1: error: 'weak' attribute ignored [-Werror=attributes]
arch/powerpc/kvm/../../../virt/kvm/kvm_main.c:1075:1: error: '__used__' attribute ignored [-Werror=attributes]
arch/powerpc/kvm/../../../virt/kvm/kvm_main.c:1075:1: error: '__used__' attribute ignored [-Werror=attributes]
arch/powerpc/kvm/../../../virt/kvm/kvm_main.c:1081:1: error: 'weak' attribute ignored [-Werror=attributes]
arch/powerpc/kvm/../../../virt/kvm/kvm_main.c:1081:1: error: '__used__' attribute ignored [-Werror=attributes]
arch/powerpc/kvm/../../../virt/kvm/kvm_main.c:1081:1: error: '__used__' attribute ignored [-Werror=attributes]
arch/powerpc/kvm/../../../virt/kvm/kvm_main.c:1308:1: error: 'weak' attribute ignored [-Werror=attributes]
arch/powerpc/kvm/../../../virt/kvm/kvm_main.c:1308:1: error: '__used__' attribute ignored [-Werror=attributes]
arch/powerpc/kvm/../../../virt/kvm/kvm_main.c:1308:1: error: '__used__' attribute ignored [-Werror=attributes]
arch/powerpc/kvm/../../../virt/kvm/kvm_main.c:1315:1: error: 'weak' attribute ignored [-Werror=attributes]
arch/powerpc/kvm/../../../virt/kvm/kvm_main.c:1315:1: error: '__used__' attribute ignored [-Werror=attributes]
arch/powerpc/kvm/../../../virt/kvm/kvm_main.c:1315:1: error: '__used__' attribute ignored [-Werror=attributes]
arch/powerpc/kvm/../../../virt/kvm/kvm_main.c:1321:1: error: 'weak' attribute ignored [-Werror=attributes]
arch/powerpc/kvm/../../../virt/kvm/kvm_main.c:1321:1: error: '__used__' attribute ignored [-Werror=attributes]
arch/powerpc/kvm/../../../virt/kvm/kvm_main.c:1321:1: error: '__used__' attribute ignored [-Werror=attributes]
arch/powerpc/kvm/../../../virt/kvm/kvm_main.c:1328:1: error: 'weak' attribute ignored [-Werror=attributes]
arch/powerpc/kvm/../../../virt/kvm/kvm_main.c:1328:1: error: '__used__' attribute ignored [-Werror=attributes]
arch/powerpc/kvm/../../../virt/kvm/kvm_main.c:1328:1: error: '__used__' attribute ignored [-Werror=attributes]
arch/powerpc/kvm/../../../virt/kvm/kvm_main.c:1339:1: error: 'weak' attribute ignored [-Werror=attributes]
arch/powerpc/kvm/../../../virt/kvm/kvm_main.c:1339:1: error: '__used__' attribute ignored [-Werror=attributes]
arch/powerpc/kvm/../../../virt/kvm/kvm_main.c:1339:1: error: '__used__' attribute ignored [-Werror=attributes]
arch/powerpc/kvm/../../../virt/kvm/kvm_main.c:1356:1: error: 'weak' attribute ignored [-Werror=attributes]
arch/powerpc/kvm/../../../virt/kvm/kvm_main.c:1356:1: error: '__used__' attribute ignored [-Werror=attributes]
arch/powerpc/kvm/../../../virt/kvm/kvm_main.c:1356:1: error: '__used__' attribute ignored [-Werror=attributes]
arch/powerpc/kvm/../../../virt/kvm/kvm_main.c:1380:1: error: 'weak' attribute ignored [-Werror=attributes]
arch/powerpc/kvm/../../../virt/kvm/kvm_main.c:1380:1: error: '__used__' attribute ignored [-Werror=attributes]
arch/powerpc/kvm/../../../virt/kvm/kvm_main.c:1380:1: error: '__used__' attribute ignored [-Werror=attributes]
arch/powerpc/kvm/../../../virt/kvm/kvm_main.c:1388:1: error: 'weak' attribute ignored [-Werror=attributes]
arch/powerpc/kvm/../../../virt/kvm/kvm_main.c:1388:1: error: '__used__' attribute ignored [-Werror=attributes]
arch/powerpc/kvm/../../../virt/kvm/kvm_main.c:1388:1: error: '__used__' attribute ignored [-Werror=attributes]
arch/powerpc/kvm/../../../virt/kvm/kvm_main.c:1395:1: error: 'weak' attribute ignored [-Werror=attributes]
arch/powerpc/kvm/../../../virt/kvm/kvm_main.c:1395:1: error: '__used__' attribute ignored [-Werror=attributes]
arch/powerpc/kvm/../../../virt/kvm/kvm_main.c:1395:1: error: '__used__' attribute ignored [-Werror=attributes]
arch/powerpc/kvm/../../../virt/kvm/kvm_main.c:1403:1: error: 'weak' attribute ignored [-Werror=attributes]
arch/powerpc/kvm/../../../virt/kvm/kvm_main.c:1403:1: error: '__used__' attribute ignored [-Werror=attributes]
arch/powerpc/kvm/../../../virt/kvm/kvm_main.c:1403:1: error: '__used__' attribute ignored [-Werror=attributes]
arch/powerpc/kvm/../../../virt/kvm/kvm_main.c:1410:1: error: 'weak' attribute ignored [-Werror=attributes]
arch/powerpc/kvm/../../../virt/kvm/kvm_main.c:1410:1: error: '__used__' attribute ignored [-Werror=attributes]
arch/powerpc/kvm/../../../virt/kvm/kvm_main.c:1410:1: error: '__used__' attribute ignored [-Werror=attributes]
arch/powerpc/kvm/../../../virt/kvm/kvm_main.c:1416:1: error: 'weak' attribute ignored [-Werror=attributes]
arch/powerpc/kvm/../../../virt/kvm/kvm_main.c:1416:1: error: '__used__' attribute ignored [-Werror=attributes]
arch/powerpc/kvm/../../../virt/kvm/kvm_main.c:1416:1: error: '__used__' attribute ignored [-Werror=attributes]
arch/powerpc/kvm/../../../virt/kvm/kvm_main.c:1426:1: error: 'weak' attribute ignored [-Werror=attributes]
arch/powerpc/kvm/../../../virt/kvm/kvm_main.c:1426:1: error: '__used__' attribute ignored [-Werror=attributes]
arch/powerpc/kvm/../../../virt/kvm/kvm_main.c:1426:1: error: '__used__' attribute ignored [-Werror=attributes]
arch/powerpc/kvm/../../../virt/kvm/kvm_main.c:1433:1: error: 'weak' attribute ignored [-Werror=attributes]
arch/powerpc/kvm/../../../virt/kvm/kvm_main.c:1433:1: error: '__used__' attribute ignored [-Werror=attributes]
arch/powerpc/kvm/../../../virt/kvm/kvm_main.c:1433:1: error: '__used__' attribute ignored [-Werror=attributes]
arch/powerpc/kvm/../../../virt/kvm/kvm_main.c:1440:1: error: 'weak' attribute ignored [-Werror=attributes]
arch/powerpc/kvm/../../../virt/kvm/kvm_main.c:1440:1: error: '__used__' attribute ignored [-Werror=attributes]
arch/powerpc/kvm/../../../virt/kvm/kvm_main.c:1440:1: error: '__used__' attribute ignored [-Werror=attributes]
arch/powerpc/kvm/../../../virt/kvm/kvm_main.c:1464:1: error: 'weak' attribute ignored [-Werror=attributes]
arch/powerpc/kvm/../../../virt/kvm/kvm_main.c:1464:1: error: '__used__' attribute ignored [-Werror=attributes]
arch/powerpc/kvm/../../../virt/kvm/kvm_main.c:1464:1: error: '__used__' attribute ignored [-Werror=attributes]
arch/powerpc/kvm/../../../virt/kvm/kvm_main.c:1484:1: error: 'weak' attribute ignored [-Werror=attributes]
arch/powerpc/kvm/../../../virt/kvm/kvm_main.c:1484:1: error: '__used__' attribute ignored [-Werror=attributes]
arch/powerpc/kvm/../../../virt/kvm/kvm_main.c:1484:1: error: '__used__' attribute ignored [-Werror=attributes]
arch/powerpc/kvm/../../../virt/kvm/kvm_main.c:1504:1: error: 'weak' attribute ignored [-Werror=attributes]
arch/powerpc/kvm/../../../virt/kvm/kvm_main.c:1504:1: error: '__used__' attribute ignored [-Werror=attributes]
arch/powerpc/kvm/../../../virt/kvm/kvm_main.c:1504:1: error: '__used__' attribute ignored [-Werror=attributes]
arch/powerpc/kvm/../../../virt/kvm/kvm_main.c:1521:1: error: 'weak' attribute ignored [-Werror=attributes]
arch/powerpc/kvm/../../../virt/kvm/kvm_main.c:1521:1: error: '__used__' attribute ignored [-Werror=attributes]
arch/powerpc/kvm/../../../virt/kvm/kvm_main.c:1521:1: error: '__used__' attribute ignored [-Werror=attributes]
arch/powerpc/kvm/../../../virt/kvm/kvm_main.c:1561:1: error: 'weak' attribute ignored [-Werror=attributes]
arch/powerpc/kvm/../../../virt/kvm/kvm_main.c:1561:1: error: '__used__' attribute ignored [-Werror=attributes]
arch/powerpc/kvm/../../../virt/kvm/kvm_main.c:1561:1: error: '__used__' attribute ignored [-Werror=attributes]
arch/powerpc/kvm/../../../virt/kvm/kvm_main.c:1582:1: error: 'weak' attribute ignored [-Werror=attributes]
arch/powerpc/kvm/../../../virt/kvm/kvm_main.c:1582:1: error: '__used__' attribute ignored [-Werror=attributes]
arch/powerpc/kvm/../../../virt/kvm/kvm_main.c:1582:1: error: '__used__' attribute ignored [-Werror=attributes]
arch/powerpc/kvm/../../../virt/kvm/kvm_main.c:1602:1: error: 'weak' attribute ignored [-Werror=attributes]
arch/powerpc/kvm/../../../virt/kvm/kvm_main.c:1602:1: error: '__used__' attribute ignored [-Werror=attributes]
arch/powerpc/kvm/../../../virt/kvm/kvm_main.c:1602:1: error: '__used__' attribute ignored [-Werror=attributes]
arch/powerpc/kvm/../../../virt/kvm/kvm_main.c:1609:1: error: 'weak' attribute ignored [-Werror=attributes]
arch/powerpc/kvm/../../../virt/kvm/kvm_main.c:1609:1: error: '__used__' attribute ignored [-Werror=attributes]
arch/powerpc/kvm/../../../virt/kvm/kvm_main.c:1609:1: error: '__used__' attribute ignored [-Werror=attributes]
arch/powerpc/kvm/../../../virt/kvm/kvm_main.c:1628:1: error: 'weak' attribute ignored [-Werror=attributes]
arch/powerpc/kvm/../../../virt/kvm/kvm_main.c:1628:1: error: '__used__' attribute ignored [-Werror=attributes]
arch/powerpc/kvm/../../../virt/kvm/kvm_main.c:1628:1: error: '__used__' attribute ignored [-Werror=attributes]
arch/powerpc/kvm/../../../virt/kvm/kvm_main.c:1703:1: error: 'weak' attribute ignored [-Werror=attributes]
arch/powerpc/kvm/../../../virt/kvm/kvm_main.c:1703:1: error: '__used__' attribute ignored [-Werror=attributes]
arch/powerpc/kvm/../../../virt/kvm/kvm_main.c:1703:1: error: '__used__' attribute ignored [-Werror=attributes]
arch/powerpc/kvm/../../../virt/kvm/kvm_main.c:1727:1: error: 'weak' attribute ignored [-Werror=attributes]
arch/powerpc/kvm/../../../virt/kvm/kvm_main.c:1727:1: error: '__used__' attribute ignored [-Werror=attributes]
arch/powerpc/kvm/../../../virt/kvm/kvm_main.c:1727:1: error: '__used__' attribute ignored [-Werror=attributes]
arch/powerpc/kvm/../../../virt/kvm/kvm_main.c:1815:1: error: 'weak' attribute ignored [-Werror=attributes]
arch/powerpc/kvm/../../../virt/kvm/kvm_main.c:1815:1: error: '__used__' attribute ignored [-Werror=attributes]
arch/powerpc/kvm/../../../virt/kvm/kvm_main.c:1815:1: error: '__used__' attribute ignored [-Werror=attributes]
arch/powerpc/kvm/../../../virt/kvm/kvm_main.c:2600:1: error: 'weak' attribute ignored [-Werror=attributes]
arch/powerpc/kvm/../../../virt/kvm/kvm_main.c:2600:1: error: '__used__' attribute ignored [-Werror=attributes]
arch/powerpc/kvm/../../../virt/kvm/kvm_main.c:2600:1: error: '__used__' attribute ignored [-Werror=attributes]
arch/powerpc/kvm/../../../virt/kvm/kvm_main.c:3005:1: error: 'weak' attribute ignored [-Werror=attributes]
arch/powerpc/kvm/../../../virt/kvm/kvm_main.c:3005:1: error: '__used__' attribute ignored [-Werror=attributes]
arch/powerpc/kvm/../../../virt/kvm/kvm_main.c:3005:1: error: '__used__' attribute ignored [-Werror=attributes]
arch/powerpc/kvm/../../../virt/kvm/kvm_main.c:3021:1: error: 'weak' attribute ignored [-Werror=attributes]
arch/powerpc/kvm/../../../virt/kvm/kvm_main.c:3021:1: error: '__used__' attribute ignored [-Werror=attributes]
arch/powerpc/kvm/../../../virt/kvm/kvm_main.c:3021:1: error: '__used__' attribute ignored [-Werror=attributes]
drivers/virtio/virtio_pci.c:324:6: error: 'virtio_pci_config_changed' undeclared (first use in this function)
drivers/virtio/virtio_pci.c:344:7: error: 'virtio_pci_vring_interrupt' undeclared (first use in this function)
drivers/virtio/virtio_pci.c:361:42: error: 'virtio_pci_interrupt' undeclared (first use in this function)
drivers/virtio/virtio_pci.c:650:2: error: 'virtio_pci_restore' undeclared here (not in a function)
drivers/mfd/wm5102-tables.c:1097:7: error: 'ARIZONA_MIC_DETECT_LEVEL_1' undeclared (first use in this function)
drivers/mfd/wm5102-tables.c:1098:7: error: 'ARIZONA_MIC_DETECT_LEVEL_2' undeclared (first use in this function)
drivers/mfd/wm5102-tables.c:1099:7: error: 'ARIZONA_MIC_DETECT_LEVEL_3' undeclared (first use in this function)
drivers/mfd/wm5102-tables.c:1100:7: error: 'ARIZONA_MIC_DETECT_LEVEL_4' undeclared (first use in this function)
drivers/misc/cs5535-mfgpt.c:384:0: error: unterminated argument list invoking macro "MODULE_PARM_DESC"
drivers/misc/cs5535-mfgpt.c:27:1: error: expected '=', ',', ';', 'asm' or '__attribute__' at end of input
drivers/mfd/arizona-core.c:265:4: error: label 'err' used but not defined
include/linux/dmaengine.h:973:1: error: expected identifier or '(' before '>>' token
include/linux/dmaengine.h:973:1: error: expected identifier or '(' before '>>' token
drivers/dma/dmatest.c:950:5: error: implicit declaration of function 'dma_release_channel' [-Werror=implicit-function-declaration]
drivers/extcon/extcon-arizona.c:156:14: error: 'struct arizona_extcon_info' has no member named 'num_micd_modes'
drivers/virtio/virtio_pci.c:124:9: error: implicit declaration of function 'to_vp_device' [-Werror=implicit-function-declaration]
drivers/virtio/virtio_pci.c:454:25: error: 'virtio_pci_notify' undeclared (first use in this function)
drivers/virtio/virtio_pci.c:228:2: error: implicit declaration of function 'virtio_pci_synchronize_vectors' [-Werror=implicit-function-declaration]
drivers/virtio/virtio_pci.c:425:2: error: implicit declaration of function 'virtio_pci_del_vqs' [-Werror=implicit-function-declaration]
drivers/virtio/virtio_pci.c:436:2: error: implicit declaration of function 'virtio_pci_find_vqs' [-Werror=implicit-function-declaration]
drivers/virtio/virtio_pci.c:465:21: error: 'virtio_pci_set_vq_affinity' undeclared here (not in a function)
drivers/virtio/virtio_pci.c:650:2: error: 'virtio_pci_freeze' undeclared here (not in a function)
drivers/media/platform/timblogiw.c:703:2: error: implicit declaration of function 'dma_release_channel' [-Werror=implicit-function-declaration]
drivers/rapidio/rio.c:1205:2: error: implicit declaration of function 'dma_release_channel' [-Werror=implicit-function-declaration]
drivers/usb/renesas_usbhs/fifo.c:1005:3: error: implicit declaration of function 'dma_release_channel' [-Werror=implicit-function-declaration]
drivers/tty/serial/8250/8250_dma.c:162:3: error: implicit declaration of function 'dma_release_channel' [-Werror=implicit-function-declaration]
drivers/tty/serial/pch_uart.c:672:3: error: implicit declaration of function 'dma_release_channel' [-Werror=implicit-function-declaration]
/c/kernel-tests/src/stable/include/linux/signal.h:261:2: error: unknown type name '__sigrestore_t'

[warnings]
sound/pci/hda/patch_sigmatel.c:2219:24: warning: unused variable 'spec' [-Wunused-variable]
Warning(lib/pci_iomap.c:37): No description found for parameter 'force_nocache'
drivers/misc/cs5535-mfgpt.c:30:3: warning: missing terminating " character [enabled by default]
drivers/misc/cs5535-mfgpt.c:31:31: warning: missing terminating " character [enabled by default]
drivers/mfd/arizona-core.c:259:2: warning: enumeration value 'WM5110' not handled in switch [-Wswitch]
sound/usb/pcm.c:463:45: warning: 'ep' may be used uninitialized in this function [-Wmaybe-uninitialized]
sound/usb/pcm.c:1222:8: warning: unused variable 'oldbytes' [-Wunused-variable]
drivers/virtio/virtio_pci.c:124:37: warning: initialization makes pointer from integer without a cast [enabled by default]
drivers/virtio/virtio_pci.c:136:37: warning: initialization makes pointer from integer without a cast [enabled by default]
drivers/virtio/virtio_pci.c:150:37: warning: initialization makes pointer from integer without a cast [enabled by default]
drivers/virtio/virtio_pci.c:157:37: warning: initialization makes pointer from integer without a cast [enabled by default]
drivers/virtio/virtio_pci.c:164:37: warning: initialization makes pointer from integer without a cast [enabled by default]
drivers/virtio/virtio_pci.c:171:37: warning: initialization makes pointer from integer without a cast [enabled by default]
drivers/virtio/virtio_pci.c:178:37: warning: initialization makes pointer from integer without a cast [enabled by default]
drivers/virtio/virtio_pci.c:185:37: warning: initialization makes pointer from integer without a cast [enabled by default]
drivers/virtio/virtio_pci.c:192:37: warning: initialization makes pointer from integer without a cast [enabled by default]
drivers/virtio/virtio_pci.c:199:37: warning: initialization makes pointer from integer without a cast [enabled by default]
drivers/virtio/virtio_pci.c:207:37: warning: initialization makes pointer from integer without a cast [enabled by default]
drivers/virtio/virtio_pci.c:213:37: warning: initialization makes pointer from integer without a cast [enabled by default]
drivers/virtio/virtio_pci.c:222:37: warning: initialization makes pointer from integer without a cast [enabled by default]
drivers/virtio/virtio_pci.c:234:37: warning: initialization makes pointer from integer without a cast [enabled by default]
drivers/virtio/virtio_pci.c:246:37: warning: initialization makes pointer from integer without a cast [enabled by default]
drivers/virtio/virtio_pci.c:284:37: warning: initialization makes pointer from integer without a cast [enabled by default]
drivers/virtio/virtio_pci.c:359:37: warning: initialization makes pointer from integer without a cast [enabled by default]
drivers/virtio/virtio_pci.c:396:37: warning: initialization makes pointer from integer without a cast [enabled by default]
drivers/virtio/virtio_pci.c:525:37: warning: initialization makes pointer from integer without a cast [enabled by default]
drivers/virtio/virtio_pci.c:561:37: warning: initialization makes pointer from integer without a cast [enabled by default]
drivers/virtio/virtio_pci.c:585:37: warning: initialization makes pointer from integer without a cast [enabled by default]
drivers/virtio/virtio_pci.c:679:37: warning: initialization makes pointer from integer without a cast [enabled by default]
drivers/virtio/virtio_pci.c:692:37: warning: initialization makes pointer from integer without a cast [enabled by default]
drivers/staging/speakup/kobjects.c:665:39: warning: 'value' may be used uninitialized in this function [-Wmaybe-uninitialized]
drivers/net/virtio_net.c:1257:4: warning: 'v' may be used uninitialized in this function [-Wmaybe-uninitialized]

[sparse]
drivers/tty/serial/8250/8250_core.c:2902:28: sparse: context imbalance in 'serial8250_console_write' - unexpected unlock
drivers/net/wireless/rtlwifi/ps.c:676:27: sparse: cast to restricted __le16
drivers/net/wireless/rtlwifi/ps.c:705:50: sparse: cast to restricted __le32
drivers/net/wireless/rtlwifi/ps.c:708:50: sparse: cast to restricted __le32
drivers/net/wireless/rtlwifi/ps.c:711:50: sparse: cast to restricted __le32
drivers/net/wireless/rtlwifi/ps.c:768:27: sparse: cast to restricted __le16
drivers/net/wireless/rtlwifi/ps.c:797:58: sparse: cast to restricted __le32
drivers/net/wireless/rtlwifi/ps.c:800:58: sparse: cast to restricted __le32
drivers/net/wireless/rtlwifi/ps.c:803:58: sparse: cast to restricted __le32
arch/x86/kernel/cpu/perf_event_intel.c:167:18: sparse: symbol 'nhm_events_attrs' was not declared. Should it be static?
arch/x86/kernel/cpu/perf_event_intel.c:172:18: sparse: symbol 'snb_events_attrs' was not declared. Should it be static?
drivers/misc/cs5535-mfgpt.c:31:8: sparse: Newline in string or character constant
drivers/dma/dmaengine.c:561:17: sparse: symbol 'dma_request_slave_channel' redeclared with different type (originally declared at include/linux/dmaengine.h:972) - incompatible argument 2 (different modifiers)
include/linux/dmaengine.h:973:1: sparse: Expected ; at the end of type declaration
include/linux/dmaengine.h:973:1: sparse: got >>
drivers/tty/serial/8250/8250_dma.c:162:17: sparse: undefined identifier 'dma_release_channel'
drivers/dma/dmatest.c:950:33: sparse: undefined identifier 'dma_release_channel'
drivers/usb/renesas_usbhs/fifo.c:1005:17: sparse: undefined identifier 'dma_release_channel'
drivers/rapidio/rio.c:1205:9: sparse: undefined identifier 'dma_release_channel'
drivers/media/platform/timblogiw.c:703:9: sparse: undefined identifier 'dma_release_channel'
drivers/media/platform/m2m-deinterlace.c:1072:9: sparse: undefined identifier 'dma_release_channel'
drivers/spi/spi-dw-mid.c:84:9: sparse: undefined identifier 'dma_release_channel'
drivers/spi/spi-pxa2xx-dma.c:347:17: sparse: undefined identifier 'dma_release_channel'
drivers/spi/spi-topcliff-pch.c:961:17: sparse: undefined identifier 'dma_release_channel'
drivers/ata/pata_arasan_cf.c:546:9: sparse: undefined identifier 'dma_release_channel'
drivers/net/ethernet/micrel/ks8842.c:903:17: sparse: undefined identifier 'dma_release_channel'
drivers/tty/serial/pch_uart.c:672:17: sparse: undefined identifier 'dma_release_channel'
drivers/net/wireless/rtlwifi/rtl8188ee/dm.c:30:10: sparse: unable to open 'wifi.h'
drivers/net/wireless/rtlwifi/rtl8188ee/fw.c:30:10: sparse: unable to open 'wifi.h'
drivers/net/wireless/rtlwifi/rtl8188ee/hw.c:30:10: sparse: unable to open 'wifi.h'
drivers/net/wireless/rtlwifi/rtl8188ee/led.c:30:10: sparse: unable to open 'wifi.h'
drivers/net/wireless/rtlwifi/rtl8188ee/phy.c:30:10: sparse: unable to open 'wifi.h'
drivers/net/wireless/rtlwifi/rtl8188ee/pwrseqcmd.h:33:10: sparse: unable to open 'wifi.h'
drivers/net/wireless/rtlwifi/rtl8188ee/rf.c:30:10: sparse: unable to open 'wifi.h'
drivers/net/wireless/rtlwifi/rtl8188ee/sw.c:30:10: sparse: unable to open 'wifi.h'
drivers/net/wireless/rtlwifi/rtl8188ee/trx.c:30:10: sparse: unable to open 'wifi.h'
drivers/virtio/virtio_pci.c:125:44: sparse: undefined identifier 'to_vp_device'
drivers/virtio/virtio_pci.c:236:9: sparse: undefined identifier 'virtio_pci_synchronize_vectors'
drivers/virtio/virtio_pci.c:325:53: sparse: undefined identifier 'virtio_pci_notify'
drivers/virtio/virtio_pci.c:433:9: sparse: undefined identifier 'virtio_pci_del_vqs'
drivers/virtio/virtio_pci.c:444:16: sparse: undefined identifier 'virtio_pci_find_vqs'
drivers/virtio/virtio_pci.c:473:28: sparse: undefined identifier 'virtio_pci_set_vq_affinity'
drivers/virtio/virtio_pci.c:685:9: sparse: undefined identifier 'virtio_pci_freeze'

[smatch]
net/sctp/socket.c:6189 sctp_poll() warn: suspicious bitop condition
net/bluetooth/af_bluetooth.c:426 bt_sock_poll() warn: suspicious bitop condition
net/core/datagram.c:753 datagram_poll() warn: suspicious bitop condition
net/nfc/llcp/sock.c:525 llcp_sock_poll() warn: suspicious bitop condition
net/unix/af_unix.c:2200 unix_dgram_poll() warn: suspicious bitop condition
kernel/workqueue.c:4001 wq_update_unbound_numa() error: double unlock 'mutex:&wq->mutex'

[coccinelle]
drivers/spi/spi-pxa2xx.c:1086:18-42: ERROR: deprecated devm_request_and_ioremap() API used on line 1086
net/wireless/nl80211.c:967:1-7: preceding lock on line 801
drivers/net/can/mcp251x.c:1049:6-22: ERROR: reference preceded by free on line 1044
block/blk-core.c:856:3-9: preceding lock on line 875
drivers/dma/dmatest.c:805:1-7: Replace memcpy with struct assignment
drivers/dma/dmatest.c:941:1-7: Replace memcpy with struct assignment

[cppcheck]
drivers/media/pci/cx18/cx18-driver.h:70: error: "This driver requires kernel PCI support."
drivers/media/pci/cx18/cx18-driver.h:70: error: "This driver requires kernel PCI support."
drivers/net/can/grcan.c:217: error: "Invalid default buffer size"
net/dccp/sysctl.c:18: error: This file should not be compiled without CONFIG_SYSCTL defined
net/ipx/sysctl_net_ipx.c:14: error: This file should not be compiled without CONFIG_SYSCTL defined
net/llc/sysctl_net_llc.c:14: error: This file should not be compiled without CONFIG_SYSCTL defined
drivers/net/wireless/rtlwifi/rtl8188ee/dm.c:30: information: Include file: "wifi.h" not found.
drivers/net/wireless/rtlwifi/rtl8188ee/dm.c:31: information: Include file: "base.h" not found.
drivers/net/wireless/rtlwifi/rtl8188ee/dm.c:32: information: Include file: "pci.h" not found.
drivers/net/wireless/rtlwifi/rtl8188ee/dm.c:1081: style: Same expression on both sides of '!='.
drivers/net/wireless/rtlwifi/rtl8188ee/dm.c:1433: style: Same expression on both sides of '||'.
drivers/net/wireless/rtlwifi/rtl8188ee/dm.c:175: style: The scope of the variable 'ele_a' can be reduced
drivers/net/wireless/rtlwifi/rtl8188ee/dm.c:175: style: The scope of the variable 'ele_c' can be reduced
drivers/net/wireless/rtlwifi/rtl8188ee/dm.c:175: style: The scope of the variable 'value32' can be reduced
drivers/net/wireless/rtlwifi/rtl8188ee/dm.c:275: style: The scope of the variable 'i' can be reduced
drivers/net/wireless/rtlwifi/rtl8188ee/dm.c:877: style: The scope of the variable 'ofdm_index' can be reduced
drivers/net/wireless/rtlwifi/rtl8188ee/dm.c:877: style: The scope of the variable 'cck_index' can be reduced
drivers/net/wireless/rtlwifi/rtl8188ee/dm.c:888: style: The scope of the variable 'del_tbl_idx' can be reduced
drivers/net/wireless/rtlwifi/rtl8188ee/dm.c:1166: style: The scope of the variable 'sta' can be reduced
drivers/net/wireless/rtlwifi/rtl8188ee/dm.c:1576: style: The scope of the variable 'drv_priv' can be reduced
drivers/net/wireless/rtlwifi/rtl8188ee/dm.c:1641: style: The scope of the variable 'bpkt_filter_match' can be reduced
drivers/net/wireless/rtlwifi/rtl8188ee/fw.c:30: information: Include file: "wifi.h" not found.
drivers/net/wireless/rtlwifi/rtl8188ee/fw.c:31: information: Include file: "pci.h" not found.
drivers/net/wireless/rtlwifi/rtl8188ee/fw.c:32: information: Include file: "base.h" not found.
drivers/net/wireless/rtlwifi/rtl8188ee/hw.c:30: information: Include file: "wifi.h" not found.
drivers/net/wireless/rtlwifi/rtl8188ee/hw.c:31: information: Include file: "efuse.h" not found.
drivers/net/wireless/rtlwifi/rtl8188ee/hw.c:32: information: Include file: "base.h" not found.
drivers/net/wireless/rtlwifi/rtl8188ee/hw.c:33: information: Include file: "regd.h" not found.
drivers/net/wireless/rtlwifi/rtl8188ee/hw.c:34: information: Include file: "cam.h" not found.
drivers/net/wireless/rtlwifi/rtl8188ee/hw.c:35: information: Include file: "ps.h" not found.
drivers/net/wireless/rtlwifi/rtl8188ee/hw.c:36: information: Include file: "pci.h" not found.
drivers/net/wireless/rtlwifi/rtl8188ee/pwrseqcmd.h:33: information: Include file: "wifi.h" not found.
drivers/net/wireless/rtlwifi/rtl8188ee/hw.c:480: warning: Redundant assignment of "reg" in switch
drivers/net/wireless/rtlwifi/rtl8188ee/hw.c:622: style: The scope of the variable 'recover' can be reduced
drivers/net/wireless/rtlwifi/rtl8188ee/hw.c:1706: style: The scope of the variable 'jj' can be reduced
drivers/net/wireless/rtlwifi/rtl8188ee/hw.c:2321: style: The scope of the variable 'is_pairwise' can be reduced
drivers/net/wireless/rtlwifi/rtl8188ee/hw.c:1227: style: Expression '(X & 0xfc) = 0x3' is always false.
drivers/net/wireless/rtlwifi/rtl8188ee/led.c:30: information: Include file: "wifi.h" not found.
drivers/net/wireless/rtlwifi/rtl8188ee/led.c:31: information: Include file: "pci.h" not found.
drivers/net/wireless/rtlwifi/rtl8188ee/phy.c:30: information: Include file: "wifi.h" not found.
drivers/net/wireless/rtlwifi/rtl8188ee/phy.c:31: information: Include file: "pci.h" not found.
drivers/net/wireless/rtlwifi/rtl8188ee/phy.c:32: information: Include file: "ps.h" not found.
drivers/net/wireless/rtlwifi/rtl8188ee/phy.c:140: style: The scope of the variable 'i' can be reduced
drivers/net/wireless/rtlwifi/rtl8188ee/phy.c:143: style: The scope of the variable 'v1' can be reduced
drivers/net/wireless/rtlwifi/rtl8188ee/phy.c:143: style: The scope of the variable 'v2' can be reduced
drivers/net/wireless/rtlwifi/rtl8188ee/phy.c:511: style: The scope of the variable 'originalvalue' can be reduced
drivers/net/wireless/rtlwifi/rtl8188ee/phy.c:511: style: The scope of the variable 'bitshift' can be reduced
drivers/net/wireless/rtlwifi/rtl8188ee/phy.c:562: style: The scope of the variable 'original_value' can be reduced
drivers/net/wireless/rtlwifi/rtl8188ee/phy.c:562: style: The scope of the variable 'bitshift' can be reduced
drivers/net/wireless/rtlwifi/rtl8188ee/phy.c:1458: style: The scope of the variable 'oldval_0' can be reduced
drivers/net/wireless/rtlwifi/rtl8188ee/phy.c:1458: style: The scope of the variable 'x' can be reduced
drivers/net/wireless/rtlwifi/rtl8188ee/phy.c:1458: style: The scope of the variable 'tx0_a' can be reduced
drivers/net/wireless/rtlwifi/rtl8188ee/phy.c:1458: style: The scope of the variable 'reg' can be reduced
drivers/net/wireless/rtlwifi/rtl8188ee/phy.c:1459: style: The scope of the variable 'y' can be reduced
drivers/net/wireless/rtlwifi/rtl8188ee/phy.c:1459: style: The scope of the variable 'tx0_c' can be reduced
drivers/net/wireless/rtlwifi/rtl8188ee/pwrseqcmd.h:33: information: Include file: "wifi.h" not found.
drivers/net/wireless/rtlwifi/rtl8188ee/rf.c:30: information: Include file: "wifi.h" not found.
drivers/net/wireless/rtlwifi/rtl8188ee/sw.c:30: information: Include file: "wifi.h" not found.
drivers/net/wireless/rtlwifi/rtl8188ee/sw.c:31: information: Include file: "core.h" not found.
drivers/net/wireless/rtlwifi/rtl8188ee/sw.c:32: information: Include file: "pci.h" not found.
drivers/net/wireless/rtlwifi/rtl8188ee/trx.c:30: information: Include file: "wifi.h" not found.
drivers/net/wireless/rtlwifi/rtl8188ee/trx.c:31: information: Include file: "pci.h" not found.
drivers/net/wireless/rtlwifi/rtl8188ee/trx.c:32: information: Include file: "base.h" not found.
drivers/net/wireless/rtlwifi/rtl8188ee/trx.c:33: information: Include file: "stats.h" not found.
drivers/net/wireless/rtlwifi/rtl8188ee/trx.c:64: style: The scope of the variable 'rx_pwr' can be reduced
drivers/net/wireless/rtlwifi/rtl8188ee/trx.c:383: style: The scope of the variable 'p_drvinfo' can be reduced
drivers/net/wireless/rtlwifi/rtl8188ee/trx.c:384: style: The scope of the variable 'hdr' can be reduced
drivers/net/wireless/rtlwifi/rtl8188ee/dm.c:30: information: Include file: "wifi.h" not found.
drivers/net/wireless/rtlwifi/rtl8188ee/dm.c:31: information: Include file: "base.h" not found.
drivers/net/wireless/rtlwifi/rtl8188ee/dm.c:32: information: Include file: "pci.h" not found.
drivers/net/wireless/rtlwifi/rtl8188ee/dm.c:1081: style: Same expression on both sides of '!='.
drivers/net/wireless/rtlwifi/rtl8188ee/dm.c:1433: style: Same expression on both sides of '||'.
drivers/net/wireless/rtlwifi/rtl8188ee/dm.c:175: style: The scope of the variable 'ele_a' can be reduced
drivers/net/wireless/rtlwifi/rtl8188ee/dm.c:175: style: The scope of the variable 'ele_c' can be reduced
drivers/net/wireless/rtlwifi/rtl8188ee/dm.c:175: style: The scope of the variable 'value32' can be reduced
drivers/net/wireless/rtlwifi/rtl8188ee/dm.c:275: style: The scope of the variable 'i' can be reduced
drivers/net/wireless/rtlwifi/rtl8188ee/dm.c:877: style: The scope of the variable 'ofdm_index' can be reduced
drivers/net/wireless/rtlwifi/rtl8188ee/dm.c:877: style: The scope of the variable 'cck_index' can be reduced
drivers/net/wireless/rtlwifi/rtl8188ee/dm.c:888: style: The scope of the variable 'del_tbl_idx' can be reduced
drivers/net/wireless/rtlwifi/rtl8188ee/dm.c:1166: style: The scope of the variable 'sta' can be reduced
drivers/net/wireless/rtlwifi/rtl8188ee/dm.c:1576: style: The scope of the variable 'drv_priv' can be reduced
drivers/net/wireless/rtlwifi/rtl8188ee/dm.c:1641: style: The scope of the variable 'bpkt_filter_match' can be reduced
drivers/net/wireless/rtlwifi/rtl8188ee/fw.c:30: information: Include file: "wifi.h" not found.
drivers/net/wireless/rtlwifi/rtl8188ee/fw.c:31: information: Include file: "pci.h" not found.
drivers/net/wireless/rtlwifi/rtl8188ee/fw.c:32: information: Include file: "base.h" not found.
drivers/net/wireless/rtlwifi/rtl8188ee/hw.c:30: information: Include file: "wifi.h" not found.
drivers/net/wireless/rtlwifi/rtl8188ee/hw.c:31: information: Include file: "efuse.h" not found.
drivers/net/wireless/rtlwifi/rtl8188ee/hw.c:32: information: Include file: "base.h" not found.
drivers/net/wireless/rtlwifi/rtl8188ee/hw.c:33: information: Include file: "regd.h" not found.
drivers/net/wireless/rtlwifi/rtl8188ee/hw.c:34: information: Include file: "cam.h" not found.
drivers/net/wireless/rtlwifi/rtl8188ee/hw.c:35: information: Include file: "ps.h" not found.
drivers/net/wireless/rtlwifi/rtl8188ee/hw.c:36: information: Include file: "pci.h" not found.
drivers/net/wireless/rtlwifi/rtl8188ee/pwrseqcmd.h:33: information: Include file: "wifi.h" not found.
drivers/net/wireless/rtlwifi/rtl8188ee/hw.c:480: warning: Redundant assignment of "reg" in switch
drivers/net/wireless/rtlwifi/rtl8188ee/hw.c:622: style: The scope of the variable 'recover' can be reduced
drivers/net/wireless/rtlwifi/rtl8188ee/hw.c:1706: style: The scope of the variable 'jj' can be reduced
drivers/net/wireless/rtlwifi/rtl8188ee/hw.c:2321: style: The scope of the variable 'is_pairwise' can be reduced
drivers/net/wireless/rtlwifi/rtl8188ee/hw.c:1227: style: Expression '(X & 0xfc) = 0x3' is always false.
drivers/net/wireless/rtlwifi/rtl8188ee/led.c:30: information: Include file: "wifi.h" not found.
drivers/net/wireless/rtlwifi/rtl8188ee/led.c:31: information: Include file: "pci.h" not found.
drivers/net/wireless/rtlwifi/rtl8188ee/phy.c:30: information: Include file: "wifi.h" not found.
drivers/net/wireless/rtlwifi/rtl8188ee/phy.c:31: information: Include file: "pci.h" not found.
drivers/net/wireless/rtlwifi/rtl8188ee/phy.c:32: information: Include file: "ps.h" not found.
drivers/net/wireless/rtlwifi/rtl8188ee/phy.c:140: style: The scope of the variable 'i' can be reduced
drivers/net/wireless/rtlwifi/rtl8188ee/phy.c:143: style: The scope of the variable 'v1' can be reduced
drivers/net/wireless/rtlwifi/rtl8188ee/phy.c:143: style: The scope of the variable 'v2' can be reduced
drivers/net/wireless/rtlwifi/rtl8188ee/phy.c:511: style: The scope of the variable 'originalvalue' can be reduced
drivers/net/wireless/rtlwifi/rtl8188ee/phy.c:511: style: The scope of the variable 'bitshift' can be reduced
drivers/net/wireless/rtlwifi/rtl8188ee/phy.c:562: style: The scope of the variable 'original_value' can be reduced
drivers/net/wireless/rtlwifi/rtl8188ee/phy.c:562: style: The scope of the variable 'bitshift' can be reduced
drivers/net/wireless/rtlwifi/rtl8188ee/phy.c:1458: style: The scope of the variable 'oldval_0' can be reduced
drivers/net/wireless/rtlwifi/rtl8188ee/phy.c:1458: style: The scope of the variable 'x' can be reduced
drivers/net/wireless/rtlwifi/rtl8188ee/phy.c:1458: style: The scope of the variable 'tx0_a' can be reduced
drivers/net/wireless/rtlwifi/rtl8188ee/phy.c:1458: style: The scope of the variable 'reg' can be reduced
drivers/net/wireless/rtlwifi/rtl8188ee/phy.c:1459: style: The scope of the variable 'y' can be reduced
drivers/net/wireless/rtlwifi/rtl8188ee/phy.c:1459: style: The scope of the variable 'tx0_c' can be reduced
drivers/net/wireless/rtlwifi/rtl8188ee/pwrseqcmd.h:33: information: Include file: "wifi.h" not found.
drivers/net/wireless/rtlwifi/rtl8188ee/rf.c:30: information: Include file: "wifi.h" not found.
drivers/net/wireless/rtlwifi/rtl8188ee/sw.c:30: information: Include file: "wifi.h" not found.
drivers/net/wireless/rtlwifi/rtl8188ee/sw.c:31: information: Include file: "core.h" not found.
drivers/net/wireless/rtlwifi/rtl8188ee/sw.c:32: information: Include file: "pci.h" not found.
drivers/net/wireless/rtlwifi/rtl8188ee/trx.c:30: information: Include file: "wifi.h" not found.
drivers/net/wireless/rtlwifi/rtl8188ee/trx.c:31: information: Include file: "pci.h" not found.
drivers/net/wireless/rtlwifi/rtl8188ee/trx.c:32: information: Include file: "base.h" not found.
drivers/net/wireless/rtlwifi/rtl8188ee/trx.c:33: information: Include file: "stats.h" not found.
drivers/net/wireless/rtlwifi/rtl8188ee/trx.c:64: style: The scope of the variable 'rx_pwr' can be reduced
drivers/net/wireless/rtlwifi/rtl8188ee/trx.c:383: style: The scope of the variable 'p_drvinfo' can be reduced
drivers/net/wireless/rtlwifi/rtl8188ee/trx.c:384: style: The scope of the variable 'hdr' can be reduced

---
0-DAY kernel build testing backend              Open Source Technology Center
http://lists.01.org/mailman/listinfo/kbuild                 Intel Corporation
