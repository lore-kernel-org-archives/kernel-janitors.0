From: Fengguang Wu <fengguang.wu@intel.com>
Date: Sat, 01 Dec 2012 16:07:39 +0000
Subject: build regressions 2012-12-01
Message-Id: <50ba2b4b.xJazUISt0ToVMpPV%fengguang.wu@intel.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

[errors]
kernel/sched/core.c:139:2: error: initializer element is not computable at load time
security/yama/yama_lsm.c:391:2: error: implicit declaration of function 'register_security' [-Werror=implicit-function-declaration]
drivers/mfd/arizona-irq.c:68:2: error: implicit declaration of function 'irq_set_irq_wake' [-Werror=implicit-function-declaration]
drivers/mfd/arizona-irq.c:107:2: error: implicit declaration of function 'handle_nested_irq' [-Werror=implicit-function-declaration]
drivers/mfd/arizona-irq.c:146:2: error: implicit declaration of function 'irq_set_chip_data' [-Werror=implicit-function-declaration]
drivers/mfd/arizona-irq.c:147:2: error: implicit declaration of function 'irq_set_chip_and_handler' [-Werror=implicit-function-declaration]
drivers/mfd/arizona-irq.c:147:52: error: 'handle_edge_irq' undeclared (first use in this function)
drivers/mfd/arizona-irq.c:148:2: error: implicit declaration of function 'irq_set_nested_thread' [-Werror=implicit-function-declaration]
drivers/mfd/arizona-irq.c:155:2: error: implicit declaration of function 'irq_set_noprobe' [-Werror=implicit-function-declaration]
drivers/gpu/drm/udl/udl_fb.c:237:52: error: 'PAGE_SHARED' undeclared (first use in this function)
drivers/tty/serial/serial_core.c:697:2: error: implicit declaration of function 'irq_canonicalize' [-Werror=implicit-function-declaration]
drivers/tty/serial/8250/8250.c:101:24: fatal error: asm/serial.h: No such file or directory
sound/pci/lx6464es/lx6464es.c:565:2: error: implicit declaration of function 'ioport_unmap' [-Werror=implicit-function-declaration]
sound/pci/lx6464es/lx6464es.c:1028:2: error: implicit declaration of function 'ioport_map' [-Werror=implicit-function-declaration]
drivers/media/usb/cpia2/cpia2_core.c:2405:66: error: 'PAGE_SHARED' undeclared (first use in this function)
drivers/video/udlfb.c:337:52: error: 'PAGE_SHARED' undeclared (first use in this function)
drivers/video/smscufx.c:795:52: error: 'PAGE_SHARED' undeclared (first use in this function)
drivers/video/vfb.c:431:52: error: 'PAGE_SHARED' undeclared (first use in this function)
drivers/scsi/qla1280.c:774:2: error: implicit declaration of function 'readw_relaxed' [-Werror=implicit-function-declaration]
drivers/net/ethernet/3com/3c59x.c:995:3: error: implicit declaration of function 'ioport_map' [-Werror=implicit-function-declaration]
drivers/usb/musb/musb_io.h:45:20: error: redefinition of 'readsl'
drivers/usb/musb/musb_io.h:47:20: error: redefinition of 'readsw'
drivers/usb/musb/musb_io.h:49:20: error: redefinition of 'readsb'
drivers/usb/musb/musb_io.h:52:20: error: redefinition of 'writesl'
drivers/usb/musb/musb_io.h:54:20: error: redefinition of 'writesw'
drivers/usb/musb/musb_io.h:56:20: error: redefinition of 'writesb'
drivers/usb/musb/tusb6010.c:922:2: error: implicit declaration of function 'irq_set_irq_type' [-Werror=implicit-function-declaration]
drivers/usb/host/oxu210hp-hcd.c:3839:2: error: implicit declaration of function 'irq_set_irq_type' [-Werror=implicit-function-declaration]
drivers/usb/gadget/pch_udc.c:1405:3: error: implicit declaration of function 'irq_set_irq_type' [-Werror=implicit-function-declaration]
drivers/atm/iphase.h:639:25: error: conflicting type qualifiers for 'freg_t'
drivers/pci/quirks.c:88:7: error: 'isa_dma_bridge_buggy' undeclared (first use in this function)
drivers/media/pci/zoran/zoran_driver.c:2955:14: error: 'PAGE_SHARED' undeclared (first use in this function)
drivers/firewire/ohci.c:3540:22: error: 'pci_probe' redeclared as different kind of symbol
drivers/gpu/drm/ast/ast_mode.c:871:12: error: conflicting types for 'get_clock'
drivers/gpu/drm/ast/ast_mode.c:891:13: error: conflicting types for 'set_clock'
drivers/base/regmap/regmap-irq.c:54:9: error: implicit declaration of function 'irq_data_get_irq_chip_data' [-Werror=implicit-function-declaration]
drivers/base/regmap/regmap-irq.c:98:4: error: implicit declaration of function 'irq_set_irq_wake' [-Werror=implicit-function-declaration]
drivers/base/regmap/regmap-irq.c:209:4: error: implicit declaration of function 'handle_nested_irq' [-Werror=implicit-function-declaration]
drivers/base/regmap/regmap-irq.c:228:2: error: implicit declaration of function 'irq_set_chip_data' [-Werror=implicit-function-declaration]
drivers/base/regmap/regmap-irq.c:229:2: error: implicit declaration of function 'irq_set_chip' [-Werror=implicit-function-declaration]
drivers/base/regmap/regmap-irq.c:230:2: error: implicit declaration of function 'irq_set_nested_thread' [-Werror=implicit-function-declaration]
drivers/base/regmap/regmap-irq.c:237:2: error: implicit declaration of function 'irq_set_noprobe' [-Werror=implicit-function-declaration]
drivers/base/regmap/regmap-irq.c:281:3: error: implicit declaration of function 'irq_alloc_descs' [-Werror=implicit-function-declaration]
drivers/gpu/drm/radeon/radeon_i2c.c:170:12: error: conflicting types for 'get_clock'
drivers/gpu/drm/radeon/radeon_i2c.c:199:13: error: conflicting types for 'set_clock'
sound/soc/codecs/wm8903.c:1954:9: error: implicit declaration of function 'irq_get_irq_data' [-Werror=implicit-function-declaration]
drivers/scsi/qla2xxx/qla_iocb.c:376:3: error: implicit declaration of function 'readw_relaxed' [-Werror=implicit-function-declaration]
drivers/scsi/qla2xxx/qla_iocb.c:488:4: error: implicit declaration of function 'readl_relaxed' [-Werror=implicit-function-declaration]
drivers/scsi/qla2xxx/qla_isr.c:224:3: error: implicit declaration of function 'readw_relaxed' [-Werror=implicit-function-declaration]
drivers/scsi/qla2xxx/qla_isr.c:2572:3: error: implicit declaration of function 'readl_relaxed' [-Werror=implicit-function-declaration]
drivers/net/ethernet/chelsio/cxgb/sge.c:374:23: error: conflicting types for 'get_clock'
drivers/message/fusion/mptbase.c:1224:2: error: implicit declaration of function 'readl_relaxed' [-Werror=implicit-function-declaration]
kernel/sched/fair.c:1179:3: error: implicit declaration of function 'sched_rebalance_to' [-Werror=implicit-function-declaration]
kernel/sched/core.c:1573:37: error: 'task_numa_scan_work' undeclared (first use in this function)
kernel/sched/core.c:1576:42: error: 'task_numa_placement_work' undeclared (first use in this function)
security/apparmor/lsm.c:916:2: error: implicit declaration of function 'register_security' [-Werror=implicit-function-declaration]
security/tomoyo/tomoyo.c:553:2: error: implicit declaration of function 'register_security' [-Werror=implicit-function-declaration]
security/smack/smack_lsm.c:3605:2: error: implicit declaration of function 'register_security' [-Werror=implicit-function-declaration]
security/selinux/hooks.c:5701:2: error: implicit declaration of function 'register_security' [-Werror=implicit-function-declaration]
security/selinux/hooks.c:5842:2: error: too few arguments to function 'reset_security_ops'
include/linux/lsm.h:151:25: error: dereferencing pointer to incomplete type

