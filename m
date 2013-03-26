From: Fengguang Wu <fengguang.wu@intel.com>
Date: Tue, 26 Mar 2013 16:30:52 +0000
Subject: build regressions 2013-03-26
Message-Id: <5151cd3c.J9ahhX/e5d5zp4K6%fengguang.wu@intel.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

[errors]
/c/kernel-tests/src/stable/include/linux/math64.h:43:15: error: '__LINUX_ARM_ARCH__' undeclared (first use in this function)
/c/kernel-tests/src/stable/arch/arm/include/asm/glue-df.h:107:2: error: #error Unknown data abort handler type
/c/kernel-tests/src/stable/arch/arm/include/asm/glue-pf.h:54:2: error: #error Unknown prefetch abort handler type
/c/kernel-tests/src/stable/arch/arm/include/asm/glue-cache.h:129:2: error: #error Unknown cache maintenance model
arch/arm/mach-imx/clk-busy.c:172:11: error: 'struct clk_mux' has no member named 'width'
arch/arm/mach-shmobile/board-marzen.c:107:15: error: 'MMC_CAP_SD_HIGHSPEED' undeclared here (not in a function)
ERROR: Input tree has errors, aborting (use -f to force output)
FATAL ERROR: Syntax error parsing input tree
include/linux/kprobes.h:316: error: dereferencing pointer to incomplete type
drivers/mtd/nand/atmel_nand.c:639: error: implicit declaration of function 'writel_relaxed'
include/uapi/linux/kvm_para.h:26:26: fatal error: asm/kvm_para.h: No such file or directory
drivers/video/console/fonts.c:71:2: error: #error No fonts configured.
ERROR: "matrix_keypad_parse_of_params" [drivers/input/keyboard/tca8418_keypad.ko] undefined!
ERROR: "crc32_le" [net/wireless/lib80211_crypt_wep.ko] undefined!
ERROR: "crc32_le" [net/wireless/lib80211_crypt_tkip.ko] undefined!
ERROR: "crc32_le" [fs/logfs/logfs.ko] undefined!
ERROR: "crc32_le" [fs/jffs2/jffs2.ko] undefined!
ERROR: "crc32_le" [drivers/net/usb/catc.ko] undefined!
ERROR: "crc32_le" [drivers/net/ethernet/via/via-rhine.ko] undefined!
ERROR: "crc32_le" [drivers/net/ethernet/smsc/smsc9420.ko] undefined!
ERROR: "crc32_le" [drivers/net/ethernet/sis/sis900.ko] undefined!
ERROR: "crc32_le" [drivers/net/ethernet/packetengines/yellowfin.ko] undefined!
ERROR: "crc32_le" [drivers/net/ethernet/micrel/ksz884x.ko] undefined!
ERROR: "crc32_le" [drivers/net/ethernet/micrel/ks8851.ko] undefined!
ERROR: "crc32_le" [drivers/net/ethernet/marvell/sky2.ko] undefined!
ERROR: "crc32_le" [drivers/net/ethernet/marvell/skge.ko] undefined!
ERROR: "crc32_le" [drivers/net/ethernet/fealnx.ko] undefined!
ERROR: "crc32_le" [drivers/net/ethernet/dlink/sundance.ko] undefined!
ERROR: "crc32_be" [fs/qnx6/qnx6.ko] undefined!
dm-cache-target.c:(.text+0x2748da): undefined reference to `__udivdi3'
dm-cache-target.c:(.text+0x276caa): undefined reference to `__udivdi3'
dm-cache-target.c:(.text+0x277b0c): undefined reference to `__udivdi3'
dm-cache-target.c:(.text+0x277b87): undefined reference to `__udivdi3'
(.text+0x1cd204): undefined reference to `au8522_attach'
(.text+0x1cd23c): undefined reference to `au8522_attach'
(.text+0x1cd274): undefined reference to `au8522_attach'
(.text+0x1cd2b4): undefined reference to `au8522_attach'
ERROR: "memcpy_toiovec" [drivers/misc/vmw_vmci/vmw_vmci.ko] undefined!
ERROR: "__udivdi3" [drivers/md/dm-cache.ko] undefined!
drivers/gpio/devres.c:90:2: error: implicit declaration of function 'gpio_request_one' [-Werror=implicit-function-declaration]
sound/oss/soundcard.c:69:31: error: 'MAX_DMA_CHANNELS' undeclared here (not in a function)
drivers/net/ethernet/3com/3c59x.c:1026:2: error: implicit declaration of function 'pci_iomap' [-Werror=implicit-function-declaration]
drivers/net/ethernet/3com/3c59x.c:1038:3: error: implicit declaration of function 'pci_iounmap' [-Werror=implicit-function-declaration]
mm/huge_memory.c:779:8: error: incompatible types when assigning to type 'pmd_t' from type 'int'
dma-default.c:(.text+0xb050): undefined reference to `coherentio'
dma-default.c:(.text+0xb0a0): undefined reference to `coherentio'
dma-default.c:(.text+0xb170): undefined reference to `coherentio'
dma-default.c:(.text+0xb174): undefined reference to `coherentio'
dma-default.c:(.text+0xb2cc): undefined reference to `coherentio'
dma-default.c:(.text+0xb698): undefined reference to `hw_coherentio'
dma-default.c:(.text+0xb69c): undefined reference to `hw_coherentio'
dma-default.c:(.text+0xb828): undefined reference to `coherentio'
dma-default.c:(.text+0xb82c): undefined reference to `coherentio'
dma-default.c:(.text+0xb87c): undefined reference to `hw_coherentio'
dma-default.c:(.text+0xb880): undefined reference to `hw_coherentio'
dma-default.c:(.text+0xb8ac): undefined reference to `coherentio'
dma-default.c:(.text+0xb8b0): undefined reference to `coherentio'
dma-default.c:(.text+0xb938): undefined reference to `coherentio'
dma-default.c:(.text+0xb93c): undefined reference to `coherentio'
dma-default.c:(.text+0xb9c4): undefined reference to `coherentio'
arch/powerpc/kernel/exceptions-64s.S:1399: Error: attempt to move .org backwards
arch/s390/mm/vmem.c:262:19: error: 'nr' undeclared (first use in this function)
drivers/atm/iphase.h:639:25: error: conflicting type qualifiers for 'freg_t'
sound/soc/codecs/wm8903.c:1954:9: error: implicit declaration of function 'irq_get_irq_data' [-Werror=implicit-function-declaration]
sound/pci/lx6464es/lx6464es.c:565:2: error: implicit declaration of function 'ioport_unmap' [-Werror=implicit-function-declaration]
sound/pci/lx6464es/lx6464es.c:1028:2: error: implicit declaration of function 'ioport_map' [-Werror=implicit-function-declaration]
drivers/video/vfb.c:431:52: error: 'PAGE_SHARED' undeclared (first use in this function)
drivers/video/udlfb.c:337:52: error: 'PAGE_SHARED' undeclared (first use in this function)
drivers/video/smscufx.c:795:52: error: 'PAGE_SHARED' undeclared (first use in this function)
drivers/usb/musb/tusb6010.c:922:2: error: implicit declaration of function 'irq_set_irq_type' [-Werror=implicit-function-declaration]
drivers/usb/host/oxu210hp-hcd.c:3839:2: error: implicit declaration of function 'irq_set_irq_type' [-Werror=implicit-function-declaration]
drivers/usb/gadget/pch_udc.c:1405:3: error: implicit declaration of function 'irq_set_irq_type' [-Werror=implicit-function-declaration]
drivers/tty/serial/serial_core.c:697:2: error: implicit declaration of function 'irq_canonicalize' [-Werror=implicit-function-declaration]
drivers/tty/serial/8250/8250.c:101:24: fatal error: asm/serial.h: No such file or directory
drivers/scsi/qla2xxx/qla_isr.c:224:3: error: implicit declaration of function 'readw_relaxed' [-Werror=implicit-function-declaration]
drivers/scsi/qla2xxx/qla_isr.c:2572:3: error: implicit declaration of function 'readl_relaxed' [-Werror=implicit-function-declaration]
drivers/scsi/qla2xxx/qla_iocb.c:376:3: error: implicit declaration of function 'readw_relaxed' [-Werror=implicit-function-declaration]
drivers/scsi/qla2xxx/qla_iocb.c:488:4: error: implicit declaration of function 'readl_relaxed' [-Werror=implicit-function-declaration]
drivers/scsi/qla1280.c:774:2: error: implicit declaration of function 'readw_relaxed' [-Werror=implicit-function-declaration]
drivers/pci/quirks.c:88:7: error: 'isa_dma_bridge_buggy' undeclared (first use in this function)
drivers/parport/parport_pc.c:67:25: fatal error: asm/parport.h: No such file or directory
drivers/mfd/arizona-irq.c:68:2: error: implicit declaration of function 'irq_set_irq_wake' [-Werror=implicit-function-declaration]
drivers/mfd/arizona-irq.c:107:2: error: implicit declaration of function 'handle_nested_irq' [-Werror=implicit-function-declaration]
drivers/mfd/arizona-irq.c:146:2: error: implicit declaration of function 'irq_set_chip_data' [-Werror=implicit-function-declaration]
drivers/mfd/arizona-irq.c:147:2: error: implicit declaration of function 'irq_set_chip_and_handler' [-Werror=implicit-function-declaration]
drivers/mfd/arizona-irq.c:147:52: error: 'handle_edge_irq' undeclared (first use in this function)
drivers/mfd/arizona-irq.c:148:2: error: implicit declaration of function 'irq_set_nested_thread' [-Werror=implicit-function-declaration]
drivers/mfd/arizona-irq.c:155:2: error: implicit declaration of function 'irq_set_noprobe' [-Werror=implicit-function-declaration]
drivers/message/fusion/mptbase.c:1224:2: error: implicit declaration of function 'readl_relaxed' [-Werror=implicit-function-declaration]
drivers/media/usb/cpia2/cpia2_core.c:2405:66: error: 'PAGE_SHARED' undeclared (first use in this function)
drivers/media/pci/zoran/zoran_driver.c:2955:14: error: 'PAGE_SHARED' undeclared (first use in this function)
drivers/gpu/drm/udl/udl_fb.c:237:52: error: 'PAGE_SHARED' undeclared (first use in this function)
drivers/gpu/drm/radeon/radeon_i2c.c:170:12: error: conflicting types for 'get_clock'
drivers/gpu/drm/radeon/radeon_i2c.c:199:13: error: conflicting types for 'set_clock'
drivers/gpu/drm/ast/ast_mode.c:871:12: error: conflicting types for 'get_clock'
drivers/gpu/drm/ast/ast_mode.c:891:13: error: conflicting types for 'set_clock'
drivers/firewire/ohci.c:3540:22: error: 'pci_probe' redeclared as different kind of symbol
drivers/base/regmap/regmap-irq.c:54:9: error: implicit declaration of function 'irq_data_get_irq_chip_data' [-Werror=implicit-function-declaration]
drivers/base/regmap/regmap-irq.c:98:4: error: implicit declaration of function 'irq_set_irq_wake' [-Werror=implicit-function-declaration]
drivers/base/regmap/regmap-irq.c:209:4: error: implicit declaration of function 'handle_nested_irq' [-Werror=implicit-function-declaration]
drivers/base/regmap/regmap-irq.c:228:2: error: implicit declaration of function 'irq_set_chip_data' [-Werror=implicit-function-declaration]
drivers/base/regmap/regmap-irq.c:229:2: error: implicit declaration of function 'irq_set_chip' [-Werror=implicit-function-declaration]
drivers/base/regmap/regmap-irq.c:230:2: error: implicit declaration of function 'irq_set_nested_thread' [-Werror=implicit-function-declaration]
drivers/base/regmap/regmap-irq.c:237:2: error: implicit declaration of function 'irq_set_noprobe' [-Werror=implicit-function-declaration]
drivers/base/regmap/regmap-irq.c:281:3: error: implicit declaration of function 'irq_alloc_descs' [-Werror=implicit-function-declaration]
drivers/staging/sb105x/sb_pci_mp.h:23:24: fatal error: asm/serial.h: No such file or directory
include/asm-generic/gpio.h:270:2: error: implicit declaration of function '__gpio_get_value' [-Werror=implicit-function-declaration]
include/asm-generic/gpio.h:276:2: error: implicit declaration of function '__gpio_set_value' [-Werror=implicit-function-declaration]
ERROR: "__ashrdi3" [fs/xfs/xfs.ko] undefined!
ERROR: "min_low_pfn" [drivers/block/aoe/aoe.ko] undefined!
ERROR: "max_low_pfn" [drivers/block/aoe/aoe.ko] undefined!
drivers/block/aoe/aoecmd.c:929:18: error: 'bv' undeclared (first use in this function)
drivers/input/gameport/gameport.c:124:10: error: 'struct cpuinfo_x86' has no member named 'loops_per_jiffy'
drivers/input/gameport/gameport.c:124:10: error: 'struct cpuinfo_x86' has no member named 'loops_per_jiffy'
drivers/input/gameport/gameport.c:124:10: error: 'struct cpuinfo_x86' has no member named 'loops_per_jiffy'
drivers/input/gameport/gameport.c:124:1: error: 'struct cpuinfo_x86' has no member named 'loops_per_jiffy'
drivers/input/gameport/gameport.c:124:1: error: 'struct cpuinfo_x86' has no member named 'loops_per_jiffy'
drivers/input/gameport/gameport.c:124:1: error: 'struct cpuinfo_x86' has no member named 'loops_per_jiffy'
drivers/input/gameport/gameport.c:124:1: error: 'struct cpuinfo_x86' has no member named 'loops_per_jiffy'
drivers/input/gameport/gameport.c:124:1: error: 'struct cpuinfo_x86' has no member named 'loops_per_jiffy'
drivers/input/gameport/gameport.c:124:1: error: 'struct cpuinfo_x86' has no member named 'loops_per_jiffy'
drivers/input/gameport/gameport.c:124:1: error: 'struct cpuinfo_x86' has no member named 'loops_per_jiffy'
drivers/input/gameport/gameport.c:124:1: error: 'struct cpuinfo_x86' has no member named 'loops_per_jiffy'
drivers/input/gameport/gameport.c:124:1: error: 'struct cpuinfo_x86' has no member named 'loops_per_jiffy'
drivers/input/gameport/gameport.c:124:1: error: 'struct cpuinfo_x86' has no member named 'loops_per_jiffy'
drivers/input/gameport/gameport.c:124:1: error: 'struct cpuinfo_x86' has no member named 'loops_per_jiffy'
drivers/input/gameport/gameport.c:124:1: error: 'struct cpuinfo_x86' has no member named 'loops_per_jiffy'
drivers/input/gameport/gameport.c:124:1: error: 'struct cpuinfo_x86' has no member named 'loops_per_jiffy'
drivers/input/gameport/gameport.c:124:1: error: 'struct cpuinfo_x86' has no member named 'loops_per_jiffy'
drivers/input/gameport/gameport.c:124:1: error: 'struct cpuinfo_x86' has no member named 'loops_per_jiffy'
drivers/input/gameport/gameport.c:124:1: error: 'struct cpuinfo_x86' has no member named 'loops_per_jiffy'
drivers/input/gameport/gameport.c:124:1: error: 'struct cpuinfo_x86' has no member named 'loops_per_jiffy'
make[2]: *** No rule to make target `drivers/base/fence.c', needed by `Documentation/DocBook/device-drivers.xml'.
make[2]: *** No rule to make target `include/linux/fence.h', needed by `Documentation/DocBook/device-drivers.xml'.
make[2]: *** No rule to make target `drivers/base/reservation.c', needed by `Documentation/DocBook/device-drivers.xml'.
make[2]: *** No rule to make target `include/linux/reservation.h', needed by `Documentation/DocBook/device-drivers.xml'.
make[2]: *** No rule to make target `block/blktrace.c', needed by `Documentation/DocBook/kernel-api.xml'.
drivers/net/wireless/ti/wl12xx/cmd.c:52:2: error: implicit declaration of function 'print_hex_dump_debug' [-Werror=implicit-function-declaration]
drivers/net/wireless/ti/wl12xx/scan.c:173:2: error: implicit declaration of function 'print_hex_dump_debug' [-Werror=implicit-function-declaration]
drivers/net/wireless/ti/wl18xx/scan.c:138:2: error: implicit declaration of function 'print_hex_dump_debug' [-Werror=implicit-function-declaration]
drivers/net/wireless/ti/wlcore/main.c:3269:2: error: implicit declaration of function 'print_hex_dump_debug' [-Werror=implicit-function-declaration]
drivers/net/wireless/ti/wlcore/cmd.c:1138:2: error: implicit declaration of function 'print_hex_dump_debug' [-Werror=implicit-function-declaration]
drivers/net/wireless/ti/wlcore/rx.c:155:3: error: implicit declaration of function 'print_hex_dump_debug' [-Werror=implicit-function-declaration]
drivers/net/wireless/ti/wlcore/acx.c:1836:2: error: implicit declaration of function 'print_hex_dump_debug' [-Werror=implicit-function-declaration]
drivers/net/wireless/ti/wlcore/scan.c:445:2: error: implicit declaration of function 'print_hex_dump_debug' [-Werror=implicit-function-declaration]
drivers/gpu/drm/i915/intel_crt.c:127:44: error: 'struct intel_connector' has no member named 'dpms'
(.text+0x154299): undefined reference to `led_classdev_unregister'
(.text+0x154437): undefined reference to `led_classdev_register'
net/mac80211/key.c:292:4: error: too few arguments to function '__ieee80211_set_default_key'
net/mac80211/key.c:294:4: error: too few arguments to function '__ieee80211_set_default_key'
net/mac80211/key.c:301:11: error: too few arguments to function '__ieee80211_set_default_key'
net/mac80211/key.c:304:11: error: too few arguments to function '__ieee80211_set_default_key'
(.text+0xb4d90): undefined reference to `pm_test_level'
ERROR: "__crc32c_le" [crypto/crc32c.ko] undefined!
arch/xtensa/kernel/built-in.o:(.init.literal+0x84): undefined reference to `platform_pcibios_init'
(.init.text+0x1ce): undefined reference to `platform_pcibios_init'

[warnings]
drivers/gpu/drm/i915/intel_pm.c:2631:30: warning: suggest parentheses around '&&' within '||' [-Wparentheses]
drivers/md/bcache/closure.c:340:2: warning: 'return' with a value, in function returning void [enabled by default]
fs/xfs/./xfs_trace.h:644:1: warning: format '%llu' expects argument of type 'long long unsigned int', but argument 6 has type 'xfs_fsblock_t' [-Wformat]
drivers/net/wireless/brcm80211/brcmfmac/wl_cfg80211.c:1830:2: warning: 'ssid.SSID_len' may be used uninitialized in this function [-Wuninitialized]
drivers/staging/dwc2/hcd_intr.c:59:2: warning: #warning Compiling code to track missed SOFs [-Wcpp]
drivers/media/dvb-frontends/af9033.c:188:1: warning: 'af9033_wr_reg_val_tab' uses dynamic stack allocation [enabled by default]
drivers/input/keyboard/cros_ec_keyb.c:234:1: warning: 'cros_ec_keyb_clear_keyboard' uses dynamic stack allocation [enabled by default]
warning: (ARM_GIC && ARM_VIC && RENESAS_INTC_IRQPIN && RENESAS_IRQC && VERSATILE_FPGA_IRQ && REGMAP && GPIO_LYNXPOINT && GPIO_PCF857X && GPIO_LANGWELL && MFD_CORE && MFD_TPS65910 && TWL4030_CORE && MFD_LP8788 && MFD_MAX77686 && MFD_MAX8997 && MFD_WM831X_I2C && MFD_WM831X_SPI && AB8500_CORE && EXTCON_MAX77693) selects IRQ_DOMAIN which has unmet direct dependencies (HAVE_GENERIC_HARDIRQS)
warning: (ARM_GIC && ARM_VIC && RENESAS_INTC_IRQPIN && RENESAS_IRQC && VERSATILE_FPGA_IRQ && REGMAP && GPIO_LYNXPOINT && GPIO_PCF857X && GPIO_LANGWELL && MFD_CORE && MFD_TPS65910 && TWL4030_CORE && MFD_LP8788 && MFD_MAX77686 && MFD_MAX8997 && MFD_WM831X_I2C && MFD_WM831X_SPI && AB8500_CORE && EXTCON_MAX77693) selects IRQ_DOMAIN which has unmet direct dependencies (HAVE_GENERIC_HARDIRQS)
warning: (ARM_GIC && ARM_VIC && RENESAS_INTC_IRQPIN && RENESAS_IRQC && VERSATILE_FPGA_IRQ && REGMAP && GPIO_LYNXPOINT && GPIO_PCF857X && GPIO_LANGWELL && MFD_CORE && MFD_TPS65910 && TWL4030_CORE && MFD_LP8788 && MFD_MAX77686 && MFD_MAX8997 && MFD_WM831X_I2C && MFD_WM831X_SPI && AB8500_CORE && EXTCON_MAX77693) selects IRQ_DOMAIN which has unmet direct dependencies (HAVE_GENERIC_HARDIRQS)
arch/s390/mm/vmem.c:262:38: warning: passing argument 1 of 'memset' makes pointer from integer without a cast [enabled by default]
drivers/cpufreq/cpufreq.c:1158:2: warning: passing argument 1 of 'spinlock_check' from incompatible pointer type [enabled by default]
drivers/cpufreq/cpufreq.c:1160:2: warning: passing argument 1 of 'spin_unlock_irqrestore' from incompatible pointer type [enabled by default]
drivers/staging/wlan-ng/cfg80211.c:728:2: warning: (near initialization for 'prism2_usb_cfg_ops.set_default_key') [enabled by default]
Warning(net/mac80211/sta_info.h:408): No description found for parameter 'ptks[2]'
Warning(net/mac80211/sta_info.h:408): No description found for parameter '_ptk'
Warning(net/mac80211/sta_info.h:408): Excess struct/union/enum/typedef member 'ptk' description in 'sta_info'
Warning(net/mac80211/sta_info.h:408): No description found for parameter 'ptks[2]'
Warning(net/mac80211/sta_info.h:408): No description found for parameter '_ptk'
Warning(net/mac80211/sta_info.h:408): Excess struct/union/enum/typedef member 'ptk' description in 'sta_info'
Warning(net/mac80211/sta_info.h:408): No description found for parameter 'ptks[2]'
Warning(net/mac80211/sta_info.h:408): No description found for parameter '_ptk'
Warning(net/mac80211/sta_info.h:408): Excess struct/union/enum/typedef member 'ptk' description in 'sta_info'
Warning(net/mac80211/sta_info.h:408): No description found for parameter 'ptks[2]'
Warning(net/mac80211/sta_info.h:408): No description found for parameter '_ptk'
Warning(net/mac80211/sta_info.h:408): Excess struct/union/enum/typedef member 'ptk' description in 'sta_info'
Warning(net/mac80211/sta_info.h:408): No description found for parameter 'ptks[2]'
Warning(net/mac80211/sta_info.h:408): No description found for parameter '_ptk'
Warning(net/mac80211/sta_info.h:408): Excess struct/union/enum/typedef member 'ptk' description in 'sta_info'
Warning(include/net/mac80211.h:1007): No description found for parameter 'chandef'
Warning(include/net/mac80211.h:1007): Excess struct/union/enum/typedef member 'channel' description in 'ieee80211_conf'
Warning(include/net/mac80211.h:1007): Excess struct/union/enum/typedef member 'channel_type' description in 'ieee80211_conf'
Warning(include/net/mac80211.h:1007): No description found for parameter 'chandef'
Warning(include/net/mac80211.h:1007): Excess struct/union/enum/typedef member 'channel' description in 'ieee80211_conf'
Warning(include/net/mac80211.h:1007): Excess struct/union/enum/typedef member 'channel_type' description in 'ieee80211_conf'
Warning(include/net/mac80211.h:1007): No description found for parameter 'chandef'
Warning(include/net/mac80211.h:1007): Excess struct/union/enum/typedef member 'channel' description in 'ieee80211_conf'
Warning(include/net/mac80211.h:1007): Excess struct/union/enum/typedef member 'channel_type' description in 'ieee80211_conf'
Warning(include/net/mac80211.h:1007): No description found for parameter 'chandef'
Warning(include/net/mac80211.h:1007): Excess struct/union/enum/typedef member 'channel' description in 'ieee80211_conf'
Warning(include/net/mac80211.h:1007): Excess struct/union/enum/typedef member 'channel_type' description in 'ieee80211_conf'
Warning(include/net/mac80211.h:1007): No description found for parameter 'chandef'
Warning(include/net/mac80211.h:1007): Excess struct/union/enum/typedef member 'channel' description in 'ieee80211_conf'
Warning(include/net/mac80211.h:1007): Excess struct/union/enum/typedef member 'channel_type' description in 'ieee80211_conf'
Warning(include/net/mac80211.h:1007): No description found for parameter 'chandef'
Warning(include/net/mac80211.h:1007): Excess struct/union/enum/typedef member 'channel' description in 'ieee80211_conf'
Warning(include/net/mac80211.h:1007): Excess struct/union/enum/typedef member 'channel_type' description in 'ieee80211_conf'
Warning(include/net/mac80211.h:1007): No description found for parameter 'chandef'
Warning(include/net/mac80211.h:1007): Excess struct/union/enum/typedef member 'channel' description in 'ieee80211_conf'
Warning(include/net/mac80211.h:1007): Excess struct/union/enum/typedef member 'channel_type' description in 'ieee80211_conf'
Warning(include/net/mac80211.h:1007): No description found for parameter 'chandef'
Warning(include/net/mac80211.h:1007): Excess struct/union/enum/typedef member 'channel' description in 'ieee80211_conf'
Warning(include/net/mac80211.h:1007): Excess struct/union/enum/typedef member 'channel_type' description in 'ieee80211_conf'
Warning(include/net/mac80211.h:1007): No description found for parameter 'chandef'
Warning(include/net/mac80211.h:1007): Excess struct/union/enum/typedef member 'channel' description in 'ieee80211_conf'
Warning(include/net/mac80211.h:1007): Excess struct/union/enum/typedef member 'channel_type' description in 'ieee80211_conf'
Warning(include/net/mac80211.h:1007): No description found for parameter 'chandef'
Warning(include/net/mac80211.h:1007): Excess struct/union/enum/typedef member 'channel' description in 'ieee80211_conf'
Warning(include/net/mac80211.h:1007): Excess struct/union/enum/typedef member 'channel_type' description in 'ieee80211_conf'
Warning(include/net/mac80211.h:1007): No description found for parameter 'chandef'
Warning(include/net/mac80211.h:1007): Excess struct/union/enum/typedef member 'channel' description in 'ieee80211_conf'
Warning(include/net/mac80211.h:1007): Excess struct/union/enum/typedef member 'channel_type' description in 'ieee80211_conf'
Warning(include/net/mac80211.h:1007): No description found for parameter 'chandef'
Warning(include/net/mac80211.h:1007): Excess struct/union/enum/typedef member 'channel' description in 'ieee80211_conf'
Warning(include/net/mac80211.h:1007): Excess struct/union/enum/typedef member 'channel_type' description in 'ieee80211_conf'
Warning(include/net/mac80211.h:1007): No description found for parameter 'chandef'
Warning(include/net/mac80211.h:1007): Excess struct/union/enum/typedef member 'channel' description in 'ieee80211_conf'
Warning(include/net/mac80211.h:1007): Excess struct/union/enum/typedef member 'channel_type' description in 'ieee80211_conf'
Warning(include/net/mac80211.h:1007): No description found for parameter 'chandef'
Warning(include/net/mac80211.h:1007): Excess struct/union/enum/typedef member 'channel' description in 'ieee80211_conf'
Warning(include/net/mac80211.h:1007): Excess struct/union/enum/typedef member 'channel_type' description in 'ieee80211_conf'
Warning(include/net/mac80211.h:1007): No description found for parameter 'chandef'
Warning(include/net/mac80211.h:1007): Excess struct/union/enum/typedef member 'channel' description in 'ieee80211_conf'
Warning(include/net/mac80211.h:1007): Excess struct/union/enum/typedef member 'channel_type' description in 'ieee80211_conf'
Warning(include/net/mac80211.h:1007): No description found for parameter 'chandef'
Warning(include/net/mac80211.h:1007): Excess struct/union/enum/typedef member 'channel' description in 'ieee80211_conf'
Warning(include/net/mac80211.h:1007): Excess struct/union/enum/typedef member 'channel_type' description in 'ieee80211_conf'
Warning(include/net/mac80211.h:1007): No description found for parameter 'chandef'
Warning(include/net/mac80211.h:1007): Excess struct/union/enum/typedef member 'channel' description in 'ieee80211_conf'
Warning(include/net/mac80211.h:1007): Excess struct/union/enum/typedef member 'channel_type' description in 'ieee80211_conf'
Warning(include/net/mac80211.h:1007): No description found for parameter 'chandef'
Warning(include/net/mac80211.h:1007): Excess struct/union/enum/typedef member 'channel' description in 'ieee80211_conf'
Warning(include/net/mac80211.h:1007): Excess struct/union/enum/typedef member 'channel_type' description in 'ieee80211_conf'
Warning(include/net/mac80211.h:1007): No description found for parameter 'chandef'
Warning(include/net/mac80211.h:1007): Excess struct/union/enum/typedef member 'channel' description in 'ieee80211_conf'
Warning(include/net/mac80211.h:1007): Excess struct/union/enum/typedef member 'channel_type' description in 'ieee80211_conf'
Warning(include/net/mac80211.h:1007): No description found for parameter 'chandef'
Warning(include/net/mac80211.h:1007): Excess struct/union/enum/typedef member 'channel' description in 'ieee80211_conf'
Warning(include/net/mac80211.h:1007): Excess struct/union/enum/typedef member 'channel_type' description in 'ieee80211_conf'
Warning(include/net/mac80211.h:1007): No description found for parameter 'chandef'
Warning(include/net/mac80211.h:1007): Excess struct/union/enum/typedef member 'channel' description in 'ieee80211_conf'
Warning(include/net/mac80211.h:1007): Excess struct/union/enum/typedef member 'channel_type' description in 'ieee80211_conf'
Warning(include/net/mac80211.h:1007): No description found for parameter 'chandef'
Warning(include/net/mac80211.h:1007): Excess struct/union/enum/typedef member 'channel' description in 'ieee80211_conf'
Warning(include/net/mac80211.h:1007): Excess struct/union/enum/typedef member 'channel_type' description in 'ieee80211_conf'
Warning(include/net/mac80211.h:1007): No description found for parameter 'chandef'
Warning(include/net/mac80211.h:1007): Excess struct/union/enum/typedef member 'channel' description in 'ieee80211_conf'
Warning(include/net/mac80211.h:1007): Excess struct/union/enum/typedef member 'channel_type' description in 'ieee80211_conf'
Warning(include/net/mac80211.h:1007): No description found for parameter 'chandef'
Warning(include/net/mac80211.h:1007): Excess struct/union/enum/typedef member 'channel' description in 'ieee80211_conf'
Warning(include/net/mac80211.h:1007): Excess struct/union/enum/typedef member 'channel_type' description in 'ieee80211_conf'
Warning(include/net/mac80211.h:1007): No description found for parameter 'chandef'
Warning(include/net/mac80211.h:1007): Excess struct/union/enum/typedef member 'channel' description in 'ieee80211_conf'
Warning(include/net/mac80211.h:1007): Excess struct/union/enum/typedef member 'channel_type' description in 'ieee80211_conf'
Warning(include/net/mac80211.h:1007): No description found for parameter 'chandef'
Warning(include/net/mac80211.h:1007): Excess struct/union/enum/typedef member 'channel' description in 'ieee80211_conf'
Warning(include/net/mac80211.h:1007): Excess struct/union/enum/typedef member 'channel_type' description in 'ieee80211_conf'
Warning(include/net/mac80211.h:1007): No description found for parameter 'chandef'
Warning(include/net/mac80211.h:1007): Excess struct/union/enum/typedef member 'channel' description in 'ieee80211_conf'
Warning(include/net/mac80211.h:1007): Excess struct/union/enum/typedef member 'channel_type' description in 'ieee80211_conf'
Warning(include/net/mac80211.h:1007): No description found for parameter 'chandef'
Warning(include/net/mac80211.h:1007): Excess struct/union/enum/typedef member 'channel' description in 'ieee80211_conf'
Warning(include/net/mac80211.h:1007): Excess struct/union/enum/typedef member 'channel_type' description in 'ieee80211_conf'
Warning(include/net/mac80211.h:1007): No description found for parameter 'chandef'
Warning(include/net/mac80211.h:1007): Excess struct/union/enum/typedef member 'channel' description in 'ieee80211_conf'
Warning(include/net/mac80211.h:1007): Excess struct/union/enum/typedef member 'channel_type' description in 'ieee80211_conf'
Warning(include/net/mac80211.h:1007): No description found for parameter 'chandef'
Warning(include/net/mac80211.h:1007): Excess struct/union/enum/typedef member 'channel' description in 'ieee80211_conf'
Warning(include/net/mac80211.h:1007): Excess struct/union/enum/typedef member 'channel_type' description in 'ieee80211_conf'
Warning(include/net/mac80211.h:1007): No description found for parameter 'chandef'
Warning(include/net/mac80211.h:1007): Excess struct/union/enum/typedef member 'channel' description in 'ieee80211_conf'
Warning(include/net/mac80211.h:1007): Excess struct/union/enum/typedef member 'channel_type' description in 'ieee80211_conf'
Warning(include/net/mac80211.h:1007): No description found for parameter 'chandef'
Warning(include/net/mac80211.h:1007): Excess struct/union/enum/typedef member 'channel' description in 'ieee80211_conf'
Warning(include/net/mac80211.h:1007): Excess struct/union/enum/typedef member 'channel_type' description in 'ieee80211_conf'
Warning(include/net/mac80211.h:1007): No description found for parameter 'chandef'
Warning(include/net/mac80211.h:1007): Excess struct/union/enum/typedef member 'channel' description in 'ieee80211_conf'
Warning(include/net/mac80211.h:1007): Excess struct/union/enum/typedef member 'channel_type' description in 'ieee80211_conf'
Warning(include/net/mac80211.h:1007): No description found for parameter 'chandef'
Warning(include/net/mac80211.h:1007): Excess struct/union/enum/typedef member 'channel' description in 'ieee80211_conf'
Warning(include/net/mac80211.h:1007): Excess struct/union/enum/typedef member 'channel_type' description in 'ieee80211_conf'
Warning(include/net/mac80211.h:1007): No description found for parameter 'chandef'
Warning(include/net/mac80211.h:1007): Excess struct/union/enum/typedef member 'channel' description in 'ieee80211_conf'
Warning(include/net/mac80211.h:1007): Excess struct/union/enum/typedef member 'channel_type' description in 'ieee80211_conf'
Warning(include/net/mac80211.h:1007): No description found for parameter 'chandef'
Warning(include/net/mac80211.h:1007): Excess struct/union/enum/typedef member 'channel' description in 'ieee80211_conf'
Warning(include/net/mac80211.h:1007): Excess struct/union/enum/typedef member 'channel_type' description in 'ieee80211_conf'
Warning(include/net/mac80211.h:1007): No description found for parameter 'chandef'
Warning(include/net/mac80211.h:1007): Excess struct/union/enum/typedef member 'channel' description in 'ieee80211_conf'
Warning(include/net/mac80211.h:1007): Excess struct/union/enum/typedef member 'channel_type' description in 'ieee80211_conf'
Warning(include/net/mac80211.h:1007): No description found for parameter 'chandef'
Warning(include/net/mac80211.h:1007): Excess struct/union/enum/typedef member 'channel' description in 'ieee80211_conf'
Warning(include/net/mac80211.h:1007): Excess struct/union/enum/typedef member 'channel_type' description in 'ieee80211_conf'
Warning(include/net/mac80211.h:1007): No description found for parameter 'chandef'
Warning(include/net/mac80211.h:1007): Excess struct/union/enum/typedef member 'channel' description in 'ieee80211_conf'
Warning(include/net/mac80211.h:1007): Excess struct/union/enum/typedef member 'channel_type' description in 'ieee80211_conf'
Warning(include/net/mac80211.h:1007): No description found for parameter 'chandef'
Warning(include/net/mac80211.h:1007): Excess struct/union/enum/typedef member 'channel' description in 'ieee80211_conf'
Warning(include/net/mac80211.h:1007): Excess struct/union/enum/typedef member 'channel_type' description in 'ieee80211_conf'
Warning(include/net/mac80211.h:1007): No description found for parameter 'chandef'
Warning(include/net/mac80211.h:1007): Excess struct/union/enum/typedef member 'channel' description in 'ieee80211_conf'
Warning(include/net/mac80211.h:1007): Excess struct/union/enum/typedef member 'channel_type' description in 'ieee80211_conf'
Warning(include/net/mac80211.h:1007): No description found for parameter 'chandef'
Warning(include/net/mac80211.h:1007): Excess struct/union/enum/typedef member 'channel' description in 'ieee80211_conf'
Warning(include/net/mac80211.h:1007): Excess struct/union/enum/typedef member 'channel_type' description in 'ieee80211_conf'
Warning(include/net/mac80211.h:1007): No description found for parameter 'chandef'
Warning(include/net/mac80211.h:1007): Excess struct/union/enum/typedef member 'channel' description in 'ieee80211_conf'
Warning(include/net/mac80211.h:1007): Excess struct/union/enum/typedef member 'channel_type' description in 'ieee80211_conf'
Warning(include/net/mac80211.h:1007): No description found for parameter 'chandef'
Warning(include/net/mac80211.h:1007): Excess struct/union/enum/typedef member 'channel' description in 'ieee80211_conf'
Warning(include/net/mac80211.h:1007): Excess struct/union/enum/typedef member 'channel_type' description in 'ieee80211_conf'
Warning(include/net/mac80211.h:1007): No description found for parameter 'chandef'
Warning(include/net/mac80211.h:1007): Excess struct/union/enum/typedef member 'channel' description in 'ieee80211_conf'
Warning(include/net/mac80211.h:1007): Excess struct/union/enum/typedef member 'channel_type' description in 'ieee80211_conf'
Warning(include/net/mac80211.h:1007): No description found for parameter 'chandef'
Warning(include/net/mac80211.h:1007): Excess struct/union/enum/typedef member 'channel' description in 'ieee80211_conf'
Warning(include/net/mac80211.h:1007): Excess struct/union/enum/typedef member 'channel_type' description in 'ieee80211_conf'
Warning(include/net/mac80211.h:1007): No description found for parameter 'chandef'
Warning(include/net/mac80211.h:1007): Excess struct/union/enum/typedef member 'channel' description in 'ieee80211_conf'
Warning(include/net/mac80211.h:1007): Excess struct/union/enum/typedef member 'channel_type' description in 'ieee80211_conf'
Warning(include/net/mac80211.h:1007): No description found for parameter 'chandef'
Warning(include/net/mac80211.h:1007): Excess struct/union/enum/typedef member 'channel' description in 'ieee80211_conf'
Warning(include/net/mac80211.h:1007): Excess struct/union/enum/typedef member 'channel_type' description in 'ieee80211_conf'
Warning(include/net/mac80211.h:1007): No description found for parameter 'chandef'
Warning(include/net/mac80211.h:1007): Excess struct/union/enum/typedef member 'channel' description in 'ieee80211_conf'
Warning(include/net/mac80211.h:1007): Excess struct/union/enum/typedef member 'channel_type' description in 'ieee80211_conf'
Warning(include/net/mac80211.h:1007): No description found for parameter 'chandef'
Warning(include/net/mac80211.h:1007): Excess struct/union/enum/typedef member 'channel' description in 'ieee80211_conf'
Warning(include/net/mac80211.h:1007): Excess struct/union/enum/typedef member 'channel_type' description in 'ieee80211_conf'
Warning(include/net/mac80211.h:1007): No description found for parameter 'chandef'
Warning(include/net/mac80211.h:1007): Excess struct/union/enum/typedef member 'channel' description in 'ieee80211_conf'
Warning(include/net/mac80211.h:1007): Excess struct/union/enum/typedef member 'channel_type' description in 'ieee80211_conf'
Warning(include/net/mac80211.h:1007): No description found for parameter 'chandef'
Warning(include/net/mac80211.h:1007): Excess struct/union/enum/typedef member 'channel' description in 'ieee80211_conf'
Warning(include/net/mac80211.h:1007): Excess struct/union/enum/typedef member 'channel_type' description in 'ieee80211_conf'
Warning(include/net/mac80211.h:1007): No description found for parameter 'chandef'
Warning(include/net/mac80211.h:1007): Excess struct/union/enum/typedef member 'channel' description in 'ieee80211_conf'
Warning(include/net/mac80211.h:1007): Excess struct/union/enum/typedef member 'channel_type' description in 'ieee80211_conf'
Warning(include/net/mac80211.h:1007): No description found for parameter 'chandef'
Warning(include/net/mac80211.h:1007): Excess struct/union/enum/typedef member 'channel' description in 'ieee80211_conf'
Warning(include/net/mac80211.h:1007): Excess struct/union/enum/typedef member 'channel_type' description in 'ieee80211_conf'
Warning(include/net/mac80211.h:1007): No description found for parameter 'chandef'
Warning(include/net/mac80211.h:1007): Excess struct/union/enum/typedef member 'channel' description in 'ieee80211_conf'
Warning(include/net/mac80211.h:1007): Excess struct/union/enum/typedef member 'channel_type' description in 'ieee80211_conf'
Warning(include/net/mac80211.h:1007): No description found for parameter 'chandef'
Warning(include/net/mac80211.h:1007): Excess struct/union/enum/typedef member 'channel' description in 'ieee80211_conf'
Warning(include/net/mac80211.h:1007): Excess struct/union/enum/typedef member 'channel_type' description in 'ieee80211_conf'
Warning(include/net/mac80211.h:1007): No description found for parameter 'chandef'
Warning(include/net/mac80211.h:1007): Excess struct/union/enum/typedef member 'channel' description in 'ieee80211_conf'
Warning(include/net/mac80211.h:1007): Excess struct/union/enum/typedef member 'channel_type' description in 'ieee80211_conf'
Warning(include/net/mac80211.h:1007): No description found for parameter 'chandef'
Warning(include/net/mac80211.h:1007): Excess struct/union/enum/typedef member 'channel' description in 'ieee80211_conf'
Warning(include/net/mac80211.h:1007): Excess struct/union/enum/typedef member 'channel_type' description in 'ieee80211_conf'
Warning(include/net/mac80211.h:1007): No description found for parameter 'chandef'
Warning(include/net/mac80211.h:1007): Excess struct/union/enum/typedef member 'channel' description in 'ieee80211_conf'
Warning(include/net/mac80211.h:1007): Excess struct/union/enum/typedef member 'channel_type' description in 'ieee80211_conf'
Warning(include/net/mac80211.h:1007): No description found for parameter 'chandef'
Warning(include/net/mac80211.h:1007): Excess struct/union/enum/typedef member 'channel' description in 'ieee80211_conf'
Warning(include/net/mac80211.h:1007): Excess struct/union/enum/typedef member 'channel_type' description in 'ieee80211_conf'
Warning(include/net/mac80211.h:1007): No description found for parameter 'chandef'
Warning(include/net/mac80211.h:1007): Excess struct/union/enum/typedef member 'channel' description in 'ieee80211_conf'
Warning(include/net/mac80211.h:1007): Excess struct/union/enum/typedef member 'channel_type' description in 'ieee80211_conf'
Warning(include/net/mac80211.h:1007): No description found for parameter 'chandef'
Warning(include/net/mac80211.h:1007): Excess struct/union/enum/typedef member 'channel' description in 'ieee80211_conf'
Warning(include/net/mac80211.h:1007): Excess struct/union/enum/typedef member 'channel_type' description in 'ieee80211_conf'
Warning(include/net/mac80211.h:1007): No description found for parameter 'chandef'
Warning(include/net/mac80211.h:1007): Excess struct/union/enum/typedef member 'channel' description in 'ieee80211_conf'
Warning(include/net/mac80211.h:1007): Excess struct/union/enum/typedef member 'channel_type' description in 'ieee80211_conf'
Warning(include/net/mac80211.h:1007): No description found for parameter 'chandef'
Warning(include/net/mac80211.h:1007): Excess struct/union/enum/typedef member 'channel' description in 'ieee80211_conf'
Warning(include/net/mac80211.h:1007): Excess struct/union/enum/typedef member 'channel_type' description in 'ieee80211_conf'
Warning(include/net/mac80211.h:1007): No description found for parameter 'chandef'
Warning(include/net/mac80211.h:1007): Excess struct/union/enum/typedef member 'channel' description in 'ieee80211_conf'
Warning(include/net/mac80211.h:1007): Excess struct/union/enum/typedef member 'channel_type' description in 'ieee80211_conf'
Warning(include/net/mac80211.h:1007): No description found for parameter 'chandef'
Warning(include/net/mac80211.h:1007): Excess struct/union/enum/typedef member 'channel' description in 'ieee80211_conf'
Warning(include/net/mac80211.h:1007): Excess struct/union/enum/typedef member 'channel_type' description in 'ieee80211_conf'
Warning(include/net/mac80211.h:1007): No description found for parameter 'chandef'
Warning(include/net/mac80211.h:1007): Excess struct/union/enum/typedef member 'channel' description in 'ieee80211_conf'
Warning(include/net/mac80211.h:1007): Excess struct/union/enum/typedef member 'channel_type' description in 'ieee80211_conf'
Warning(include/net/mac80211.h:1007): No description found for parameter 'chandef'
Warning(include/net/mac80211.h:1007): Excess struct/union/enum/typedef member 'channel' description in 'ieee80211_conf'
Warning(include/net/mac80211.h:1007): Excess struct/union/enum/typedef member 'channel_type' description in 'ieee80211_conf'
Warning(include/net/mac80211.h:1007): No description found for parameter 'chandef'
Warning(include/net/mac80211.h:1007): Excess struct/union/enum/typedef member 'channel' description in 'ieee80211_conf'
Warning(include/net/mac80211.h:1007): Excess struct/union/enum/typedef member 'channel_type' description in 'ieee80211_conf'
Warning(include/net/mac80211.h:1007): No description found for parameter 'chandef'
Warning(include/net/mac80211.h:1007): Excess struct/union/enum/typedef member 'channel' description in 'ieee80211_conf'
Warning(include/net/mac80211.h:1007): Excess struct/union/enum/typedef member 'channel_type' description in 'ieee80211_conf'
Warning(include/net/mac80211.h:1007): No description found for parameter 'chandef'
Warning(include/net/mac80211.h:1007): Excess struct/union/enum/typedef member 'channel' description in 'ieee80211_conf'
Warning(include/net/mac80211.h:1007): Excess struct/union/enum/typedef member 'channel_type' description in 'ieee80211_conf'
Warning(include/net/mac80211.h:1007): No description found for parameter 'chandef'
Warning(include/net/mac80211.h:1007): Excess struct/union/enum/typedef member 'channel' description in 'ieee80211_conf'
Warning(include/net/mac80211.h:1007): Excess struct/union/enum/typedef member 'channel_type' description in 'ieee80211_conf'
Warning(include/net/mac80211.h:1007): No description found for parameter 'chandef'
Warning(include/net/mac80211.h:1007): Excess struct/union/enum/typedef member 'channel' description in 'ieee80211_conf'
Warning(include/net/mac80211.h:1007): Excess struct/union/enum/typedef member 'channel_type' description in 'ieee80211_conf'
Warning(include/net/mac80211.h:1007): No description found for parameter 'chandef'
Warning(include/net/mac80211.h:1007): Excess struct/union/enum/typedef member 'channel' description in 'ieee80211_conf'
Warning(include/net/mac80211.h:1007): Excess struct/union/enum/typedef member 'channel_type' description in 'ieee80211_conf'
Warning(include/net/mac80211.h:1007): No description found for parameter 'chandef'
Warning(include/net/mac80211.h:1007): Excess struct/union/enum/typedef member 'channel' description in 'ieee80211_conf'
Warning(include/net/mac80211.h:1007): Excess struct/union/enum/typedef member 'channel_type' description in 'ieee80211_conf'
Warning(include/net/mac80211.h:1007): No description found for parameter 'chandef'
Warning(include/net/mac80211.h:1007): Excess struct/union/enum/typedef member 'channel' description in 'ieee80211_conf'
Warning(include/net/mac80211.h:1007): Excess struct/union/enum/typedef member 'channel_type' description in 'ieee80211_conf'
Warning(include/net/mac80211.h:1007): No description found for parameter 'chandef'
Warning(include/net/mac80211.h:1007): Excess struct/union/enum/typedef member 'channel' description in 'ieee80211_conf'
Warning(include/net/mac80211.h:1007): Excess struct/union/enum/typedef member 'channel_type' description in 'ieee80211_conf'
Warning(include/net/mac80211.h:1007): No description found for parameter 'chandef'
Warning(include/net/mac80211.h:1007): Excess struct/union/enum/typedef member 'channel' description in 'ieee80211_conf'
Warning(include/net/mac80211.h:1007): Excess struct/union/enum/typedef member 'channel_type' description in 'ieee80211_conf'
Warning(include/net/mac80211.h:1007): No description found for parameter 'chandef'
Warning(include/net/mac80211.h:1007): Excess struct/union/enum/typedef member 'channel' description in 'ieee80211_conf'
Warning(include/net/mac80211.h:1007): Excess struct/union/enum/typedef member 'channel_type' description in 'ieee80211_conf'
Warning(include/net/mac80211.h:1007): No description found for parameter 'chandef'
Warning(include/net/mac80211.h:1007): Excess struct/union/enum/typedef member 'channel' description in 'ieee80211_conf'
Warning(include/net/mac80211.h:1007): Excess struct/union/enum/typedef member 'channel_type' description in 'ieee80211_conf'
Warning(include/net/mac80211.h:1007): No description found for parameter 'chandef'
Warning(include/net/mac80211.h:1007): Excess struct/union/enum/typedef member 'channel' description in 'ieee80211_conf'
Warning(include/net/mac80211.h:1007): Excess struct/union/enum/typedef member 'channel_type' description in 'ieee80211_conf'
Warning(include/net/mac80211.h:1007): No description found for parameter 'chandef'
Warning(include/net/mac80211.h:1007): Excess struct/union/enum/typedef member 'channel' description in 'ieee80211_conf'
Warning(include/net/mac80211.h:1007): Excess struct/union/enum/typedef member 'channel_type' description in 'ieee80211_conf'
Warning(include/net/mac80211.h:1007): No description found for parameter 'chandef'
Warning(include/net/mac80211.h:1007): Excess struct/union/enum/typedef member 'channel' description in 'ieee80211_conf'
Warning(include/net/mac80211.h:1007): Excess struct/union/enum/typedef member 'channel_type' description in 'ieee80211_conf'
Warning(include/net/mac80211.h:1007): No description found for parameter 'chandef'
Warning(include/net/mac80211.h:1007): Excess struct/union/enum/typedef member 'channel' description in 'ieee80211_conf'
Warning(include/net/mac80211.h:1007): Excess struct/union/enum/typedef member 'channel_type' description in 'ieee80211_conf'
Warning(include/net/mac80211.h:1007): No description found for parameter 'chandef'
Warning(include/net/mac80211.h:1007): Excess struct/union/enum/typedef member 'channel' description in 'ieee80211_conf'
Warning(include/net/mac80211.h:1007): Excess struct/union/enum/typedef member 'channel_type' description in 'ieee80211_conf'
Warning(include/net/mac80211.h:1007): No description found for parameter 'chandef'
Warning(include/net/mac80211.h:1007): Excess struct/union/enum/typedef member 'channel' description in 'ieee80211_conf'
Warning(include/net/mac80211.h:1007): Excess struct/union/enum/typedef member 'channel_type' description in 'ieee80211_conf'
Warning(include/net/mac80211.h:1007): No description found for parameter 'chandef'
Warning(include/net/mac80211.h:1007): Excess struct/union/enum/typedef member 'channel' description in 'ieee80211_conf'
Warning(include/net/mac80211.h:1007): Excess struct/union/enum/typedef member 'channel_type' description in 'ieee80211_conf'
Warning(include/net/mac80211.h:1007): No description found for parameter 'chandef'
Warning(include/net/mac80211.h:1007): Excess struct/union/enum/typedef member 'channel' description in 'ieee80211_conf'
Warning(include/net/mac80211.h:1007): Excess struct/union/enum/typedef member 'channel_type' description in 'ieee80211_conf'
Warning(include/net/mac80211.h:1007): No description found for parameter 'chandef'
Warning(include/net/mac80211.h:1007): Excess struct/union/enum/typedef member 'channel' description in 'ieee80211_conf'
Warning(include/net/mac80211.h:1007): Excess struct/union/enum/typedef member 'channel_type' description in 'ieee80211_conf'
drivers/gpu/drm/i915/intel_crt.c:742:17: warning: assignment from incompatible pointer type [enabled by default]
include/linux/spinlock.h:154:18: warning: 'ulp' may be used uninitialized in this function [-Wmaybe-uninitialized]
net/mac80211/key.c:292:4: warning: passing argument 2 of '__ieee80211_set_default_key' makes pointer from integer without a cast [enabled by default]
net/mac80211/key.c:294:4: warning: passing argument 2 of '__ieee80211_set_default_key' makes pointer from integer without a cast [enabled by default]
net/mac80211/key.c:301:11: warning: passing argument 2 of '__ieee80211_set_default_key' makes pointer from integer without a cast [enabled by default]
net/mac80211/key.c:304:11: warning: passing argument 2 of '__ieee80211_set_default_key' makes pointer from integer without a cast [enabled by default]
fs/bio.c:785:17: warning: assignment from incompatible pointer type [enabled by default]
arch/x86/include/asm/uaccess_64.h:36:24: warning: 'size' may be used uninitialized in this function [-Wmaybe-uninitialized]

[sparse]
drivers/md/bcache/btree.c:133:22: sparse: constant 0xffffffffffffffff is so big it is unsigned long
drivers/md/bcache/journal.c:588:17: sparse: context imbalance in 'journal_write_unlocked' - unexpected unlock
drivers/md/bcache/journal.c:646:13: sparse: context imbalance in 'journal_write' - wrong count at exit
drivers/md/bcache/journal.c:661:28: sparse: context imbalance in '__journal_try_write' - unexpected unlock
drivers/md/bcache/journal.c:673:9: sparse: context imbalance in 'bch_journal_meta' - wrong count at exit
drivers/md/bcache/journal.c:692:6: sparse: context imbalance in 'bch_journal' - different lock contexts for basic block
drivers/md/bcache/super.c:101:35: sparse: cast to restricted __le64
drivers/md/bcache/super.c:102:35: sparse: cast to restricted __le64
drivers/md/bcache/super.c:109:35: sparse: cast to restricted __le64
drivers/md/bcache/super.c:110:35: sparse: cast to restricted __le64
drivers/md/bcache/super.c:112:35: sparse: cast to restricted __le64
drivers/md/bcache/super.c:113:35: sparse: cast to restricted __le16
drivers/md/bcache/super.c:114:35: sparse: cast to restricted __le16
drivers/md/bcache/super.c:116:35: sparse: cast to restricted __le16
drivers/md/bcache/super.c:117:35: sparse: cast to restricted __le16
drivers/md/bcache/super.c:118:35: sparse: cast to restricted __le32
drivers/md/bcache/super.c:120:35: sparse: cast to restricted __le16
drivers/md/bcache/super.c:121:35: sparse: cast to restricted __le16
drivers/md/bcache/super.c:124:28: sparse: cast to restricted __le64
drivers/md/bcache/super.c:223:33: sparse: incorrect type in assignment (different base types)
drivers/md/bcache/super.c:224:33: sparse: incorrect type in assignment (different base types)
drivers/md/bcache/super.c:230:33: sparse: incorrect type in assignment (different base types)
drivers/md/bcache/super.c:231:33: sparse: incorrect type in assignment (different base types)
drivers/md/bcache/super.c:233:33: sparse: incorrect type in assignment (different base types)
drivers/md/bcache/super.c:234:33: sparse: incorrect type in assignment (different base types)
drivers/md/bcache/super.c:235:33: sparse: incorrect type in assignment (different base types)
drivers/md/bcache/super.c:238:27: sparse: incorrect type in assignment (different base types)
drivers/md/bcache/super.c:534:33: sparse: incorrect type in assignment (different base types)
drivers/md/bcache/super.c:597:27: sparse: cast to restricted __le16
drivers/md/bcache/super.c:650:32: sparse: incorrect type in assignment (different base types)
drivers/md/bcache/super.c:847:26: sparse: incorrect type in initializer (different base types)
drivers/md/bcache/super.c:879:32: sparse: incorrect type in assignment (different base types)
drivers/md/bcache/super.c:1165:36: sparse: incorrect type in assignment (different base types)
drivers/md/bcache/sysfs.c:673:28: sparse: bad constant expression
drivers/md/bcache/util.c:280:29: sparse: constant 0x42F0E1EBA9EA3693 is so big it is long
drivers/md/bcache/util.c:280:49: sparse: constant 0x85E1C3D753D46D26 is so big it is unsigned long
drivers/md/bcache/util.c:281:9: sparse: constant 0xC711223CFA3E5BB5 is so big it is unsigned long
drivers/md/bcache/util.c:281:29: sparse: constant 0x493366450E42ECDF is so big it is long
drivers/md/bcache/util.c:281:49: sparse: constant 0x0BC387AEA7A8DA4C is so big it is long
drivers/md/bcache/util.c:282:9: sparse: constant 0xCCD2A5925D9681F9 is so big it is unsigned long
drivers/md/bcache/util.c:282:29: sparse: constant 0x8E224479F47CB76A is so big it is unsigned long
drivers/md/bcache/util.c:282:49: sparse: constant 0x9266CC8A1C85D9BE is so big it is unsigned long
drivers/md/bcache/util.c:283:9: sparse: constant 0xD0962D61B56FEF2D is so big it is unsigned long
drivers/md/bcache/util.c:283:29: sparse: constant 0x17870F5D4F51B498 is so big it is long
drivers/md/bcache/util.c:283:49: sparse: constant 0x5577EEB6E6BB820B is so big it is long
drivers/md/bcache/util.c:284:9: sparse: constant 0xDB55AACF12C73561 is so big it is unsigned long
drivers/md/bcache/util.c:284:29: sparse: constant 0x99A54B24BB2D03F2 is so big it is unsigned long
drivers/md/bcache/util.c:284:49: sparse: constant 0x5EB4691841135847 is so big it is long
drivers/md/bcache/util.c:285:9: sparse: constant 0x1C4488F3E8F96ED4 is so big it is long
drivers/md/bcache/util.c:285:29: sparse: constant 0x663D78FF90E185EF is so big it is long
drivers/md/bcache/util.c:285:49: sparse: constant 0x24CD9914390BB37C is so big it is long
drivers/md/bcache/util.c:286:9: sparse: constant 0xE3DCBB28C335E8C9 is so big it is unsigned long
drivers/md/bcache/util.c:286:29: sparse: constant 0xA12C5AC36ADFDE5A is so big it is unsigned long
drivers/md/bcache/util.c:286:49: sparse: constant 0x2F0E1EBA9EA36930 is so big it is long
drivers/md/bcache/util.c:287:9: sparse: constant 0x6DFEFF5137495FA3 is so big it is long
drivers/md/bcache/util.c:287:29: sparse: constant 0xAAEFDD6DCD770416 is so big it is unsigned long
drivers/md/bcache/util.c:287:49: sparse: constant 0xE81F3C86649D3285 is so big it is unsigned long
drivers/md/bcache/util.c:288:9: sparse: constant 0xF45BB4758C645C51 is so big it is unsigned long
drivers/md/bcache/util.c:288:29: sparse: constant 0xB6AB559E258E6AC2 is so big it is unsigned long
drivers/md/bcache/util.c:288:49: sparse: constant 0x71BA77A2DFB03177 is so big it is long
drivers/md/bcache/util.c:289:9: sparse: constant 0x334A9649765A07E4 is so big it is long
drivers/md/bcache/util.c:289:29: sparse: constant 0xBD68D2308226B08E is so big it is unsigned long
drivers/md/bcache/util.c:289:49: sparse: constant 0xFF9833DB2BCC861D is so big it is unsigned long
drivers/md/bcache/util.c:290:9: sparse: constant 0x388911E7D1F2DDA8 is so big it is long
drivers/md/bcache/util.c:290:29: sparse: constant 0x7A79F00C7818EB3B is so big it is long
drivers/md/bcache/util.c:290:49: sparse: constant 0xCC7AF1FF21C30BDE is so big it is unsigned long
drivers/md/bcache/util.c:291:9: sparse: constant 0x8E8A101488293D4D is so big it is unsigned long
drivers/md/bcache/util.c:291:29: sparse: constant 0x499B3228721766F8 is so big it is long
drivers/md/bcache/util.c:291:49: sparse: constant 0x0B6BD3C3DBFD506B is so big it is long
drivers/md/bcache/util.c:292:9: sparse: constant 0x854997BA2F81E701 is so big it is unsigned long
drivers/md/bcache/util.c:292:29: sparse: constant 0xC7B97651866BD192 is so big it is unsigned long
drivers/md/bcache/util.c:292:49: sparse: constant 0x00A8546D7C558A27 is so big it is long
drivers/md/bcache/util.c:293:9: sparse: constant 0x4258B586D5BFBCB4 is so big it is long
drivers/md/bcache/util.c:293:29: sparse: constant 0x5E1C3D753D46D260 is so big it is long
drivers/md/bcache/util.c:293:49: sparse: constant 0x1CECDC9E94ACE4F3 is so big it is long
drivers/md/bcache/util.c:294:9: sparse: constant 0xDBFDFEA26E92BF46 is so big it is unsigned long
drivers/md/bcache/util.c:294:29: sparse: constant 0x990D1F49C77889D5 is so big it is unsigned long
drivers/md/bcache/util.c:294:49: sparse: constant 0x172F5B3033043EBF is so big it is long
drivers/md/bcache/util.c:295:9: sparse: constant 0x55DFBADB9AEE082C is so big it is long
drivers/md/bcache/util.c:295:29: sparse: constant 0x92CE98E760D05399 is so big it is unsigned long
drivers/md/bcache/util.c:295:49: sparse: constant 0xD03E790CC93A650A is so big it is unsigned long
drivers/md/bcache/util.c:296:9: sparse: constant 0xAA478900B1228E31 is so big it is unsigned long
drivers/md/bcache/util.c:296:29: sparse: constant 0xE8B768EB18C8B8A2 is so big it is unsigned long
drivers/md/bcache/util.c:296:49: sparse: constant 0x2FA64AD7E2F6E317 is so big it is long
drivers/md/bcache/util.c:297:9: sparse: constant 0x6D56AB3C4B1CD584 is so big it is long
drivers/md/bcache/util.c:297:29: sparse: constant 0xE374EF45BF6062EE is so big it is unsigned long
drivers/md/bcache/util.c:297:49: sparse: constant 0xA1840EAE168A547D is so big it is unsigned long
drivers/md/bcache/util.c:298:9: sparse: constant 0x66952C92ECB40FC8 is so big it is long
drivers/md/bcache/util.c:298:29: sparse: constant 0x2465CD79455E395B is so big it is long
drivers/md/bcache/util.c:298:49: sparse: constant 0x3821458AADA7578F is so big it is long
drivers/md/bcache/util.c:299:9: sparse: constant 0x7AD1A461044D611C is so big it is long
drivers/md/bcache/util.c:299:29: sparse: constant 0xBDC0865DFE733AA9 is so big it is unsigned long
drivers/md/bcache/util.c:299:49: sparse: constant 0xFF3067B657990C3A is so big it is unsigned long
drivers/md/bcache/util.c:300:9: sparse: constant 0x711223CFA3E5BB50 is so big it is long
drivers/md/bcache/util.c:300:29: sparse: constant 0x33E2C2240A0F8DC3 is so big it is long
drivers/md/bcache/util.c:300:49: sparse: constant 0xF4F3E018F031D676 is so big it is unsigned long
drivers/md/bcache/util.c:301:9: sparse: constant 0xB60301F359DBE0E5 is so big it is unsigned long
drivers/md/bcache/util.c:301:29: sparse: constant 0xDA050215EA6C212F is so big it is unsigned long
drivers/md/bcache/util.c:301:49: sparse: constant 0x98F5E3FE438617BC is so big it is unsigned long
drivers/md/bcache/util.c:302:9: sparse: constant 0x5FE4C1C2B9B84C09 is so big it is long
drivers/md/bcache/util.c:302:29: sparse: constant 0x1D14202910527A9A is so big it is long
drivers/md/bcache/util.c:302:49: sparse: constant 0x93366450E42ECDF0 is so big it is unsigned long
drivers/md/bcache/util.c:303:9: sparse: constant 0xD1C685BB4DC4FB63 is so big it is unsigned long
drivers/md/bcache/util.c:303:29: sparse: constant 0x16D7A787B7FAA0D6 is so big it is long
drivers/md/bcache/util.c:303:49: sparse: constant 0x5427466C1E109645 is so big it is long
drivers/md/bcache/util.c:304:9: sparse: constant 0x4863CE9FF6E9F891 is so big it is long
drivers/md/bcache/util.c:304:29: sparse: constant 0x0A932F745F03CE02 is so big it is long
drivers/md/bcache/util.c:304:49: sparse: constant 0xCD820D48A53D95B7 is so big it is unsigned long
drivers/md/bcache/util.c:305:9: sparse: constant 0x8F72ECA30CD7A324 is so big it is unsigned long
drivers/md/bcache/util.c:305:29: sparse: constant 0x0150A8DAF8AB144E is so big it is long
drivers/md/bcache/util.c:305:49: sparse: constant 0x43A04931514122DD is so big it is long
drivers/md/bcache/util.c:306:9: sparse: constant 0x84B16B0DAB7F7968 is so big it is unsigned long
drivers/md/bcache/util.c:306:29: sparse: constant 0xC6418AE602954FFB is so big it is unsigned long
drivers/md/bcache/util.c:306:49: sparse: constant 0xBC387AEA7A8DA4C0 is so big it is unsigned long
drivers/md/bcache/util.c:307:9: sparse: constant 0xFEC89B01D3679253 is so big it is unsigned long
drivers/md/bcache/util.c:307:29: sparse: constant 0x39D9B93D2959C9E6 is so big it is long
drivers/md/bcache/util.c:307:49: sparse: constant 0x7B2958D680B3FF75 is so big it is long
drivers/md/bcache/util.c:308:9: sparse: constant 0xF50B1CAF74CF481F is so big it is unsigned long
drivers/md/bcache/util.c:308:29: sparse: constant 0xB7FBFD44DD257E8C is so big it is unsigned long
drivers/md/bcache/util.c:308:49: sparse: constant 0x70EADF78271B2539 is so big it is long
drivers/md/bcache/util.c:309:9: sparse: constant 0x321A3E938EF113AA is so big it is long
drivers/md/bcache/util.c:309:29: sparse: constant 0x2E5EB66066087D7E is so big it is long
drivers/md/bcache/util.c:309:49: sparse: constant 0x6CAE578BCFE24BED is so big it is long
drivers/md/bcache/util.c:310:9: sparse: constant 0xABBF75B735DC1058 is so big it is unsigned long
drivers/md/bcache/util.c:310:29: sparse: constant 0xE94F945C9C3626CB is so big it is unsigned long
drivers/md/bcache/util.c:310:49: sparse: constant 0x676DD025684A91A1 is so big it is long
drivers/md/bcache/util.c:311:9: sparse: constant 0x259D31CEC1A0A732 is so big it is long
drivers/md/bcache/util.c:311:29: sparse: constant 0xE28C13F23B9EFC87 is so big it is unsigned long
drivers/md/bcache/util.c:311:49: sparse: constant 0xA07CF2199274CA14 is so big it is unsigned long
drivers/md/bcache/util.c:312:9: sparse: constant 0x167FF3EACBAF2AF1 is so big it is long
drivers/md/bcache/util.c:312:29: sparse: constant 0x548F120162451C62 is so big it is long
drivers/md/bcache/util.c:312:49: sparse: constant 0x939E303D987B47D7 is so big it is unsigned long
drivers/md/bcache/util.c:313:9: sparse: constant 0xD16ED1D631917144 is so big it is unsigned long
drivers/md/bcache/util.c:313:29: sparse: too many warnings
drivers/md/bcache/closure.c:340:16: sparse: return expression in void function
drivers/md/bcache/debug.c:528:41: sparse: undefined identifier '__func__'

[smatch]
drivers/net/ethernet/broadcom/bnx2x/bnx2x_main.c:10073 bnx2x_prev_unload() error: double unlock 'sem:&bnx2x_prev_sem'
net/l2tp/l2tp_core.c:1780 l2tp_session_delete() error: we previously assumed 'session->ref' could be null (see line 1773)
drivers/md/bcache/btree.c:2337 bch_btree_refill_keybuf() warn: statement has no effect 3
drivers/md/bcache/btree.c:2386 bch_refill_keybuf() error: potential NULL dereference 'w'.
drivers/md/bcache/io.c:124 bch_bio_split() error: potential NULL dereference 'ret'.
drivers/md/bcache/debug.c:347 bch_dump_read() warn: maybe return -EFAULT instead of the bytes remaining?
drivers/md/bcache/super.c:693 bcache_device_free() warn: variable dereferenced before check 'd->disk' (see line 688)
drivers/md/bcache/journal.c:757 bch_journal() warn: inconsistent returns spin_lock:&c->journal.lock: locked (741) unlocked (720,757)
drivers/block/drbd/drbd_actlog.c:392 drbd_al_begin_io_nonblock() warn: if();
drivers/staging/vt6656/rxtx.c:2565 nsDMA_tx_packet() error: __builtin_memcpy() 'pDevice->sTxEthHeader.h_dest' too small (6 vs 14)
drivers/staging/vt6656/rxtx.c:2888 bRelayPacketSend() error: __builtin_memcpy() 'pDevice->sTxEthHeader.h_dest' too small (6 vs 14)
drivers/block/rsxx/dma.c:995 rsxx_eeh_save_issued_dmas() error: potential null dereference 'issued_dmas'.  (kzalloc returns null)
drivers/base/power/qos.c:471 dev_pm_qos_add_notifier() error: we previously assumed 'dev->power.qos' could be null (see line 465)
sound/pci/asihpi/hpi6205.c:410 _HPI_6205() error: we previously assumed 'pao' could be null (see line 383)
net/9p/protocol.c:394 p9pdu_vwritef() warn: '__min2' 4294967295 can't fit into 65535 'len'
drivers/usb/gadget/r8a66597-udc.c:1457 r8a66597_sudmac_irq() error: buffer overflow 'r8a66597->pipenum2ep' 8 <= 15
drivers/staging/csr/csr_wifi_hip_card_sdio.c:3359 CardWriteBulkData() error: testing array offset 'queue' after use.
drivers/net/ethernet/mellanox/mlx4/eq.c:549 mlx4_eq_int() error: buffer overflow 'mlx4_priv(dev)->sense.do_sense_port' 3 <= 15
drivers/net/ethernet/mellanox/mlx4/eq.c:553 mlx4_eq_int() error: buffer overflow 'dev->caps.port_type' 3 <= 15
drivers/net/ethernet/mellanox/mlx4/eq.c:575 mlx4_eq_int() error: buffer overflow 'mlx4_priv(dev)->sense.do_sense_port' 3 <= 15
drivers/net/ethernet/mellanox/mlx4/eq.c:579 mlx4_eq_int() error: buffer overflow 'dev->caps.port_type' 3 <= 15
drivers/mtd/nand/denali_dt.c:45 request_and_map() warn: variable dereferenced before check 'res' (see line 38)
drivers/misc/eeprom/eeprom.c:113 eeprom_read() error: buffer overflow 'data->data' 256 <= 256
drivers/misc/altera-stapl/altera.c:2104 altera_execute() error: testing array offset 'stack_ptr' after use.
drivers/infiniband/hw/mthca/mthca_provider.c:594 mthca_create_qp() warn: struct type mismatch 'mthca_qp vs mthca_sqp'
drivers/infiniband/hw/mlx4/mad.c:262 smp_snoop() error: buffer overflow 'dev->pkeys.phys_pkey_cache[port_num - 1]' 128 <= 2097151
drivers/infiniband/hw/mlx4/mad.c:264 smp_snoop() error: buffer overflow 'dev->pkeys.phys_pkey_cache[port_num - 1]' 128 <= 2097151
net/mac80211/key.c:269 ieee80211_key_replace() error: we previously assumed 'new' could be null (see line 260)
drivers/net/wireless/iwlwifi/mvm/bt-coex.c:569 iwl_mvm_bt_rssi_event() warn: inconsistent returns mutex:&mvm->mutex: locked (527) unlocked (532,569)

[coccinelle]
kernel/workqueue.c:1105:3-9: preceding lock on line 1103

[cppcheck]
include/uapi/linux/acct.h:115: error: unspecified endianness
include/uapi/linux/acct.h:115: error: unspecified endianness
include/uapi/linux/aio_abi.h:70: error: #error edit for your odd byteorder.

---
0-DAY kernel build testing backend              Open Source Technology Center
http://lists.01.org/mailman/listinfo/kbuild                 Intel Corporation
