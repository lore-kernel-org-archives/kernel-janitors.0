From: Fengguang Wu <fengguang.wu@intel.com>
Date: Mon, 17 Jun 2013 17:13:21 +0000
Subject: build regressions 2013-06-17
Message-Id: <51bf43b1.hNSg8oScMp2G+Lu1%fengguang.wu@intel.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

[errors]
arch/arm/kernel/entry-armv.S:692: Error: selected processor does not support ARM mode `ldrd r4,r5,[r2,#96]'
drivers/net/ethernet/alx/alx_main.c:1680:3: error: implicit declaration of function 'pci_prepare_to_sleep' [-Werror=implicit-function-declaration]
ab3100.c:(.text+0x71352): undefined reference to `syscon_node_to_regmap'
av7110.c:(.text+0x3043e7): undefined reference to `stv0299_attach'
av7110.c:(.text+0x3045ae): undefined reference to `stv0299_attach'
ngene-cards.c:(.text+0x30bbc5): undefined reference to `stv090x_attach'
saa7134-dvb.c:(.text+0x3479c1): undefined reference to `zl10039_attach'
drivers/net/ethernet/alx/alx_main.c:764:2: error: invalid use of undefined type 'struct msix_entry'
drivers/net/ethernet/alx/alx_main.c:764:34: error: dereferencing pointer to incomplete type
drivers/net/ethernet/alx/alx_main.c:781:3: error: invalid use of undefined type 'struct msix_entry'
drivers/net/ethernet/alx/alx_main.c:781:35: error: dereferencing pointer to incomplete type
drivers/net/ethernet/alx/alx_main.c:786:5: error: invalid use of undefined type 'struct msix_entry'
drivers/net/ethernet/alx/alx_main.c:786:28: error: dereferencing pointer to incomplete type
drivers/net/ethernet/alx/alx_main.c:788:4: error: invalid use of undefined type 'struct msix_entry'
drivers/net/ethernet/alx/alx_main.c:788:27: error: dereferencing pointer to incomplete type
drivers/net/ethernet/alx/alx_main.c:801:3: error: implicit declaration of function 'pci_disable_msix' [-Werror=implicit-function-declaration]
drivers/net/ethernet/alx/alx_main.c:811:3: error: implicit declaration of function 'pci_disable_msi' [-Werror=implicit-function-declaration]
drivers/net/ethernet/alx/alx_main.c:902:4: error: invalid use of undefined type 'struct msix_entry'
drivers/net/ethernet/alx/alx_main.c:902:34: error: dereferencing pointer to incomplete type
drivers/net/ethernet/alx/alx_main.c:934:3: error: implicit declaration of function 'pci_enable_msi' [-Werror=implicit-function-declaration]
drivers/net/ethernet/alx/alx_main.c:989:3: error: invalid use of undefined type 'struct msix_entry'
drivers/net/ethernet/alx/alx_main.c:989:26: error: dereferencing pointer to incomplete type
drivers/net/ethernet/alx/alx_main.c:992:4: error: invalid use of undefined type 'struct msix_entry'
drivers/net/ethernet/alx/alx_main.c:992:27: error: dereferencing pointer to incomplete type
drivers/net/ethernet/alx/alx_main.c:1262:13: error: invalid application of 'sizeof' to incomplete type 'struct msix_entry'
drivers/net/ethernet/alx/alx_main.c:1270:3: error: invalid use of undefined type 'struct msix_entry'
drivers/net/ethernet/alx/alx_main.c:1270:17: error: dereferencing pointer to incomplete type
drivers/net/ethernet/alx/alx_main.c:1272:2: error: implicit declaration of function 'pci_enable_msix' [-Werror=implicit-function-declaration]
drivers/net/ethernet/alx/alx_main.c:2484:2: error: implicit declaration of function 'pci_enable_device_mem' [-Werror=implicit-function-declaration]
drivers/net/ethernet/alx/alx_main.c:2511:2: error: implicit declaration of function 'pci_select_bars' [-Werror=implicit-function-declaration]
drivers/net/ethernet/alx/alx_main.c:2512:2: error: implicit declaration of function 'pci_request_selected_regions' [-Werror=implicit-function-declaration]
drivers/net/ethernet/alx/alx_main.c:2677:2: error: implicit declaration of function 'pci_release_selected_regions' [-Werror=implicit-function-declaration]
drivers/net/ethernet/alx/alx_hw.c:1251:2: error: implicit declaration of function 'pcie_get_readrq' [-Werror=implicit-function-declaration]
drivers/net/ethernet/alx/alx_hw.c:1257:3: error: implicit declaration of function 'pcie_set_readrq' [-Werror=implicit-function-declaration]
drivers/net/ethernet/alx/alx_ethtool.c:964:3: error: invalid use of undefined type 'struct msix_entry'
drivers/net/ethernet/alx/alx_ethtool.c:964:28: error: dereferencing pointer to incomplete type
drivers/net/ethernet/alx/alx_ethtool.c:1048:3: error: invalid use of undefined type 'struct msix_entry'
drivers/net/ethernet/alx/alx_ethtool.c:1048:35: error: dereferencing pointer to incomplete type
drivers/net/ethernet/alx/alx_ethtool.c:1091:3: error: invalid use of undefined type 'struct msix_entry'
drivers/net/ethernet/alx/alx_ethtool.c:1091:33: error: dereferencing pointer to incomplete type
drivers/net/ethernet/alx/alx_ethtool.c:1092:3: error: invalid use of undefined type 'struct msix_entry'
drivers/net/ethernet/alx/alx_ethtool.c:1092:26: error: dereferencing pointer to incomplete type
drivers/net/ethernet/alx/alx_ethtool.c:1114:2: error: implicit declaration of function 'pci_disable_msix' [-Werror=implicit-function-declaration]
drivers/net/ethernet/alx/alx_ethtool.c:1161:2: error: implicit declaration of function 'pci_disable_msi' [-Werror=implicit-function-declaration]
compat_binfmt_elf.c:(.text+0x433ec): undefined reference to `elf_core_extra_phdrs'
compat_binfmt_elf.c:(.text+0x43da4): undefined reference to `elf_core_extra_data_size'
compat_binfmt_elf.c:(.text+0x4414c): undefined reference to `elf_core_write_extra_phdrs'
compat_binfmt_elf.c:(.text+0x44374): undefined reference to `elf_core_write_extra_data'

