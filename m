From: Fengguang Wu <fengguang.wu@intel.com>
Date: Thu, 03 Jan 2013 16:20:19 +0000
Subject: build regressions 2013-01-03
Message-Id: <50e5afc3.QuR4LILOfT8Ts1sw%fengguang.wu@intel.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

[errors]
(.text+0x114bfe): undefined reference to `ath_printk'
(.text+0x117329): undefined reference to `ath_regd_get_band_ctl'
(.text+0x119734): undefined reference to `ath_hw_setbssidmask'
(.text+0x12800f): undefined reference to `ath_hw_cycle_counters_update'
(.text+0x128016): undefined reference to `ath_hw_get_listen_time'
ERROR: "cfc_write_array_to_buffer" [drivers/staging/comedi/drivers/ni_at_a2150.ko] undefined!
net/bridge/br_netlink.c:304:2: error: implicit declaration of function 'br_mdb_init' [-Werror=implicit-function-declaration]
net/bridge/br_netlink.c:311:2: error: implicit declaration of function 'br_mdb_uninit' [-Werror=implicit-function-declaration]
include/net/netfilter/nf_conntrack.h:77:22: error: field 'ct_general' has incomplete type
include/net/netfilter/nf_conntrack.h:157:30: error: 'const struct sk_buff' has no member named 'nfct'
include/net/netfilter/nf_conntrack.h:164:2: error: implicit declaration of function 'nf_conntrack_put' [-Werror=implicit-function-declaration]
net/netfilter/xt_CT.c:30:2: error: 'struct sk_buff' has no member named 'nfct'
net/netfilter/xt_CT.c:155:15: error: 'struct net' has no member named 'ct'
net/netfilter/xt_CT.c:397:2: error: implicit declaration of function 'nf_conntrack_get' [-Werror=implicit-function-declaration]

[warnings]
warning: (SOC_IMX6Q && ARCH_TEGRA_2x_SOC && ARCH_TEGRA_3x_SOC) selects ARM_ERRATA_751472 which has unmet direct dependencies (CPU_V7 && !ARCH_MULTIPLATFORM)
warning: (SOC_IMX6Q && ARCH_TEGRA_3x_SOC) selects ARM_ERRATA_743622 which has unmet direct dependencies (CPU_V7 && !ARCH_MULTIPLATFORM)
fs/binfmt_elf.c:998:2: warning: operation on 'regs->r1' may be undefined [-Wsequence-point]
include/asm-generic/dma-mapping-common.h:93:18: warning: 'dma_addr' may be used uninitialized in this function [-Wmaybe-uninitialized]
warning: (NETFILTER_XT_TARGET_NOTRACK) selects NETFILTER_XT_TARGET_CT which has unmet direct dependencies (NET && INET && NETFILTER && NETFILTER_XTABLES && NF_CONNTRACK && (IP_NF_RAW || IP6_NF_RAW) && NETFILTER_ADVANCED)

[smatch]
mm/mempolicy.c:2386 shared_policy_replace() error: potential NULL dereference 'mpol_new'.
drivers/net/ethernet/broadcom/bnx2x/bnx2x_sriov.c:870 bnx2x_vfop_mcast_cmd() error: potential NULL dereference 'mc'.
drivers/net/ethernet/qlogic/qlcnic/qlcnic_main.c:1744 qlcnic_probe() error: potential NULL dereference 'adapter'.
drivers/net/ethernet/qlogic/qlcnic/qlcnic_83xx_hw.c:1683 qlcnic_83xx_config_intrpt() warn: '2' 2 can't fit into 1 'type'

---
0-DAY kernel build testing backend         Open Source Technology Center
Fengguang Wu, Yuanhan Liu                              Intel Corporation
