From: Fengguang Wu <fengguang.wu@intel.com>
Date: Sat, 27 Oct 2012 17:06:06 +0000
Subject: build regressions 2012-10-27
Message-Id: <20121027170606.GB31432@localhost>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

[errors]
drivers/net/ethernet/cadence/macb.h:563:2: error: implicit declaration of function '__raw_readl' [-Werror=implicit-function-declaration]
drivers/net/ethernet/cadence/macb.c:65:2: error: implicit declaration of function '__raw_writel' [-Werror=implicit-function-declaration]
drivers/net/ethernet/cadence/macb.c:1350:2: error: implicit declaration of function 'ioremap' [-Werror=implicit-function-declaration]
drivers/net/ethernet/cadence/macb.c:1436:2: error: implicit declaration of function 'iounmap' [-Werror=implicit-function-declaration]
drivers/net/ethernet/cadence/at91_ether.c:119:2: error: implicit declaration of function '__raw_writel' [-Werror=implicit-function-declaration]
sound/soc/codecs/arizona.h:20:21: fatal error: wm_adsp.h: No such file or directory
ERROR: "wm_adsp1_event" undefined!
ERROR: "wm_adsp2_event" undefined!
ERROR: "crc32c" [net/batman-adv/batman-adv.ko] undefined!

[warnings]
net/mac80211/cfg.c:1076:3: warning: 'ret' may be used uninitialized in this function [-Wmaybe-uninitialized]
drivers/target/target_core_alua.c:619:18: warning: 'alua_ascq' may be used uninitialized in this function [-Wmaybe-uninitialized]
drivers/net/ethernet/cadence/macb.c:1350:11: warning: assignment makes pointer from integer without a cast [enabled by default]
warning: (GRETH && DNET && LPC_ENET && OCTEON_MGMT_ETHERNET && ETHOC && SH_ETH && S6GMAC && MIPS_AU1X00_ENET && MACB && BFIN_MAC && BCM63XX_ENET && SB1250_MAC && TIGON3 && FTGMAC100 && FEC && FEC_MPC52xx && FS_ENET && FSL_PQ_MDIO && FSL_XGMAC_MDIO && UCC_GETH && GIANFAR && IXP4XX_ETH && MV643XX_ETH && PXA168_ETH && AX88796 && W90P910_ETH && PASEMI_MAC && R6040 && SMSC911X && SMSC9420 && STMMAC_ETH && TI_DAVINCI_EMAC && TI_DAVINCI_MDIO && CPMAC && TC35815 && XILINX_EMACLITE && XILINX_AXI_EMAC && XILINX_LL_TEMAC && USB_NET_AX8817X && ET131X && OCTEON_ETHERNET) selects PHYLIB which has unmet direct dependencies (!S390 && NETDEVICES)
sound/soc/codecs/wm5102.c:464:1: warning: large integer implicitly truncated to unsigned type [-Woverflow]

[sparse]
drivers/net/ethernet/cadence/macb.c:64:16: sparse: incorrect type in assignment (different base types)
drivers/acpi/osl.c:545:11: sparse: symbol 'acpi_table_checksum' was not declared. Should it be static?
drivers/acpi/osl.c:648:11: sparse: incorrect type in assignment (different address spaces)

[smatch]
drivers/iio/dac/ad5449.c:132 ad5449_read() warn: inconsistent returns mutex:&indio_dev->mlock: locked (127) unlocked (132)
drivers/staging/comedi/drivers/dt3000.c:810 dt3000_attach_pci() warn: 'devpriv->io_addr' was not released on error
drivers/staging/comedi/drivers/dt3000.c:815 dt3000_attach_pci() warn: 'pcidev->irq' was not released on error
drivers/net/ethernet/cadence/macb.c:689 macb_free_consistent() info: redundant null check on bp->tx_skb calling kfree()
drivers/target/target_core_pscsi.c:582 pscsi_configure_device() warn: inconsistent returns spin_lock:sh->host_lock: locked (566,568) unlocked (479,490,499,510,514,524,531,582)
drivers/target/target_core_pscsi.c:582 pscsi_configure_device() warn: inconsistent returns irq:: locked (566,568) unlocked (479,490,499,510,514,524,531,582)

[coccinelle]
drivers/staging/ced1401/ced_ioc.c:701:6-20: WARNING: casting value returned by k[cmz]alloc to (struct page * *) is useless.
drivers/iio/dac/ad5449.c:127:2-8: preceding lock on line 121
drivers/staging/ced1401/ced_ioc.c:1511:2-8: preceding lock on line 1425
drivers/staging/zram/zram_drv.c:352:8-14: ERROR: reference preceded by free on line 343

[cppcheck]
arch/powerpc/include/asm/mmu-hash64.h:527: style: Statements following return, break, continue, goto or throw will never be executed.
arch/powerpc/include/asm/timex.h:20: style: Statements following return, break, continue, goto or throw will never be executed.
arch/powerpc/include/asm/smp.h:98: style: Statements following return, break, continue, goto or throw will never be executed.
arch/powerpc/include/asm/time.h:107: style: Statements following return, break, continue, goto or throw will never be executed.
include/asm-generic/irq_regs.h:25: style: Statements following return, break, continue, goto or throw will never be executed.
include/linux/irq.h:720: style: Statements following return, break, continue, goto or throw will never be executed.
arch/powerpc/include/asm/pgtable-ppc64.h:351: style: The scope of the variable 'pu' can be reduced
arch/powerpc/include/asm/pgtable-ppc64.h:352: style: The scope of the variable 'pm' can be reduced
arch/powerpc/include/asm/mmu-hash64.h:282: style: The scope of the variable 'vsid' can be reduced
arch/powerpc/include/asm/mmu-hash64.h:249: style: Variable 'r' is not assigned a value
include/linux/ktime.h:217: performance: Function parameter 'ts' should be passed by reference.
include/linux/ktime.h:229: performance: Function parameter 'tv' should be passed by reference.
arch/powerpc/include/asm/spinlock.h:132: warning: Redundant code: Found a statement that begins with numeric constant
arch/powerpc/include/asm/dma.h:176: warning: Redundant code: Found a statement that begins with numeric constant
include/linux/memory_hotplug.h:35: warning: Redundant code: Found a statement that begins with numeric constant
arch/powerpc/include/asm/spinlock.h:132: error: Uninitialized variable: __dummy
arch/powerpc/include/asm/dma.h:176: error: Uninitialized variable: __dummy
include/linux/memory_hotplug.h:35: error: Uninitialized variable: __dummy

---
0-DAY kernel build testing backend         Open Source Technology Center
Fengguang Wu, Yuanhan Liu                              Intel Corporation
