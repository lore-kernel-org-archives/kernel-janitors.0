From: Fengguang Wu <fengguang.wu@intel.com>
Date: Wed, 31 Jul 2013 11:07:44 +0000
Subject: build regressions 2013-07-30
Message-Id: <51f8f000.aK37f1L/7WAFijpS%fengguang.wu@intel.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

[errors]
net/9p/trans_rdma.c:724:15: error: 'rdma_cancelled' undeclared here (not in a function)
drivers/net/ethernet/tile/tilegx.c:484:31: error: 'struct tile_net_info' has no member named 'mpipe'
drivers/net/ethernet/tile/tilegx.c:484:39: error: 'instance' undeclared (first use in this function)
drivers/net/ethernet/tile/tilegx.c:494:33: error: 'struct tile_net_info' has no member named 'mpipe'

[warnings]
kernel/rcutree_plugin.h:2030:1: warning: initialization from incompatible pointer type [enabled by default]
kernel/rcutree_plugin.h:2030:1: warning: (near initialization for '__setup_rcu_nocb_setup.setup_func') [enabled by default]
kernel/rcutree_plugin.h:2037:1: warning: initialization from incompatible pointer type [enabled by default]
kernel/rcutree_plugin.h:2037:1: warning: (near initialization for '__setup_parse_rcu_nocb_poll.setup_func') [enabled by default]
drivers/misc/lkdtm.c:276:1: warning: the frame size of 1028 bytes is larger than 1024 bytes [-Wframe-larger-than=]
drivers/infiniband/hw/cxgb4/mem.c:79:25: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
drivers/scsi/advansys.c:71:2: warning: #warning this driver is still not properly converted to the DMA API [-Wcpp]
drivers/scsi/aic7xxx_old.c:7901:5: warning: case value '257' not in enumerated type 'ahc_chip' [-Wswitch]
drivers/scsi/aic7xxx_old.c:7898:5: warning: case value '513' not in enumerated type 'ahc_chip' [-Wswitch]
drivers/scsi/aic7xxx_old.c:8517:5: warning: case value '257' not in enumerated type 'ahc_chip' [-Wswitch]
drivers/scsi/aic7xxx_old.c:8510:5: warning: case value '513' not in enumerated type 'ahc_chip' [-Wswitch]
mm/page_alloc.c:5112:34: warning: array subscript is below array bounds [-Warray-bounds]
drivers/video/sis/sis_main.c:64:2: warning: #warning Neither CONFIG_FB_SIS_300 nor CONFIG_FB_SIS_315 is set [-Wcpp]
drivers/video/sis/sis_main.c:65:2: warning: #warning sisfb will not work! [-Wcpp]
drivers/video/sis/sis_main.c:64:2: warning: #warning Neither CONFIG_FB_SIS_300 nor CONFIG_FB_SIS_315 is set [-Wcpp]
drivers/video/sis/sis_main.c:65:2: warning: #warning sisfb will not work! [-Wcpp]
WARNING: drivers/net/built-in.o(.data+0x2818): Section mismatch in reference from the variable de4x5_eisa_driver to the function .init.text:de4x5_eisa_probe()
arch/ia64/include/asm/gpio.h:2:2: warning: #warning Include linux/gpio.h instead of asm/gpio.h [-Wcpp]
arch/microblaze/include/asm/gpio.h:2:2: warning: #warning Include linux/gpio.h instead of asm/gpio.h [-Wcpp]
arch/powerpc/include/asm/gpio.h:2:2: warning: #warning Include linux/gpio.h instead of asm/gpio.h [-Wcpp]
drivers/spi/spi-atmel.c:1333:13: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
drivers/spi/spi-atmel.c:1458:19: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
drivers/spi/spi-ep93xx.c:613:3: warning: format '%d' expects argument of type 'int', but argument 3 has type 'size_t' [-Wformat=]
drivers/spi/spi-imx.c:783:2: warning: large integer implicitly truncated to unsigned type [-Woverflow]
drivers/spi/spi-omap-100k.c:503:2: warning: large integer implicitly truncated to unsigned type [-Woverflow]
drivers/spi/spi-omap2-mcspi.c:1319:2: warning: large integer implicitly truncated to unsigned type [-Woverflow]
arch/x86/include/asm/gpio.h:2:2: warning: #warning Include linux/gpio.h instead of asm/gpio.h [-Wcpp]
kernel/rcutree_plugin.h:1896:3: warning: passing argument 1 of 'sprintf' discards 'const' qualifier from pointer target type [enabled by default]
include/linux/init.h:241:16: warning: initialization from incompatible pointer type [enabled by default]
include/linux/init.h:241:16: warning: (near initialization for '__setup_rcu_nocb_setup.setup_func') [enabled by default]
include/linux/init.h:241:16: warning: initialization from incompatible pointer type [enabled by default]
include/linux/init.h:241:16: warning: (near initialization for '__setup_parse_rcu_nocb_poll.setup_func') [enabled by default]

[sparse]
kernel/rcutree_plugin.h:1892:17: sparse: incorrect type in argument 1 (different modifiers) @@    expected char *buf @@    got char cchar *buf @@
kernel/rcutree_plugin.h:2030:1: sparse: incorrect type in initializer (incompatible argument 1 (different modifiers)) @@    expected int ( *setup_func )( ... ) @@    got int ( static [toplint ( *setup_func )( ... ) @@
kernel/rcutree_plugin.h:2037:1: sparse: incorrect type in initializer (incompatible argument 1 (different modifiers)) @@    expected int ( *setup_func )( ... ) @@    got int ( static [toplint ( *setup_func )( ... ) @@
drivers/net/wireless/rt2x00/rt2x00queue.c:939:6: sparse: symbol 'rt2x00queue_pause_queue_nocheck' was not declared. Should it be static?

---
0-DAY kernel build testing backend              Open Source Technology Center
http://lists.01.org/mailman/listinfo/kbuild                 Intel Corporation
