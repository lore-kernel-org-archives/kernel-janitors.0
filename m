From: Fengguang Wu <fengguang.wu@intel.com>
Date: Fri, 18 Jan 2013 20:51:38 +0000
Subject: build regressions 2013-01-18
Message-Id: <50f9b5da.T4lbrlO8qR//NC1c%fengguang.wu@intel.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

[errors]
drivers/ntb/ntb_hw.c:407:3: error: implicit declaration of function 'writeq' [-Werror=implicit-function-declaration]
drivers/ntb/ntb_hw.c:740:3: error: implicit declaration of function 'readq' [-Werror=implicit-function-declaration]
init/main.c:807:2: error: implicit declaration of function 'load_default_elevator_module' [-Werror=implicit-function-declaration]
ERROR: "mv_usb2_get_phy" [drivers/usb/gadget/mv_udc.ko] undefined!
ERROR: "mv_usb2_unregister_notifier" [drivers/usb/gadget/mv_udc.ko] undefined!
ERROR: "mv_usb2_register_notifier" [drivers/usb/gadget/mv_udc.ko] undefined!
drivers/net/wireless/ath/ath9k/recv.c:1127:2: error: implicit declaration of function 'ath_debug_send_fft_sample' [-Werror=implicit-function-declaration]
drivers/bcma/driver_mips.c:297:4: error: implicit declaration of function 'bcma_core_irq' [-Werror=implicit-function-declaration]
fs/xfs/xfs_log.c:1740:39: error: 'B_TRUE' undeclared (first use in this function)
drivers/gpu/drm/qxl/qxl_drv.c:34:17: fatal error: drm.h: No such file or directory
include/drm/qxl_drm.h:5:17: fatal error: drm.h: No such file or directory
drivers/gpu/drm/qxl/qxl_fb.c:34:17: fatal error: drm.h: No such file or directory
drivers/gpu/drm/qxl/qxl_gem.c:2:17: fatal error: drm.h: No such file or directory
drivers/gpu/drm/qxl/qxl_drv.c:51:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before 'qxl_pci_probe'
drivers/gpu/drm/qxl/qxl_drv.c:72:12: error: 'qxl_pci_probe' undeclared here (not in a function)
drivers/gpu/drm/qxl/qxl_object.c:91:4: error: too many arguments to function 'ttm_bo_init'
drivers/gpu/drm/qxl/qxl_object.c:155:2: error: too many arguments to function 'ttm_bo_validate'
drivers/gpu/drm/qxl/qxl_object.c:179:2: error: too many arguments to function 'ttm_bo_validate'
drivers/gpu/drm/qxl/qxl_ttm.c:395:2: error: incompatible type for argument 4 of 'ttm_bo_move_memcpy'
drivers/gpu/drm/qxl/qxl_ttm.c:395:2: error: too many arguments to function 'ttm_bo_move_memcpy'
drivers/usb/gadget/mv_udc_core.c:1124:16: error: 'struct mv_usb_platform_data' has no member named 'phy_init'
drivers/usb/gadget/mv_udc_core.c:1150:17: error: 'struct mv_usb_platform_data' has no member named 'phy_deinit'
drivers/usb/gadget/mv_udc_core.c:2097:17: error: 'struct mv_usb_platform_data' has no member named 'vbus'
make[4]: *** No rule to make target `drivers/usb/gadget/functions.o', needed by `drivers/usb/gadget/libcomposite.o'.
kernel/system_keyring.c:18:33: fatal error: keys/system_keyring.h: No such file or directory
kernel/module_signing.c:17:33: fatal error: keys/system_keyring.h: No such file or directory
crypto/asymmetric_keys/pefile_parser.c:21:33: fatal error: keys/system_keyring.h: No such file or directory
kernel/time/tick-broadcast.c:136:10: error: 'struct clock_event_device' has no member named 'evt_handler'
make[2]: *** No rule to make target `signing_key.x509', needed by `kernel/x509_certificate_list'.
drivers/gpio/devres.c:26:2: error: implicit declaration of function 'gpio_free' [-Werror=implicit-function-declaration]
drivers/gpio/devres.c:60:2: error: implicit declaration of function 'gpio_request' [-Werror=implicit-function-declaration]
drivers/gpio/devres.c:90:2: error: implicit declaration of function 'gpio_request_one' [-Werror=implicit-function-declaration]
arch/xtensa/kernel/built-in.o:(.init.literal+0x84): undefined reference to `platform_pcibios_init'

[warnings]
drivers/tty/serial/serial-tegra.c:523:4: warning: passing argument 1 of 'tty_insert_flip_char' from incompatible pointer type [enabled by default]
drivers/tty/serial/serial-tegra.c:542:4: warning: passing argument 1 of 'tty_insert_flip_string' from incompatible pointer type [enabled by default]
drivers/tty/serial/serial-tegra.c:572:3: warning: passing argument 1 of 'tty_flip_buffer_push' from incompatible pointer type [enabled by default]
drivers/ntb/ntb_transport.c:895:7: warning: 'offset' may be used uninitialized in this function [-Wuninitialized]
drivers/ntb/ntb_transport.c:414:1: warning: the frame size of 1044 bytes is larger than 1024 bytes [-Wframe-larger-than=]
WARNING: drivers/net/built-in.o(.data+0x4c168): Section mismatch in reference from the variable ntb_netdev_client to the function .exit.text:ntb_netdev_remove()
drivers/gpu/drm/i915/i915_debugfs.c:263:6: warning: format '%zu' expects argument of type 'size_t', but argument 4 has type 'long unsigned int' [-Wformat]
drivers/md/dm-ioctl.c:1716:2: warning: 'ioctl_flags' may be used uninitialized in this function [-Wmaybe-uninitialized]
drivers/md/dm-ioctl.c:1743:13: warning: 'param_flags' may be used uninitialized in this function [-Wmaybe-uninitialized]
drivers/net/wireless/iwlwifi/pcie/trans.c:765:8: warning: unused variable 'val' [-Wunused-variable]
drivers/gpu/drm/qxl/qxl_object.c:91:4: warning: passing argument 8 of 'ttm_bo_init' makes pointer from integer without a cast [enabled by default]
drivers/gpu/drm/qxl/qxl_object.c:91:4: warning: passing argument 9 of 'ttm_bo_init' makes integer from pointer without a cast [enabled by default]
drivers/gpu/drm/qxl/qxl_object.c:91:4: warning: passing argument 10 of 'ttm_bo_init' makes pointer from integer without a cast [enabled by default]
drivers/gpu/drm/qxl/qxl_ttm.c:405:2: warning: initialization from incompatible pointer type [enabled by default]
drivers/gpu/drm/qxl/qxl_ttm.c:405:2: warning: (near initialization for 'qxl_bo_driver.move') [enabled by default]
drivers/gpu/drm/qxl/qxl_ttm.c:435:2: warning: (near initialization for 'qxl_bo_driver.sync_obj_signaled') [enabled by default]
drivers/gpu/drm/qxl/qxl_ttm.c:436:2: warning: (near initialization for 'qxl_bo_driver.sync_obj_wait') [enabled by default]
drivers/gpu/drm/qxl/qxl_ttm.c:437:2: warning: (near initialization for 'qxl_bo_driver.sync_obj_flush') [enabled by default]
drivers/usb/phy/mv_usb2_phy.c:350:17: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]

[sparse]
drivers/usb/gadget/zero.c:66:25: sparse: symbol 'gzero_options' was not declared. Should it be static?
drivers/usb/gadget/u_serial.c:1291:5: sparse: symbol 'userial_init' was not declared. Should it be static?
drivers/usb/phy/mv_usb2_phy.c:364:9: sparse: Trying to use reserved word 'if' as identifier
drivers/usb/phy/mv_usb2_phy.c:370:17: sparse: Trying to use reserved word 'return' as identifier
drivers/usb/phy/mv_usb2_phy.c:453:9: sparse: too many errors
kernel/system_keyring.c:18:11: sparse: unable to open 'keys/system_keyring.h'
kernel/module_signing.c:17:11: sparse: unable to open 'keys/system_keyring.h'
crypto/asymmetric_keys/pefile_parser.c:21:11: sparse: unable to open 'keys/system_keyring.h'
drivers/net/wireless/ti/wl12xx/main.c:1806:9: sparse: Trying to use reserved word 'if' as identifier
drivers/hv/vmbus_drv.c:510:6: sparse: symbol 'vmbus_flow_handler' was not declared. Should it be static?
drivers/video/backlight/ili922x.c:372:6: sparse: symbol 'set_write_to_gram_reg' was not declared. Should it be static?
net/ipv6/route.c:521:17: sparse: context imbalance in 'rt6_probe' - different lock contexts for basic block
drivers/ntb/ntb_hw.c:112:24: sparse: incorrect type in assignment (incompatible argument 2 (different signedness))
drivers/ntb/ntb_hw.c:365:28: sparse: incorrect type in return expression (different address spaces)
drivers/ntb/ntb_transport.c:211:17: sparse: symbol 'ntb_bus_type' was not declared. Should it be static?
drivers/ntb/ntb_transport.c:458:9: sparse: Using plain integer as NULL pointer
drivers/ntb/ntb_transport.c:803:42: sparse: incorrect type in argument 2 (incompatible argument 2 (different signedness))
drivers/ntb/ntb_transport.c:999:21: sparse: incorrect type in argument 1 (different address spaces)
drivers/thermal/intel_powerclamp.c:516:25: sparse: incorrect type in initializer (different address spaces)
drivers/thermal/intel_powerclamp.c:550:32: sparse: incorrect type in assignment (different address spaces)
drivers/thermal/intel_powerclamp.c:776:21: sparse: incorrect type in argument 1 (different address spaces)
drivers/acpi/csrt.c:130:13: sparse: symbol 'acpi_csrt_init' was not declared. Should it be static?
drivers/net/wireless/ti/wl12xx/main.c:1801:22: sparse: Expected ; at end of declaration
drivers/net/wireless/ti/wl12xx/main.c:1801:22: sparse: got wl12xx_remove
drivers/net/wireless/ti/wl12xx/main.c:1806:13: sparse: Expected ) in function declarator
drivers/net/wireless/ti/wl12xx/main.c:1806:13: sparse: got !
drivers/net/wireless/ti/wl12xx/main.c:1812:4: sparse: got :
drivers/net/wireless/ti/wl12xx/main.c:1814:1: sparse: Expected ; at the end of type declaration
drivers/net/wireless/ti/wl12xx/main.c:1808:16: sparse: undefined identifier 'wl'
drivers/net/wireless/ti/wl12xx/main.c:1808:9: sparse: symbol 'priv' redeclared with different type (originally declared at drivers/net/wireless/ti/wl12xx/main.c:1804) - different base types
drivers/net/wireless/ti/wl12xx/main.c:1824:27: sparse: undefined identifier 'wl12xx_remove'
drivers/net/wireless/ti/wl12xx/main.c:1825:27: sparse: undefined identifier 'wl12xx_id_table'
drivers/tty/serial/8250/8250.c:286:10: sparse: Initializer entry defined twice
drivers/net/wireless/ath/wil6210/dbg_hexdump.h:21:9: sparse: preprocessor token print_hex_dump_bytes redefined
drivers/ntb/ntb_hw.c:407:17: sparse: undefined identifier 'writeq'
drivers/ntb/ntb_hw.c:740:27: sparse: undefined identifier 'readq'
drivers/usb/phy/mv_usb2_phy.c:198:9: sparse: undefined identifier 'writel_relaxed'
kernel/time/tick-broadcast.c:149:17: sparse: no member 'evt_handler' in struct clock_event_device

[smatch]
drivers/video/backlight/ili922x.c:543 ili922x_probe() error: doing dma on the stack (&reg)

---
0-DAY kernel build testing backend              Open Source Technology Center
http://lists.01.org/mailman/listinfo/kbuild                 Intel Corporation