[warnings]
drivers/spi/spi-atmel.c:1007: warning: 'atmel_spi_remove' defined but not used
kernel/sched/features.h:88:1: warning: left shift count >= width of type [enabled by default]
WARNING: arch/x86/built-in.o(.cpuinit.text+0x31f2): Section mismatch in reference from the function load_ucode_intel_ap() to the function .init.text:apply_microcode_early.isra.1.constprop.6()
WARNING: drivers/built-in.o(.text+0x61b98): Section mismatch in reference from the function twlreg_probe() to the variable .devinit.rodata:twl_of_match
WARNING: arch/x86/built-in.o(.cpuinit.text+0x2070): Section mismatch in reference from the function load_ucode_intel_ap() to the function .init.text:apply_microcode_early.isra.1.constprop.5()
WARNING: arch/powerpc/kernel/built-in.o(.text+0x3ddb0): Section mismatch in reference from the function .start_secondary() to the function .cpuinit.text:.vdso_getcpu_init()
WARNING: vmlinux.o(.text+0x49214): Section mismatch in reference from the function .start_secondary() to the function .cpuinit.text:.notify_cpu_starting()
drivers/misc/tifm_7xx1.c:297:1: warning: 'tifm_7xx1_resume' uses dynamic stack allocation [enabled by default]
include/asm-generic/io.h:116:2: warning: passing argument 1 of 'zpci_read_u8' makes pointer from integer without a cast [enabled by default]
include/asm-generic/io.h:121:2: warning: passing argument 1 of 'zpci_read_u16' makes pointer from integer without a cast [enabled by default]
include/asm-generic/io.h:126:2: warning: passing argument 1 of 'zpci_read_u32' makes pointer from integer without a cast [enabled by default]
include/asm-generic/io.h:131:2: warning: passing argument 2 of 'zpci_write_u8' makes pointer from integer without a cast [enabled by default]
include/asm-generic/io.h:136:2: warning: passing argument 2 of 'zpci_write_u16' makes pointer from integer without a cast [enabled by default]
include/asm-generic/io.h:141:2: warning: passing argument 2 of 'zpci_write_u32' makes pointer from integer without a cast [enabled by default]
drivers/media/tuners/tuner-xc2028.c:651:1: warning: 'load_firmware' uses dynamic stack allocation [enabled by default]
lib/reed_solomon/reed_solomon.c:373:1: warning: 'decode_rs16' uses dynamic stack allocation [enabled by default]
lib/reed_solomon/reed_solomon.c:329:1: warning: 'decode_rs8' uses dynamic stack allocation [enabled by default]
drivers/mtd/inftlmount.c:429:1: warning: 'INFTL_formatblock' uses dynamic stack allocation [enabled by default]
drivers/mtd/nftlmount.c:294:1: warning: 'check_free_sectors' uses dynamic stack allocation [enabled by default]
sound/pci/lx6464es/lx6464es.c:1028:26: warning: assignment makes pointer from integer without a cast [enabled by default]
drivers/mtd/nand/denali.c:543:1: warning: 'denali_nand_timing_set' uses dynamic stack allocation [enabled by default]
drivers/staging/line6/midi.c:83:1: warning: 'line6_midi_transmit' uses dynamic stack allocation [enabled by default]
drivers/scsi/dpt_i2o.c:1984:1: warning: 'adpt_i2o_passthru' uses dynamic stack allocation [enabled by default]
drivers/usb/gadget/f_fs.c:681:1: warning: 'ffs_ep0_read' uses dynamic stack allocation [enabled by default]
crypto/async_tx/async_pq.c:242:1: warning: 'async_gen_syndrome' uses dynamic stack allocation [enabled by default]
drivers/media/pci/ttpci/av7110_hw.c:510:1: warning: 'av7110_fw_cmd' uses dynamic stack allocation [enabled by default]
drivers/net/ethernet/neterion/vxge/vxge-config.c:1090:1: warning: 'vxge_hw_device_hw_info_get' uses dynamic stack allocation [enabled by default]
sound/core/pcm_native.c:333:1: warning: 'snd_pcm_hw_refine' uses dynamic stack allocation [enabled by default]
sound/core/oss/pcm_oss.c:1701:1: warning: 'snd_pcm_oss_sync' uses dynamic stack allocation [enabled by default]
drivers/mtd/tests/mtd_torturetest.c:409:1: warning: 'tort_init' uses dynamic stack allocation [enabled by default]
drivers/dma/dmatest.c:510:1: warning: 'dmatest_func' uses dynamic stack allocation [enabled by default]
drivers/gpu/drm/drm_lock.c:196:3: warning: passing argument 1 of '__cmpxchg' discards 'volatile' qualifier from pointer target type [enabled by default]
sound/soc/soc-core.c:167:1: warning: 'soc_codec_reg_show' uses dynamic stack allocation [enabled by default]
drivers/base/regmap/regmap-irq.c:54:35: warning: initialization makes pointer from integer without a cast [enabled by default]
lib/bch.c:1336:1: warning: 'init_bch' uses dynamic stack allocation [enabled by default]
lib/bch.c:540:1: warning: 'find_affine4_roots' uses dynamic stack allocation [enabled by default]
sound/soc/codecs/wm8903.c:1954:30: warning: initialization makes pointer from integer without a cast [enabled by default]
fs/pstore/ram_core.c:104:1: warning: 'persistent_ram_decode_rs8' uses dynamic stack allocation [enabled by default]
fs/pstore/ram_core.c:92:1: warning: 'persistent_ram_encode_rs8' uses dynamic stack allocation [enabled by default]
drivers/media/dvb-frontends/cxd2820r_core.c:51:1: warning: 'cxd2820r_wr_regs_i2c.isra.0' uses dynamic stack allocation [enabled by default]
drivers/media/dvb-frontends/cxd2820r_core.c:136:1: warning: 'cxd2820r_rd_regs' uses dynamic stack allocation [enabled by default]
drivers/media/dvb-frontends/bcm3510.c:230:1: warning: 'bcm3510_do_hab_cmd' uses dynamic stack allocation [enabled by default]
drivers/media/dvb-frontends/stb0899_drv.c:540:1: warning: 'stb0899_write_regs' uses dynamic stack allocation [enabled by default]
drivers/media/dvb-frontends/s5h1420.c:851:1: warning: 's5h1420_tuner_i2c_tuner_xfer' uses dynamic stack allocation [enabled by default]
drivers/media/dvb-frontends/mt312.c:126:1: warning: 'mt312_write' uses dynamic stack allocation [enabled by default]
drivers/media/dvb-frontends/tda10071.c:84:1: warning: 'tda10071_rd_regs' uses dynamic stack allocation [enabled by default]
drivers/media/dvb-frontends/tda10071.c:52:1: warning: 'tda10071_wr_regs' uses dynamic stack allocation [enabled by default]
drivers/media/dvb-frontends/zl10039.c:119:1: warning: 'zl10039_write' uses dynamic stack allocation [enabled by default]
drivers/media/dvb-frontends/stv6110x.c:85:1: warning: 'stv6110x_write_regs' uses dynamic stack allocation [enabled by default]
drivers/media/dvb-frontends/tda18271c2dd.c:169:1: warning: 'UpdateRegs' uses dynamic stack allocation [enabled by default]
drivers/media/dvb-frontends/nxt200x.c:111:1: warning: 'nxt200x_writebytes' uses dynamic stack allocation [enabled by default]
warning: (CAN_PEAK_PCIEC && SFC && DRM && FB_DDC && FB_BFIN_7393 && FB_VIA && SND_AOA_ONYX && SND_AOA_TAS && SND_SOC_BFIN_EVAL_ADAU1701 && FB_OLPC_DCON) selects I2C which has unmet direct dependencies (!S390)
warning: (I2C_TAOS_EVM) selects SERIO which has unmet direct dependencies (!S390 && !UML)
warning: (CNIC) selects UIO which has unmet direct dependencies (!S390)
warning: (REGMAP && GPIO_PCF857X && GPIO_LANGWELL && MFD_CORE && MFD_TPS65910 && TWL4030_CORE && TWL6040_CORE && MFD_LP8788 && MFD_MAX77686 && MFD_MAX8997 && MFD_WM831X_I2C && MFD_WM831X_SPI && AB8500_CORE && EXTCON_MAX77693) selects IRQ_DOMAIN which has unmet direct dependencies (HAVE_GENERIC_HARDIRQS)
warning: (I2C_TAOS_EVM) selects SERIO_SERPORT which has unmet direct dependencies (!S390 && !UML && SERIO)
WARNING: vmlinux.o(.cpuinit.text+0xbcdd): Section mismatch in reference from the function load_ucode_intel_ap() to the function .init.text:load_microcode()
WARNING: vmlinux.o(.cpuinit.text+0xbcf2): Section mismatch in reference from the function load_ucode_intel_ap() to the function .init.text:apply_microcode_early.isra.1()
WARNING: arch/x86/built-in.o(.cpuinit.text+0x4dd0): Section mismatch in reference from the function load_ucode_intel_ap() to the function .init.text:apply_microcode_early.isra.1.constprop.7()
security/security.c:2058:16: warning: 'order' may be used uninitialized in this function [-Wmaybe-uninitialized]

