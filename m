From: Fengguang Wu <fengguang.wu@intel.com>
Date: Fri, 09 Nov 2012 01:28:07 +0000
Subject: build regressions 2012-11-08
Message-Id: <20121109012807.GC6332@localhost>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

[errors]
drivers/staging/silicom/bp_mod.c:5437:13: error: 'dev_base' undeclared (first use in this function)
drivers/staging/silicom/bp_mod.c:5437:37: error: 'struct net_device' has no member named 'next'
drivers/staging/silicom/bp_mod.c:7202:6: error: void value not ignored as it ought to be
drivers/staging/silicom/bypasslib/bypass.c:145:2: error: implicit declaration of function 'pci_find_class' [-Werror=implicit-function-declaration]
sdhci-pltfm.c:(.text+0x80): multiple definition of `sdhci_runtime_pm_get'
drivers/mmc/host/sdhci.o:sdhci.c:(.text+0x7550): first defined here
sdhci-pltfm.c:(.text+0xa0): multiple definition of `sdhci_runtime_pm_put'
fs/btrfs/ioctl.c:3872:7: error: case label does not reduce to an integer constant
drivers/mfd/rtsx_pcr.c:985:2: error: implicit declaration of function 'kcalloc' [-Werror=implicit-function-declaration]
drivers/mfd/rtsx_pcr.c:993:3: error: implicit declaration of function 'kfree' [-Werror=implicit-function-declaration]
drivers/mfd/rtsx_pcr.c:1021:2: error: implicit declaration of function 'kzalloc' [-Werror=implicit-function-declaration]

[warnings]
include/linux/version.h:1:0: warning: "UTS_RELEASE" redefined [enabled by default]
include/generated/utsrelease.h:1:0: warning: "UTS_RELEASE" redefined [enabled by default]
drivers/staging/silicom/bypasslib/bypass.c:145:15: warning: assignment makes pointer from integer without a cast [enabled by default]
drivers/staging/silicom/bypasslib/bypass.c:483:1: warning: data definition has no type or storage class [enabled by default]
drivers/staging/silicom/bypasslib/bypass.c:483:1: warning: type defaults to 'int' in declaration of 'EXPORT_SYMBOL_NOVERS' [-Wimplicit-int]
drivers/staging/silicom/bypasslib/bypass.c:483:1: warning: parameter names (without types) in function declaration [enabled by default]
drivers/block/mtip32xx/mtip32xx.c:2472:2: warning: right shift count >= width of type [enabled by default]
drivers/mfd/rtsx_pcr.c:985:13: warning: assignment makes pointer from integer without a cast [enabled by default]

[sparse]
include/linux/version.h:1:9: sparse: preprocessor token UTS_RELEASE redefined
include/generated/utsrelease.h:1:9: sparse: preprocessor token UTS_RELEASE redefined
fs/btrfs/dev-replace.c:486:17: sparse: incompatible types in comparison expression (different address spaces)
drivers/net/ethernet/broadcom/bnx2x/bnx2x_main.c:7053:6: sparse: symbol 'bnx2x_init_searcher' was not declared. Should it be static?
drivers/net/ethernet/broadcom/bnx2x/bnx2x_main.c:7083:5: sparse: symbol 'bnx2x_reset_nic_mode' was not declared. Should it be static?
drivers/staging/silicom/bp_mod.c:5437:20: sparse: undefined identifier 'dev_base'
drivers/staging/silicom/bp_mod.c:5437:44: sparse: no member 'next' in struct net_device
drivers/staging/silicom/bypasslib/bypass.c:145:24: sparse: undefined identifier 'pci_find_class'

[smatch]
fs/btrfs/dev-replace.c:827 btrfs_dev_replace_lock() warn: inconsistent returns mutex:&dev_replace->lock: locked (814) unlocked (823)
fs/btrfs/extent-tree.c:2358 run_clustered_refs() warn: inconsistent returns mutex:&locked_ref->mutex: locked (2351,2358) unlocked (2305)
fs/btrfs/ctree.c:2575 btrfs_search_slot() debug: remove_pools: nr_children over 4000 (4110). (trans unknown)
fs/btrfs/ctree.c:2575 btrfs_search_slot() error: buffer overflow 'p->nodes' 8 <= 9
fs/btrfs/ctree.c:2583 btrfs_search_slot() error: buffer overflow 'p->slots' 8 <= 9
drivers/mmc/host/rtsx_pci_sdmmc.c:502 sd_search_final_phase() warn: 'path' puts 512 bytes on stack

[coccinelle]
drivers/net/usb/smsc95xx.c:1134:39-50: ERROR: reference preceded by free on line 1136

---
0-DAY kernel build testing backend         Open Source Technology Center
Fengguang Wu, Yuanhan Liu                              Intel Corporation
