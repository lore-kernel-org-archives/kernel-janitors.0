From: Fengguang Wu <fengguang.wu@intel.com>
Date: Wed, 12 Jun 2013 16:04:34 +0000
Subject: build regressions 2013-06-12
Message-Id: <51b89c12.SQTYN/Zmn8FB/vsb%fengguang.wu@intel.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

[errors]
drivers/dma/dw/platform.c:220:18: error: invalid type argument of '->' (have 'struct device')

[warnings]
drivers/gpu/drm/drm_fb_helper.c:127:3: warning: passing argument 1 of 'fb_get_options' discards 'const' qualifier from pointer target type [enabled by default]
drivers/gpu/drm/drm_edid_load.c:246:25: warning: initialization discards 'const' qualifier from pointer target type [enabled by default]
warning: (DW_DMAC && DW_DMAC_PCI) selects DW_DMAC_CORE which has unmet direct dependencies (DMADEVICES && GENERIC_HARDIRQS)
warning: (DW_DMAC && DW_DMAC_PCI) selects DW_DMAC_CORE which has unmet direct dependencies (DMADEVICES && GENERIC_HARDIRQS)
warning: (DW_DMAC && DW_DMAC_PCI) selects DW_DMAC_CORE which has unmet direct dependencies (DMADEVICES && GENERIC_HARDIRQS)
warning: (DW_DMAC && DW_DMAC_PCI) selects DW_DMAC_CORE which has unmet direct dependencies (DMADEVICES && GENERIC_HARDIRQS)
warning: (DW_DMAC && DW_DMAC_PCI) selects DW_DMAC_CORE which has unmet direct dependencies (DMADEVICES && GENERIC_HARDIRQS)
warning: (DW_DMAC && DW_DMAC_PCI) selects DW_DMAC_CORE which has unmet direct dependencies (DMADEVICES && GENERIC_HARDIRQS)
drivers/net/macvtap.c:1027:3: warning: 'ret' may be used uninitialized in this function [-Wmaybe-uninitialized]

[sparse]
drivers/gpu/drm/drm_fb_helper.c:127:58: sparse: incorrect type in argument 1 (different modifiers)
drivers/gpu/drm/drm_edid_load.c:246:54: sparse: incorrect type in initializer (different modifiers)
drivers/net/ethernet/via/via-velocity.c:97:26: sparse: incorrect type in initializer (different address spaces)
drivers/net/ethernet/via/via-velocity.c:100:49: sparse: incorrect type in argument 2 (different base types)
drivers/net/ethernet/via/via-velocity.c:102:36: sparse: incorrect type in argument 2 (different address spaces)
drivers/net/ethernet/via/via-velocity.c:2256:40: sparse: incorrect type in argument 2 (different base types)
drivers/net/ethernet/via/via-velocity.c:2264:48: sparse: incorrect type in argument 2 (different base types)
drivers/net/ethernet/via/via-velocity.c:2437:48: sparse: incorrect type in argument 2 (different base types)
drivers/net/ethernet/via/via-velocity.c:2450:48: sparse: incorrect type in argument 2 (different base types)
drivers/net/ethernet/via/via-velocity.c:2881:40: sparse: incorrect type in argument 2 (different base types)
drivers/net/ethernet/via/via-velocity.c:3153:48: sparse: incorrect type in argument 2 (different base types)
drivers/net/ethernet/via/via-velocity.c:3159:48: sparse: incorrect type in argument 2 (different base types)
drivers/net/ethernet/via/via-velocity.c:3211:40: sparse: incorrect type in argument 2 (different base types)
drivers/net/ethernet/via/via-velocity.c:3278:48: sparse: incorrect type in argument 2 (different base types)
drivers/net/ethernet/via/via-velocity.c:3293:48: sparse: incorrect type in argument 2 (different base types)
drivers/net/ethernet/via/via-velocity.c:97:26: sparse: incorrect type in initializer (different address spaces)
drivers/net/ethernet/via/via-velocity.c:100:49: sparse: incorrect type in argument 2 (different base types)
drivers/net/ethernet/via/via-velocity.c:102:36: sparse: incorrect type in argument 2 (different address spaces)
drivers/net/ethernet/via/via-velocity.c:2256:40: sparse: incorrect type in argument 2 (different base types)
drivers/net/ethernet/via/via-velocity.c:2264:48: sparse: incorrect type in argument 2 (different base types)
drivers/net/ethernet/via/via-velocity.c:2437:48: sparse: incorrect type in argument 2 (different base types)
drivers/net/ethernet/via/via-velocity.c:2450:48: sparse: incorrect type in argument 2 (different base types)
drivers/net/ethernet/via/via-velocity.c:2881:40: sparse: incorrect type in argument 2 (different base types)
drivers/net/ethernet/via/via-velocity.c:3153:48: sparse: incorrect type in argument 2 (different base types)
drivers/net/ethernet/via/via-velocity.c:3159:48: sparse: incorrect type in argument 2 (different base types)
drivers/net/ethernet/via/via-velocity.c:3211:40: sparse: incorrect type in argument 2 (different base types)
drivers/net/ethernet/via/via-velocity.c:3278:48: sparse: incorrect type in argument 2 (different base types)
drivers/net/ethernet/via/via-velocity.c:3293:48: sparse: incorrect type in argument 2 (different base types)
net/core/sysctl_net_core.c:114:31: sparse: incompatible types in comparison expression (different address spaces)
net/core/sysctl_net_core.c:143:29: sparse: incompatible types in comparison expression (different address spaces)
net/core/net-procfs.c:155:14: sparse: incompatible types in comparison expression (different address spaces)
drivers/net/ethernet/broadcom/bnx2x/bnx2x_ethtool.c:1394:59: sparse: restricted pci_power_t degrades to integer
drivers/net/ethernet/broadcom/bnx2x/bnx2x_ethtool.c:1394:70: sparse: restricted pci_power_t degrades to integer
drivers/net/ethernet/broadcom/bnx2x/bnx2x_ethtool.c:1394:59: sparse: restricted pci_power_t degrades to integer
drivers/net/ethernet/broadcom/bnx2x/bnx2x_ethtool.c:1394:70: sparse: restricted pci_power_t degrades to integer
arch/x86/net/bpf_jit_comp.c:43:24: sparse: cast truncates bits from constant value (e0478b4c becomes 4c)
arch/x86/net/bpf_jit_comp.c:45:31: sparse: cast truncates bits from constant value (e0478b4c becomes 8b4c)
net/sctp/ipv6.c:163:18: sparse: incorrect type in assignment (different base types)
net/sctp/ipv6.c:164:18: sparse: incorrect type in assignment (different base types)
net/sctp/ipv6.c:169:31: sparse: incorrect type in assignment (different base types)
net/sctp/ipv6.c:170:31: sparse: incorrect type in assignment (different base types)
net/ipv4/af_inet.c:1410:59: sparse: restricted __be16 degrades to integer
drivers/dma/dw/platform.c:191:24: sparse: incorrect type in argument 1 (different address spaces)
drivers/dma/dw/platform.c:192:36: sparse: incorrect type in argument 1 (different address spaces)
drivers/dma/dw/platform.c:220:13: sparse: cannot dereference this type
drivers/base/dd.c:139:6: sparse: symbol 'driver_deferred_probe_trigger' was not declared. Should it be static?
mm/memory.c:266:13: sparse: undefined identifier 'tlb_fast_mode'

---
0-DAY kernel build testing backend              Open Source Technology Center
http://lists.01.org/mailman/listinfo/kbuild                 Intel Corporation
