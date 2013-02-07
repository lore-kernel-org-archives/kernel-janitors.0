From: Fengguang Wu <fengguang.wu@intel.com>
Date: Thu, 07 Feb 2013 16:47:59 +0000
Subject: build regressions 2013-02-07
Message-Id: <5113dabf.cQUWCFHWztpDW/pE%fengguang.wu@intel.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

[errors]
drivers/block/rsxx/dma.c:251:2: error: implicit declaration of function 'kmem_cache_free' [-Werror=implicit-function-declaration]
drivers/block/rsxx/dma.c:567:2: error: implicit declaration of function 'kmem_cache_alloc' [-Werror=implicit-function-declaration]
drivers/block/rsxx/dma.c:985:2: error: implicit declaration of function 'KMEM_CACHE' [-Werror=implicit-function-declaration]
drivers/block/rsxx/dma.c:985:29: error: 'rsxx_dma' undeclared (first use in this function)
drivers/block/rsxx/dma.c:985:39: error: 'SLAB_HWCACHE_ALIGN' undeclared (first use in this function)
drivers/block/rsxx/dma.c:995:2: error: implicit declaration of function 'kmem_cache_destroy' [-Werror=implicit-function-declaration]
drivers/tty/serial/imx.c:1221:2: error: implicit declaration of function 'imx_port_ucrs_save' [-Werror=implicit-function-declaration]
drivers/tty/serial/imx.c:1241:2: error: implicit declaration of function 'imx_port_ucrs_restore' [-Werror=implicit-function-declaration]
arch/arm/mach-shmobile/board-marzen.c:401:15: error: 'GPIO_FN_DU0_DR7' undeclared (first use in this function)
arch/arm/mach-shmobile/board-marzen.c:402:15: error: 'GPIO_FN_DU0_DR6' undeclared (first use in this function)
arch/arm/mach-shmobile/board-marzen.c:403:15: error: 'GPIO_FN_DU0_DR5' undeclared (first use in this function)
arch/arm/mach-shmobile/board-marzen.c:404:15: error: 'GPIO_FN_DU0_DR4' undeclared (first use in this function)
arch/arm/mach-shmobile/board-marzen.c:405:15: error: 'GPIO_FN_DU0_DR3' undeclared (first use in this function)
arch/arm/mach-shmobile/board-marzen.c:406:15: error: 'GPIO_FN_DU0_DR2' undeclared (first use in this function)
arch/arm/mach-shmobile/board-marzen.c:407:15: error: 'GPIO_FN_DU0_DR1' undeclared (first use in this function)
arch/arm/mach-shmobile/board-marzen.c:408:15: error: 'GPIO_FN_DU0_DR0' undeclared (first use in this function)
arch/arm/mach-shmobile/board-marzen.c:409:15: error: 'GPIO_FN_DU0_DG7' undeclared (first use in this function)
arch/arm/mach-shmobile/board-marzen.c:410:15: error: 'GPIO_FN_DU0_DG6' undeclared (first use in this function)
arch/arm/mach-shmobile/board-marzen.c:411:15: error: 'GPIO_FN_DU0_DG5' undeclared (first use in this function)
arch/arm/mach-shmobile/board-marzen.c:412:15: error: 'GPIO_FN_DU0_DG4' undeclared (first use in this function)
arch/arm/mach-shmobile/board-marzen.c:413:15: error: 'GPIO_FN_DU0_DG3' undeclared (first use in this function)
arch/arm/mach-shmobile/board-marzen.c:414:15: error: 'GPIO_FN_DU0_DG2' undeclared (first use in this function)
arch/arm/mach-shmobile/board-marzen.c:415:15: error: 'GPIO_FN_DU0_DG1' undeclared (first use in this function)
arch/arm/mach-shmobile/board-marzen.c:416:15: error: 'GPIO_FN_DU0_DG0' undeclared (first use in this function)
arch/arm/mach-shmobile/board-marzen.c:417:15: error: 'GPIO_FN_DU0_DB7' undeclared (first use in this function)
arch/arm/mach-shmobile/board-marzen.c:418:15: error: 'GPIO_FN_DU0_DB6' undeclared (first use in this function)
arch/arm/mach-shmobile/board-marzen.c:419:15: error: 'GPIO_FN_DU0_DB5' undeclared (first use in this function)
arch/arm/mach-shmobile/board-marzen.c:420:15: error: 'GPIO_FN_DU0_DB4' undeclared (first use in this function)
arch/microblaze/pci/iomap.c:13:6: error: redefinition of 'pci_iounmap'
drivers/staging/comedi/drivers/quatech_daqp_cs.c:726:2: error: too few arguments to function 'comedi_pcmcia_enable'