[sparse]
drivers/net/ethernet/myricom/myri10ge/myri10ge.c:1286:34: sparse: cast to restricted __be16
drivers/net/ethernet/myricom/myri10ge/myri10ge.c:1286:16: sparse: restricted __be16 degrades to integer
drivers/gpu/drm/i915/i915_irq.c:939:43: sparse: incorrect type in argument 2 (different address spaces)
arch/x86/kernel/microcode_intel_early.c:299:33: sparse: Using plain integer as NULL pointer
security/smack/smack_lsm.c:1300:49: sparse: incorrect type in argument 1 (different address spaces)
security/smack/smackfs.c:1586:52: sparse: incorrect type in argument 1 (different address spaces)
mm/memory.c:3499:17: sparse: context imbalance in '__do_numa_page' - unexpected unlock
drivers/scsi/mpt3sas/mpt3sas_base.c:2099:26: sparse: incorrect type in initializer (different base types)
drivers/scsi/mpt3sas/mpt3sas_base.c:3236:24: sparse: incorrect type in argument 1 (different base types)
drivers/scsi/mpt3sas/mpt3sas_base.c:3257:20: sparse: cast to restricted __le16
drivers/scsi/mpt3sas/mpt3sas_scsih.c:3456:61: sparse: incorrect type in assignment (different base types)
arch/x86/kernel/microcode_intel.c:112:5: sparse: symbol 'apply_microcode' was not declared. Should it be static?
kernel/sched/core.c:1574:44: sparse: undefined identifier 'task_numa_scan_work'
kernel/sched/core.c:1577:49: sparse: undefined identifier 'task_numa_placement_work'
kernel/sched/fair.c:2131:17: sparse: undefined identifier 'sched_rebalance_to'

[smatch]
drivers/net/wireless/ath/ath9k/debug.c:1556 ath9k_get_et_strings() error: __builtin_memcpy() '*ath9k_gstrings_stats' too small (32 vs 2592)
arch/x86/kernel/microcode_intel_early.c:160 get_matching_model_microcode() warn: 'mc_saved_tmp' puts 512 bytes on stack
drivers/scsi/mpt3sas/mpt3sas_base.c:1869 mpt3sas_base_map_resources() warn: 'ioc->chip' was not released on error
drivers/scsi/mpt3sas/mpt3sas_scsih.c:2508 mpt3sas_send_trigger_data_event() warn: possible memory leak of 'fw_event'
drivers/scsi/mpt3sas/mpt3sas_scsih.c:4496 _scsih_expander_add() warn: returning -1 instead of -ENOMEM is sloppy

---
0-DAY kernel build testing backend         Open Source Technology Center
Fengguang Wu, Yuanhan Liu                              Intel Corporation
