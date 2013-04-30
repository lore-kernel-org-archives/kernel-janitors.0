From: Fengguang Wu <fengguang.wu@intel.com>
Date: Tue, 30 Apr 2013 17:00:54 +0000
Subject: build regressions 2013-04-30
Message-Id: <517ff8c6.lCkdXSiRP7fBsLNc%fengguang.wu@intel.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

[errors]
arch/arm/kernel/setup.c:653:30: error: 'of_default_bus_match_table' undeclared (first use in this function)
fs/binfmt_elf_fdpic.c:970:50: error: expected ')' before ';' token
fs/binfmt_elf_fdpic.c:971:12: error: too few arguments to function 'read_code'
net/netfilter/nf_log.c:373:38: error: 'struct netns_nf' has no member named 'proc_netfilter'
net/netfilter/nf_log.c:381:37: error: 'struct netns_nf' has no member named 'proc_netfilter'
drivers/mtd/mtdcore.c:1184:42: error: 'mtd_proc_ops' undeclared (first use in this function)
drivers/isdn/hardware/avm/b1.c:705:2: error: implicit declaration of function 'PDE_DATA' [-Werror=implicit-function-declaration]
drivers/isdn/hardware/avm/c4.c:1132:2: error: implicit declaration of function 'PDE_DATA' [-Werror=implicit-function-declaration]
net/netfilter/xt_hashlimit.c:852:3: error: implicit declaration of function 'PDE_DATA' [-Werror=implicit-function-declaration]
arch/powerpc/mm/hugetlbpage.c:212:2: error: implicit declaration of function 'shift_to_mmu_psize' [-Werror=implicit-function-declaration]
arch/powerpc/mm/hugetlbpage.c:318:3: error: implicit declaration of function 'mmu_psize_to_shift' [-Werror=implicit-function-declaration]
arch/sh/mm/alignment.c:143:2: error: implicit declaration of function 'PDE_DATA' [-Werror=implicit-function-declaration]
net/bluetooth/cmtp/capi.c:542:2: error: implicit declaration of function 'PDE_DATA' [-Werror=implicit-function-declaration]

[warnings]
Warning(mm/filemap.c:1403): No description found for parameter 'iter'
Warning(mm/filemap.c:1403): Excess function parameter 'iov_iter' description in 'generic_file_read_iter'
drivers/isdn/hardware/avm/b1.c:705:2: warning: passing argument 3 of 'single_open' makes pointer from integer without a cast [enabled by default]
drivers/isdn/hardware/avm/c4.c:1132:2: warning: passing argument 3 of 'single_open' makes pointer from integer without a cast [enabled by default]
net/netfilter/xt_hashlimit.c:852:15: warning: assignment makes pointer from integer without a cast [enabled by default]
security/integrity/ima/ima_api.c:243:1: warning: 'ima_audit_measurement' uses dynamic stack allocation [enabled by default]
warning: (ARM_GIC && ARM_VIC && RENESAS_INTC_IRQPIN && RENESAS_IRQC && VERSATILE_FPGA_IRQ && REGMAP && GPIO_LYNXPOINT && GPIO_GRGPIO && GPIO_PCF857X && GPIO_LANGWELL && MFD_CORE && MFD_MAX77686 && MFD_MAX8997 && AB8500_CORE && MFD_LP8788 && MFD_TPS65910 && TWL4030_CORE && MFD_WM831X_I2C && MFD_WM831X_SPI && EXTCON_MAX77693) selects IRQ_DOMAIN which has unmet direct dependencies (HAVE_GENERIC_HARDIRQS)
warning: (ARM_GIC && ARM_VIC && RENESAS_INTC_IRQPIN && RENESAS_IRQC && VERSATILE_FPGA_IRQ && REGMAP && GPIO_LYNXPOINT && GPIO_GRGPIO && GPIO_PCF857X && GPIO_LANGWELL && MFD_CORE && MFD_MAX77686 && MFD_MAX8997 && AB8500_CORE && MFD_LP8788 && MFD_TPS65910 && TWL4030_CORE && MFD_WM831X_I2C && MFD_WM831X_SPI && EXTCON_MAX77693) selects IRQ_DOMAIN which has unmet direct dependencies (HAVE_GENERIC_HARDIRQS)
warning: (ARM_GIC && ARM_VIC && RENESAS_INTC_IRQPIN && RENESAS_IRQC && VERSATILE_FPGA_IRQ && REGMAP && GPIO_LYNXPOINT && GPIO_GRGPIO && GPIO_PCF857X && GPIO_LANGWELL && MFD_CORE && MFD_MAX77686 && MFD_MAX8997 && AB8500_CORE && MFD_LP8788 && MFD_TPS65910 && TWL4030_CORE && MFD_WM831X_I2C && MFD_WM831X_SPI && EXTCON_MAX77693) selects IRQ_DOMAIN which has unmet direct dependencies (HAVE_GENERIC_HARDIRQS)
net/netfilter/ipset/ip_set_bitmap_ipmac.c:72:2: warning: 'ip' may be used uninitialized in this function [-Wmaybe-uninitialized]
net/bluetooth/cmtp/capi.c:542:2: warning: passing argument 3 of 'single_open' makes pointer from integer without a cast [enabled by default]

[sparse]
net/ipv6/icmp.c:375:13: sparse: context imbalance in 'icmp6_send' - different lock contexts for basic block
net/netfilter/ipset/ip_set_hash_gen.h:570:9: sparse: incorrect type in assignment (different address spaces)
net/netfilter/ipset/ip_set_hash_gen.h:611:13: sparse: incompatible types in comparison expression (different address spaces)
net/netfilter/ipset/ip_set_hash_gen.h:611:13: sparse: incompatible types in comparison expression (different address spaces)

---
0-DAY kernel build testing backend              Open Source Technology Center
http://lists.01.org/mailman/listinfo/kbuild                 Intel Corporation
