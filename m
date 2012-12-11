From: Fengguang Wu <fengguang.wu@intel.com>
Date: Tue, 11 Dec 2012 16:04:39 +0000
Subject: build regressions 2012-12-11
Message-Id: <50c75997.Lcei46ybIa2libfE%fengguang.wu@intel.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

[errors]
file.c:(.text+0xcd63c): undefined reference to `mb_cache_entry_get'
file.c:(.text+0xcd6b4): undefined reference to `mb_cache_entry_release'
file.c:(.text+0xcd794): undefined reference to `mb_cache_entry_free'
file.c:(.text+0xcdca4): undefined reference to `mb_cache_entry_alloc'
file.c:(.text+0xcdcbc): undefined reference to `mb_cache_entry_insert'
file.c:(.text+0xcdfb8): undefined reference to `mb_cache_entry_find_first'
file.c:(.text+0xcdfe0): undefined reference to `mb_cache_entry_find_next'
file.c:(.text+0xcfdc4): undefined reference to `mb_cache_shrink'
file.c:(.text+0xcfddc): undefined reference to `mb_cache_destroy'
file.c:(.init.text+0x1c38): undefined reference to `mb_cache_create'
drivers/dma/xilinx/xilinx_axicdma.c:850:2: error: implicit declaration of function 'irq_dispose_mapping' [-Werror=implicit-function-declaration]
drivers/dma/xilinx/xilinx_axidma.c:952:2: error: implicit declaration of function 'irq_dispose_mapping' [-Werror=implicit-function-declaration]
drivers/dma/xilinx/xilinx_axivdma.c:1041:2: error: implicit declaration of function 'irq_dispose_mapping' [-Werror=implicit-function-declaration]
drivers/mfd/timberdale.c:148:2: error: unknown field 'little_endian' specified in initializer
drivers/misc/cma_test.c:52:50: error: 'SZ_1K' undeclared (first use in this function)
drivers/media/i2c/s5c73m3/s5c73m3-core.c:1749:1: error: '__mod_of_device_table' aliased to undefined symbol 's5c73m3_of_match'
fs/ext4/inline.c:268:19: error: 'empty_zero_page' undeclared (first use in this function)
ERROR: "mb_cache_entry_find_next" [fs/ext4/ext4.ko] undefined!
ERROR: "mb_cache_entry_get" [fs/ext4/ext4.ko] undefined!
ERROR: "mb_cache_entry_release" [fs/ext4/ext4.ko] undefined!
ERROR: "mb_cache_entry_alloc" [fs/ext4/ext4.ko] undefined!
ERROR: "mb_cache_entry_find_first" [fs/ext4/ext4.ko] undefined!
ERROR: "mb_cache_destroy" [fs/ext4/ext4.ko] undefined!
ERROR: "mb_cache_entry_free" [fs/ext4/ext4.ko] undefined!
ERROR: "mb_cache_entry_insert" [fs/ext4/ext4.ko] undefined!
ERROR: "mb_cache_shrink" [fs/ext4/ext4.ko] undefined!
ERROR: "mb_cache_create" [fs/ext4/ext4.ko] undefined!

[warnings]
drivers/misc/si570.c:454:14: warning: 'tmp' may be used uninitialized in this function [-Wuninitialized]
drivers/dma/xilinx/vdmatest.c:277:4: warning: format '%x' expects argument of type 'unsigned int', but argument 4 has type 'dma_addr_t' [-Wformat]
drivers/regulator/s5m8767.c:207:29: warning: 'mode' may be used uninitialized in this function [-Wmaybe-uninitialized]
drivers/staging/comedi/drivers/8253.h:141:9: warning: 'divisor1' may be used uninitialized in this function [-Wuninitialized]
drivers/staging/comedi/drivers/8253.h:142:9: warning: 'divisor2' may be used uninitialized in this function [-Wuninitialized]
mm/slab_common.c:219:6: warning: format '%zd' expects argument of type 'signed size_t', but argument 3 has type 'size_t' [-Wformat]
drivers/dma/xilinx/vdmatest.c:277:4: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
drivers/dma/xilinx/xilinx_axicdma.c:527:4: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
drivers/dma/xilinx/xilinx_axidma.c:377:3: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
drivers/dma/xilinx/xilinx_axidma.c:1027:16: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
drivers/dma/xilinx/xilinx_axivdma.c:398:3: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
drivers/dma/xilinx/xilinx_axivdma.c:1109:22: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
drivers/pmods/pmodoled-gpio.c:153:6: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
drivers/pmods/pmodoled-gpio.c:657:2: warning: large integer implicitly truncated to unsigned type [-Woverflow]
drivers/pmods/pmodoled-gpio.c:684:26: warning: assignment discards 'const' qualifier from pointer target type [enabled by default]
drivers/usb/c67x00/c67x00-drv.c:148:3: warning: ISO C90 forbids mixed declarations and code [-Wdeclaration-after-statement]
drivers/mfd/max8997.c:181:10: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
warning: (PPC_E500MC && PPC_BOOK3S_32 && PPC_BOOK3S_64 && PPC_BOOK3E_64 && ISS4xx && 440EP && 440EPX && 460EX && 460SX && 476FPE && APM821xx) selects PPC_FPU which has unmet direct dependencies (XILINX_VIRTEX_5_FXT)
drivers/dma/xilinx_dma.c:486:3: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
drivers/dma/xilinx_dma.c:1961:23: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
drivers/base/regmap/regmap-debugfs.c:147:9: warning: 'ret' may be used uninitialized in this function [-Wmaybe-uninitialized]

