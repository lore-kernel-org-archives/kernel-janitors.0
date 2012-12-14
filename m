From: Fengguang Wu <fengguang.wu@intel.com>
Date: Fri, 14 Dec 2012 17:17:44 +0000
Subject: build regressions 2012-12-14
Message-Id: <50cb5f38.EkNEIkfboqmOK/01%fengguang.wu@intel.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

[errors]
include/asm-generic/pgtable.h:462:9: error: 'mem_map' undeclared (first use in this function)
include/asm-generic/pgtable.h:462:9: error: implicit declaration of function 'page_to_section' [-Werror=implicit-function-declaration]
include/linux/mm.h:708:29: error: conflicting types for 'page_to_section'
drivers/tty/serial/8250/8250_early.c:37:24: fatal error: asm/serial.h: No such file or directory
drivers/mfd/lp8788-irq.c:68:9: error: implicit declaration of function 'irq_data_get_irq_chip_data' [-Werror=implicit-function-declaration]
drivers/mfd/lp8788-irq.c:125:4: error: implicit declaration of function 'handle_nested_irq' [-Werror=implicit-function-declaration]
drivers/mfd/lp8788-irq.c:139:2: error: implicit declaration of function 'irq_set_chip_data' [-Werror=implicit-function-declaration]
drivers/mfd/lp8788-irq.c:140:2: error: implicit declaration of function 'irq_set_chip_and_handler' [-Werror=implicit-function-declaration]
drivers/mfd/lp8788-irq.c:140:39: error: 'handle_edge_irq' undeclared (first use in this function)
drivers/mfd/lp8788-irq.c:141:2: error: implicit declaration of function 'irq_set_nested_thread' [-Werror=implicit-function-declaration]
drivers/mfd/lp8788-irq.c:146:2: error: implicit declaration of function 'irq_set_noprobe' [-Werror=implicit-function-declaration]
security/integrity/ima/ima_policy.c:257:30: error: 'DIR_CHECK' undeclared (first use in this function)
security/integrity/ima/ima_policy.c:257:51: error: 'SPECIAL_CHECK' undeclared (first use in this function)
fs/open.c:424:25: error: 'f' undeclared (first use in this function)
security/integrity/ima/ima_dir.c:142:50: error: 'SPECIAL_CHECK' undeclared (first use in this function)
fs/namei.c:3490:37: error: request for member 'name' in something not a structure or union
fs/aio.c:969:6: error: void value not ignored as it ought to be
drivers/staging/sb105x/sb_pci_mp.c:2830:26: error: 'BASE_BAUD' undeclared (first use in this function)

[warnings]
include/uapi/linux/swab.h:60:2: warning: 'ip' may be used uninitialized in this function [-Wmaybe-uninitialized]
warning: (DLM) selects IP_SCTP which has unmet direct dependencies (NET && INET && EXPERIMENTAL && (IPV6 || IPV6=n))
warning: (NET_DSA && GRETH && DNET && LPC_ENET && OCTEON_MGMT_ETHERNET && ETHOC && SH_ETH && S6GMAC && MIPS_AU1X00_ENET && MACB && BFIN_MAC && BCM63XX_ENET && SB1250_MAC && TIGON3 && FTGMAC100 && FEC && FEC_MPC52xx && FS_ENET && FSL_PQ_MDIO && FSL_XGMAC_MDIO && UCC_GETH && GIANFAR && IXP4XX_ETH && MV643XX_ETH && PXA168_ETH && AX88796 && W90P910_ETH && PASEMI_MAC && R6040 && SMSC911X && SMSC9420 && STMMAC_ETH && TI_DAVINCI_EMAC && TI_DAVINCI_MDIO && CPMAC && TC35815 && XILINX_EMACLITE && XILINX_AXI_EMAC && XILINX_LL_TEMAC && USB_NET_AX8817X && ET131X && OCTEON_ETHERNET) selects PHYLIB which has unmet direct dependencies (!S390 && NETDEVICES)
drivers/mfd/lp8788-irq.c:68:33: warning: initialization makes pointer from integer without a cast [enabled by default]
security/integrity/ima/ima_crypto.c:105:1: warning: 'ima_calc_dir_hash' uses dynamic stack allocation [enabled by default]
arch/x86/kvm/irq.c:46:18: warning: unused variable 's' [-Wunused-variable]
fs/aio.c:983:2: warning: 'return' with a value, in function returning void [enabled by default]
drivers/scsi/isci/init.c:393:2: warning: array subscript is above array bounds [-Warray-bounds]
WARNING: drivers/w1/built-in.o(.data+0x5d8): Section mismatch in reference from the variable w1_gpio_driver to the function .init.text:w1_init()
WARNING: drivers/w1/masters/built-in.o(.data+0x28c): Section mismatch in reference from the variable w1_gpio_driver to the function .init.text:matrox_w1_init()

[sparse]
mm/swapfile.c:1485:13: sparse: multiple definitions for function 'enable_swap_info'
mm/swapfile.c:1501:13: sparse: multiple definitions for function 'reinsert_swap_info'
mm/mmap.c:392:13: sparse: multiple definitions for function 'validate_mm_rb'
drivers/hwmon/max6697.c:36:10: sparse: symbol 'MAX6697_REG_TEMP' was not declared. Should it be static?
drivers/hwmon/max6697.c:37:10: sparse: symbol 'MAX6697_REG_TEMP_EXT' was not declared. Should it be static?
drivers/hwmon/max6697.c:39:10: sparse: symbol 'MAX6697_REG_MAX' was not declared. Should it be static?
drivers/hwmon/max6697.c:41:10: sparse: symbol 'MAX6697_REG_CRIT' was not declared. Should it be static?
fs/autofs4/root.c:409:9: sparse: context imbalance in 'autofs4_d_automount' - different lock contexts for basic block
net/bridge/br_multicast.c:622:30: sparse: symbol 'br_multicast_new_port_group' redeclared with different type (originally declared at net/bridge/br_private.h:443) - incompatible argument 3 (different address spaces)

[smatch]
net/netfilter/nf_tables_api.c:1417 nf_tables_newrule() error: potential NULL dereference 'old_rule'.
security/integrity/ima/ima_main.c:248 process_measurement_new() error: we previously assumed 'file' could be null (see line 169)
security/integrity/ima/ima_api.c:151 ima_collect_measurement() error: we previously assumed 'file' could be null (see line 140)

---
0-DAY kernel build testing backend         Open Source Technology Center
Fengguang Wu, Yuanhan Liu                              Intel Corporation