[warnings]
drivers/staging/comedi/drivers/adl_pci9118.c:1953:6: warning: 'virt_to_bus' is deprecated (declared at arch/alpha/include/asm/io.h:113) [-Wdeprecated-declarations]
drivers/staging/comedi/drivers/ni_labpc.c:1248:4: warning: 'virt_to_bus' is deprecated (declared at arch/alpha/include/asm/io.h:113) [-Wdeprecated-declarations]
drivers/staging/comedi/drivers/ni_labpc.c:1476:2: warning: 'virt_to_bus' is deprecated (declared at arch/alpha/include/asm/io.h:113) [-Wdeprecated-declarations]
drivers/staging/comedi/drivers/pcl812.c:1339:3: warning: 'virt_to_bus' is deprecated (declared at arch/alpha/include/asm/io.h:113) [-Wdeprecated-declarations]
drivers/staging/comedi/drivers/pcl812.c:1348:3: warning: 'virt_to_bus' is deprecated (declared at arch/alpha/include/asm/io.h:113) [-Wdeprecated-declarations]
drivers/staging/comedi/drivers/pcl818.c:1806:3: warning: 'virt_to_bus' is deprecated (declared at arch/alpha/include/asm/io.h:113) [-Wdeprecated-declarations]
drivers/staging/comedi/drivers/pcl818.c:1818:5: warning: 'virt_to_bus' is deprecated (declared at arch/alpha/include/asm/io.h:113) [-Wdeprecated-declarations]
drivers/staging/comedi/drivers/pcl816.c:1149:3: warning: 'virt_to_bus' is deprecated (declared at arch/alpha/include/asm/io.h:113) [-Wdeprecated-declarations]
drivers/staging/comedi/drivers/pcl816.c:1162:5: warning: 'virt_to_bus' is deprecated (declared at arch/alpha/include/asm/io.h:113) [-Wdeprecated-declarations]
drivers/staging/comedi/drivers/das1800.c:976:3: warning: 'virt_to_bus' is deprecated (declared at arch/alpha/include/asm/io.h:113) [-Wdeprecated-declarations]
drivers/staging/comedi/drivers/das1800.c:1442:2: warning: 'virt_to_bus' is deprecated (declared at arch/alpha/include/asm/io.h:113) [-Wdeprecated-declarations]
drivers/staging/comedi/drivers/das1800.c:1454:3: warning: 'virt_to_bus' is deprecated (declared at arch/alpha/include/asm/io.h:113) [-Wdeprecated-declarations]
drivers/staging/comedi/drivers/ni_at_a2150.c:302:3: warning: 'virt_to_bus' is deprecated (declared at arch/alpha/include/asm/io.h:113) [-Wdeprecated-declarations]
drivers/staging/comedi/drivers/ni_at_a2150.c:669:2: warning: 'virt_to_bus' is deprecated (declared at arch/alpha/include/asm/io.h:113) [-Wdeprecated-declarations]
drivers/staging/comedi/drivers/dt282x.c:544:2: warning: 'virt_to_bus' is deprecated (declared at arch/alpha/include/asm/io.h:113) [-Wdeprecated-declarations]
drivers/staging/comedi/drivers/dt282x.c:566:2: warning: 'virt_to_bus' is deprecated (declared at arch/alpha/include/asm/io.h:113) [-Wdeprecated-declarations]
drivers/staging/comedi/drivers/addi_apci_3120.c:252:7: warning: 'virt_to_bus' is deprecated (declared at arch/alpha/include/asm/io.h:114) [-Wdeprecated-declarations]
drivers/block/rsxx/dma.c:567:6: warning: assignment makes pointer from integer without a cast [enabled by default]
drivers/block/rsxx/dma.c:601:6: warning: assignment makes pointer from integer without a cast [enabled by default]
drivers/video/backlight/backlight.c:395:2: warning: passing argument 4 of 'class_find_device' from incompatible pointer type [enabled by default]
drivers/staging/vt6656/card.c:798: warning: integer constant is too large for 'unsigned long' type
drivers/cpufreq/intel_pstate.c:577:6: warning: unused variable 'idx' [-Wunused-variable]
drivers/of/base.c:1445:3: warning: passing argument 1 of '_raw_write_unlock_irqrestore' from incompatible pointer type [enabled by default]
drivers/of/base.c:1451:3: warning: passing argument 1 of '_raw_write_unlock_irqrestore' from incompatible pointer type [enabled by default]
drivers/tty/tty_io.c:2919:2: warning: passing argument 4 of 'class_find_device' from incompatible pointer type [enabled by default]
Warning(include/net/cfg80211.h:721): Enum value 'STATION_INFO_RX_BYTES64' not described in enum 'station_info_flags'
Warning(include/net/cfg80211.h:721): Enum value 'STATION_INFO_TX_BYTES64' not described in enum 'station_info_flags'
Warning(include/net/cfg80211.h:721): Enum value 'STATION_INFO_RX_BYTES64' not described in enum 'station_info_flags'
Warning(include/net/cfg80211.h:721): Enum value 'STATION_INFO_TX_BYTES64' not described in enum 'station_info_flags'
Warning(include/net/cfg80211.h:721): Enum value 'STATION_INFO_RX_BYTES64' not described in enum 'station_info_flags'
Warning(include/net/cfg80211.h:721): Enum value 'STATION_INFO_TX_BYTES64' not described in enum 'station_info_flags'
Warning(include/net/cfg80211.h:721): Enum value 'STATION_INFO_RX_BYTES64' not described in enum 'station_info_flags'
Warning(include/net/cfg80211.h:721): Enum value 'STATION_INFO_TX_BYTES64' not described in enum 'station_info_flags'
Warning(include/net/cfg80211.h:721): Enum value 'STATION_INFO_RX_BYTES64' not described in enum 'station_info_flags'
Warning(include/net/cfg80211.h:721): Enum value 'STATION_INFO_TX_BYTES64' not described in enum 'station_info_flags'
Warning(include/net/cfg80211.h:721): Enum value 'STATION_INFO_RX_BYTES64' not described in enum 'station_info_flags'
Warning(include/net/cfg80211.h:721): Enum value 'STATION_INFO_TX_BYTES64' not described in enum 'station_info_flags'
Warning(include/net/cfg80211.h:721): Enum value 'STATION_INFO_RX_BYTES64' not described in enum 'station_info_flags'
Warning(include/net/cfg80211.h:721): Enum value 'STATION_INFO_TX_BYTES64' not described in enum 'station_info_flags'
Warning(include/net/cfg80211.h:721): Enum value 'STATION_INFO_RX_BYTES64' not described in enum 'station_info_flags'
Warning(include/net/cfg80211.h:721): Enum value 'STATION_INFO_TX_BYTES64' not described in enum 'station_info_flags'
Warning(include/net/cfg80211.h:721): Enum value 'STATION_INFO_RX_BYTES64' not described in enum 'station_info_flags'
Warning(include/net/cfg80211.h:721): Enum value 'STATION_INFO_TX_BYTES64' not described in enum 'station_info_flags'
Warning(include/net/cfg80211.h:721): Enum value 'STATION_INFO_RX_BYTES64' not described in enum 'station_info_flags'
Warning(include/net/cfg80211.h:721): Enum value 'STATION_INFO_TX_BYTES64' not described in enum 'station_info_flags'
Warning(include/net/cfg80211.h:721): Enum value 'STATION_INFO_RX_BYTES64' not described in enum 'station_info_flags'
Warning(include/net/cfg80211.h:721): Enum value 'STATION_INFO_TX_BYTES64' not described in enum 'station_info_flags'
Warning(include/net/cfg80211.h:721): Enum value 'STATION_INFO_RX_BYTES64' not described in enum 'station_info_flags'
Warning(include/net/cfg80211.h:721): Enum value 'STATION_INFO_TX_BYTES64' not described in enum 'station_info_flags'
Warning(include/net/cfg80211.h:721): Enum value 'STATION_INFO_RX_BYTES64' not described in enum 'station_info_flags'
Warning(include/net/cfg80211.h:721): Enum value 'STATION_INFO_TX_BYTES64' not described in enum 'station_info_flags'
Warning(include/net/cfg80211.h:721): Enum value 'STATION_INFO_RX_BYTES64' not described in enum 'station_info_flags'
Warning(include/net/cfg80211.h:721): Enum value 'STATION_INFO_TX_BYTES64' not described in enum 'station_info_flags'
Warning(include/net/cfg80211.h:721): Enum value 'STATION_INFO_RX_BYTES64' not described in enum 'station_info_flags'
Warning(include/net/cfg80211.h:721): Enum value 'STATION_INFO_TX_BYTES64' not described in enum 'station_info_flags'
Warning(include/net/cfg80211.h:721): Enum value 'STATION_INFO_RX_BYTES64' not described in enum 'station_info_flags'
Warning(include/net/cfg80211.h:721): Enum value 'STATION_INFO_TX_BYTES64' not described in enum 'station_info_flags'
Warning(include/net/cfg80211.h:721): Enum value 'STATION_INFO_RX_BYTES64' not described in enum 'station_info_flags'
Warning(include/net/cfg80211.h:721): Enum value 'STATION_INFO_TX_BYTES64' not described in enum 'station_info_flags'
Warning(include/net/cfg80211.h:721): Enum value 'STATION_INFO_RX_BYTES64' not described in enum 'station_info_flags'
Warning(include/net/cfg80211.h:721): Enum value 'STATION_INFO_TX_BYTES64' not described in enum 'station_info_flags'
Warning(include/net/cfg80211.h:721): Enum value 'STATION_INFO_RX_BYTES64' not described in enum 'station_info_flags'
Warning(include/net/cfg80211.h:721): Enum value 'STATION_INFO_TX_BYTES64' not described in enum 'station_info_flags'
Warning(include/net/cfg80211.h:721): Enum value 'STATION_INFO_RX_BYTES64' not described in enum 'station_info_flags'
Warning(include/net/cfg80211.h:721): Enum value 'STATION_INFO_TX_BYTES64' not described in enum 'station_info_flags'
Warning(include/net/cfg80211.h:721): Enum value 'STATION_INFO_RX_BYTES64' not described in enum 'station_info_flags'
Warning(include/net/cfg80211.h:721): Enum value 'STATION_INFO_TX_BYTES64' not described in enum 'station_info_flags'
Warning(include/net/cfg80211.h:721): Enum value 'STATION_INFO_RX_BYTES64' not described in enum 'station_info_flags'
Warning(include/net/cfg80211.h:721): Enum value 'STATION_INFO_TX_BYTES64' not described in enum 'station_info_flags'
Warning(include/net/cfg80211.h:721): Enum value 'STATION_INFO_RX_BYTES64' not described in enum 'station_info_flags'
Warning(include/net/cfg80211.h:721): Enum value 'STATION_INFO_TX_BYTES64' not described in enum 'station_info_flags'
Warning(include/net/cfg80211.h:721): Enum value 'STATION_INFO_RX_BYTES64' not described in enum 'station_info_flags'
Warning(include/net/cfg80211.h:721): Enum value 'STATION_INFO_TX_BYTES64' not described in enum 'station_info_flags'
Warning(include/net/cfg80211.h:721): Enum value 'STATION_INFO_RX_BYTES64' not described in enum 'station_info_flags'
Warning(include/net/cfg80211.h:721): Enum value 'STATION_INFO_TX_BYTES64' not described in enum 'station_info_flags'
Warning(include/net/cfg80211.h:721): Enum value 'STATION_INFO_RX_BYTES64' not described in enum 'station_info_flags'
Warning(include/net/cfg80211.h:721): Enum value 'STATION_INFO_TX_BYTES64' not described in enum 'station_info_flags'
Warning(include/net/cfg80211.h:721): Enum value 'STATION_INFO_RX_BYTES64' not described in enum 'station_info_flags'
Warning(include/net/cfg80211.h:721): Enum value 'STATION_INFO_TX_BYTES64' not described in enum 'station_info_flags'
Warning(include/net/cfg80211.h:721): Enum value 'STATION_INFO_RX_BYTES64' not described in enum 'station_info_flags'
Warning(include/net/cfg80211.h:721): Enum value 'STATION_INFO_TX_BYTES64' not described in enum 'station_info_flags'
Warning(include/net/cfg80211.h:721): Enum value 'STATION_INFO_RX_BYTES64' not described in enum 'station_info_flags'
Warning(include/net/cfg80211.h:721): Enum value 'STATION_INFO_TX_BYTES64' not described in enum 'station_info_flags'
Warning(include/net/cfg80211.h:721): Enum value 'STATION_INFO_RX_BYTES64' not described in enum 'station_info_flags'
Warning(include/net/cfg80211.h:721): Enum value 'STATION_INFO_TX_BYTES64' not described in enum 'station_info_flags'
Warning(include/net/cfg80211.h:721): Enum value 'STATION_INFO_RX_BYTES64' not described in enum 'station_info_flags'
Warning(include/net/cfg80211.h:721): Enum value 'STATION_INFO_TX_BYTES64' not described in enum 'station_info_flags'
Warning(include/net/cfg80211.h:721): Enum value 'STATION_INFO_RX_BYTES64' not described in enum 'station_info_flags'
Warning(include/net/cfg80211.h:721): Enum value 'STATION_INFO_TX_BYTES64' not described in enum 'station_info_flags'
Warning(include/net/cfg80211.h:721): Enum value 'STATION_INFO_RX_BYTES64' not described in enum 'station_info_flags'
Warning(include/net/cfg80211.h:721): Enum value 'STATION_INFO_TX_BYTES64' not described in enum 'station_info_flags'
Warning(include/net/cfg80211.h:721): Enum value 'STATION_INFO_RX_BYTES64' not described in enum 'station_info_flags'
Warning(include/net/cfg80211.h:721): Enum value 'STATION_INFO_TX_BYTES64' not described in enum 'station_info_flags'
Warning(include/net/cfg80211.h:721): Enum value 'STATION_INFO_RX_BYTES64' not described in enum 'station_info_flags'
Warning(include/net/cfg80211.h:721): Enum value 'STATION_INFO_TX_BYTES64' not described in enum 'station_info_flags'
Warning(include/net/cfg80211.h:721): Enum value 'STATION_INFO_RX_BYTES64' not described in enum 'station_info_flags'
Warning(include/net/cfg80211.h:721): Enum value 'STATION_INFO_TX_BYTES64' not described in enum 'station_info_flags'
Warning(include/net/cfg80211.h:721): Enum value 'STATION_INFO_RX_BYTES64' not described in enum 'station_info_flags'
Warning(include/net/cfg80211.h:721): Enum value 'STATION_INFO_TX_BYTES64' not described in enum 'station_info_flags'
Warning(include/net/cfg80211.h:721): Enum value 'STATION_INFO_RX_BYTES64' not described in enum 'station_info_flags'
Warning(include/net/cfg80211.h:721): Enum value 'STATION_INFO_TX_BYTES64' not described in enum 'station_info_flags'
Warning(include/net/cfg80211.h:721): Enum value 'STATION_INFO_RX_BYTES64' not described in enum 'station_info_flags'
Warning(include/net/cfg80211.h:721): Enum value 'STATION_INFO_TX_BYTES64' not described in enum 'station_info_flags'
Warning(include/net/cfg80211.h:721): Enum value 'STATION_INFO_RX_BYTES64' not described in enum 'station_info_flags'
Warning(include/net/cfg80211.h:721): Enum value 'STATION_INFO_TX_BYTES64' not described in enum 'station_info_flags'
Warning(include/net/cfg80211.h:721): Enum value 'STATION_INFO_RX_BYTES64' not described in enum 'station_info_flags'
Warning(include/net/cfg80211.h:721): Enum value 'STATION_INFO_TX_BYTES64' not described in enum 'station_info_flags'
Warning(include/net/cfg80211.h:721): Enum value 'STATION_INFO_RX_BYTES64' not described in enum 'station_info_flags'
Warning(include/net/cfg80211.h:721): Enum value 'STATION_INFO_TX_BYTES64' not described in enum 'station_info_flags'
Warning(include/net/cfg80211.h:721): Enum value 'STATION_INFO_RX_BYTES64' not described in enum 'station_info_flags'
Warning(include/net/cfg80211.h:721): Enum value 'STATION_INFO_TX_BYTES64' not described in enum 'station_info_flags'
Warning(include/net/cfg80211.h:721): Enum value 'STATION_INFO_RX_BYTES64' not described in enum 'station_info_flags'
Warning(include/net/cfg80211.h:721): Enum value 'STATION_INFO_TX_BYTES64' not described in enum 'station_info_flags'
Warning(include/net/cfg80211.h:721): Enum value 'STATION_INFO_RX_BYTES64' not described in enum 'station_info_flags'
Warning(include/net/cfg80211.h:721): Enum value 'STATION_INFO_TX_BYTES64' not described in enum 'station_info_flags'
Warning(include/net/cfg80211.h:721): Enum value 'STATION_INFO_RX_BYTES64' not described in enum 'station_info_flags'
Warning(include/net/cfg80211.h:721): Enum value 'STATION_INFO_TX_BYTES64' not described in enum 'station_info_flags'
Warning(include/net/cfg80211.h:721): Enum value 'STATION_INFO_RX_BYTES64' not described in enum 'station_info_flags'
Warning(include/net/cfg80211.h:721): Enum value 'STATION_INFO_TX_BYTES64' not described in enum 'station_info_flags'
Warning(include/net/cfg80211.h:721): Enum value 'STATION_INFO_RX_BYTES64' not described in enum 'station_info_flags'
Warning(include/net/cfg80211.h:721): Enum value 'STATION_INFO_TX_BYTES64' not described in enum 'station_info_flags'
Warning(include/net/cfg80211.h:721): Enum value 'STATION_INFO_RX_BYTES64' not described in enum 'station_info_flags'
Warning(include/net/cfg80211.h:721): Enum value 'STATION_INFO_TX_BYTES64' not described in enum 'station_info_flags'
Warning(include/net/cfg80211.h:721): Enum value 'STATION_INFO_RX_BYTES64' not described in enum 'station_info_flags'
Warning(include/net/cfg80211.h:721): Enum value 'STATION_INFO_TX_BYTES64' not described in enum 'station_info_flags'
Warning(include/net/cfg80211.h:721): Enum value 'STATION_INFO_RX_BYTES64' not described in enum 'station_info_flags'
Warning(include/net/cfg80211.h:721): Enum value 'STATION_INFO_TX_BYTES64' not described in enum 'station_info_flags'
Warning(include/net/cfg80211.h:721): Enum value 'STATION_INFO_RX_BYTES64' not described in enum 'station_info_flags'
Warning(include/net/cfg80211.h:721): Enum value 'STATION_INFO_TX_BYTES64' not described in enum 'station_info_flags'
Warning(include/net/cfg80211.h:721): Enum value 'STATION_INFO_RX_BYTES64' not described in enum 'station_info_flags'
Warning(include/net/cfg80211.h:721): Enum value 'STATION_INFO_TX_BYTES64' not described in enum 'station_info_flags'
Warning(include/net/cfg80211.h:721): Enum value 'STATION_INFO_RX_BYTES64' not described in enum 'station_info_flags'
Warning(include/net/cfg80211.h:721): Enum value 'STATION_INFO_TX_BYTES64' not described in enum 'station_info_flags'
Warning(include/net/cfg80211.h:721): Enum value 'STATION_INFO_RX_BYTES64' not described in enum 'station_info_flags'
Warning(include/net/cfg80211.h:721): Enum value 'STATION_INFO_TX_BYTES64' not described in enum 'station_info_flags'
Warning(include/net/cfg80211.h:721): Enum value 'STATION_INFO_RX_BYTES64' not described in enum 'station_info_flags'
Warning(include/net/cfg80211.h:721): Enum value 'STATION_INFO_TX_BYTES64' not described in enum 'station_info_flags'
Warning(include/net/cfg80211.h:721): Enum value 'STATION_INFO_RX_BYTES64' not described in enum 'station_info_flags'
Warning(include/net/cfg80211.h:721): Enum value 'STATION_INFO_TX_BYTES64' not described in enum 'station_info_flags'
Warning(include/net/cfg80211.h:721): Enum value 'STATION_INFO_RX_BYTES64' not described in enum 'station_info_flags'
Warning(include/net/cfg80211.h:721): Enum value 'STATION_INFO_TX_BYTES64' not described in enum 'station_info_flags'
Warning(include/net/cfg80211.h:721): Enum value 'STATION_INFO_RX_BYTES64' not described in enum 'station_info_flags'
Warning(include/net/cfg80211.h:721): Enum value 'STATION_INFO_TX_BYTES64' not described in enum 'station_info_flags'
Warning(include/net/cfg80211.h:721): Enum value 'STATION_INFO_RX_BYTES64' not described in enum 'station_info_flags'
Warning(include/net/cfg80211.h:721): Enum value 'STATION_INFO_TX_BYTES64' not described in enum 'station_info_flags'
Warning(include/net/cfg80211.h:721): Enum value 'STATION_INFO_RX_BYTES64' not described in enum 'station_info_flags'
Warning(include/net/cfg80211.h:721): Enum value 'STATION_INFO_TX_BYTES64' not described in enum 'station_info_flags'
Warning(include/net/cfg80211.h:721): Enum value 'STATION_INFO_RX_BYTES64' not described in enum 'station_info_flags'
Warning(include/net/cfg80211.h:721): Enum value 'STATION_INFO_TX_BYTES64' not described in enum 'station_info_flags'
Warning(include/net/cfg80211.h:721): Enum value 'STATION_INFO_RX_BYTES64' not described in enum 'station_info_flags'
Warning(include/net/cfg80211.h:721): Enum value 'STATION_INFO_TX_BYTES64' not described in enum 'station_info_flags'
Warning(include/net/cfg80211.h:721): Enum value 'STATION_INFO_RX_BYTES64' not described in enum 'station_info_flags'
Warning(include/net/cfg80211.h:721): Enum value 'STATION_INFO_TX_BYTES64' not described in enum 'station_info_flags'
Warning(include/net/cfg80211.h:721): Enum value 'STATION_INFO_RX_BYTES64' not described in enum 'station_info_flags'
Warning(include/net/cfg80211.h:721): Enum value 'STATION_INFO_TX_BYTES64' not described in enum 'station_info_flags'
Warning(include/net/cfg80211.h:721): Enum value 'STATION_INFO_RX_BYTES64' not described in enum 'station_info_flags'
Warning(include/net/cfg80211.h:721): Enum value 'STATION_INFO_TX_BYTES64' not described in enum 'station_info_flags'
Warning(include/net/cfg80211.h:721): Enum value 'STATION_INFO_RX_BYTES64' not described in enum 'station_info_flags'
Warning(include/net/cfg80211.h:721): Enum value 'STATION_INFO_TX_BYTES64' not described in enum 'station_info_flags'
Warning(include/net/cfg80211.h:721): Enum value 'STATION_INFO_RX_BYTES64' not described in enum 'station_info_flags'
Warning(include/net/cfg80211.h:721): Enum value 'STATION_INFO_TX_BYTES64' not described in enum 'station_info_flags'
Warning(include/net/cfg80211.h:721): Enum value 'STATION_INFO_RX_BYTES64' not described in enum 'station_info_flags'
Warning(include/net/cfg80211.h:721): Enum value 'STATION_INFO_TX_BYTES64' not described in enum 'station_info_flags'
Warning(include/net/cfg80211.h:721): Enum value 'STATION_INFO_RX_BYTES64' not described in enum 'station_info_flags'
Warning(include/net/cfg80211.h:721): Enum value 'STATION_INFO_TX_BYTES64' not described in enum 'station_info_flags'
Warning(include/net/cfg80211.h:721): Enum value 'STATION_INFO_RX_BYTES64' not described in enum 'station_info_flags'
Warning(include/net/cfg80211.h:721): Enum value 'STATION_INFO_TX_BYTES64' not described in enum 'station_info_flags'
Warning(include/net/cfg80211.h:721): Enum value 'STATION_INFO_RX_BYTES64' not described in enum 'station_info_flags'
Warning(include/net/cfg80211.h:721): Enum value 'STATION_INFO_TX_BYTES64' not described in enum 'station_info_flags'
Warning(include/net/cfg80211.h:721): Enum value 'STATION_INFO_RX_BYTES64' not described in enum 'station_info_flags'
Warning(include/net/cfg80211.h:721): Enum value 'STATION_INFO_TX_BYTES64' not described in enum 'station_info_flags'
Warning(include/net/cfg80211.h:721): Enum value 'STATION_INFO_RX_BYTES64' not described in enum 'station_info_flags'
Warning(include/net/cfg80211.h:721): Enum value 'STATION_INFO_TX_BYTES64' not described in enum 'station_info_flags'
Warning(include/net/cfg80211.h:721): Enum value 'STATION_INFO_RX_BYTES64' not described in enum 'station_info_flags'
Warning(include/net/cfg80211.h:721): Enum value 'STATION_INFO_TX_BYTES64' not described in enum 'station_info_flags'
Warning(include/net/cfg80211.h:721): Enum value 'STATION_INFO_RX_BYTES64' not described in enum 'station_info_flags'
Warning(include/net/cfg80211.h:721): Enum value 'STATION_INFO_TX_BYTES64' not described in enum 'station_info_flags'
Warning(include/net/cfg80211.h:721): Enum value 'STATION_INFO_RX_BYTES64' not described in enum 'station_info_flags'
Warning(include/net/cfg80211.h:721): Enum value 'STATION_INFO_TX_BYTES64' not described in enum 'station_info_flags'
Warning(include/net/cfg80211.h:721): Enum value 'STATION_INFO_RX_BYTES64' not described in enum 'station_info_flags'
Warning(include/net/cfg80211.h:721): Enum value 'STATION_INFO_TX_BYTES64' not described in enum 'station_info_flags'
Warning(include/net/cfg80211.h:721): Enum value 'STATION_INFO_RX_BYTES64' not described in enum 'station_info_flags'
Warning(include/net/cfg80211.h:721): Enum value 'STATION_INFO_TX_BYTES64' not described in enum 'station_info_flags'
Warning(include/net/cfg80211.h:721): Enum value 'STATION_INFO_RX_BYTES64' not described in enum 'station_info_flags'
Warning(include/net/cfg80211.h:721): Enum value 'STATION_INFO_TX_BYTES64' not described in enum 'station_info_flags'
Warning(include/net/cfg80211.h:721): Enum value 'STATION_INFO_RX_BYTES64' not described in enum 'station_info_flags'
Warning(include/net/cfg80211.h:721): Enum value 'STATION_INFO_TX_BYTES64' not described in enum 'station_info_flags'
Warning(include/net/cfg80211.h:721): Enum value 'STATION_INFO_RX_BYTES64' not described in enum 'station_info_flags'
Warning(include/net/cfg80211.h:721): Enum value 'STATION_INFO_TX_BYTES64' not described in enum 'station_info_flags'
Warning(include/net/cfg80211.h:721): Enum value 'STATION_INFO_RX_BYTES64' not described in enum 'station_info_flags'
Warning(include/net/cfg80211.h:721): Enum value 'STATION_INFO_TX_BYTES64' not described in enum 'station_info_flags'
Warning(include/net/cfg80211.h:721): Enum value 'STATION_INFO_RX_BYTES64' not described in enum 'station_info_flags'
Warning(include/net/cfg80211.h:721): Enum value 'STATION_INFO_TX_BYTES64' not described in enum 'station_info_flags'
Warning(include/net/cfg80211.h:721): Enum value 'STATION_INFO_RX_BYTES64' not described in enum 'station_info_flags'
Warning(include/net/cfg80211.h:721): Enum value 'STATION_INFO_TX_BYTES64' not described in enum 'station_info_flags'
Warning(include/net/cfg80211.h:721): Enum value 'STATION_INFO_RX_BYTES64' not described in enum 'station_info_flags'
Warning(include/net/cfg80211.h:721): Enum value 'STATION_INFO_TX_BYTES64' not described in enum 'station_info_flags'
Warning(include/net/cfg80211.h:721): Enum value 'STATION_INFO_RX_BYTES64' not described in enum 'station_info_flags'
Warning(include/net/cfg80211.h:721): Enum value 'STATION_INFO_TX_BYTES64' not described in enum 'station_info_flags'
Warning(include/net/cfg80211.h:721): Enum value 'STATION_INFO_RX_BYTES64' not described in enum 'station_info_flags'
Warning(include/net/cfg80211.h:721): Enum value 'STATION_INFO_TX_BYTES64' not described in enum 'station_info_flags'
Warning(include/net/cfg80211.h:721): Enum value 'STATION_INFO_RX_BYTES64' not described in enum 'station_info_flags'
Warning(include/net/cfg80211.h:721): Enum value 'STATION_INFO_TX_BYTES64' not described in enum 'station_info_flags'
Warning(include/net/cfg80211.h:721): Enum value 'STATION_INFO_RX_BYTES64' not described in enum 'station_info_flags'
Warning(include/net/cfg80211.h:721): Enum value 'STATION_INFO_TX_BYTES64' not described in enum 'station_info_flags'
Warning(include/net/cfg80211.h:721): Enum value 'STATION_INFO_RX_BYTES64' not described in enum 'station_info_flags'
Warning(include/net/cfg80211.h:721): Enum value 'STATION_INFO_TX_BYTES64' not described in enum 'station_info_flags'
Warning(include/net/cfg80211.h:721): Enum value 'STATION_INFO_RX_BYTES64' not described in enum 'station_info_flags'
Warning(include/net/cfg80211.h:721): Enum value 'STATION_INFO_TX_BYTES64' not described in enum 'station_info_flags'
Warning(include/net/cfg80211.h:721): Enum value 'STATION_INFO_RX_BYTES64' not described in enum 'station_info_flags'
Warning(include/net/cfg80211.h:721): Enum value 'STATION_INFO_TX_BYTES64' not described in enum 'station_info_flags'
Warning(include/net/cfg80211.h:721): Enum value 'STATION_INFO_RX_BYTES64' not described in enum 'station_info_flags'
Warning(include/net/cfg80211.h:721): Enum value 'STATION_INFO_TX_BYTES64' not described in enum 'station_info_flags'
Warning(include/net/cfg80211.h:721): Enum value 'STATION_INFO_RX_BYTES64' not described in enum 'station_info_flags'
Warning(include/net/cfg80211.h:721): Enum value 'STATION_INFO_TX_BYTES64' not described in enum 'station_info_flags'
Warning(include/net/cfg80211.h:721): Enum value 'STATION_INFO_RX_BYTES64' not described in enum 'station_info_flags'
Warning(include/net/cfg80211.h:721): Enum value 'STATION_INFO_TX_BYTES64' not described in enum 'station_info_flags'
Warning(include/net/cfg80211.h:721): Enum value 'STATION_INFO_RX_BYTES64' not described in enum 'station_info_flags'
Warning(include/net/cfg80211.h:721): Enum value 'STATION_INFO_TX_BYTES64' not described in enum 'station_info_flags'
Warning(include/net/cfg80211.h:721): Enum value 'STATION_INFO_RX_BYTES64' not described in enum 'station_info_flags'
Warning(include/net/cfg80211.h:721): Enum value 'STATION_INFO_TX_BYTES64' not described in enum 'station_info_flags'
Warning(include/net/cfg80211.h:721): Enum value 'STATION_INFO_RX_BYTES64' not described in enum 'station_info_flags'
Warning(include/net/cfg80211.h:721): Enum value 'STATION_INFO_TX_BYTES64' not described in enum 'station_info_flags'
Warning(include/net/cfg80211.h:721): Enum value 'STATION_INFO_RX_BYTES64' not described in enum 'station_info_flags'
Warning(include/net/cfg80211.h:721): Enum value 'STATION_INFO_TX_BYTES64' not described in enum 'station_info_flags'
Warning(include/net/cfg80211.h:721): Enum value 'STATION_INFO_RX_BYTES64' not described in enum 'station_info_flags'
Warning(include/net/cfg80211.h:721): Enum value 'STATION_INFO_TX_BYTES64' not described in enum 'station_info_flags'
Warning(include/net/cfg80211.h:721): Enum value 'STATION_INFO_RX_BYTES64' not described in enum 'station_info_flags'
Warning(include/net/cfg80211.h:721): Enum value 'STATION_INFO_TX_BYTES64' not described in enum 'station_info_flags'
Warning(include/net/cfg80211.h:721): Enum value 'STATION_INFO_RX_BYTES64' not described in enum 'station_info_flags'
Warning(include/net/cfg80211.h:721): Enum value 'STATION_INFO_TX_BYTES64' not described in enum 'station_info_flags'
Warning(include/net/cfg80211.h:721): Enum value 'STATION_INFO_RX_BYTES64' not described in enum 'station_info_flags'
Warning(include/net/cfg80211.h:721): Enum value 'STATION_INFO_TX_BYTES64' not described in enum 'station_info_flags'
Warning(include/net/cfg80211.h:721): Enum value 'STATION_INFO_RX_BYTES64' not described in enum 'station_info_flags'
Warning(include/net/cfg80211.h:721): Enum value 'STATION_INFO_TX_BYTES64' not described in enum 'station_info_flags'
Warning(include/net/cfg80211.h:721): Enum value 'STATION_INFO_RX_BYTES64' not described in enum 'station_info_flags'
Warning(include/net/cfg80211.h:721): Enum value 'STATION_INFO_TX_BYTES64' not described in enum 'station_info_flags'
Warning(include/net/cfg80211.h:2361): No description found for parameter 'tcp'
Warning(include/net/cfg80211.h:2361): No description found for parameter 'tcp'
Warning(include/net/cfg80211.h:2361): No description found for parameter 'tcp'
Warning(include/net/cfg80211.h:2361): No description found for parameter 'tcp'
Warning(include/net/cfg80211.h:2361): No description found for parameter 'tcp'
Warning(include/net/cfg80211.h:2361): No description found for parameter 'tcp'
Warning(include/net/cfg80211.h:2361): No description found for parameter 'tcp'
Warning(include/net/cfg80211.h:2361): No description found for parameter 'tcp'
Warning(include/net/cfg80211.h:2361): No description found for parameter 'tcp'
Warning(include/net/cfg80211.h:2361): No description found for parameter 'tcp'
Warning(include/net/cfg80211.h:2361): No description found for parameter 'tcp'
Warning(include/net/cfg80211.h:2361): No description found for parameter 'tcp'
Warning(include/net/cfg80211.h:2361): No description found for parameter 'tcp'
Warning(include/net/cfg80211.h:2361): No description found for parameter 'tcp'
Warning(include/net/cfg80211.h:2361): No description found for parameter 'tcp'
Warning(include/net/cfg80211.h:2361): No description found for parameter 'tcp'
Warning(include/net/cfg80211.h:2361): No description found for parameter 'tcp'
Warning(include/net/cfg80211.h:2361): No description found for parameter 'tcp'
Warning(include/net/cfg80211.h:2361): No description found for parameter 'tcp'
Warning(include/net/cfg80211.h:2361): No description found for parameter 'tcp'
Warning(include/net/cfg80211.h:2361): No description found for parameter 'tcp'
Warning(include/net/cfg80211.h:2361): No description found for parameter 'tcp'
Warning(include/net/cfg80211.h:2361): No description found for parameter 'tcp'
Warning(include/net/cfg80211.h:2361): No description found for parameter 'tcp'
Warning(include/net/cfg80211.h:2361): No description found for parameter 'tcp'
Warning(include/net/cfg80211.h:2361): No description found for parameter 'tcp'
Warning(include/net/cfg80211.h:2361): No description found for parameter 'tcp'
Warning(include/net/cfg80211.h:2361): No description found for parameter 'tcp'
Warning(include/net/cfg80211.h:2361): No description found for parameter 'tcp'
Warning(include/net/cfg80211.h:2361): No description found for parameter 'tcp'
Warning(include/net/cfg80211.h:2361): No description found for parameter 'tcp'
Warning(include/net/cfg80211.h:2361): No description found for parameter 'tcp'
Warning(include/net/cfg80211.h:2361): No description found for parameter 'tcp'
Warning(include/net/cfg80211.h:2361): No description found for parameter 'tcp'
Warning(include/net/cfg80211.h:2361): No description found for parameter 'tcp'
Warning(include/net/cfg80211.h:2361): No description found for parameter 'tcp'
Warning(include/net/cfg80211.h:2361): No description found for parameter 'tcp'
Warning(include/net/cfg80211.h:2361): No description found for parameter 'tcp'
Warning(include/net/cfg80211.h:2361): No description found for parameter 'tcp'
Warning(include/net/cfg80211.h:2361): No description found for parameter 'tcp'
Warning(include/net/cfg80211.h:2361): No description found for parameter 'tcp'
Warning(include/net/cfg80211.h:2361): No description found for parameter 'tcp'
Warning(include/net/cfg80211.h:2361): No description found for parameter 'tcp'
Warning(include/net/cfg80211.h:2361): No description found for parameter 'tcp'
Warning(include/net/cfg80211.h:2361): No description found for parameter 'tcp'
Warning(include/net/cfg80211.h:2361): No description found for parameter 'tcp'
Warning(include/net/cfg80211.h:2361): No description found for parameter 'tcp'
Warning(include/net/cfg80211.h:2361): No description found for parameter 'tcp'
Warning(include/net/cfg80211.h:2361): No description found for parameter 'tcp'
Warning(include/net/cfg80211.h:2361): No description found for parameter 'tcp'
Warning(include/net/cfg80211.h:2361): No description found for parameter 'tcp'
Warning(include/net/cfg80211.h:2361): No description found for parameter 'tcp'
Warning(include/net/cfg80211.h:2361): No description found for parameter 'tcp'
Warning(include/net/cfg80211.h:2361): No description found for parameter 'tcp'
Warning(include/net/cfg80211.h:2361): No description found for parameter 'tcp'
Warning(include/net/cfg80211.h:2361): No description found for parameter 'tcp'
Warning(include/net/cfg80211.h:2361): No description found for parameter 'tcp'
Warning(include/net/cfg80211.h:2361): No description found for parameter 'tcp'
Warning(include/net/cfg80211.h:2361): No description found for parameter 'tcp'
Warning(include/net/cfg80211.h:2361): No description found for parameter 'tcp'
Warning(include/net/cfg80211.h:2361): No description found for parameter 'tcp'
Warning(include/net/cfg80211.h:2361): No description found for parameter 'tcp'
Warning(include/net/cfg80211.h:2361): No description found for parameter 'tcp'
Warning(include/net/cfg80211.h:2361): No description found for parameter 'tcp'
Warning(include/net/cfg80211.h:2361): No description found for parameter 'tcp'
Warning(include/net/cfg80211.h:2361): No description found for parameter 'tcp'
Warning(include/net/cfg80211.h:2361): No description found for parameter 'tcp'
Warning(include/net/cfg80211.h:2361): No description found for parameter 'tcp'
Warning(include/net/cfg80211.h:2361): No description found for parameter 'tcp'
Warning(include/net/cfg80211.h:2361): No description found for parameter 'tcp'
Warning(include/net/cfg80211.h:2361): No description found for parameter 'tcp'
Warning(include/net/cfg80211.h:2361): No description found for parameter 'tcp'
Warning(include/net/cfg80211.h:2361): No description found for parameter 'tcp'
Warning(include/net/cfg80211.h:2361): No description found for parameter 'tcp'
Warning(include/net/cfg80211.h:2361): No description found for parameter 'tcp'
Warning(include/net/cfg80211.h:2361): No description found for parameter 'tcp'
Warning(include/net/cfg80211.h:2361): No description found for parameter 'tcp'
Warning(include/net/cfg80211.h:2361): No description found for parameter 'tcp'
Warning(include/net/cfg80211.h:2361): No description found for parameter 'tcp'
Warning(include/net/cfg80211.h:2361): No description found for parameter 'tcp'
Warning(include/net/cfg80211.h:2361): No description found for parameter 'tcp'
Warning(include/net/cfg80211.h:2361): No description found for parameter 'tcp'
Warning(include/net/cfg80211.h:2361): No description found for parameter 'tcp'
Warning(include/net/cfg80211.h:2361): No description found for parameter 'tcp'
Warning(include/net/cfg80211.h:2361): No description found for parameter 'tcp'
Warning(include/net/cfg80211.h:2361): No description found for parameter 'tcp'
Warning(include/net/cfg80211.h:2361): No description found for parameter 'tcp'
Warning(include/net/cfg80211.h:2361): No description found for parameter 'tcp'
Warning(include/net/cfg80211.h:2361): No description found for parameter 'tcp'
Warning(include/net/cfg80211.h:2361): No description found for parameter 'tcp'
Warning(include/net/cfg80211.h:2361): No description found for parameter 'tcp'
Warning(include/net/cfg80211.h:2361): No description found for parameter 'tcp'
Warning(include/net/cfg80211.h:2361): No description found for parameter 'tcp'
Warning(include/net/cfg80211.h:2361): No description found for parameter 'tcp'
Warning(include/net/cfg80211.h:2361): No description found for parameter 'tcp'
Warning(include/net/cfg80211.h:2361): No description found for parameter 'tcp'
Warning(include/net/cfg80211.h:2361): No description found for parameter 'tcp'
Warning(include/net/cfg80211.h:2361): No description found for parameter 'tcp'
Warning(include/net/cfg80211.h:2361): No description found for parameter 'tcp'
Warning(include/net/cfg80211.h:2361): No description found for parameter 'tcp'
Warning(include/net/cfg80211.h:2361): No description found for parameter 'tcp'
Warning(include/net/cfg80211.h:2361): No description found for parameter 'tcp'
Warning(include/net/cfg80211.h:2361): No description found for parameter 'tcp'
Warning(include/net/cfg80211.h:2361): No description found for parameter 'tcp'
Warning(include/net/cfg80211.h:2361): No description found for parameter 'tcp'
Warning(include/net/cfg80211.h:2361): No description found for parameter 'tcp'
Warning(fs/seq_file.c:304): No description found for parameter 'whence'
Warning(fs/seq_file.c:304): Excess function parameter 'origin' description in 'seq_lseek'
drivers/mtd/maps/latch-addr-flash.c:56:2: warning: 'r.x[0]' may be used uninitialized in this function [-Wmaybe-uninitialized]
WARNING: drivers/built-in.o(.data+0x19f354): Section mismatch in reference from the variable w1_gpio_driver to the function .init.text:gpiolib_debugfs_init()
WARNING: vmlinux.o(.text+0x3c28): Section mismatch in reference from the function pgd_ctor() to the function .init.text:__alloc_bootmem()
WARNING: vmlinux.o(.text+0x4633): Section mismatch in reference from the function iss_net_setup() to the function .init.text:__alloc_bootmem()
WARNING: vmlinux.o(.text+0x5dbb7c): Section mismatch in reference from the function twl_pwmled_probe() to the function .init.text:pcibios_fixup_bus()
WARNING: vmlinux.o(.text+0x5dfc28): Section mismatch in reference from the function pci_scan_child_bus() to the function .init.text:pcibios_fixup_bus()
WARNING: vmlinux.o(.data+0x1c77b4): Section mismatch in reference from the variable w1_gpio_driver to the function .init.text:_startup()