[sparse]
include/linux/rcupdate.h:294:30: sparse: context imbalance in 'nl80211_get_reg' - unexpected unlock
drivers/gpu/drm/ttm/ttm_bo.c:582:17: sparse: context imbalance in 'ttm_bo_cleanup_refs_and_unlock' - unexpected unlock
drivers/gpu/drm/ttm/ttm_bo.c:677:25: sparse: context imbalance in 'ttm_bo_delayed_delete' - different lock contexts for basic block
drivers/gpu/drm/ttm/ttm_bo.c:834:25: sparse: context imbalance in 'ttm_mem_evict_first' - different lock contexts for basic block
drivers/gpu/drm/ttm/ttm_bo.c:1816:9: sparse: context imbalance in 'ttm_bo_swapout' - different lock contexts for basic block
net/netfilter/nf_tables_api.c:344:23: sparse: incorrect type in assignment (different base types)
net/netfilter/nf_tables_api.c:345:21: sparse: restricted __be32 degrades to integer
net/netfilter/nf_tables_api.c:413:30: sparse: invalid assignment: |net/netfilter/nft_nat.c:47:35: sparse: incorrect type in assignment (different base types)
drivers/char/xilinx_devcfg.c:35:11: sparse: unable to open 'mach/slcr.h'
drivers/misc/si570.c:200:15: sparse: symbol 'si570_hs_div_values' was not declared. Should it be static?
drivers/dma/xilinx/cdmatest.c:243:32: sparse: bad constant expression
drivers/dma/xilinx/dmatest.c:247:37: sparse: bad constant expression
drivers/dma/xilinx/xilinx_axivdma.c:497:38: sparse: cast removes address space of expression
drivers/dma/xilinx/xilinx_axivdma.c:498:25: sparse: incorrect type in argument 2 (different address spaces)
net/ipv6/netfilter/nft_chain_nat_ipv6.c:169:22: sparse: symbol 'nft_chain_nat_ipv6' was not declared. Should it be static?
drivers/video/xylon/xylonfb/platform/../core/xylonfb.c:742:39: sparse: undefined identifier 'dma_alloc_writecombine'
drivers/video/xylon/xylonfb/platform/../core/xylonfb-pixclk.c:45:5: sparse: symbol 'xylonfb_hw_pixclk_set' was not declared. Should it be static?
drivers/video/xylon/xylonfb/platform/../core/xylonfb-pixclk.c:140:6: sparse: symbol 'xylonfb_hw_pixclk_change' was not declared. Should it be static?
drivers/dma/xilinx/xilinx_axidma.c:952:9: sparse: undefined identifier 'irq_dispose_mapping'
drivers/dma/xilinx/xilinx_axivdma.c:1041:9: sparse: undefined identifier 'irq_dispose_mapping'
drivers/dma/xilinx/xilinx_axicdma.c:850:9: sparse: undefined identifier 'irq_dispose_mapping'
drivers/mfd/timberdale.c:148:10: sparse: unknown field name in initializer

[smatch]
drivers/base/regmap/regmap-debugfs.c:105 regmap_debugfs_get_dump_start() warn: overwrite may leak 'c'
drivers/net/wireless/ath/ath9k/init.c:636 ath9k_init_softc() error: we previously assumed 'pdata' could be null (see line 582)
drivers/net/wireless/ath/ath9k/init.c:647 ath9k_init_softc() warn: variable dereferenced before check 'pdata' (see line 639)
drivers/gpu/drm/ttm/ttm_bo.c:683 ttm_bo_delayed_delete() error: double lock 'spin_lock:&glob->lru_lock'
drivers/gpu/drm/ttm/ttm_bo.c:1887 ttm_bo_swapout() warn: inconsistent returns spin_lock:&glob->lru_lock: locked (1832) unlocked (1824,1887)
drivers/gpu/drm/ttm/ttm_bo.c:848 ttm_mem_evict_first() warn: inconsistent returns spin_lock:&glob->lru_lock: locked (834) unlocked (825,848)
drivers/video/omap2/dss/dispc-compat.c:225 omap_dispc_wait_for_irq_interruptible_timeout() error: 'wait_for_completion_interruptible_timeout()' returns negative and 'timeout' is unsigned

---
0-DAY kernel build testing backend         Open Source Technology Center
Fengguang Wu, Yuanhan Liu                              Intel Corporation