[warnings]
drivers/block/rbd.c:510:2: warning: 'return' with a value, in function returning void [enabled by default]
warning: (ARM_GIC && ARM_VIC && ORION_IRQCHIP && RENESAS_INTC_IRQPIN && RENESAS_IRQC && VERSATILE_FPGA_IRQ && REGMAP && GPIO_LYNXPOINT && GPIO_GRGPIO && GPIO_PCF857X && GPIO_LANGWELL && MFD_CORE && MFD_MAX77686 && MFD_MAX8997 && AB8500_CORE && MFD_LP8788 && MFD_TPS65910 && TWL4030_CORE && MFD_WM831X_I2C && MFD_WM831X_SPI && EXTCON_MAX77693) selects IRQ_DOMAIN which has unmet direct dependencies (HAVE_GENERIC_HARDIRQS)
warning: (ARM_GIC && ARM_VIC && ORION_IRQCHIP && RENESAS_INTC_IRQPIN && RENESAS_IRQC && VERSATILE_FPGA_IRQ && REGMAP && GPIO_LYNXPOINT && GPIO_GRGPIO && GPIO_PCF857X && GPIO_LANGWELL && MFD_CORE && MFD_MAX77686 && MFD_MAX8997 && AB8500_CORE && MFD_LP8788 && MFD_TPS65910 && TWL4030_CORE && MFD_WM831X_I2C && MFD_WM831X_SPI && EXTCON_MAX77693) selects IRQ_DOMAIN which has unmet direct dependencies (HAVE_GENERIC_HARDIRQS)
warning: (ARM_GIC && ARM_VIC && ORION_IRQCHIP && RENESAS_INTC_IRQPIN && RENESAS_IRQC && VERSATILE_FPGA_IRQ && REGMAP && GPIO_LYNXPOINT && GPIO_GRGPIO && GPIO_PCF857X && GPIO_LANGWELL && MFD_CORE && MFD_MAX77686 && MFD_MAX8997 && AB8500_CORE && MFD_LP8788 && MFD_TPS65910 && TWL4030_CORE && MFD_WM831X_I2C && MFD_WM831X_SPI && EXTCON_MAX77693) selects IRQ_DOMAIN which has unmet direct dependencies (HAVE_GENERIC_HARDIRQS)
include/linux/skbuff.h:683:37: warning: 'rx_skb' may be used uninitialized in this function [-Wmaybe-uninitialized]
drivers/net/ethernet/renesas/sh_eth.c:482:22: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
drivers/net/ethernet/renesas/sh_eth.c:483:22: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
drivers/net/ethernet/renesas/sh_eth.c:492:22: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
drivers/net/ethernet/renesas/sh_eth.c:493:22: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]

[sparse]
drivers/md/dm-stripe.c:443:12: sparse: symbol 'dm_stripe_init' was not declared. Should it be static?
drivers/md/dm-stripe.c:456:6: sparse: symbol 'dm_stripe_exit' was not declared. Should it be static?
lib/libcrc32c.c:42:5: sparse: symbol 'crc32c' was not declared. Should it be static?
drivers/media/dvb-frontends/tda18271c2dd_maps.h:8:23: sparse: symbol 'm_StandardTable' was not declared. Should it be static?
drivers/media/dvb-frontends/tda18271c2dd_maps.h:30:14: sparse: symbol 'm_BP_Filter_Map' was not declared. Should it be static?
drivers/media/dvb-frontends/tda18271c2dd_maps.h:802:4: sparse: symbol 'm_Thermometer_Map_1' was not declared. Should it be static?
drivers/media/dvb-frontends/tda18271c2dd_maps.h:809:4: sparse: symbol 'm_Thermometer_Map_2' was not declared. Should it be static?
arch/x86/xen/enlighten.c:768:8: sparse: symbol 'idt_desc' was not declared. Should it be static?
arch/x86/xen/enlighten.c:1421:24: sparse: symbol 'xen_start_kernel' was not declared. Should it be static?

[coccinelle]
sound/soc/codecs/wm8962.c:3608:2-8: Replace memcpy with struct assignment
drivers/devfreq/devfreq.c:651:1-7: preceding lock on line 578

---
0-DAY kernel build testing backend              Open Source Technology Center
http://lists.01.org/mailman/listinfo/kbuild                 Intel Corporation
