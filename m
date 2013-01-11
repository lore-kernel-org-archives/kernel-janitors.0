From: Fengguang Wu <fengguang.wu@intel.com>
Date: Fri, 11 Jan 2013 18:43:27 +0000
Subject: build regressions 2013-01-11
Message-Id: <50f05d4f.N8KQgAXXH1qh/owr%fengguang.wu@intel.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

[errors]
arch/arm/mm/idmap.c:101:31: error: 'PMD_SECT_AP1' undeclared (first use in this function)
drivers/mtd/nand/atmel_nand.c:639: error: implicit declaration of function 'writel_relaxed'
ERROR: "clockevents_config_and_register" [drivers/clocksource/cs5535-clockevt.ko] undefined!
sound/soc/codecs/ak4642.c:550:46: error: expected '=', ',', ';', 'asm' or '__attribute__' before '__devinitconst'
ERROR: "pstore_cannot_block_path" [drivers/firmware/efivars.ko] undefined!
ERROR: "ath_printk" [drivers/net/wireless/ath/ath9k/ath9k_hw.ko] undefined!
ERROR: "ath_hw_get_listen_time" [drivers/net/wireless/ath/ath9k/ath9k_hw.ko] undefined!
ERROR: "ath_regd_get_band_ctl" [drivers/net/wireless/ath/ath9k/ath9k_hw.ko] undefined!
ERROR: "ath_hw_cycle_counters_update" [drivers/net/wireless/ath/ath9k/ath9k_hw.ko] undefined!
ERROR: "ath_hw_setbssidmask" [drivers/net/wireless/ath/ath9k/ath9k_hw.ko] undefined!
ERROR: "ath_key_delete" [drivers/net/wireless/ath/ath9k/ath9k_htc.ko] undefined!
ERROR: "ath_regd_init" [drivers/net/wireless/ath/ath9k/ath9k_htc.ko] undefined!
ERROR: "ath_is_world_regd" [drivers/net/wireless/ath/ath9k/ath9k_htc.ko] undefined!
ERROR: "ath_reg_notifier_apply" [drivers/net/wireless/ath/ath9k/ath9k_htc.ko] undefined!
ERROR: "ath_key_config" [drivers/net/wireless/ath/ath9k/ath9k_htc.ko] undefined!
ERROR: "ath_hw_keyreset" [drivers/net/wireless/ath/ath9k/ath9k_common.ko] undefined!
{standard input}:10875: Error: Unknown opcode `m'
{standard input}: Error: Unwind directive not followed by an instruction.
{standard input}:7970: Error: Operand 3 of `adds' should be a general register
{standard input}:1300: Error: Unknown opcode `c'
kernel/rcutree.c:808:2: error: implicit declaration of function 'rcu_jiffies_till_stall_check' [-Werror=implicit-function-declaration]
kernel/rcutree.c:941:6: error: 'rcu_cpu_stall_suppress' undeclared (first use in this function)
drivers/net/ethernet/smsc/atari_91C111.c:1739:22: error: expected '=', ',', ';', 'asm' or '__attribute__' before 'smc_findirq'
drivers/net/ethernet/smsc/atari_91C111.c:1813:22: error: expected '=', ',', ';', 'asm' or '__attribute__' before 'smc_probe'
drivers/net/ethernet/smsc/atari_91C111.c:2168:22: error: expected '=', ',', ';', 'asm' or '__attribute__' before 'smc_drv_probe'
drivers/net/ethernet/smsc/atari_91C111.c:2331:22: error: expected '=', ',', ';', 'asm' or '__attribute__' before 'smc_drv_remove'
drivers/net/ethernet/smsc/atari_91C111.c:2402:12: error: 'smc_drv_probe' undeclared here (not in a function)
drivers/net/ethernet/smsc/atari_91C111.c:2403:2: error: implicit declaration of function '__devexit_p' [-Werror=implicit-function-declaration]
drivers/net/ethernet/smsc/atari_91C111.c:2403:25: error: 'smc_drv_remove' undeclared here (not in a function)
include/acpi/actbl3.h:526:2: error: unknown type name 'ACPI_RASF_PARAMETER_BLOCK'
init/main.c:370:2: error: implicit declaration of function 'kernel_thread' [-Werror=implicit-function-declaration]
kernel/kthread.c:192:2: error: implicit declaration of function 'kernel_thread' [-Werror=implicit-function-declaration]
kernel/kmod.c:272:2: error: implicit declaration of function 'kernel_thread' [-Werror=implicit-function-declaration]
ERROR: "mdiobus_alloc_size" [drivers/net/ethernet/marvell/mvmdio.ko] undefined!
ERROR: "mdiobus_free" [drivers/net/ethernet/marvell/mvmdio.ko] undefined!
ERROR: "mdiobus_unregister" [drivers/net/ethernet/marvell/mvmdio.ko] undefined!

[warnings]
arch/avr32/include/asm/param.h:6:1: warning: "HZ" redefined
arch/avr32/include/uapi/asm/param.h:6:1: warning: this is the location of the previous definition
drivers/spi/spi-atmel.c:1007: warning: 'atmel_spi_remove' defined but not used
arch/avr32/kernel/process.c:310: warning: assignment makes integer from pointer without a cast
<stdin>:1223:2: warning: #warning syscall finit_module not implemented
net/sunrpc/svc.c:1045: warning: unused variable 'buf'
{standard input}:1302: Warning: `g' was not specified with previous .proc
{standard input}:1302: Warning: `get_vfs_caps_from_disk' should be an operand to this .endp
WARNING: arch/powerpc/kernel/built-in.o(.text+0x20c9a): Section mismatch in reference from the function .smp_release_cpus() to the variable .init.data:spinning_secondaries
warning: (MPC836x_RDK && MTD_NAND_FSL_ELBC && MTD_NAND_FSL_UPM) selects FSL_LBC which has unmet direct dependencies (FSL_SOC)
warning: (CAN_PEAK_PCIEC && SFC && DRM && FB_DDC && FB_BFIN_7393 && FB_VIA && SND_AOA_ONYX && SND_AOA_TAS && SND_SOC_BFIN_EVAL_ADAU1701 && FB_OLPC_DCON) selects I2C which has unmet direct dependencies (!S390)
warning: (I2C_TAOS_EVM) selects SERIO which has unmet direct dependencies (!S390 && !UML)
warning: (CNIC) selects UIO which has unmet direct dependencies (!S390)
warning: (I2C_TAOS_EVM) selects SERIO_SERPORT which has unmet direct dependencies (!S390 && !UML && SERIO)
warning: (NET_DSA && GRETH && DNET && LPC_ENET && OCTEON_MGMT_ETHERNET && ETHOC && SH_ETH && S6GMAC && MIPS_AU1X00_ENET && MACB && BFIN_MAC && BCM63XX_ENET && SB1250_MAC && TIGON3 && FTGMAC100 && FEC && FEC_MPC52xx && FS_ENET && FSL_PQ_MDIO && FSL_XGMAC_MDIO && UCC_GETH && GIANFAR && IXP4XX_ETH && MV643XX_ETH && MVNETA && PXA168_ETH && AX88796 && W90P910_ETH && PASEMI_MAC && R6040 && SMSC911X && SMSC9420 && STMMAC_ETH && TI_DAVINCI_EMAC && TI_DAVINCI_MDIO && CPMAC && TC35815 && XILINX_EMACLITE && XILINX_AXI_EMAC && XILINX_LL_TEMAC && USB_NET_AX8817X && ET131X && OCTEON_ETHERNET) selects PHYLIB which has unmet direct dependencies (!S390 && NETDEVICES)
drivers/gpu/drm/qxl/qxl_ttm.c:416:20: warning: unused variable 'qfence' [-Wunused-variable]
drivers/md/persistent-data/dm-transaction-manager.c:28:0: warning: "HASH_SIZE" redefined [enabled by default]
include/acpi/platform/acenv.h:361:0: warning: "ACPI_ACQUIRE_GLOBAL_LOCK" redefined [enabled by default]
include/acpi/platform/acenv.h:362:0: warning: "ACPI_RELEASE_GLOBAL_LOCK" redefined [enabled by default]

[sparse]
drivers/cpufreq/cpufreq.c:51:17: sparse: symbol 'cpufreq_online_mask' was not declared. Should it be static?
drivers/acpi/acpica/acglobal.h:396:17: sparse: symbol 'acpi_method_count' was not declared. Should it be static?
drivers/acpi/acpica/acglobal.h:398:17: sparse: symbol 'acpi_sci_count' was not declared. Should it be static?
drivers/acpi/acpica/evhandler.c:60:4: sparse: symbol 'acpi_gbl_default_address_spaces' was not declared. Should it be static?
include/acpi/actbl3.h:526:35: sparse: Expected } at end of struct-union-enum-specifier
include/acpi/actbl3.h:526:35: sparse: got header
include/acpi/actbl3.h:532:1: sparse: Expected ; at the end of type declaration
include/acpi/actbl3.h:532:1: sparse: got }

[smatch]
mm/memcontrol.c:6128 mem_cgroup_css_online() warn: variable dereferenced before check 'parent' (see line 6125)
mm/memcontrol.c:6126 mem_cgroup_css_online() error: potentially derefencing uninitialized 'memcg'.
mm/memcontrol.c:5373 mem_cgroup_swappiness_write() warn: inconsistent returns mutex:&memcg_mutex: locked (5366) unlocked (5354,5357,5373)
mm/memcontrol.c:5708 mem_cgroup_oom_control_write() warn: inconsistent returns mutex:&memcg_mutex: locked (5702) unlocked (5693,5708)
crypto/asymmetric_keys/x509_public_key.c:179 x509_key_preparse() error: testing array offset 'cert->pub->pkey_algo' after use.
crypto/asymmetric_keys/x509_public_key.c:180 x509_key_preparse() error: testing array offset 'cert->sig.pkey_algo' after use.
crypto/asymmetric_keys/x509_public_key.c:181 x509_key_preparse() error: testing array offset 'cert->sig.pkey_hash_algo' after use.
crypto/asymmetric_keys/x509_public_key.c:182 x509_key_preparse() error: buffer overflow 'pkey_algo' 2 <= 2
crypto/asymmetric_keys/x509_public_key.c:184 x509_key_preparse() error: buffer overflow 'pkey_hash_algo_name' 8 <= 8
crypto/asymmetric_keys/pkcs7_verify.c:36 pkcs7_digest() error: buffer overflow 'pkey_hash_algo_name' 8 <= 8
fs/pstore/platform.c:172 pstore_dump() error: double unlock 'irqsave:flags'
net/core/dev.c:2071 netif_set_xps_queue() warn: inconsistent returns mutex:&xps_map_mutex: locked (1973) unlocked (2057,2071)
sound/usb/pcm.c:515 configure_sync_endpoint() warn: variable dereferenced before check 'subs->stream' (see line 512)
drivers/block/mtip32xx/mtip32xx.c:3930 mtip_block_shutdown() warn: variable dereferenced before check 'dd->disk' (see line 3926)

---
0-DAY kernel build testing backend         Open Source Technology Center
Fengguang Wu, Yuanhan Liu                              Intel Corporation
