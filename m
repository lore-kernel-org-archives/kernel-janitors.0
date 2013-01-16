From: Fengguang Wu <fengguang.wu@intel.com>
Date: Wed, 16 Jan 2013 17:10:28 +0000
Subject: build regressions 2013-01-16
Message-Id: <50f6df04.DUVgeJedc7iUUo1s%fengguang.wu@intel.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

[errors]
arch/arm/mach-vexpress/reset.c:116:3: error: 'pm_restart' undeclared (first use in this function)
drivers/gpio/gpio-lynxpoint.c:298:22: error: expected '=', ',', ';', 'asm' or '__attribute__' before 'lp_gpio_probe'
drivers/gpio/gpio-lynxpoint.c:380:22: error: expected '=', ',', ';', 'asm' or '__attribute__' before 'lp_gpio_remove'
drivers/gpio/gpio-lynxpoint.c:392:20: error: 'lp_gpio_probe' undeclared here (not in a function)
drivers/gpio/gpio-lynxpoint.c:393:2: error: implicit declaration of function '__devexit_p' [-Werror=implicit-function-declaration]
drivers/gpio/gpio-lynxpoint.c:393:32: error: 'lp_gpio_remove' undeclared here (not in a function)
perf_event_intel_uncore.c:(.text+0xf4b9): undefined reference to `snbep_uncore_cbox'
perf_event_intel_uncore.c:(.text+0xf4de): undefined reference to `snbep_uncore_pcu'
perf_event_intel_uncore.c:(.text+0xfc7c): undefined reference to `nhmex_uncore_mbox_extra_regs'
perf_event_intel_uncore.c:(.text+0xff5d): undefined reference to `uncore_nhmex'
perf_event_intel_uncore.c:(.text+0x10112): undefined reference to `constraint_empty'
perf_event_intel_uncore.c:(.text+0x10597): undefined reference to `uncore_cpu_mask'
perf_event_intel_uncore.c:(.text+0x10664): undefined reference to `constraint_fixed'
perf_event_intel_uncore.c:(.init.text+0x4efb): undefined reference to `uncore_pmu_event_init'
perf_event_intel_uncore.c:(.init.text+0x4f02): undefined reference to `uncore_pmu_event_add'
perf_event_intel_uncore.c:(.init.text+0x4f09): undefined reference to `uncore_pmu_event_del'
perf_event_intel_uncore.c:(.init.text+0x4f10): undefined reference to `uncore_pmu_event_start'
perf_event_intel_uncore.c:(.init.text+0x4f17): undefined reference to `uncore_pmu_event_stop'
security/smack/smackfs.c:2130:29: error: 'SMACK_MAGIC' undeclared (first use in this function)
(.text+0x2d3a7): undefined reference to `bad_sock_fops'
algif_skcipher.c:(.text+0x29c38): undefined reference to `sock_wake_async'
af_alg.c:(.init.text+0xbb7): undefined reference to `sock_register'
af_alg.c:(.exit.text+0x6cd): undefined reference to `sock_unregister'
drbd_receiver.c:(.text+0x3e7986): undefined reference to `sock_recvmsg'
drbd_receiver.c:(.text+0x3e7a17): undefined reference to `sock_release'
drbd_receiver.c:(.text+0x3f0ab9): undefined reference to `sock_create_kern'
drbd_receiver.c:(.text+0x3f12d2): undefined reference to `kernel_accept'
(.text+0x403e6a): undefined reference to `kernel_sendmsg'
(.text+0x407b16): undefined reference to `kernel_sock_shutdown'
main.c:(.ref.text+0x249): undefined reference to `prepare_namespace'
(.init.text+0x8f3): undefined reference to `ROOT_DEV'
(.init.text+0xb58): undefined reference to `root_mountflags'
drivers/gpio/gpio-lynxpoint.c:62:19: error: field 'chip' has incomplete type
drivers/gpio/gpio-lynxpoint.c:92:2: error: implicit declaration of function 'inl' [-Werror=implicit-function-declaration]
drivers/gpio/gpio-lynxpoint.c:101:2: error: implicit declaration of function 'outl' [-Werror=implicit-function-declaration]
drivers/gpio/gpio-lynxpoint.c:335:4: error: dereferencing pointer to incomplete type
drivers/gpio/gpio-lynxpoint.c:336:4: error: dereferencing pointer to incomplete type
drivers/gpio/gpio-lynxpoint.c:337:4: error: dereferencing pointer to incomplete type
drivers/gpio/gpio-lynxpoint.c:338:4: error: dereferencing pointer to incomplete type
drivers/gpio/gpio-lynxpoint.c:339:4: error: dereferencing pointer to incomplete type
drivers/gpio/gpio-lynxpoint.c:340:4: error: dereferencing pointer to incomplete type
drivers/gpio/gpio-lynxpoint.c:341:4: error: dereferencing pointer to incomplete type
drivers/gpio/gpio-lynxpoint.c:342:4: error: dereferencing pointer to incomplete type
drivers/gpio/gpio-lynxpoint.c:343:4: error: dereferencing pointer to incomplete type
drivers/gpio/gpio-lynxpoint.c:344:4: error: dereferencing pointer to incomplete type
drivers/gpio/gpio-lynxpoint.c:345:4: error: dereferencing pointer to incomplete type
drivers/gpio/gpio-lynxpoint.c:350:5: error: dereferencing pointer to incomplete type
drivers/gpio/gpio-lynxpoint.c:363:2: error: implicit declaration of function 'gpiochip_add' [-Werror=implicit-function-declaration]
drivers/gpio/gpio-lynxpoint.c:384:2: error: implicit declaration of function 'gpiochip_remove' [-Werror=implicit-function-declaration]
drivers/tty/serial/8250/8250_dw.c:151:1: error: unknown type name 'acpi_status'
drivers/tty/serial/8250/8250_dw.c:161:13: error: dereferencing pointer to incomplete type
drivers/tty/serial/8250/8250_dw.c:162:7: error: 'ACPI_RESOURCE_TYPE_FIXED_DMA' undeclared (first use in this function)
drivers/tty/serial/8250/8250_dw.c:163:19: error: dereferencing pointer to incomplete type
drivers/tty/serial/8250/8250_dw.c:169:12: error: 'AE_NO_MEMORY' undeclared (first use in this function)
drivers/tty/serial/8250/8250_dw.c:176:32: error: dereferencing pointer to incomplete type
drivers/tty/serial/8250/8250_dw.c:178:32: error: dereferencing pointer to incomplete type
drivers/tty/serial/8250/8250_dw.c:187:32: error: dereferencing pointer to incomplete type
drivers/tty/serial/8250/8250_dw.c:189:32: error: dereferencing pointer to incomplete type
drivers/tty/serial/8250/8250_dw.c:196:9: error: 'AE_OK' undeclared (first use in this function)
drivers/tty/serial/8250/8250_dw.c:202:2: error: unknown type name 'acpi_status'
drivers/tty/serial/8250/8250_dw.c:214:2: error: implicit declaration of function 'acpi_walk_resources' [-Werror=implicit-function-declaration]
drivers/tty/serial/8250/8250_dw.c:214:52: error: 'METHOD_NAME__CRS' undeclared (first use in this function)
drivers/tty/serial/8250/8250_dw.c:216:2: error: implicit declaration of function 'ACPI_FAILURE' [-Werror=implicit-function-declaration]
drivers/tty/serial/8250/8250_dw.c:217:3: error: implicit declaration of function 'acpi_format_exception' [-Werror=implicit-function-declaration]
arch/mn10300/kernel/mn10300-serial.c:527:19: error: 'port' redeclared as different kind of symbol
arch/mn10300/kernel/mn10300-serial.c:527:31: error: 'struct tty_port' has no member named 'uart'
arch/mn10300/kernel/mn10300-serial.c:533:2: error: 'struct tty_port' has no member named 'name'
arch/mn10300/kernel/mn10300-serial.c:537:10: error: 'struct tty_port' has no member named 'rx_inp'
arch/mn10300/kernel/mn10300-serial.c:537:10: error: 'struct tty_port' has no member named 'rx_outp'
arch/mn10300/kernel/mn10300-serial.c:555:11: error: 'struct tty_port' has no member named 'rx_buffer'
arch/mn10300/kernel/mn10300-serial.c:571:14: error: 'struct tty_port' has no member named 'rx_brk'
net/mac80211/util.c:1666:27: error: 'reconfig_due_to_wowlan' undeclared (first use in this function)
drivers/staging/sb105x/sb_pci_mp.c:901:19: error: 'struct tty_struct' has no member named 'low_latency'
drivers/acpi/acpi_csrt.c:130:10: error: 'const struct acpi_csrt_group' has no member named 'info_length'
drivers/tty/serial/8250/8250_pci.c:1286:23: error: expected '=', ',', ';', 'asm' or '__attribute__' before 'pci_quatech_exit'
drivers/tty/serial/8250/8250_pci.c:1786:3: error: implicit declaration of function '__devexit_p' [-Werror=implicit-function-declaration]
drivers/tty/serial/8250/8250_pci.c:1786:24: error: 'pci_quatech_exit' undeclared here (not in a function)

[warnings]
drivers/acpi/csrt.c:42:5: warning: left shift count >= width of type [enabled by default]
drivers/gpio/gpio-lynxpoint.c:73:23: warning: initialization from incompatible pointer type [enabled by default]
drivers/gpio/gpio-lynxpoint.c:73:23: warning: (near initialization for 'lg') [enabled by default]
drivers/gpio/gpio-lynxpoint.c:86:23: warning: initialization from incompatible pointer type [enabled by default]
drivers/gpio/gpio-lynxpoint.c:86:23: warning: (near initialization for 'lg') [enabled by default]
drivers/gpio/gpio-lynxpoint.c:150:23: warning: initialization from incompatible pointer type [enabled by default]
drivers/gpio/gpio-lynxpoint.c:150:23: warning: (near initialization for 'lg') [enabled by default]
drivers/gpio/gpio-lynxpoint.c:166:23: warning: initialization from incompatible pointer type [enabled by default]
drivers/gpio/gpio-lynxpoint.c:166:23: warning: (near initialization for 'lg') [enabled by default]
drivers/gpio/gpio-lynxpoint.c:180:23: warning: initialization from incompatible pointer type [enabled by default]
drivers/gpio/gpio-lynxpoint.c:180:23: warning: (near initialization for 'lg') [enabled by default]
drivers/gpio/gpio-lynxpoint.c:195:23: warning: initialization from incompatible pointer type [enabled by default]
drivers/gpio/gpio-lynxpoint.c:195:23: warning: (near initialization for 'lg') [enabled by default]
drivers/tty/serial/8250/8250_dw.c:151:34: warning: 'struct acpi_resource' declared inside parameter list [enabled by default]
drivers/tty/serial/8250/8250_dw.c:151:34: warning: its scope is only this definition or declaration, which is probably not what you want [enabled by default]
drivers/tty/serial/8250/8250_dw.c:217:3: warning: format '%s' expects argument of type 'char *', but argument 4 has type 'int' [-Wformat]
drivers/tty/serial/ip22zilog.c:464:4: warning: passing argument 1 of 'tty_flip_buffer_push' from incompatible pointer type [enabled by default]
warning: (VERSATILE_FPGA_IRQ && REGMAP && GPIO_LYNXPOINT && GPIO_PCF857X && GPIO_LANGWELL && MFD_CORE && MFD_TPS65910 && TWL4030_CORE && MFD_LP8788 && MFD_MAX77686 && MFD_MAX8997 && MFD_WM831X_I2C && MFD_WM831X_SPI && AB8500_CORE && EXTCON_MAX77693) selects IRQ_DOMAIN which has unmet direct dependencies (HAVE_GENERIC_HARDIRQS)
sound/pci/hda/patch_ca0132.c:2933:15: warning: 'nid' may be used uninitialized in this function [-Wmaybe-uninitialized]
drivers/staging/sb105x/sb_pci_mp.c:2118:4: warning: passing argument 1 of 'tty_insert_flip_char' from incompatible pointer type [enabled by default]
drivers/staging/sb105x/sb_pci_mp.c:2129:2: warning: passing argument 1 of 'tty_flip_buffer_push' from incompatible pointer type [enabled by default]
drivers/w1/slaves/w1_therm.c:245:15: warning: 'crc' may be used uninitialized in this function [-Wmaybe-uninitialized]
drivers/w1/slaves/w1_therm.c:247:2: warning: 'verdict' may be used uninitialized in this function [-Wmaybe-uninitialized]
drivers/tty/serial/8250/8250_dma.c:55:2: warning: passing argument 1 of 'tty_insert_flip_string' from incompatible pointer type [enabled by default]
drivers/tty/serial/8250/8250_dma.c:58:2: warning: passing argument 1 of 'tty_flip_buffer_push' from incompatible pointer type [enabled by default]
WARNING: vmlinux.o(.data+0x5baa0): Section mismatch in reference from the variable early_arc_platform_driver to the function .init.text:arc_serial_probe_earlyprintk()

[sparse]
sound/pci/hda/patch_ca0132.c:387:19: sparse: symbol 'ca0132_voicefx' was not declared. Should it be static?
sound/pci/hda/patch_ca0132.c:394:26: sparse: symbol 'ca0132_voicefx_presets' was not declared. Should it be static?
drivers/gpio/gpio-lynxpoint.c:307:9: sparse: Trying to use reserved word 'if' as identifier
drivers/gpio/gpio-lynxpoint.c:309:17: sparse: Trying to use reserved word 'return' as identifier
drivers/gpio/gpio-lynxpoint.c:332:9: sparse: Trying to use reserved word 'do' as identifier
drivers/gpio/gpio-lynxpoint.c:334:17: sparse: cannot dereference this type
drivers/gpio/gpio-lynxpoint.c:336:9: sparse: too many errors
drivers/tty/serial/8250/8250_pci.c:1286:23: sparse: void declaration
drivers/tty/serial/8250/8250_pci.c:1297:9: sparse: Trying to use reserved word 'if' as identifier
drivers/tty/serial/8250/8250_pci.c:1299:9: sparse: Trying to use reserved word 'else' as identifier
drivers/tty/serial/8250/8250_pci.c:1308:9: sparse: Trying to use reserved word 'return' as identifier
drivers/tty/serial/8250/8250_pci.c:1353:17: sparse: Trying to use reserved word 'struct' as identifier
drivers/tty/serial/8250/8250_pci.c:1441:24: sparse: too many errors
drivers/tty/serial/8250/8250_dma.c:55:32: sparse: incorrect type in argument 1 (different base types)
net/xfrm/xfrm_state.c:177:16: sparse: incorrect type in assignment (different address spaces)
net/xfrm/xfrm_state.c:1866:21: sparse: incompatible types in comparison expression (different address spaces)
drivers/acpi/acpi_csrt.c:130:24: sparse: no member 'info_length' in struct acpi_csrt_group
drivers/gpio/gpio-lynxpoint.c:298:22: sparse: Expected ; at end of declaration
drivers/gpio/gpio-lynxpoint.c:298:22: sparse: got lp_gpio_probe
drivers/gpio/gpio-lynxpoint.c:307:13: sparse: Expected ) in function declarator
drivers/gpio/gpio-lynxpoint.c:307:13: sparse: got !
drivers/gpio/gpio-lynxpoint.c:310:9: sparse: Expected ; at the end of type declaration
drivers/gpio/gpio-lynxpoint.c:332:9: sparse: got (
drivers/gpio/gpio-lynxpoint.c:380:22: sparse: got lp_gpio_remove
drivers/gpio/gpio-lynxpoint.c:386:17: sparse: got dev_warn
drivers/gpio/gpio-lynxpoint.c:303:31: sparse: undefined identifier 'pdev'
drivers/gpio/gpio-lynxpoint.c:315:9: sparse: symbol 'io_rc' redeclared with different type (originally declared at drivers/gpio/gpio-lynxpoint.c:302) - different base types
drivers/gpio/gpio-lynxpoint.c:316:9: sparse: symbol 'irq_rc' redeclared with different type (originally declared at drivers/gpio/gpio-lynxpoint.c:302) - different base types
drivers/gpio/gpio-lynxpoint.c:334:9: sparse: symbol 'gc' redeclared with different type (originally declared at drivers/gpio/gpio-lynxpoint.c:301) - different base types
drivers/tty/serial/8250/8250_pci.c:1286:23: sparse: Expected ; at end of declaration
drivers/tty/serial/8250/8250_pci.c:1286:23: sparse: got pci_quatech_exit
drivers/tty/serial/8250/8250_pci.c:1297:18: sparse: Expected ) in function declarator
drivers/tty/serial/8250/8250_pci.c:1297:18: sparse: got ->
drivers/tty/serial/8250/8250_pci.c:1300:17: sparse: got offset
drivers/tty/serial/8250/8250_pci.c:1308:16: sparse: got setup_port
drivers/tty/serial/8250/8250_pci.c:1309:1: sparse: Expected ; at the end of type declaration
drivers/tty/serial/8250/8250_pci.c:1324:16: sparse: got ret
drivers/tty/serial/8250/8250_pci.c:1347:16: sparse: got pci_default_setup
drivers/tty/serial/8250/8250_pci.c:1353:17: sparse: Expected ) in nested declarator
drivers/tty/serial/8250/8250_pci.c:1353:17: sparse: got uart_8250_port
drivers/tty/serial/8250/8250_pci.c:1393:16: sparse: got skip_tx_en_setup
drivers/staging/sb105x/sb_pci_mp.c:901:33: sparse: no member 'low_latency' in struct tty_struct

[smatch]
drivers/net/ethernet/broadcom/bnx2x/bnx2x_ethtool.c:832 __bnx2x_get_preset_regs() error: potential NULL dereference 'wreg_addr_p'.

---
0-DAY kernel build testing backend              Open Source Technology Center
http://lists.01.org/mailman/listinfo/kbuild                 Intel Corporation