[sparse]
drivers/staging/zram/zram_drv.c:468:6: sparse: symbol '__zram_reset_device' was not declared. Should it be static?
drivers/staging/comedi/drivers/quatech_daqp_cs.c:726:35: sparse: not enough arguments for function comedi_pcmcia_enable
drivers/tty/tty_io.c:2919:58: sparse: incorrect type in argument 4 (incompatible argument 2 (different modifiers))
drivers/vhost/vringh.c:206:41: sparse: incorrect type in argument 2 (different type sizes)
drivers/vhost/vhost.c:571:39: sparse: incorrect type in assignment (different address spaces)
drivers/vhost/vhost.c:572:40: sparse: incorrect type in assignment (different address spaces)
drivers/vhost/vhost.c:573:39: sparse: incorrect type in assignment (different address spaces)
drivers/vhost/vhost.c:861:13: sparse: incorrect type in argument 1 (different address spaces)
drivers/vhost/vhost.c:876:16: sparse: incorrect type in argument 1 (different address spaces)
net/core/netpoll.c:208:32: sparse: incorrect type in argument 1 (different address spaces)
net/core/netpoll.c:223:26: sparse: incorrect type in argument 1 (different address spaces)
drivers/cpufreq/cpufreq.c:1178:31: sparse: dereference of noderef expression
drivers/cpufreq/cpufreq.c:1179:25: sparse: dereference of noderef expression
drivers/cpufreq/intel_pstate.c:102:16: sparse: symbol 'all_cpu_data' was not declared. Should it be static?
drivers/cpufreq/intel_pstate.c:260:15: sparse: symbol 'debugfs_parent' was not declared. Should it be static?
drivers/cpufreq/intel_pstate.c:261:6: sparse: symbol 'intel_pstate_debug_expose_params' was not declared. Should it be static?
drivers/cpufreq/intel_pstate.c:350:6: sparse: symbol 'intel_pstate_sysfs_expose_params' was not declared. Should it be static?
drivers/cpufreq/intel_pstate.c:661:14: sparse: symbol 'intel_pstate_get' was not declared. Should it be static?
arch/x86/boot/compressed/eboot.c:303:33: sparse: dubious: !x & y
arch/x86/boot/version.c:19:12: sparse: symbol 'kernel_version' was not declared. Should it be static?
arch/x86/boot/compressed/eboot.c:592:6: sparse: symbol 'setup_graphics' was not declared. Should it be static?
arch/x86/boot/compressed/eboot.c:857:20: sparse: symbol 'make_boot_params' was not declared. Should it be static?
arch/x86/boot/compressed/eboot.c:1131:20: sparse: symbol 'efi_main' was not declared. Should it be static?
arch/x86/boot/compressed/misc.c:321:17: sparse: symbol 'decompress_kernel' was not declared. Should it be static?
arch/x86/boot/compressed/../string.c:60:14: sparse: symbol 'atou' was not declared. Should it be static?
arch/x86/boot/compressed/../cmdline.c:30:5: sparse: symbol '__cmdline_find_option' was not declared. Should it be static?
arch/x86/boot/compressed/../cmdline.c:102:5: sparse: symbol '__cmdline_find_option_bool' was not declared. Should it be static?
drivers/net/wireless/iwlwifi/mvm/mac80211.c:116:21: sparse: undefined identifier 'IEEE80211_HW_NEED_DTIM_PERIOD'
arch/x86/boot/pm.c:104:6: sparse: symbol 'go_to_protected_mode' redeclared with different type (originally declared at arch/x86/boot/boot.h:328) - different modifiers
arch/x86/boot/string.c:119:8: sparse: symbol 'strlen' was not declared. Should it be static?
arch/x86/boot/string.c:133:6: sparse: symbol 'strstr' was not declared. Should it be static?

[smatch]
net/core/netpoll.c:242 netpoll_poll_dev() warn: inconsistent returns mutex:&dev->npinfo->dev_lock: locked (212,216) unlocked (209,242)

[cppcheck]
include/linux/slab.h:250: error: "Unknown slab allocator"
include/linux/slab.h:250: error: "Unknown slab allocator"
include/linux/slab.h:250: error: "Unknown slab allocator"
include/linux/slab.h:250: error: "Unknown slab allocator"

---
0-DAY kernel build testing backend              Open Source Technology Center
http://lists.01.org/mailman/listinfo/kbuild                 Intel Corporation
